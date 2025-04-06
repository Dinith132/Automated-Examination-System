import React, { useState, useEffect } from "react";
import { GiMechanicGarage, GiCircuitry } from "react-icons/gi";
import { FaBuildingColumns } from "react-icons/fa6";
import { MdComputer } from "react-icons/md";

const Department = () => {
  const [department, setDepartment] = useState(null);
  const [semester, setSemester] = useState(null);
  const [lecturers, setLecturers] = useState([]);
  const [students, setStudents] = useState([]);

  useEffect(() => {
    const token = localStorage.getItem("token");

    if (department && semester && token) {
      const body = JSON.stringify({ department, semester });
      const headers = {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      };

      // Fetch lecturers
      fetch("http://192.168.68.73:8080/admin/getLecturersByDeptSem", {
        method: "POST",
        headers,
        body,
      })
        .then((res) => res.json())
        .then((data) => {
          console.log("Lecturers fetched:", data);
          setLecturers(data.lecturers || []);
        })
        .catch((err) => console.error("Error fetching lecturers:", err));

      // Fetch students
      fetch("http://192.168.68.73:8080/admin/getStudentsByDeptSem", {
        method: "POST",
        headers,
        body,
      })
        .then((res) => res.json())
        .then((data) => {
          console.log("Students fetched:", data);
          setStudents(data.students || []);
        })
        .catch((err) => console.error("Error fetching students:", err));
    }
  }, [department, semester]);

  return (
    <div className="department-container">
      <h2 className="title">SELECT DEPARTMENT</h2>
      <div className="department-buttons">
        <button onClick={() => setDepartment("Electrical & Electronics Engineering")}>
          <GiCircuitry size={30} color="black" />
          ELECTRICAL & ELECTRONICS ENGINEERING
        </button>
        <button onClick={() => setDepartment("Computer Engineering")}>
          <MdComputer size={30} color="black" />
          COMPUTER ENGINEERING
        </button>
        <button onClick={() => setDepartment("Civil Engineering")}>
          <FaBuildingColumns size={30} color="black" />
          CIVIL ENGINEERING
        </button>
        <button onClick={() => setDepartment("Mechanical Engineering")}>
          <GiMechanicGarage size={30} color="black" />
          MECHANICAL ENGINEERING
        </button>
      </div>

      <h2 className="title">SELECT SEMESTER</h2>
      <div className="semester-buttons">
        {Array.from({ length: 8 }, (_, i) => (
          <button key={i} onClick={() => setSemester(`Semester ${i + 1}`)}>
            SEMESTER {i + 1}
          </button>
        ))}
      </div>

      {department && semester && (
        <>
          <h2 className="title">AVAILABLE LECTURERS</h2>
          <div className="lecturer-buttons">
            {lecturers.length > 0 ? (
              lecturers.map((lecturer, index) => (
                <button key={index}>{lecturer.name}</button>
              ))
            ) : (
              <p>No lecturers found.</p>
            )}
          </div>

          <h2 className="title">AVAILABLE STUDENTS</h2>
          <div className="student-buttons">
            {students.length > 0 ? (
              students.map((student, index) => (
                <button key={index}>{student.name}</button>
              ))
            ) : (
              <p>No students found.</p>
            )}
          </div>
        </>
      )}

      <style>{`
        .department-container {
          text-align: center;
          padding: 20px;
          background: linear-gradient(to bottom, #eef2f3, #cfd9df);
          border-radius: 8px;
          max-width: 800px;
          margin: auto;
          box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .title {
          font-size: 20px;
          font-weight: bold;
          margin: 20px 0 10px;
        }

        .department-buttons,
        .semester-buttons,
        .lecturer-buttons,
        .student-buttons {
          display: flex;
          flex-wrap: wrap;
          justify-content: center;
          gap: 12px;
          margin-bottom: 20px;
        }

        button {
          padding: 10px 15px;
          border: none;
          background: #007bff;
          color: white;
          font-weight: bold;
          cursor: pointer;
          border-radius: 5px;
          transition: background 0.3s ease;
          min-width: 180px;
          text-transform: uppercase;
          display: flex;
          align-items: center;
          justify-content: center;
          gap: 10px;
        }

        button:hover {
          background: #0056b3;
        }

        p {
          font-size: 16px;
          color: #333;
        }
      `}</style>
    </div>
  );
};

export default Department;
