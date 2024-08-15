import React, { useEffect, useState } from "react";
import Graph from "./Graph";
import { getDependencyGraph } from "../../database/graphData";

const SubGraph = ({ topicName }) => {
  const [nodes, setNodes] = useState([]);
  const [relationships, setRelationships] = useState([]);
  const [error, setError] = useState(null);

  const graphStyle = {
    marginLeft: "17%",
    border: "1px solid black",
    boxShadow:
      "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)",
    borderRadius: "10px",
  };

  useEffect(() => {
    const fetchGraphData = async () => {
      try {
        const { nodes, relationships } = await getDependencyGraph(topicName);
        setNodes(nodes);
        console.log("nodes", nodes);

        let newRelationships = relationships.map((rel, index) => {
          const sourceNode = nodes.find((n) => n.id === rel.source);
          const targetNode = nodes.find((n) => n.id === rel.target);

          return {
            source: {
              name: sourceNode.name,
              type: sourceNode.type,
              index: index,
            },
            target: {
              name: targetNode.name,
              type: targetNode.type,
              index: index,
            },
          };
        });
        setRelationships(newRelationships);
      } catch (error) {
        setError("Failed to fetch graph data.");
        console.error("Failed to fetch graph data:", error);
      }
    };

    fetchGraphData();
  }, [topicName]);

  if (error) {
    return <div>{error}</div>;
  }

  if (!nodes.length) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      <h2>SubGraph for {topicName}</h2>
      <Graph
        nodes={nodes}
        links={relationships}
        width={1200}
        height={600}
        style={graphStyle}
      />
    </div>
  );
};

export default SubGraph;
