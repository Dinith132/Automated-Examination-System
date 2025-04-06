import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import "./StudentReports.css";
import Navbar from "../components/Navbar";

const StudentReport = () => {
  const [reportData, setReportData] = useState([]);
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate(); // React Router hook for navigation

  // Fetch report data
  useEffect(() => {
    const token = localStorage.getItem("token");
    fetch("http://192.168.147.57:8080/student/reports", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${token}`,
        "Content-Type": "application/json",
      },
    })
      .then((res) => res.json())
      .then((data) => {
        setReportData(data);
        setLoading(false);
      })
      .catch((err) => console.error("Error fetching report data:", err));
  }, []);

  return (
    <>
      <Navbar />
      <div className="student-report-container">
        {loading ? (
          <p>Loading your report...</p>
        ) : (
          <>
            <h2 className="stu-header">Student Reports</h2>
            <div className="report-content">
              {reportData.length > 0 ? (
                reportData.map((report) => (
                  <div key={report.attemptId} className="report-card">
                    <h3>{report.courseName}</h3>
                    <p>Exam ID: {report.examId}</p>
                    <p>Start Date: {new Date(report.startDateTime).toLocaleString()}</p>
                    <p>Marks Obtained: {report.marks}/{report.totalMarks}</p>
                    <p>Grade: {report.grade}</p>
                    <button
                      onClick={() =>
                        navigate(`/view-report/${report.examId}`, {
                          state: { attemptId: report.attemptId },
                        })
                      }
                      className="view-report-button"
                    >
                      View Report
                    </button>
                  </div>
                ))
              ) : (
                <p>No report data available.</p>
              )}
            </div>
          </>
        )}
      </div>
    </>
  );
};

export default StudentReport;
