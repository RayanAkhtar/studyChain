import { Link } from "react-router-dom";
import studyChainLogo from "../assets/StudyChain.jpg";

function HomePage() {
  const ourExploreButton = {
    width: "200px",
    padding: "10px 20px",
    fontSize: "1.2rem",
  };

  return (
    <div
      style={{
        display: "flex",
        alignItems: "center",
        justifyContent: "space-between",
        margin: "auto",
        marginTop: "50px",
        width: "90%",
        padding: "20px",
        height: "80%",
        background: "#f8f9fa",
        borderRadius: "20px",
        boxShadow: "0px 0px 20px rgba(0, 0, 0, 0.1)",
      }}
    >
      <div style={{ flex: 2, margin: "10px" }}>
        <h1 style={{ fontSize: "3.5rem", marginBottom: "20px", color: "#333" }}>
          StudyChain
        </h1>
        <h3 style={{ fontSize: "1.8rem", color: "#666", marginBottom: "30px" }}>
          Studying Made Simple
        </h3>
        <Link to="/grid-menu">
          <button
            type="button"
            className="btn btn-dark"
            style={ourExploreButton}
          >
            Explore Our Topics
          </button>
        </Link>
      </div>

      <div
        style={{
          flex: 1,
          margin: "10px",
          marginLeft: "auto",
          marginRight: "20px",
        }}
      >
        <img
          src={studyChainLogo}
          alt="StudyChain Logo"
          style={{ maxWidth: "100%", height: "auto", borderRadius: "10px" }}
        />
      </div>
    </div>
  );
}

export default HomePage;
