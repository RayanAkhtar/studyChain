import React from "react";
import "../styles/FormOverlay.css";
import {
  addMainSubjectToGraph,
  addMiniSubjectToGraph,
  addTopicToGraph,
  mainSubjectExists,
  mainSubjectExistsForMini,
  nameExists,
  nodeExists,
  subjectExists,
} from "../../database/graphData";
import { writeNotification } from "../../database/firebase";

const TopicAdderForm = ({
  formData,
  selectedType,
  handleChange,
  handleTypeChange,
  handleSubmit,
}) => {
  const isInGraphPath = window.location.pathname.includes("/graph/");

  if (!isInGraphPath) {
    // render only the main form
    formData.type = "main-subject";
    return (
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="type">Type</label>
          <select
            id="type"
            name="type"
            className="form-control"
            value={selectedType}
            onChange={handleTypeChange}
          >
            <option value="main-subject">Main Subject</option>
          </select>
        </div>

        <>
          <div className="form-group">
            <label htmlFor="name">Name</label>
            <input
              type="text"
              className="form-control"
              id="name"
              name="name"
              placeholder="Enter name"
              value={formData.name}
              onChange={handleChange}
              required
            />
          </div>
          <div className="form-group">
            <label htmlFor="theme">Theme</label>
            <input
              type="text"
              className="form-control"
              id="theme"
              name="theme"
              placeholder="Enter the theme of this topic, for example 'mathematics'"
              value={formData.theme}
              onChange={handleChange}
              required
            />
          </div>
        </>

        <button type="submit" className="btn btn-success submit-button-style">
          Submit
        </button>
      </form>
    );
  }

  // full form if in a graph

  const fullPathArr = decodeURIComponent(window.location.pathname).split("/");
  const subject = fullPathArr[fullPathArr.length - 1];
  formData.subject = subject;
  formData.prerequisites = subject;

  return (
    <form onSubmit={handleSubmit}>
      <div className="form-group">
        <label htmlFor="type">Type</label>
        <select
          id="type"
          name="type"
          className="form-control"
          value={selectedType}
          onChange={handleTypeChange}
        >
          <option value="">Select Type</option>
          <option value="main-subject">Main Subject</option>
          <option value="mini-subject">Mini Subject</option>
          <option value="topic">Topic</option>
        </select>
      </div>
      {selectedType && (
        <>
          <div className="form-group">
            <label htmlFor="name">Name</label>
            <input
              type="text"
              className="form-control"
              id="name"
              name="name"
              placeholder="Enter name"
              value={formData.name}
              onChange={handleChange}
              required
            />
          </div>

          {selectedType === "main-subject" && (
            <div className="form-group">
              <label htmlFor="theme">Theme</label>
              <input
                type="text"
                className="form-control"
                id="theme"
                name="theme"
                placeholder="Enter the theme of this topic, for example 'mathematics'"
                value={formData.theme}
                onChange={handleChange}
                required
              />
            </div>
          )}
        </>
      )}
      <button type="submit" className="btn btn-success submit-button-style">
        Submit
      </button>
    </form>
  );
};

export async function handleTopicAdderSubmit(formData, isValid) {
  if (formData.type === "main-subject") {
    isValid = await validateMainSubject(formData);
    if (isValid) {
      await addMainSubjectToGraph(formData.name, formData.theme);
      const newPath = `/graph/${formData.name}`;
      await writeNotification({
        text: `New Main Subject Added: ${formData.name}`,
        path: newPath,
      });
      window.location.assign(newPath);
    } else {
      alert(
        "Please ensure that the form is filled, and that the name is not currently used as a topic, subject or mini-subject."
      );
    }
  } else if (formData.type === "mini-subject") {
    isValid = await validateMiniSubject(formData);
    if (isValid) {
      addMiniSubjectToGraph(
        formData.name,
        formData.subject,
        formData.prerequisites
      );
      await writeNotification({
        text: `New Mini Subject Added: ${formData.name}`,
        path: `/graph/${formData.subject}`,
      });
    } else {
      alert(
        "Please ensure that the form is filled, and that the name is not currently used as a topic, subject or mini-subject"
      );
    }
  } else if (formData.type === "topic") {
    isValid = await validateTopic(formData);
    if (isValid) {
      addTopicToGraph(formData.name, formData.subject, formData.prerequisites);
      await writeNotification({
        text: `New Topic Added ${formData.name}`,
        path: `/topic/${formData.name}`,
      });
    } else {
      alert(
        "Please ensure that the form is filled, and that the name is not currently used as a topic, subject or mini-subject."
      );
    }
  }
  return isValid;
}

const validateMainSubject = async (data) => {
  const nonEmpty = data.name.trim() !== "" && data.theme.trim() !== "";
  const nameExst = await nameExists("Subject", data);
  const nodeExst = await nodeExists("Subject", data)
  return nonEmpty && !nameExst && !nodeExst;
};

const validateMiniSubject = async (data) => {
  const nonEmpty =
    data.name.trim() !== "" &&
    data.subject.trim() !== "" &&
    data.prerequisites.trim() !== "";
  const mainSubExst = await mainSubjectExistsForMini("Subject", data);
  const minSubExst = await subjectExists("Subject", data);

  const prerequisitesArray = data.prerequisites
    .split(",")
    .map((prereq) => prereq.trim());

  for (const prerequisite of prerequisitesArray) {
    const exists = await nodeExists("Subject", { name: prerequisite });
    if (!exists) return false;
  }

  return nonEmpty && mainSubExst && !minSubExst;
};

const validateTopic = async (data) => {
  const nonEmpty =
    data.name.trim() !== "" &&
    data.subject.trim() !== "" &&
    data.prerequisites.trim() !== "";
  const mainSubExst = await mainSubjectExistsForMini("Subject", data, false);
  const topicExst = await nodeExists("Subject", data);

  const prerequisitesArray = data.prerequisites
    .split(",")
    .map((prereq) => prereq.trim());
  for (const prerequisite of prerequisitesArray) {
    const exists = await nodeExists("Subject", { name: prerequisite });
    if (!exists) return false;
  }

  return nonEmpty && mainSubExst && !topicExst;
};

export default TopicAdderForm;
