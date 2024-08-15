import React from "react";
import "../styles/FormOverlay.css";

const SignupForm = ({ formData, handleChange, handleSubmit }) => (
  <form onSubmit={handleSubmit} className="signup-form">
    <div className="form-group">
      <label htmlFor="email">Email</label>
      <input
        type="email"
        name="email"
        placeholder="Enter email"
        className="form-control"
        value={formData.email}
        onChange={handleChange}
        required
      />
    </div>
    <div className="form-group">
      <label htmlFor="password">Password</label>
      <input
        type="password"
        name="password"
        className="form-control"
        placeholder="Enter password (at least 6 characters)"
        value={formData.password}
        onChange={handleChange}
        minLength="6"
        required
      />
    </div>
    <div className="form-group">
      <label htmlFor="confirmPassword">Confirm Password</label>
      <input
        type="password"
        name="confirmPassword"
        className="form-control"
        placeholder="Confirm password"
        value={formData.confirmPassword}
        onChange={handleChange}
        required
      />
    </div>
    <button type="submit" className="btn btn-success submit-button-style">
      Submit
    </button>
  </form>
);

export default SignupForm;
