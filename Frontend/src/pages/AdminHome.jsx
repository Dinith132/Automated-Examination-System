import React, { useState, useEffect } from "react";
import Calendar from "react-calendar";
import "react-calendar/dist/Calendar.css";
import "./StudentHomePage.css"; 
import NavbarAdminHome from "../components/NavbarAdminHome";

const AdminHome = () => {
  const [events, setEvents] = useState([]);
  const [specialDates, setSpecialDates] = useState({});

  useEffect(() => {
    const token = localStorage.getItem("token");

    fetch("http://192.168.68.73:8080/admin/getAllExam", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
    })
      .then((res) => {
        if (!res.ok) {
          throw new Error(`HTTP error! Status: ${res.status}`);
        }
        return res.json();
      })
      .then((data) => {
        console.log("API Response:", data);

        if (!data.events || !Array.isArray(data.events)) {
          console.error("Invalid data format:", data);
          return;
        }

        const typeMapping = {
          1: "Exam",
          2: "Quiz",
          3: "Assignment",
        };

        const formattedEvents = data.events.map((event) => {
          const eventDate = new Date(event.date);
          return {
            id: event.id,
            type: typeMapping[event.type] || "Unknown",
            date: eventDate.toISOString().split("T")[0], // YYYY-MM-DD
            time: eventDate.toLocaleTimeString(),
            subject: event.subject,
            code: event.code,
          };
        });

        setEvents(formattedEvents);

        const dateHighlightMap = {};
        formattedEvents.forEach((event) => {
          dateHighlightMap[event.date] = event.type; // For coloring the calendar
        });

        setSpecialDates(dateHighlightMap);
      })
      .catch((err) => {
        console.error("Error fetching events: ", err);
      });
  }, []);

  const tileClassName = ({ date, view }) => {
    if (view === "month") {
      const dateString = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, "0")}-${String(date.getDate()).padStart(2, "0")}`;
      if (specialDates[dateString]) {
        return `highlight-${specialDates[dateString].toLowerCase()}`;
      }
    }
    return "";
  };

  return (
    <>
      <NavbarAdminHome />
      <div className="student-homepage">
        {/* Calendar Section */}
        <div className="calendar-section">
          <h2 className="event-cal">Event Calendar</h2>
          <Calendar tileClassName={tileClassName} />

          {/* Legend */}
          <div className="calendar-legend">
            <div className="legend-item">
              <span className="legend-color assignment"></span> Assignment
            </div>
            <div className="legend-item">
              <span className="legend-color quiz"></span> Quiz
            </div>
            <div className="legend-item">
              <span className="legend-color exam"></span> Exam
            </div>
            <div className="legend-item">
              <span className="legend-color today"></span> Today
            </div>
          </div>
        </div>

        {/* Events Section */}
        <div className="tasks-section">
          <h2 className="ongoing-tasks-title">Upcoming Events</h2>
          <div className="task-cards">
            {events.length > 0 ? (
              events.map((event, index) => (
                <div key={index} className="task-card">
                  <h3>{event.subject}</h3>
                  <p className={`task-card-${event.type.replace(/\s+/g, "-").toLowerCase()}`}>
                    Type: {event.type}
                  </p>
                  <p>Date: {event.date}</p>
                  <p>Time: {event.time}</p>
                  <p>Code: {event.code}</p>
                </div>
              ))
            ) : (
              <p>No upcoming events.</p>
            )}
          </div>
        </div>
      </div>
    </>
  );
};

export default AdminHome;
