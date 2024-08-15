import React from "react";
import { Link } from "react-router-dom";
import "../styles/Backtrack.css";

const Backtrack = ({ paths }) => {
  return (
    <nav className="backtrack">
      {paths.map((path, index) => (
        <span key={index} className="backtrack-item">
          {index < paths.length - 1 ? (
            <>
              <Link to={"/graph/" + path.name}>{path.name}</Link>
              <span className="backtrack-separator">/</span>
            </>
          ) : (
            <span className="backtrack-last">{path.name}</span>
          )}
        </span>
      ))}
    </nav>
  );
};

export default Backtrack;
