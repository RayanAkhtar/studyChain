import { initializeApp } from "firebase/app";
import { getAuth, onAuthStateChanged } from "firebase/auth";
import {
  getFirestore,
  collection,
  query,
  where,
  getDocs,
  doc,
  updateDoc,
  addDoc,
  deleteDoc,
} from "firebase/firestore";

const firebaseConfig = {
  apiKey: "AIzaSyCtai3PnZayNSzA4_5nm4guJpagIB37yTU",
  authDomain: "studychain-2b33a.firebaseapp.com",
  projectId: "studychain-2b33a",
  storageBucket: "studychain-2b33a.appspot.com",
  messagingSenderId: "203870817975",
  appId: "1:203870817975:web:c8f7074854b22ba43d8732",
  measurementId: "G-ZZ9K1L4TN5",
};

const app = initializeApp(firebaseConfig);
export const auth = getAuth(app);
export const db = getFirestore(app);

let currentUser = null;

export const getCurrentUserData = () => {
  return currentUser;
};

export const getCurrentUserDocData = async (email) => {
  try {
    const userQuery = query(
      collection(db, "Users"),
      where("email", "==", email)
    );
    const userQuerySnapshot = await getDocs(userQuery);
    if (userQuerySnapshot.empty) {
      console.log("No user document found with the email:", email);
      return null;
    }

    // asm: Only ever one that matches, will not work if 2 docs with same email
    const userData = userQuerySnapshot.docs[0].data();
    return userData;
  } catch (error) {
    console.error("Error fetching user data:", error);
    return null;
  }
};

export const getSuggestionData = async () => {
  try {
    const suggestionQuery = collection(db, "Suggestions");
    const suggestionQuerySnapshot = await getDocs(suggestionQuery);

    if (suggestionQuerySnapshot.empty) {
      console.log("No suggestions found from database");
      return [];
    }

    const suggestions = [];
    suggestionQuerySnapshot.forEach((doc) => {
      suggestions.push(doc.data());
    });
    console.log("suggestions", suggestions);
    return suggestions;
  } catch (error) {
    console.error("Error fetching suggestions:", error);
    return [];
  }
};

export const initAuthStateListener = () => {
  onAuthStateChanged(auth, (user) => {
    if (user) {
      console.log("User is signed in:", user);
      currentUser = user;
    } else {
      console.log("No user is signed in");
      currentUser = null; // if no user is signed in, should set null to be safe
    }
  });
};

export const updateCompletionStatus = async (
  userEmail,
  topicKey,
  newStatus
) => {
  try {
    const docId = await getUserDocumentByUserEmail(userEmail);
    const userDocData = await getCurrentUserDocData(userEmail);

    if (docId && userDocData) {
      const updatedSubjectProgress = {
        ...userDocData.subjectProgress,
        [topicKey]: newStatus,
      };

      const userDocRef = doc(db, "Users", docId);
      await updateDoc(userDocRef, {
        subjectProgress: updatedSubjectProgress,
      });
      console.log("Completion status updated successfully.");
    } else {
      console.error("User document not found.");
    }
  } catch (error) {
    console.error("Error updating completion status:", error);
  }
};

export const updateBookmarkStatus = async (userEmail, topicKey, newStatus) => {
  try {
    const docId = await getUserDocumentByUserEmail(userEmail);
    const userDocData = await getCurrentUserDocData(userEmail);

    if (docId && userDocData) {
      const updatedBookmarks = {
        ...userDocData.bookmarks,
        [topicKey]: newStatus,
      };

      const userDocRef = doc(db, "Users", docId);
      await updateDoc(userDocRef, {
        bookmarks: updatedBookmarks,
      });
      console.log("Bookmark status updated successfully.");
    } else {
      console.error("User document not found.");
    }
  } catch (error) {
    console.error("Error updating bookmark status:", error);
  }
};

const getUserDocumentByUserEmail = async (email) => {
  try {
    const userQuery = query(
      collection(db, "Users"),
      where("email", "==", email)
    );
    const userQuerySnapshot = await getDocs(userQuery);

    if (!userQuerySnapshot.empty) {
      return userQuerySnapshot.docs[0].id;
    } else {
      console.error("User document not found.");
      return null;
    }
  } catch (error) {
    console.error("Error fetching user document:", error);
    return null;
  }
};

