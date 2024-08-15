import React, { useState, useEffect } from "react";
import {
  deleteSuggestionFromTopic,
  getFormData,
  getNode,
  updateFormData,
  updateNode,
} from "../../database/graphData";
import "../styles/TopicEditForm.css";
import Button from "react-bootstrap/Button";
import { writeNotification } from "../../database/firebase";

const TopicEditForm = ({ topicName }) => {
  const [topicNode, setTopicNode] = useState(null);
  const [formData, setFormData] = useState(null);
  const [messages, setMessages] = useState([]);
  const [showAside, setShowAside] = useState(false);
  const [editableLabel, setEditableLabel] = useState(null);
  const [editableValue, setEditableValue] = useState("");

  useEffect(() => {
    const fetchTopicData = async () => {
      try {
        const fetchedTopicNode = await getNode(topicName);
        const fetchedFormData = await getFormData(topicName);
        setTopicNode(fetchedTopicNode);
        setFormData(fetchedFormData);
      } catch (error) {
        console.error("Error fetching topic data:", error);
      }
    };
    fetchTopicData();
  }, [topicName]);

  useEffect(() => {
    const fetchNotifications = async () => {
      try {
        const fetchedTopicNode = await getNode(topicName);
        setMessages(
          fetchedTopicNode.suggestions.map((d, i) => ({ text: d, id: i }))
        );
      } catch (error) {
        console.error("Error fetching notifications:", error);
      }
    };

    fetchNotifications();

    const interval = setInterval(fetchNotifications, 3000);

    return () => clearInterval(interval);
  }, [topicName]);

  const handleInputChange = (e, label, isTopicNode) => {
    const newValue = e.target.value;

    if (isTopicNode) {
      setTopicNode((prevState) => ({
        ...prevState,
        [label]: newValue,
      }));
    } else {
      setFormData((prevState) => ({
        ...prevState,
        [label]: newValue,
      }));
    }
  };

  const handleLabelClick = (label) => {
    setEditableLabel(label);
    setEditableValue(label);
  };

  const handleLabelChange = (e) => {
    setEditableValue(e.target.value);
  };

  const handleLabelBlur = (oldLabel, isTopicNode) => {
    const newLabel = editableValue.trim();

    if (isTopicNode) {
      setTopicNode((prevState) => {
        const { [oldLabel]: value, ...rest } = prevState;
        return { ...rest, [newLabel]: value };
      });
    } else {
      setFormData((prevState) => {
        const { [oldLabel]: value, ...rest } = prevState;
        return { ...rest, [newLabel]: value };
      });
    }

    setEditableLabel(null);
  };

  const handleSubmit = async () => {
    try {
      const processedTopicNode = { ...topicNode };
      const processedFormData = { ...formData };

      Object.keys(processedTopicNode).forEach((key) => {
        if (
          key === "learning_objectives" &&
          typeof processedTopicNode[key] === "string"
        ) {
          processedTopicNode[key] = processedTopicNode[key]
            .split("\n")
            .map((line) => line.trim());
        }
      });

      Object.keys(processedFormData).forEach((key) => {
        if (typeof processedFormData[key] === "string") {
          processedFormData[key] = processedFormData[key]
            .split("\n")
            .map((line) => line.trim());
        }
      });

      const allFormData = { ...processedTopicNode, ...processedFormData };

      console.log("Form submitted:", allFormData);

      const successNode = await updateNode(topicName, processedTopicNode);
      const successForm = await updateFormData(topicName, processedFormData);

      if (successNode && successForm) {
        console.log("Form and Node successfully updated");
        const path = `/topic/${topicName}`;

        await writeNotification({
          text: `Topic content updated: ${topicName}`,
          path: path
        });
        window.location.assign(path);
      } else {
        console.error("Error updating form or node");
        alert("Error updating form or node. Please try again later.");
      }
    } catch (error) {
      console.error("Error handling form submission:", error);
      alert(
        "An error occurred while handling the form submission. Please try again later."
      );
    }
  };

  const handleDeleteMessage = async (id) => {
    try {
      const messageToDelete = messages.find((message) => message.id === id);

      if (!messageToDelete) {
        console.error(`Message with id ${id} not found.`);
        return;
      }
      await deleteSuggestionFromTopic(topicName, messageToDelete.text);

      setMessages((prevMessages) =>
        prevMessages.filter((message) => message.id !== id)
      );
    } catch (error) {
      console.error("Error deleting message:", error);
      alert(
        "An error occurred while deleting the message. Please try again later."
      );
    }
  };

  const renderFormElement = (label, value, isTopicNode) => {
    const topicNodePropsToUse = [
      "name",
      "subject",
      "description",
      "learning_objectives",
    ];

    if (isTopicNode) {
      if (topicNodePropsToUse.includes(label)) {
        let processedValue = value;

        if (Array.isArray(value)) {
          processedValue = value.join("\n");
        }

        return (
          <div key={label} className="form-group">
            <label
              className={`form-label ${editableLabel === label ? "editable-label" : ""}`}
              onClick={() => handleLabelClick(label)}
            >
              {asTitle(label)}:
            </label>
            <textarea
              value={processedValue}
              onChange={(e) => handleInputChange(e, label, true)}
              className="form-control"
              rows="5"
            />
          </div>
        );
      }
    } else {
      let processedValue = value;
      if (Array.isArray(value)) {
        processedValue = value.join("\n");
      }

      return (
        <div key={label} className="form-group">
          {editableLabel === label ? (
            <input
              type="text"
              value={editableValue}
              onChange={handleLabelChange}
              onBlur={() => handleLabelBlur(label, false)}
              className="form-control"
            />
          ) : (
            <label
              className={`form-label editable-label`}
              onClick={() => handleLabelClick(label)}
            >
              {asTitle(label)}:
            </label>
          )}
          <textarea
            type="text"
            value={processedValue}
            onChange={(e) => handleInputChange(e, label, false)}
            className="form-control"
            rows="5"
          />
        </div>
      );
    }
  };

  const renderForm = () => {
    if (!topicNode || !formData) return null;

    const topicNodeElements = Object.entries(topicNode).map(([key, value]) =>
      renderFormElement(key, value, true)
    );

    const formDataElements = Object.entries(formData).map(([key, value]) =>
      renderFormElement(key, value, false)
    );

    return (
      <div className="topic-edit-container">
        <div className="form-section">
          <div className="d-flex justify-content-between align-items-center mb-3">
            <Button
              variant="dark"
              onClick={() => window.location.assign(`/topic/${topicName}`)}
              className="our-back-button"
            >
              Go Back
            </Button>
            <Button variant="info" onClick={() => setShowAside(!showAside)}>
              {showAside ? "Hide Suggestions" : "Show Suggestions"}
            </Button>
          </div>
          <h1> Editing Topic: {topicName}</h1>
          <h2 style={{ marginTop: "30px", marginBottom: "20px" }}>
            Required Topic Details
          </h2>
          {topicNodeElements}
          <h2 style={{ marginTop: "80px", marginBlock: "20px" }}>
            Extra Details
          </h2>
          {formDataElements}
          <div className="d-flex justify-content-between align-items-center mb-3">
            <div></div>
            <Button
              variant="success"
              className="our-submit-button float-right"
              onClick={handleSubmit}
            >
              Submit
            </Button>
          </div>
        </div>
        {showAside && (
          <aside className="message-aside">
            <div className="d-flex justify-content-end">
              <h2 style={{ marginRight: "auto" }}>Suggestions</h2>
              <Button variant="info" onClick={() => setShowAside(false)}>
                Close
              </Button>
            </div>
            {messages.map((message) => (
              <div key={message.id} className="message">
                <span>{message.text}</span>
                <button
                  className="delete-button"
                  onClick={() => handleDeleteMessage(message.id)}
                >
                  x
                </button>
              </div>
            ))}
          </aside>
        )}
      </div>
    );
  };

  return renderForm();
};

const asTitle = (str) => {
  return str.replace(/\b\w/g, (char) => char.toUpperCase());
};

export default TopicEditForm;
