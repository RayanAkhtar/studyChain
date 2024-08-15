import React, { useState } from "react";
import "../styles/SuggestionOverlay.css";
import { addSuggestionToTopic } from "../../database/graphData";

const SuggestionOverlay = ({ onClose, topicName }) => {
  const [suggestion, setSuggestion] = useState("");
  const [showSuccessMessage, setShowSuccessMessage] = useState(false);
  const [showErrorMessage, setShowErrorMessage] = useState(false);

  const handleInputChange = (event) => {
    setSuggestion(event.target.value);
    setShowSuccessMessage(false);
  };

  const handleSubmit = async () => {
    console.log("Suggestion submitted:", suggestion);

    try {
      let result = await addSuggestionToTopic(topicName, suggestion);
      if (result) {
        setSuggestion("");
        setShowSuccessMessage(true);
        setTimeout(() => {
          setShowSuccessMessage(false);
        }, 3000);
      }
    } catch (error) {
      console.error("Error submitting suggestion:", error);
      setShowErrorMessage(true);
      setTimeout(() => {
        setShowErrorMessage(false);
      }, 3000);
    }
  };

  return (
    <div className="overlay">
      <div className="overlay-content">
        <div className="overlay-header">
          <h2>Suggest Topic</h2>
          <button className="close-btn" onClick={onClose}>
            x
          </button>
        </div>
        <div className="input-group mb-3">
          <input
            type="text"
            className="form-control"
            value={suggestion}
            onChange={handleInputChange}
            placeholder="Enter your suggestion..."
          />
        </div>
        <button
          className="btn btn-outline-primary btn-block"
          type="button"
          onClick={handleSubmit}
        >
          Submit
        </button>
        {showSuccessMessage && (
          <div className="success-message">
            Suggestion submitted successfully!
          </div>
        )}
      </div>
    </div>
  );
};

export default SuggestionOverlay;
