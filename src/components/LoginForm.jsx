import React from "react";
import "../styles/FormOverlay.css";

const LoginForm = ({ formData, handleChange, handleSubmit }) => (
  <form onSubmit={handleSubmit}>
    <div className="form-group">
      <label htmlFor="email">Email</label>
      <input
        type="email"
        name="email"
        className="form-control"
        placeholder="Enter email"
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
        placeholder="Enter password"
        value={formData.password}
        onChange={handleChange}
        required
      />
    </div>
    <button type="submit" className="btn btn-success submit-button-style">
      Submit
    </button>
  </form>
);

export default LoginForm;
