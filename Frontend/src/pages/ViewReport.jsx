import React, { useEffect, useState } from "react";
import { useLocation, useParams } from "react-router-dom";
import Navbar from "../components/Navbar";
import "./ViewReport.css"; // Assuming you have some CSS for styling

const ViewReport = () => {
  const { examId } = useParams(); // Get examId from the route
  const location = useLocation(); // Get state passed from the previous page
  const { attemptId } = location.state || {}; // Safely extract attemptId
  const [reportData, setReportData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    // If attemptId is missing, bail out early
    if (!attemptId) {
      setError("No attemptId provided. Cannot fetch report.");
      setLoading(false);
      return;
    }

    const token = localStorage.getItem("token");
    console.log("Fetching report for", { examId, attemptId });

    fetch(`http://192.168.147.57:8080/student/reports/${examId}`, {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ attemptId }),
    })
      .then((res) => {
        if (!res.ok) {
          throw new Error(`Server responded with status ${res.status}`);
        }
        return res.json();
      })
      .then((data) => {
        console.log("Report Data:", data);
        setReportData(data); // Store the fetched array of reports
      })
      .catch((err) => {
        console.error("Error fetching report data:", err);
        setError(err.message);
      })
      .finally(() => {
        setLoading(false);
      });
  }, [attemptId, examId]);

  return (
    <>
      <Navbar />
      <div className="view-report-container">
        {loading ? (
          <p>Loading report details...</p>
        ) : error ? (
          <p className="error">Error: {error}</p>
        ) : reportData.length > 0 ? ( // Check if reportData is a non-empty array
          reportData.map((report) => (
            <div key={report.questionId} className="report-details">
              <p><strong>Exam ID:</strong> {report.examId}</p>
              <p><strong>Question ID:</strong> {report.questionId}</p>
              <p><strong>Question:</strong> {report.question}</p>
              <p><strong>Correct Answer:</strong> {report.answer}</p>
              <p><strong>Student Answer:</strong> {report.studentAnswer || "Not Answered"}</p>
              <p><strong>Marks:</strong> {report.marks}</p>
            </div>
          ))
        ) : (
          <p>No report data available.</p>
        )}
      </div>
    </>
  );
};

export default ViewReport;
