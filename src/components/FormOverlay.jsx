import React, { useState } from "react";
import ReactDOM from "react-dom";
import LoginForm from "./LoginForm";
import SignupForm from "./SignupForm";
import TopicAdderForm, { handleTopicAdderSubmit } from "./TopicAdderForm.jsx";
import {
  createUserWithEmailAndPassword,
  signInWithEmailAndPassword,
} from "firebase/auth";
import { addUserSuggestion, auth } from "../../database/firebase.js";
import { addDoc, collection } from "firebase/firestore";
import { db } from "../../database/firebase.js";
import "../styles/FormOverlay.css";

const FormOverlay = ({ onClose, formType }) => {
  const usersCollectionRef = collection(db, "Users");

  const [selectedType, setSelectedType] = useState("");
  const [formData, setFormData] = useState({
    type: "",
    name: "",
    theme: "",
    subject: "",
    prerequisites: "",
    email: "",
    password: "",
    confirmPassword: "",
  });

  const [userEmail, setUserEmail] = useState("");

  const handleTypeChange = (event) => {
    const newType = event.target.value;
    setFormData((prevData) => ({
      ...prevData,
      type: newType,
    }));
    setSelectedType(newType);
  };

  const handleChange = (event) => {
    const { name, value } = event.target;
    setFormData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    let isValid = false;
    let errorMessage = "";

    if (
      formType === "signup" &&
      formData.password !== formData.confirmPassword
    ) {
      errorMessage = "Password and confirm password must match.";
    } else {
      const signingUp = async () => {
        try {
          const userCredential = await createUserWithEmailAndPassword(
            auth,
            formData.email,
            formData.password
          );
          setUserEmail(formData.email);
          isValid = true;
          return userCredential.user.uid;
        } catch (error) {
          console.error(error);
          errorMessage = "Signup failed. Please try again.";
        }
      };

      const loggingIn = async () => {
        try {
          const userCredential = await signInWithEmailAndPassword(
            auth,
            formData.email,
            formData.password
          );
          setUserEmail(formData.email);
          isValid = true;
          return userCredential.user.uid;
        } catch (error) {
          console.error(error);
          errorMessage = "Login failed. Please try again.";
        }
      };

      if (formType === "login") {
        const userId = await loggingIn();
        if (userId) {
          handleSubmitWithUserId(event, userId);
        }
      } else if (formType === "signup") {
        const userId = await signingUp();
        if (userId) {
          handleSubmitWithUserId(event, userId);
        }
      } else if (formType === "add") {
        isValid = await handleTopicAdderSubmit(formData, isValid);
      } else if (formType === "suggest") {
        const suggestion = {
          email: userEmail,
          name: formData.name,
          prerequisites: formData.prerequisites.split(","),
          subject: formData.subject,
          theme: formData.theme,
          type: formData.type,
        };
        isValid = addUserSuggestion(suggestion);
      } else {
        console.error("unknown formtype: " + formType);
      }
    }

    if (isValid) {
      onClose();
    } else {
      setFormData((prevData) => ({
        ...prevData,
        password: "",
        confirmPassword: "",
      }));
      alert(errorMessage);
    }
  };

  const handleSubmitWithUserId = async (event, userId) => {
    const documentData = {
      email: formData.email,
      userId: userId,
      privledge: "member",
      subjectProgress: {},
      bookmarks: {},
      ratings: {},
      notifications: [],
    };

    try {
      if (formType === "signup") {
        await addDoc(usersCollectionRef, documentData);
      }
      onClose();
    } catch (error) {
      console.error("Error adding document:", error);
    }
  };

  const renderForm = () => {
    if (formType === "login") {
      return (
        <LoginForm
          formData={formData}
          handleChange={handleChange}
          handleSubmit={handleSubmit}
        />
      );
    } else if (formType === "signup") {
      return (
        <SignupForm
          formData={formData}
          handleChange={handleChange}
          handleSubmit={handleSubmit}
        />
      );
    } else {
      return (
        <TopicAdderForm
          formData={formData}
          selectedType={selectedType}
          handleChange={handleChange}
          handleTypeChange={handleTypeChange}
          handleSubmit={handleSubmit}
        />
      );
    }
  };

  return ReactDOM.createPortal(
    <div className="auth-form-overlay auth-form-overlay">
      <div className="form-container form-container-2">
        <button
          className="close-button close-button-2"
          onClick={onClose}
          aria-label="Close form"
        >
          &times;
        </button>
        <h2>
          {formType === "login"
            ? "Login"
            : formType === "signup"
            ? "Sign Up"
            : "Add a New Entry"}
        </h2>
        <div className="form-content">{renderForm()}</div>
      </div>
    </div>,
    document.body
  );
};

export default FormOverlay;
