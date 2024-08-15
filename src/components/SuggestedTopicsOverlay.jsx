import React, { useState, useEffect } from "react";
import { RiDeleteBin6Line } from "react-icons/ri";
import "../styles/SuggestedTopicsOverlay.css";
import {
  getSuggestionData,
  deleteUserSuggestion,
} from "../../database/firebase";
import ConfirmationOverlay from "./ConfirmationOverlay";

const SuggestedTopicsOverlay = ({ open, onClose }) => {
  const [suggestedTopics, setSuggestedTopics] = useState([]);
  const [deleteTopicId, setDeleteTopicId] = useState(null);

  useEffect(() => {
    const fetchSuggestedTopics = async () => {
      try {
        const topics = await getSuggestionData();
        setSuggestedTopics(topics);
      } catch (error) {
        console.error("Error fetching suggested topics:", error);
      }
    };

    if (open) {
      fetchSuggestedTopics();
      const interval = setInterval(fetchSuggestedTopics, 3000);

      return () => clearInterval(interval);
    }
  }, [open]);

  const handleDeleteTopic = async (suggestionId) => {
    setDeleteTopicId(suggestionId);
  };

  const handleConfirmDelete = async () => {
    try {
      await deleteUserSuggestion(deleteTopicId);

      setSuggestedTopics((prevTopics) =>
        prevTopics.filter((topic) => topic.id !== deleteTopicId)
      );
    } catch (error) {
      console.error("Error deleting topic:", error);
    }
    setDeleteTopicId(null);
  };

  if (deleteTopicId) {
    return (
      <ConfirmationOverlay
        open={true}
        onClose={() => setDeleteTopicId(null)}
        onConfirm={handleConfirmDelete}
      />
    );
  }

  return (
    <>
      {open && (
        <div className="auth-form-overlay overlay-container" onClick={onClose}>
          <div
            className="form-container overlay-content"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="overlay-header">
              <span className="suggested-topics-title">Suggested Topics</span>
              <button className="close-button" onClick={onClose}>
                &times;
              </button>
            </div>
            {suggestedTopics.length === 0 ? (
              <div>No suggested topics available.</div>
            ) : (
              <div className="suggested-topics-container">
                {suggestedTopics.map((topic, index) => (
                  <div className="suggested-topic" key={index}>
                    <div className="topic-info">
                      <div className="suggested-topic-name">{topic.name}</div>
                      <div>
                        Type:
                        {topic.type === "main-subject"
                          ? " Main Subject"
                          : topic.type === "mini-subject"
                          ? " Mini Subject"
                          : topic.type === "topic"
                          ? " Topic"
                          : " Unknown"}
                      </div>
                      {topic.type === "main-subject" && (
                        <div>Theme: {topic.theme}</div>
                      )}
                      {topic.type === "mini-subject" && (
                        <div>
                          Subject: {topic.subject}
                          <br />
                          Prerequisites: {topic.prerequisites.join(", ")}
                        </div>
                      )}
                      {topic.type === "topic" && (
                        <div>
                          Subject: {topic.subject}
                          <br />
                          Prerequisites: {topic.prerequisites.join(", ")}
                        </div>
                      )}
                    </div>
                    <div className="delete-icon-container">
                      <button
                        className="btn btn-danger delete-button"
                        onClick={() => handleDeleteTopic(topic.id)}
                      >
                        <RiDeleteBin6Line className="delete-icon" />
                        Delete
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
      )}
    </>
  );
};

export default SuggestedTopicsOverlay;
