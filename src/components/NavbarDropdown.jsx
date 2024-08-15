import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { getMainSubjects } from "../../database/graphData";

const NavbarDropdown = () => {
  const dropDownMenuStyle = {
    maxWidth: "200px",
  };

  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const [subjects, setSubjects] = useState([]);

  const handleMouseEnter = () => {
    setIsDropdownOpen(true);
  };

  const handleMouseLeave = () => {
    setIsDropdownOpen(false);
  };

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

  return (
    <div
      className={`collapse navbar-collapse ${isDropdownOpen ? "show" : ""}`}
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
      style={dropDownMenuStyle}
    >
      <ul className="navbar-nav me-auto mb-2 mb-lg-0" style={dropDownMenuStyle}>
        <li className="nav-item dropdown" style={dropDownMenuStyle}>
          <Link
            className="nav-link dropdown-toggle"
            to="/grid-menu"
            role="button"
            aria-expanded={isDropdownOpen ? "true" : "false"}
          >
            {" "}
            Explore Our Topics{" "}
          </Link>
          <ul className={`dropdown-menu ${isDropdownOpen ? "show" : ""}`}>
            {subjects.slice(0, 5).map((subject, index) => (
              <li key={index}>
                <Link className="dropdown-item" to={`/graph/${subject.name}`}>
                  {subject.name}
                </Link>
              </li>
            ))}
          </ul>
        </li>
      </ul>
    </div>
  );
};

export default NavbarDropdown;
