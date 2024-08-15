import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import NavbarDropdown from "./NavbarDropdown";
import AuthFormOverlay from "./FormOverlay";
import SearchBar from "./SearchBar";
import {
  auth,
  getSuggestionData,
  getUserPrivledge,
} from "../../database/firebase";
import { FaBookmark } from "react-icons/fa";
import "../styles/Navbar.css";
import SuggestedTopicsOverlay from "./SuggestedTopicsOverlay";
import NotificationAside from "./NotificationAside";

const MyNavbar = () => {
  const [isFormOpen, setIsFormOpen] = useState(false);
  const [formType, setFormType] = useState("");
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [privilegeLevel, setPrivilegeLevel] = useState(null);
  const [showSuggestedTopics, setShowSuggestedTopics] = useState(false);
  const [suggestedNum, setSuggestedNum] = useState(0);

  useEffect(() => {
    const fetchPrivilegeAndSuggestions = async (user) => {
      if (user) {
        try {
          const privilege = await getUserPrivledge(user.email);
          setPrivilegeLevel(privilege);

          if (privilege === "moderator") {
            const suggestions = await getSuggestionData();
            setSuggestedNum(suggestions.length);
          }
        } catch (error) {
          console.error("Error fetching user privilege:", error);
        }
      } else {
        setPrivilegeLevel("guest");
        setSuggestedNum(0);
      }
    };

    const unsubscribe = auth.onAuthStateChanged((user) => {
      setIsLoggedIn(!!user);
      fetchPrivilegeAndSuggestions(user);
    });

    const intervalId = setInterval(async () => {
      const user = auth.currentUser;
      if (user && privilegeLevel === "moderator") {
        fetchPrivilegeAndSuggestions(user);
      }
    }, 3000);

    return () => {
      clearInterval(intervalId);
      unsubscribe();
    };
  }, [privilegeLevel]);

  const handleLogout = () => {
    auth
      .signOut()
      .then(() => {
        console.log("User logged out");
      })
      .catch((error) => {
        console.error("Error signing out:", error);
      });
  };

  const handleOpenForm = (type) => {
    setIsFormOpen(true);
    setFormType(type);
  };

  const handleCloseForm = () => {
    setIsFormOpen(false);
  };

  const handleShowSuggestedTopics = () => {
    setShowSuggestedTopics(true);
  };

  const handleCloseSuggestedTopics = () => {
    setShowSuggestedTopics(false);
  };

  const getSuggestedTopics = async () => {
    return await getSuggestionData();
  };

  if (privilegeLevel === null) {
    return null;
  }

  return (
    <div>
      <nav className="navbar navbar-expand-lg bg-body-tertiary our-navbar">
        <div className="container-fluid">
          <LogoAndDropdown />

          {privilegeLevel === "guest" ? (
            <DisabledTopicAdder />
          ) : privilegeLevel === "member" ? (
            <>
              <TopicSuggester handleOpenForm={handleOpenForm} />
              <BookmarkButton />
            </>
          ) : privilegeLevel === "moderator" ? (
            <>
              <SeeSuggestedTopics
                handleShowSuggestedTopics={handleShowSuggestedTopics}
                suggestedNum={suggestedNum}
              />
              <TopicAdder handleOpenForm={handleOpenForm} />
            </>
          ) : (
            <h1>ERROR: Not guest, member, or moderator</h1>
          )}

          <SearchBar />

          {privilegeLevel === "member" && <NotificationAside />}

          {!isLoggedIn ? (
            <LoggedOutButtons handleOpenForm={handleOpenForm} />
          ) : (
            <LoggedInButtons handleLogout={handleLogout} />
          )}
        </div>
      </nav>
      {isFormOpen && (
        <AuthFormOverlay onClose={handleCloseForm} formType={formType} />
      )}
      {showSuggestedTopics && (
        <SuggestedTopicsOverlay
          open={showSuggestedTopics}
          onClose={handleCloseSuggestedTopics}
          suggestedTopics={getSuggestedTopics}
        />
      )}
    </div>
  );
};

const LogoAndDropdown = () => (
  <>
    <Link className="navbar-brand our-logo" to="/">
      StudyChain
    </Link>
    <button
      className="navbar-toggler"
      type="button"
      aria-label="Toggle navigation"
    >
      <span className="navbar-toggler-icon"></span>
    </button>
    <NavbarDropdown />
  </>
);

const DisabledTopicAdder = () => (
  <div className="collapse navbar-collapse">
    <ul className="navbar-nav mr-auto">
      <li className="nav-item">
        <div className="tooltip-wrapper">
          <button
            className="btn btn-success disabled-button-style dis-button"
            disabled
            style={{ fontSize: "12px" }}
          >
            Login to add a topic
          </button>
          <span className="tooltip-text">Please login to add a topic</span>
        </div>
      </li>
    </ul>
  </div>
);

const TopicSuggester = ({ handleOpenForm }) => (
  <div className="collapse navbar-collapse">
    <ul className="navbar-nav mr-auto">
      <li className="nav-item">
        <button
          className="btn btn-success suggest-topic-style"
          onClick={() => handleOpenForm("suggest")}
        >
          Suggest a Topic
        </button>
      </li>
    </ul>
  </div>
);

const SeeSuggestedTopics = ({ handleShowSuggestedTopics, suggestedNum }) => (
  <div className="collapse navbar-collapse">
    <ul className="navbar-nav mr-auto">
      <li className="nav-item see-suggested-topics-container">
        <button
          className="btn btn-warning see-suggested-topics-style"
          onClick={handleShowSuggestedTopics}
        >
          View Suggested Topics
        </button>
        <span className="badge suggested-topics-badge">{suggestedNum}</span>
      </li>
    </ul>
  </div>
);

const TopicAdder = ({ handleOpenForm }) => (
  <div className="collapse navbar-collapse">
    <ul className="navbar-nav mr-auto">
      <li className="nav-item">
        <button
          className="btn btn-success add-topic-style"
          onClick={() => handleOpenForm("add")}
        >
          Add a Topic
        </button>
      </li>
    </ul>
  </div>
);

const BookmarkButton = () => (
  <div className="collapse navbar-collapse">
    <ul className="navbar-nav mr-auto">
      <li className="nav-item">
        <Link to="/bookmarked" className="btn btn-warning bookmark-style">
          <FaBookmark /> Bookmarks
        </Link>
      </li>
    </ul>
  </div>
);

const LoggedOutButtons = ({ handleOpenForm }) => (
  <>
    <button
      className="btn btn-outline-success login-style our-login"
      onClick={() => handleOpenForm("login")}
    >
      Login
    </button>
    <button
      className="btn btn-outline-success"
      onClick={() => handleOpenForm("signup")}
    >
      Sign Up
    </button>
  </>
);

const LoggedInButtons = ({ handleLogout }) => (
  <button
    className="btn btn-outline-danger logout-style"
    onClick={handleLogout}
  >
    Logout
  </button>
);

export default MyNavbar;