export const getUserPrivledge = async (email) => {
  const userDoc = await getCurrentUserDocData(email);
  return userDoc.privledge;
};

export const getUserSubjectProgress = async (email) => {
  const userDoc = await getCurrentUserDocData(email);
  return userDoc.subjectProgress;
};

export const getUserBookmarks = async (email) => {
  const userDoc = await getCurrentUserDocData(email);
  return userDoc.bookmarks;
};

export const addUserSuggestion = async (suggestion) => {
  try {
    const suggestionData = {
      ...suggestion,
      timestamp: new Date().toISOString(),
    };

    const docRef = await addDoc(collection(db, "Suggestions"), suggestionData);
    const suggestionId = docRef.id;
    console.log("Suggestion added successfully with ID: ", suggestionId);

    const updatedSuggestionData = {
      ...suggestionData,
      id: suggestionId,
    };

    await updateDoc(docRef, updatedSuggestionData);

    return suggestionId;
  } catch (error) {
    console.error("Error adding suggestion:", error);
    throw error;
  }
};

export const deleteUserSuggestion = async (suggestionId) => {
  try {
    const suggestionDocRef = doc(db, "Suggestions", suggestionId);
    await deleteDoc(suggestionDocRef);
    console.log("Suggestion deleted successfully.");
  } catch (error) {
    console.error("Error deleting suggestion:", error);
  }
};

export const removeBookmark = async (userEmail, bookmarkTopicName) => {
  try {
    const docId = await getUserDocumentByUserEmail(userEmail);
    const userDocData = await getCurrentUserDocData(userEmail);

    if (docId && userDocData) {
      const updatedBookmarks = { ...userDocData.bookmarks };
      delete updatedBookmarks[bookmarkTopicName];

      const userDocRef = doc(db, "Users", docId);
      await updateDoc(userDocRef, {
        bookmarks: updatedBookmarks,
      });
      console.log("Bookmark removed successfully.");
    } else {
      console.error("User document not found.");
    }
  } catch (error) {
    console.error("Error removing bookmark:", error);
  }
};

export const getRating = async (email, topicName) => {
  const userDoc = await getCurrentUserDocData(email);
  return userDoc.ratings[topicName];
};

export const updateRating = async (
  userEmail,
  newRatingName,
  newRatingValue
) => {
  try {
    const docId = await getUserDocumentByUserEmail(userEmail);
    const userDocData = await getCurrentUserDocData(userEmail);

    if (docId && userDocData) {
      const updatedRatings = { ...userDocData.ratings };
      updatedRatings[newRatingName] = newRatingValue;

      const userDocRef = doc(db, "Users", docId);
      await updateDoc(userDocRef, {
        ratings: updatedRatings,
      });
      console.log("Ratings updated successfully");
    } else {
      console.error("User document not found");
    }
  } catch (error) {
    console.error("Error updating rating:", error);
  }
};

export const getNotifications = async (email) => {
  try {
    const userDocData = await getCurrentUserDocData(email);
    return userDocData.notifications;
  } catch (error) {
    console.error("Error fetching notifications", error);
    return false;
  }
};

export const deleteNotification = async (userEmail, notificationContent) => {
  try {
    const docId = await getUserDocumentByUserEmail(userEmail);
    const userDocData = await getCurrentUserDocData(userEmail);

    if (docId && userDocData) {
      const updatedNotifications = userDocData.notifications.filter(
        (notification) => notification.text !== notificationContent
      );

      const userDocRef = doc(db, "Users", docId);
      await updateDoc(userDocRef, {
        notifications: updatedNotifications,
      });
      console.log("Notification deleted successfully.");
    } else {
      console.error("User document not found.");
    }
  } catch (error) {
    console.error("Error deleting notification:", error);
  }
};

export const writeNotification = async (notification) => {
  try {
    const userQuery = query(collection(db, "Users"));
    const userQuerySnapshot = await getDocs(userQuery);

    const updatePromises = userQuerySnapshot.docs.map(async (userDoc) => {
      const userDocRef = doc(db, "Users", userDoc.id);
      const userData = userDoc.data();

      const updatedNotifications = userData.notifications
        ? [...userData.notifications, notification]
        : [notification];

      await updateDoc(userDocRef, {
        notifications: updatedNotifications,
      });
    });

    await Promise.all(updatePromises);
    console.log("Notification written successfully to all users.");
  } catch (error) {
    console.error("Error writing notification:", error);
  }
};
