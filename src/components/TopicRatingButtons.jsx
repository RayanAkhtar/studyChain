import React, { useState, useEffect } from "react";
import { BsEmojiSmile, BsEmojiNeutral, BsEmojiFrown } from "react-icons/bs";
import { updateRating, getRating } from "../../database/firebase";
import {
  decreaseRatingInGraph,
  increaseRatingInGraph,
} from "../../database/graphData";

const TopicRatingButtons = ({ onRatingChange, userEmail, topicName }) => {
  const [selectedRating, setSelectedRating] = useState(null);
  const [hoveredRating, setHoveredRating] = useState(null);

  useEffect(() => {
    const fetchRating = async () => {
      try {
        const rating = await getRating(userEmail, topicName);
        setSelectedRating(rating);
      } catch (error) {
        console.error("Error fetching rating:", error);
      }
    };

    fetchRating();
  }, [userEmail, topicName]);

  const handleRatingHover = (rating) => {
    setHoveredRating(rating);
  };

  const handleRatingClick = (rating) => {
    if (selectedRating === rating) {
      setSelectedRating(null);
      decreaseRatingInGraph(topicName, rating);
    } else {
      if (selectedRating !== null && selectedRating !== undefined) {
        decreaseRatingInGraph(topicName, selectedRating);
      }
      increaseRatingInGraph(topicName, rating);
      setSelectedRating(rating);
      onRatingChange(rating);
    }
    updateRating(userEmail, topicName, rating);
  };

  return (
    <div
      className="rating-icons"
      style={{ display: "flex", justifyContent: "center", gap: "20px" }}
    >
      <div
        onClick={() => handleRatingClick("good")}
        onMouseEnter={() => handleRatingHover("good")}
        onMouseLeave={() => handleRatingHover(null)}
        style={{
          cursor: "pointer",
          color:
            selectedRating === "good" || hoveredRating === "good"
              ? "green"
              : "black",
        }}
      >
        <BsEmojiSmile size={50} />
        <span style={{ display: "block", textAlign: "center" }}>Good</span>
      </div>
      <div
        onClick={() => handleRatingClick("alright")}
        onMouseEnter={() => handleRatingHover("alright")}
        onMouseLeave={() => handleRatingHover(null)}
        style={{
          cursor: "pointer",
          color:
            selectedRating === "alright" || hoveredRating === "alright"
              ? "yellow"
              : "black",
        }}
      >
        <BsEmojiNeutral size={50} />
        <span style={{ display: "block", textAlign: "center" }}>Alright</span>
      </div>
      <div
        onClick={() => handleRatingClick("bad")}
        onMouseEnter={() => handleRatingHover("bad")}
        onMouseLeave={() => handleRatingHover(null)}
        style={{
          cursor: "pointer",
          color:
            selectedRating === "bad" || hoveredRating === "bad"
              ? "red"
              : "black",
        }}
      >
        <BsEmojiFrown size={50} />
        <span style={{ display: "block", textAlign: "center" }}>Bad</span>
      </div>
    </div>
  );
};

export default TopicRatingButtons;
