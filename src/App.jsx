import React, { useState, useEffect } from "react";
import "bootstrap/dist/css/bootstrap.css";
import {
  BrowserRouter as Router,
  Route,
  Routes,
  useParams,
} from "react-router-dom";
import HomePage from "./pages/HomePage";
import Graph from "./components/Graph";
import Navbar from "./components/Navbar";
import GridMenu from "./pages/GridMenu";
import { getGraphData, getPaths } from "../database/graphData";
import { initAuthStateListener, auth } from "../database/firebase";
import TopicEntry from "./components/TopicEntry";
import Backtrack from "./components/Backtrack";
import BookmarkMenu from "./pages/BookmarkMenu";
import TopicEditForm from "./pages/TopicEditForm";

function App() {
  const [graphData, setGraphData] = useState({ nodes: [], links: [] });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [userData, setUserData] = useState(null);
  const [key, setKey] = useState(0);

  let oldData = null;

  const fetchData = async () => {
    try {
      const data = await getGraphData();
      if (oldData === null || !isEqualData(oldData, data)) {
        oldData = data;
        setGraphData(data);
        console.log("data is now", data);
      }
    } catch (err) {
      setError(err);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();

    const intervalId = setInterval(fetchData, 1000);

    return () => {
      clearInterval(intervalId);
    };
  }, []);

  useEffect(() => {
    initAuthStateListener();

    const unsubscribe = auth.onAuthStateChanged((user) => {
      setUserData(user);
      setKey((prevKey) => prevKey + 1);
      console.log(user ? "User data: " + user : "No user is signed in");
    });

    return () => unsubscribe();
  }, []);

  if (loading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>Error loading graph data: {error.message}</div>;
  }

  return (
    <Router>
      <div>
        <Navbar />
        <Routes key={key}>
          <Route path="/" element={<HomePage />} />
          <Route path="/grid-menu" element={<GridMenu />} />
          <Route path="/bookmarked" element={<BookmarkMenu />} />
          <Route
            path="/editTopic/:topicName"
            element={<TopicEditFormWrapper />}
          />
          <Route
            path="/graph/:subject"
            element={
              <GraphRouteWrapper graphData={graphData} userData={userData} />
            }
          />
          <Route
            path="/topic/:node"
            element={
              <TopicRouteWrapper graphData={graphData} userData={userData} />
            }
          />
          <Route
            path="/subgraph/:topicName"
            element={
              <SubgraphRouteWrapper graphData={graphData} userData={userData} />
            }
          />
        </Routes>
      </div>
    </Router>
  );
}

function TopicEditFormWrapper() {
  const { topicName } = useParams();
  return <TopicEditForm topicName={topicName} />;
}

function TopicRouteWrapper({ graphData, userData }) {
  const { node } = useParams();

  useEffect(() => {
    console.log("TopicRouteWrapper userData changed:", userData);
  }, [userData]);

  return <TopicEntry node={node} graphData={graphData} userData={userData} />;
}

function GraphRouteWrapper({ graphData, userData }) {
  const { subject } = useParams();
  const [paths, setPaths] = useState([]);

  useEffect(() => {
    const fetchPaths = async () => {
      try {
        const paths = await getPaths(subject, graphData);
        setPaths(paths);
      } catch (error) {
        console.error("Error fetching paths:", error);
      }
    };

    fetchPaths();
  }, [subject, graphData]);

  useEffect(() => {
    console.log("GraphRouteWrapper userData changed:", userData);
  }, [userData]);

  return (
    <>
      <Backtrack paths={paths} />
      <Graph
        nodes={graphData.nodes}
        links={graphData.relationships}
        subject={subject}
        width={1500}
        height={600}
      />
    </>
  );
}

function SubgraphRouteWrapper({ graphData, userData }) {
  const { topicName } = useParams();
  const node = graphData.nodes.find((n) => n.name === topicName);
  const subject = node.subject;

  useEffect(() => {
    console.log("SubgraphRouteWrapper userData changed:", userData);
  }, [userData]);

  return (
    <Graph
      nodes={graphData.nodes}
      links={graphData.relationships}
      subject={subject}
      width={1500}
      height={600}
    />
  );
}

function isEqualData(oldData, data) {
  const transformedOldData = {
    nodes: oldData.nodes,
    relationships: oldData.relationships.map((n) => {
      if (n.source.name != null) {
        return { source: n.source.name, target: n.target.name, order: n.order };
      } else {
        return { source: n.source, target: n.target, order: n.order };
      }
    }),
  };

  if (
    transformedOldData.nodes.length !== data.nodes.length ||
    transformedOldData.relationships.length !== data.relationships.length
  ) {
    return false;
  }

  const nodesEqual = transformedOldData.nodes.every((node, index) => {
    const newNode = data.nodes[index];
  
    if (node.name !== newNode.name) {
      return false;
    }
  
    if (node.type === "topic" && newNode.type === "topic") {
      const oldRatings = {
        good: node.good?.low || 0,
        bad: node.bad?.low || 0,
        alright: node.alright?.low || 0,
      };
  
      const newRatings = {
        good: newNode.good?.low || 0,
        bad: newNode.bad?.low || 0,
        alright: newNode.alright?.low || 0,
      };
  
      const oldMaxRating = Math.max(oldRatings.good, oldRatings.bad, oldRatings.alright);
      const newMaxRating = Math.max(newRatings.good, newRatings.bad, newRatings.alright);
  
      const oldDominant = Object.keys(oldRatings).find(key => oldRatings[key] === oldMaxRating);
      const newDominant = Object.keys(newRatings).find(key => newRatings[key] === newMaxRating);
  
      if (oldDominant !== newDominant) {
        return false
      }
    }

    if (node.type === "topic" && node.suggestions.length !== data.nodes[index].suggestions.length) {
      return false
    }

    return true;
  });
  

  const relationshipsEqual = transformedOldData.relationships.every(
    (rel, index) => {
      return (
        rel.source === data.relationships[index].source &&
        rel.target === data.relationships[index].target &&
        rel.order === data.relationships[index].order
      );
    }
  );

  return nodesEqual && relationshipsEqual;
}

export default App;
