import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { getMainSubjects } from "../../database/graphData";
import "../styles/GridMenu.css";

const GridMenu = () => {
  const [subjects, setSubjects] = useState(null);

  useEffect(() => {
    const fetchSubjects = async () => {
      try {
        const subjectsData = await getMainSubjects();
        setSubjects(subjectsData);
      } catch (error) {
        console.error("Error fetching subjects:", error);
      }
    };

    fetchSubjects();

    const interval = setInterval(fetchSubjects, 3000);

    return () => clearInterval(interval);
  }, []);

  if (!subjects) {
    return <div>Loading...</div>;
  }

  const themes = [...new Set(subjects.map((subject) => subject.theme))];

  return (
    <div className="col grid-container">
      {themes.map((theme) => (
        <div className="grid-section" key={theme}>
          <h2 style={{ marginBottom: "20px" }}>{theme}</h2>
          {subjects
            .filter((subject) => subject.theme === theme)
            .map((subject, index) => (
              <Link to={`/graph/${subject.name}`} key={index}>
                <button className="btn btn-light btn-outline-success grid-button">
                  {subject.name}
                </button>
              </Link>
            ))}
        </div>
      ))}
    </div>
  );
};

export default GridMenu;
