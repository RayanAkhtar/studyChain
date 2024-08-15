import React, { useEffect, useRef, useState } from "react";
import * as d3 from "d3";
import { useNavigate } from "react-router-dom";
import {
  getCurrentUserData,
  getUserPrivledge,
  getUserSubjectProgress,
} from "../../database/firebase";
import { getOrder, updateRelationshipOrder } from "../../database/graphData";
import "../styles/Graph.css";

const Graph = ({ nodes, links, subject = null, width, height, style }) => {
  const svgRef = useRef();
  const navigate = useNavigate();
  const [totalTopicCount, setTotalTopicCount] = useState(0);
  const [ourTopicCount, setOurTopicCount] = useState(0);
  const [loading, setLoading] = useState(true);
  const [userLoggedIn, setUserLoggedIn] = useState(false);
  const [subjectProgress, setSubjectProgress] = useState({});
  const [privledge, setUserPrivledge] = useState("guest");

  let validNodes =
    subject == null
      ? nodes
      : nodes.filter((n) => n.name === subject || n.subject === subject);

  if (validNodes.length === 0) {
    validNodes = [{ name: subject, type: "subject" }];
  }

  const nodesToUse = validNodes.map((n) => {
    return n;
  });

  let linksToUse = links.map((link) => {
    if (link.source == null) {
      return {
        source: link.source.source,
        target: link.source.target,
        order: link.source.order !== undefined ? links.source.order : 0,
      };
    }
    return {
      source: link.source,
      target: link.target,
      order: link.order !== undefined ? link.order : "NaN",
    };
  });

  const nodeNameList = nodesToUse.map((n) => n.name);
  linksToUse =
    subject == null
      ? linksToUse
      : linksToUse.filter((link) => {
          return (
            nodeNameList.includes(link.source) &&
            nodeNameList.includes(link.target)
          );
        });

  useEffect(() => {
    const fetchData = async () => {
      const user = await getCurrentUserData();
      if (user) {
        setUserLoggedIn(true);
        const progress = await getUserSubjectProgress(user.email);
        const totalTopicsCount = getTotalNodesForSubject(subject, links, nodes);
        const ourTopicsCount = getNodesCompleteForSubject(
          subject,
          links,
          nodes,
          progress
        );
        setSubjectProgress(progress);
        setTotalTopicCount(totalTopicsCount);
        setOurTopicCount(ourTopicsCount);
        setLoading(false);
      } else {
        setUserLoggedIn(false);
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  useEffect(() => {
    const fetchData = async () => {
      const user = await getCurrentUserData();
      if (user) {
        setUserLoggedIn(true);
        const subjectProgress = await getUserSubjectProgress(user.email);
        const privledge = await getUserPrivledge(user.email);
        const totalTopicsCount = getTotalNodesForSubject(subject, links, nodes);
        const ourTopicsCount = getNodesCompleteForSubject(
          subject,
          links,
          nodes,
          subjectProgress
        );
        setUserPrivledge(privledge);
        setTotalTopicCount(totalTopicsCount);
        setOurTopicCount(ourTopicsCount);
        setLoading(false);
      } else {
        setUserLoggedIn(false);
        setLoading(false);
      }
    };

    const svg = d3.select(svgRef.current);

    const zoom = d3
      .zoom()
      .scaleExtent([0.05, 4]) // Minimum and maximum zoom levels
      .on("zoom", (event) => {
        svgGroup.attr("transform", event.transform);
      });

    svg.call(zoom).on("dblclick.zoom", null);

    svg.selectAll("*").remove();

    const svgGroup = svg.append("g");
    svg
      .append("defs")
      .append("marker")
      .attr("id", "arrowhead")
      .attr("viewBox", "-0 -5 10 10")
      .attr("refX", 50) // Increase this value to move the arrowhead closer to the end of the line
      .attr("refY", 0)
      .attr("orient", "auto")
      .attr("markerWidth", 6)
      .attr("markerHeight", 6)
      .attr("xoverflow", "visible")
      .append("svg:path")
      .attr("d", "M 0,-5 L 10 ,0 L 0,5")
      .attr("fill", "#999")
      .style("stroke", "none");

    const simulation = d3
      .forceSimulation(nodesToUse)
      .force(
        "link",
        d3
          .forceLink(linksToUse)
          .id((d) => d.name)
          .distance(90) // distance = link length
      )
      .force(
        "charge",
        d3.forceManyBody().strength(-400000) // how far apart are nodes
      )
      .force("center", d3.forceCenter(width / 2, height / 2));

    const link = svgGroup
      .append("g")
      .attr("stroke", "#999")
      .attr("stroke-opacity", 0.6)
      .selectAll("line")
      .data(linksToUse)
      .enter()
      .append("line")
      .attr("stroke-width", 15) // number = thickness of lines
      .attr("marker-end", "url(#arrowhead)");

    const node = svgGroup
      .append("g")
      .selectAll("g")
      .data(nodesToUse)
      .enter()
      .append("g")
      .attr("class", "node");

    // Supporting code for rendering topics here
    const highlightLinks = (d) => {
      const highlightedNodes = new Set();
      const highlightRecursive = (currentNode) => {
        highlightedNodes.add(currentNode.name);
        link
          .filter((l) => l.target.name === currentNode.name)
          .attr("stroke", "blue")
          .each(function (l) {
            if (!highlightedNodes.has(l.source.name)) {
              highlightRecursive(l.source);
            }
          });
      };
      highlightRecursive(d);
    };

    const innerComplete = (miniSubjectObj) => {
      const miniSubjectName = miniSubjectObj.name;
      const miniSubjectTopics = nodes.filter(
        (node) => node.subject === miniSubjectName && node.type === "topic"
      );
      const childMiniSubjects = nodes.filter(
        (node) => node.subject === miniSubjectName && node.type === "subject"
      );

      if (childMiniSubjects.length > 0) {
        for (const childMiniSubject of childMiniSubjects) {
          if (!innerComplete(childMiniSubject)) {
            return false;
          }
        }
      }

      for (const topic of miniSubjectTopics) {
        if (!subjectProgress[topic.name]) {
          return false;
        }
      }
      return true;
    };


    const innerSuggestions = (miniSubjectObj) => {
      const miniSubjectName = miniSubjectObj.name;
      const miniSubjectTopics = nodes.filter(
        (node) => node.subject === miniSubjectName && node.type === "topic"
      );
      const childMiniSubjects = nodes.filter(
        (node) => node.subject === miniSubjectName && node.type === "subject"
      );

      let currCount = 0;
      if (childMiniSubjects.length > 0) {
        for (const childMiniSubject of childMiniSubjects) {
          currCount += innerSuggestions(childMiniSubject);
        }
      }

      for (const topic of miniSubjectTopics) {
        console.log("topic is", topic)
        if (topic.suggestions) {
          console.log("topic suggestions", topic.suggestions)
          currCount += topic.suggestions.length;
        }
      }
      return currCount;
    }

    const colCompleteTopic = "#86e399";
    const colTodoTopic = "#ff9999";

    const colCompleteMainSubject = "#28a745";
    const colTodoMainSubject = "#f86d6d";

    const colCompleteMiniSubject = "#86e399"; // same as topic, but just incase you wish to change later
    const colTodoMiniSubject = "#ff9999";

    // -------------------------------------------------- TOPICS HERE -------------------------------------------------- //

    renderTopicNodes(
      node,
      subjectProgress,
      colCompleteTopic,
      navigate,
      colTodoTopic,
      highlightLinks,
      link,
      privledge
    );

    // -------------------------------------------------- MAIN SUBJECTS HERE -------------------------------------------------- //

    renderMainSubjects(
      node,
      subject,
      innerComplete,
      colTodoMainSubject,
      colCompleteMainSubject
    ); // to center rectangle

    // -------------------------------------------------- MINI SUBJECTS HERE -------------------------------------------------- //

    renderMiniSubjects(
      node,
      subject,
      innerComplete,
      colTodoMiniSubject,
      navigate,
      colCompleteMiniSubject,
      highlightLinks,
      link,
      privledge,
      nodes
    );

    // ALL TEXT HERE FOR NODES
    node
      .append("text")
      .attr("x", 0)
      .attr("y", 0)
      .attr("dy", ".35em")
      .attr("text-anchor", "middle")
      .attr("font-size", (d) =>
        subject == null ? "40px" : d.name === subject ? "65px" : "45px"
      )
      .attr("font-family", "Arial, sans-serif")
      .style("font-weight", "bold")
      .style("pointer-events", "none")
      .text((d) => d.name);

    let text = renderLinkOrderings(privledge, svgGroup, linksToUse);

    // Add badge for moderator
    if (privledge === "moderator") {
      node
        .filter(d => d.type === "topic" && d.suggestions && d.suggestions.length > 0)
        .append("g") // Append a group element
        .attr("transform", "translate(-70, -70)") // Adjust position for the badge
        .append("circle")
        .attr("cx", 350) // Center of the circle
        .attr("cy", 20) // Center of the circle
        .attr("r", 45) // Radius of the circle
        .style("fill", "red")
        .style("stroke", "white")
        .style("stroke-width", "2px");
    
      node.select("g") // Select the appended group element
        .filter(d => d.type === "topic" && d.suggestions && d.suggestions.length > 0)
        .append("text")
        .attr("x", 350) // Center the text
        .attr("y", 20) // Center the text
        .style("fill", "white")
        .style("font-family", "Arial, sans-serif")
        .style("font-size", "50px") // Adjust font size as needed
        .style("text-anchor", "middle") // Center-align text horizontally
        .style("alignment-baseline", "middle") // Center-align text vertically
        .text(d => d.suggestions.length);



      node
        .filter(d => d.type === "subject" && !d.mainSubject && innerSuggestions(d) > 0 && d.name !== subject)
        .append("g") // Append a group element
        .attr("transform", "translate(-70, -70)") // Adjust position for the badge
        .append("circle")
        .attr("cx", 320) // Center of the circle
        .attr("cy", -30) // Center of the circle
        .attr("r", 45) // Radius of the circle
        .style("fill", "red")
        .style("stroke", "white")
        .style("stroke-width", "2px");
    
      node.select("g") // Select the appended group element
        .filter(d => d.type === "subject" && !d.mainSubject && innerSuggestions(d) > 0 && d.name !== subject)
        .append("text")
        .attr("x", 320) // Center the text
        .attr("y", -30) // Center the text
        .style("fill", "white")
        .style("font-family", "Arial, sans-serif")
        .style("font-size", "50px") // Adjust font size as needed
        .style("text-anchor", "middle") // Center-align text horizontally
        .style("alignment-baseline", "middle") // Center-align text vertically
        .text(d => innerSuggestions(d));
    }
    
    


    if (privledge === "member") {
      const progressBar = svg
        .append("rect")
        .attr("width", 200)
        .attr("height", 20)
        .attr("fill", "#ddd") // Light gray
        .attr("stroke", "#333") // Dark gray
        .attr("stroke-width", 1)
        .attr("rx", 10)
        .attr("ry", 10)
        .attr("x", (width + 1100) / 2)
        .attr("y", 10);

      const progressBarIndicator = svg
        .append("rect")
        .attr("width", 0)
        .attr("height", 20)
        .attr("fill", "#4caf50") // Green
        .attr("stroke", "#333") // Dark gray
        .attr("stroke-width", 1)
        .attr("rx", 10)
        .attr("ry", 10)
        .attr("x", (width + 1100) / 2)
        .attr("y", 10);

      const updateProgressBar = (completionPercentage) => {
        const width = 200 * (completionPercentage / 100);
        progressBarIndicator.attr("width", isNaN(width) ? 0 : width);
      };

      updateProgressBar((ourTopicCount / totalTopicCount) * 100);

      const completionText = svg
        .append("text")
        .attr("x", (width + 1165) / 2)
        .attr("y", 50)
        .attr("font-family", "Arial, sans-serif")
        .attr("font-size", "16px")
        .attr("fill", "#333") // Dark gray
        .attr("text-anchor", "start")
        .text(ourTopicCount + " out of " + totalTopicCount + " complete");
    }

    simulation.on("tick", () => {
      link
        .attr("x1", (d) => d.source.x)
        .attr("y1", (d) => d.source.y)
        .attr("x2", (d) => d.target.x)
        .attr("y2", (d) => d.target.y);

      text
        .attr("x", (d) => (d.source.x + d.target.x) / 2)
        .attr("y", (d) => (d.source.y + d.target.y) / 2);

      node.attr("transform", (d) => `translate(${d.x},${d.y})`);
    });

    const initialTransform = d3.zoomIdentity
      .translate(width / 2.75, height / 3)
      .scale(0.25);
    svg.call(zoom.transform, initialTransform);

    const updateText = async () => {
      const orders = linksToUse.map((d) => d.order);

      text.text((d, i) => orders[i]);
    };

    updateText();
    fetchData();
  }, [nodesToUse, linksToUse, ourTopicCount, totalTopicCount, subject]);

  if (loading) {
    return <div>Loading...</div>;
  }

  return (
    <svg
      ref={svgRef}
      width="100%"
      height="100%"
      style={{ width: "100%", height: "100%", minHeight: "590px", ...style }}
    ></svg>
  );
};

const getTotalNodesForSubject = (subject, links, nodes) => {
  const totalTopics = getTopicsFromSubject(subject, links, nodes);
  const totalMiniSubjects = getMiniSubjectFromSubject(subject, links, nodes);
  return totalTopics.length + totalMiniSubjects.length;
};

const getNodesCompleteForSubject = (subject, links, nodes, subjectProgress) => {
  let progCount = 0;

  const totalTopics = getTopicsFromSubject(subject, links, nodes);
  const totalMiniSubjects = getMiniSubjectFromSubject(subject, links, nodes);

  totalTopics.forEach((topic) => {
    progCount = progCount + (subjectProgress[topic.name] ? 1 : 0);
  });

  totalMiniSubjects.map((miniSubject) => {
    const miniSubjectNodeCount = getTotalNodesForSubject(
      miniSubject.name,
      links,
      nodes
    );
    const ourMiniSubjectCount = getNodesCompleteForSubject(
      miniSubject.name,
      links,
      nodes,
      subjectProgress
    );
    progCount =
      progCount + (miniSubjectNodeCount === ourMiniSubjectCount ? 1 : 0);
  });

  return progCount;
};

const getTopicsFromSubject = (subject, links, nodes) => {
  return nodes.filter(
    (node) => node.subject === subject && node.type === "topic"
  );
};

const getMiniSubjectFromSubject = (subject, links, nodes) => {
  return nodes.filter(
    (node) =>
      node.subject === subject && node.type === "subject" && !node.mainSubject
  );
};

export default Graph;

function renderMiniSubjects(
  node,
  subject,
  innerComplete,
  colTodoMiniSubject,
  navigate,
  colCompleteMiniSubject,
  highlightLinks,
  link,
  privledge,
  nodes
) {
  if (privledge === "moderator") {
    node
      .append("rect")
      .filter(
        (d) =>
          d.type === "subject" &&
          (subject == null || d.name !== subject) &&
          innerRating(d, nodes) === "bad"
      )
      .attr("width", 500) // rectangle width
      .attr("height", 200) // rectangle height
      .attr("fill", colTodoMiniSubject)
      .attr("stroke", "#333") // Dark gray
      .attr("stroke-width", 2)
      .attr("x", -250)
      .attr("y", -100)
      .style("cursor", "pointer")
      .on("click", (event, d) => {
        navigate("/graph/" + d.name);
      })
      .on("mouseover", function (event, d) {
        d3.select(this).transition().duration(200).attr("fill", "yellow");
        // Highlight connected links recursively
        highlightLinks(d);
      })
      .on("mouseout", function (event, d) {
        d3.select(this)
          .transition()
          .duration(200)
          .attr("fill", colTodoMiniSubject);
        link.attr("stroke", "#999").attr("stroke-width", 15);
      });

    node
      .append("rect")
      .filter(
        (d) =>
          d.type === "subject" &&
          (subject == null || d.name !== subject) &&
          innerRating(d, nodes) === "alright"
      )
      .attr("width", 500) // rectangle width
      .attr("height", 200) // rectangle height
      .attr("fill", "yellow")
      .attr("stroke", "#333") // Dark gray
      .attr("stroke-width", 2)
      .attr("x", -250)
      .attr("y", -100)
      .style("cursor", "pointer") // Change cursor to pointer for clickable rectangles
      .on("click", (event, d) => {
        navigate("/graph/" + d.name);
      })
      .on("mouseover", function (event, d) {
        d3.select(this)
          .transition()
          .duration(50)
          .attr("fill", colCompleteMiniSubject); // Light red
        highlightLinks(d);
      })
      .on("mouseout", function (event, d) {
        d3.select(this).transition().duration(50).attr("fill", "yellow");
        link.attr("stroke", "#999").attr("stroke-width", 15);
      });

    node
      .append("rect")
      .filter(
        (d) =>
          d.type === "subject" &&
          (subject == null || d.name !== subject) &&
          innerRating(d, nodes) === "good"
      )
      .attr("width", 500) // rectangle width
      .attr("height", 200) // rectangle height
      .attr("fill", colCompleteMiniSubject)
      .attr("stroke", "#333") // Dark gray
      .attr("stroke-width", 2)
      .attr("x", -250)
      .attr("y", -100)
      .style("cursor", "pointer") // Change cursor to pointer for clickable rectangles
      .on("click", (event, d) => {
        navigate("/graph/" + d.name);
      })
      .on("mouseover", function (event, d) {
        d3.select(this).transition().duration(50).attr("fill", "green"); // Light red
        highlightLinks(d);
      })
      .on("mouseout", function (event, d) {
        d3.select(this)
          .transition()
          .duration(50)
          .attr("fill", colCompleteMiniSubject);
        link.attr("stroke", "#999").attr("stroke-width", 15);
      });
  } else {
    node
      .append("rect")
      .filter(
        (d) =>
          d.type === "subject" &&
          (subject == null || d.name !== subject) &&
          !innerComplete(d)
      )
      .attr("width", 500) // rectangle width
      .attr("height", 200) // rectangle height
      .attr("fill", colTodoMiniSubject)
      .attr("stroke", "#333") // Dark gray
      .attr("stroke-width", 2)
      .attr("x", -250)
      .attr("y", -100)
      .style("cursor", "pointer")
      .on("click", (event, d) => {
        navigate("/graph/" + d.name);
      })
      .on("mouseover", function (event, d) {
        d3.select(this)
          .transition()
          .duration(200)
          .attr("fill", colCompleteMiniSubject);
        // Highlight connected links recursively
        highlightLinks(d);
      })
      .on("mouseout", function (event, d) {
        d3.select(this)
          .transition()
          .duration(200)
          .attr("fill", colTodoMiniSubject);
        link.attr("stroke", "#999").attr("stroke-width", 15);
      });

    node
      .append("rect")
      .filter(
        (d) =>
          d.type === "subject" &&
          (subject == null || d.name !== subject) &&
          innerComplete(d)
      )
      .attr("width", 500) // rectangle width
      .attr("height", 200) // rectangle height
      .attr("fill", colCompleteMiniSubject)
      .attr("stroke", "#333") // Dark gray
      .attr("stroke-width", 2)
      .attr("x", -250)
      .attr("y", -100)
      .style("cursor", "pointer") // Change cursor to pointer for clickable rectangles
      .on("click", (event, d) => {
        navigate("/graph/" + d.name);
      })
      .on("mouseover", function (event, d) {
        d3.select(this)
          .transition()
          .duration(50)
          .attr("fill", colTodoMiniSubject); // Light red
        highlightLinks(d);
      })
      .on("mouseout", function (event, d) {
        d3.select(this)
          .transition()
          .duration(50)
          .attr("fill", colCompleteMiniSubject);
        link.attr("stroke", "#999").attr("stroke-width", 15);
      });
  }
}

function renderMainSubjects(
  node,
  subject,
  innerComplete,
  colTodoMainSubject,
  colCompleteMainSubject
) {
  node
    .append("rect")
    .filter(
      (d) => d.type === "subject" && d.name === subject && !innerComplete(d)
    )
    .attr("width", 800)
    .attr("height", 200)
    .attr("fill", colTodoMainSubject)
    .attr("stroke", "#333")
    .attr("stroke-width", 2)
    .attr("x", -400) // to center rectangle
    .attr("y", -100); // to center rectangle

  node
    .append("rect")
    .filter(
      (d) => d.type === "subject" && d.name === subject && innerComplete(d)
    )
    .attr("width", 800)
    .attr("height", 200)
    .attr("fill", colCompleteMainSubject)
    .attr("stroke", "#333")
    .attr("stroke-width", 2)
    .attr("x", -400) // to center rectangle
    .attr("y", -100);
}

function renderTopicNodes(
  node,
  subjectProgress,
  colCompleteTopic,
  navigate,
  colTodoTopic,
  highlightLinks,
  link,
  privledge
) {
  if (privledge === "moderator") {
    node // Topics that are complete
      .append("ellipse")
      .filter(
        (d) =>
          d.type === "topic" &&
          d.good.low >= d.alright.low &&
          d.good.low >= d.bad.low
      )
      .attr("rx", 300) // ellipse width
      .attr("ry", 100) // ellipse height
      .attr("fill", colCompleteTopic)
      .attr("stroke", "#333")
      .attr("stroke-width", 2)
      .style("cursor", "pointer")
      .on("click", (event, d) => {
        navigate("/topic/" + d.name);
      })
      .on("mouseover", function (event, d) {
        d3.select(this).transition().duration(200).attr("fill", "green");
        highlightLinks(d);
      })
      .on("mouseout", function (event, d) {
        d3.select(this)
          .transition()
          .duration(200)
          .attr("fill", colCompleteTopic);
        link.attr("stroke", "#999").attr("stroke-width", 15);
      });

    node // topics that are incomplete
      .append("ellipse")
      .filter(
        (d) =>
          d.type === "topic" &&
          d.alright.low > d.good.low &&
          d.alright.low > d.bad.low
      )
      .attr("rx", 300) // ellipse width
      .attr("ry", 100) // ellipse height
      .attr("fill", "yellow")
      .attr("stroke", "#333")
      .attr("stroke-width", 2)
      .style("cursor", "pointer")
      .on("click", (event, d) => {
        navigate("/topic/" + d.name);
      })
      .on("mouseover", function (event, d) {
        d3.select(this)
          .transition()
          .duration(200)
          .attr("fill", colCompleteTopic);

        highlightLinks(d);
      })
      .on("mouseout", function (event, d) {
        d3.select(this).transition().duration(200).attr("fill", "yellow");
        link.attr("stroke", "#999").attr("stroke-width", 15);
      });

    node // topics that are incomplete
      .append("ellipse")
      .filter(
        (d) =>
          d.type === "topic" &&
          d.bad.low > d.alright.low &&
          d.bad.low > d.good.low
      )
      .attr("rx", 300) // ellipse width
      .attr("ry", 100) // ellipse height
      .attr("fill", colTodoTopic)
      .attr("stroke", "#333")
      .attr("stroke-width", 2)
      .style("cursor", "pointer")
      .on("click", (event, d) => {
        navigate("/topic/" + d.name);
      })
      .on("mouseover", function (event, d) {
        d3.select(this).transition().duration(200).attr("fill", "yellow");

        highlightLinks(d);
      })
      .on("mouseout", function (event, d) {
        d3.select(this).transition().duration(200).attr("fill", colTodoTopic);
        link.attr("stroke", "#999").attr("stroke-width", 15);
      });
  } else {
    node // Topics that are complete
      .append("ellipse")
      .filter((d) => d.type === "topic" && subjectProgress[d.name])
      .attr("rx", 300) // ellipse width
      .attr("ry", 100) // ellipse height
      .attr("fill", colCompleteTopic)
      .attr("stroke", "#333")
      .attr("stroke-width", 2)
      .style("cursor", "pointer")
      .on("click", (event, d) => {
        navigate("/topic/" + d.name);
      })
      .on("mouseover", function (event, d) {
        d3.select(this).transition().duration(200).attr("fill", colTodoTopic);
        highlightLinks(d);
      })
      .on("mouseout", function (event, d) {
        d3.select(this)
          .transition()
          .duration(200)
          .attr("fill", colCompleteTopic);
        link.attr("stroke", "#999").attr("stroke-width", 15);
      });

    node // topics that are incomplete
      .append("ellipse")
      .filter((d) => d.type === "topic" && !subjectProgress[d.name])
      .attr("rx", 300) // ellipse width
      .attr("ry", 100) // ellipse height
      .attr("fill", colTodoTopic)
      .attr("stroke", "#333")
      .attr("stroke-width", 2)
      .style("cursor", "pointer")
      .on("click", (event, d) => {
        navigate("/topic/" + d.name);
      })
      .on("mouseover", function (event, d) {
        d3.select(this)
          .transition()
          .duration(200)
          .attr("fill", colCompleteTopic);

        highlightLinks(d);
      })
      .on("mouseout", function (event, d) {
        d3.select(this).transition().duration(200).attr("fill", colTodoTopic);
        link.attr("stroke", "#999").attr("stroke-width", 15);
      });
  }
}

function renderLinkOrderings(privledge, svgGroup, linksToUse) {
  let text = null;

  // TEXT ORDERINGS HERE
  if (privledge === "moderator") {
    text = svgGroup
      .selectAll("text.link-order")
      .data(linksToUse)
      .enter()
      .append("text")
      .attr("class", "link-order")
      .attr("font-size", "160px")
      .attr("fill", "#ff0000") // Red
      .style("font-weight", "bold")
      .style("stroke", "#000000") // Black
      .style("stroke-width", "7.5px")
      .style("pointer-events", "auto")
      .text((d) => d.order)
      .on("click", function (event, d) {
        const textElement = d3.select(this);
        const parent = d3.select(this.parentNode);

        textElement.style("display", "none");

        const inputBox = parent
          .append("foreignObject")
          .attr("x", textElement.attr("x"))
          .attr("y", textElement.attr("y") - 180)
          .attr("width", 500)
          .attr("height", 300)
          .append("xhtml:div")
          .attr("class", "input-group")
          .style("width", "400px")
          .style("height", "200px")
          .append("xhtml:input")
          .attr("type", "text")
          .attr("class", "form-control")
          .style("font-size", "160px")
          .attr("value", d.order)
          .on("blur", async function () {
            const newValue = this.value;
            d.order = newValue;

            const updateSuccess = await updateRelationshipOrder(
              d.source.name,
              d.target.name,
              newValue
            );

            if (updateSuccess) {
              parent.select("foreignObject").remove();

              textElement.text(newValue).style("display", null);
            } else {
              console.error("Failed to update the order in the database.");
            }
          })
          .on("keydown", function (event) {
            if (event.key === "Enter") {
              this.blur();
            }
          });

        inputBox.node().focus();
      });
  } else {
    text = svgGroup
      .selectAll("text.link-order")
      .data(linksToUse)
      .enter()
      .append("text")
      .attr("class", "link-order")
      .attr("font-size", "160px")
      .attr("fill", "#ff0000") // Red
      .style("font-weight", "bold")
      .style("stroke", "#000000") // Black
      .style("stroke-width", "7.5px")
      .style("pointer-events", "none")
      .text((d) => d.order);
  }

  svgGroup
    .selectAll("text.link-order")
    .data(linksToUse)
    .enter()
    .append("text")
    .attr("class", "link-order hovered-text")
    .attr("font-size", "160px")
    .attr("fill", "#ff0000")
    .style("font-weight", "bold")
    .style("stroke", "#000000")
    .style("stroke-width", "7.5px")
    .text((d) => d.order);

  // Add hover effect with D3.js
  svgGroup
    .selectAll("text.link-order")
    .on("mouseover", function () {
      d3.select(this).classed("hovered-text", true);
    })
    .on("mouseout", function () {
      d3.select(this).classed("hovered-text", false);
    });
  return text;
}

const innerRating = (miniSubjectObj, nodes) => {
  const miniSubjectName = miniSubjectObj.name;
  const miniSubjectTopics = nodes.filter(
    (node) => node.subject === miniSubjectName && node.type === "topic"
  );
  const childMiniSubjects = nodes.filter(
    (node) => node.subject === miniSubjectName && node.type === "subject"
  );

  let currentRating = "good";

  if (childMiniSubjects.length > 0) {
    for (const childMiniSubject of childMiniSubjects) {
      if (innerRating(childMiniSubject, nodes) === "bad") {
        return "bad";
      } else if (innerRating(childMiniSubject, nodes) === "alright") {
        currentRating = "alright";
      } else {
        currentRating = currentRating === "good" ? "good" : "alright";
      }
    }
  }

  for (const topic of miniSubjectTopics) {
    if (topic.bad.low > topic.alright.low && topic.bad.low > topic.good.low) {
      return "bad";
    } else if (
      topic.alright.low > topic.bad.low &&
      topic.alright.low > topic.good.low
    ) {
      currentRating = "alright";
    } else {
      currentRating = currentRating === "good" ? "good" : "alright";
    }
  }
  return currentRating;
};
