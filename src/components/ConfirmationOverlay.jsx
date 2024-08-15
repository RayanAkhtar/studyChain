import React from "react";
import "../styles/ConfirmationOverlay.css";

const ConfirmationOverlay = ({ open, onClose, onConfirm }) => {
  if (!open) return null;

  return (
    <div className="overlay-container">
      <div className="overlay-content confirmation-box">
        <div className="overlay-header">
          <span className="confirmation-message">
            Are you sure you want to delete this topic?
          </span>
          <button className="close-button" onClick={onClose}>
            &times;
          </button>
        </div>
        <div className="confirmation-buttons">
          <button className="btn btn-primary" onClick={onConfirm}>
            Yes
          </button>
          <button className="btn btn-secondary" onClick={onClose}>
            No
          </button>
        </div>
      </div>
    </div>
  );
};

export default ConfirmationOverlay;
