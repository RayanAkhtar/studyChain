import React, { useEffect, useState } from "react";
import { FaBell } from "react-icons/fa";
import Button from "react-bootstrap/Button";
import "../styles/NotificationAside.css";
import {
  deleteNotification,
  getCurrentUserData,
  getNotifications,
} from "../../database/firebase";

const NotificationAside = () => {
  const [showNotifications, setShowNotifications] = useState(false);
  const [notifications, setNotifications] = useState([]);
  const [userEmail, setUserEmail] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const userData = await getCurrentUserData();
        if (userData) {
          const userEmail = userData.email;
          const notifications = await getNotifications(userEmail);
          setUserEmail(userEmail);
          setNotifications(
            notifications
              .map((d, i) => ({ id: i, text: d.text, path: d.path }))
              .reverse()
          );
        }
      } catch (error) {
        console.error("Error fetching messages: ", error);
      }
    };

    fetchData();
    const interval = setInterval(fetchData, 3000);

    return () => clearInterval(interval);
  }, []);

  const handleDeleteNotification = async (id, e) => {
    e.stopPropagation();

    const notificationNode = notifications.find(
      (notification) => notification.id === id
    );
    const notificationText = notificationNode.text;

    if (userEmail !== null) {
      await deleteNotification(userEmail, notificationText);
      setNotifications(
        notifications.filter(
          (notification) => notification.text !== notificationText
        )
      );
    }
  };

  const handleNotificationClick = (path) => {
    setShowNotifications(false);
    window.location.assign(path);
  };

  return (
    <>
      <div
        className="notification-icon"
        onClick={() => setShowNotifications(!showNotifications)}
      >
        <FaBell />
        {notifications.length > 0 && (
          <span className="badge suggested-topics-badge">
            {notifications.length}
          </span>
        )}
      </div>
      {showNotifications && (
        <aside className="notification-aside">
          <div className="d-flex justify-content-between align-items-center mb-3">
            <h2>Notifications</h2>
            <Button
              variant="outline-dark"
              onClick={() => setShowNotifications(false)}
            >
              Close
            </Button>
          </div>
          <div className="notification-list">
            {notifications.length > 0 ? (
              notifications.map((notification) => (
                <div
                  key={notification.id}
                  className="notification-message"
                  onClick={() => handleNotificationClick(notification.path)}
                >
                  <span>{notification.text}</span>
                  <button
                    className="delete-button"
                    onClick={(e) =>
                      handleDeleteNotification(notification.id, e)
                    }
                  >
                    x
                  </button>
                </div>
              ))
            ) : (
              <div>No new notifications</div>
            )}
          </div>
        </aside>
      )}
    </>
  );
};

export default NotificationAside;
