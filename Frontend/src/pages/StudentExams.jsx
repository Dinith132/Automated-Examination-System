import React, { useState, useEffect } from "react";
import './StudentExams.css';
import Navbar from "../components/Navbar";

const StudentExams = () => {
  const [quizzes, setQuizzes] = useState([]);
  const [currentQuiz, setCurrentQuiz] = useState(null);
  const [answers, setAnswers] = useState({});
  const [submitted, setSubmitted] = useState(false);
  const [quizResults, setQuizResults] = useState([]);
  const [totalMarks, setTotalMarks] = useState(0);

  // Fetch quizzes from backend
  useEffect(() => {
    const token = localStorage.getItem("token"); // Retrieve token
    fetch("http://192.168.43.27:8080/student/exam/exams", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${token}`,
        "Content-Type": "application/json",
      },
    })
      .then((res) => res.json())
      .then((data) => {
        const formattedQuizzes = data.map((quiz) => ({
          id: quiz.examId,
          title: quiz.courseName,
          subject: quiz.courseCode,
          duration: quiz.duration,
          passingCriteria: quiz.passingCriteria,
          totalMarks: quiz.totalMarks,
          startDateTime: quiz.startDateTime,
          type: quiz.type,
        }));
        setQuizzes(formattedQuizzes);
      })
      .catch((err) => console.error("Error fetching quizzes:", err));
  }, []);

  // Start a quiz
  const startQuiz = (quiz) => {
    const token = localStorage.getItem("token"); // Retrieve token

    fetch(`http://192.168.43.27:8080/student/exam/${quiz.id}`, {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${token}`,
        "Content-Type": "application/json",
      },
    })
      .then((res) => {
        if (!res.ok) {
          throw new Error(`HTTP error! status: ${res.status}`);
        }
        return res.json();
      })
      .then((data) => {
        if (Array.isArray(data)) {
          const formattedQuestions = data.map((q) => ({
            questionId: q.questionId,
            question: q.question,
            marks: q.marks,
            optionList: q.optionList.map((opt) => ({
              optionText: opt.optionText,
            })),
            Answer: q.Answer, // Include correct answer
          }));

          setCurrentQuiz({ ...quiz, questions: formattedQuestions });
          setSubmitted(false);
          setAnswers({});
        } else {
          console.error("Unexpected data format:", data);
        }
      })
      .catch((err) => console.error("Error fetching questions:", err));
  };

  // Handle answer selection
  const handleAnswerChange = (questionId, selectedOption) => {
    setAnswers((prev) => ({ ...prev, [questionId]: selectedOption }));
  };

  // Submit quiz to backend
  const submitQuiz = () => {
    if (submitted) {
      console.error("Quiz has already been submitted.");
      alert("You have already submitted the quiz. Submitting again is not allowed.");
      return; // Prevent further execution
    }

    console.log("Submitting Answers:", answers);
    setSubmitted(true);

    const token = localStorage.getItem("token"); // Retrieve token

    // Format answers into the required structure
    const formattedAnswers = currentQuiz.questions.map((question) => {
      const selectedOption = answers[question.questionId]; // Get the selected option

      return {
        questionId: question.questionId,
        answer: selectedOption || "No Answer", // Use the selected option text or "No Answer"
      };
    });

    fetch(`http://192.168.43.27:8080/student/exam/${currentQuiz.id}/submit`, {
      method: "POST",
      body: JSON.stringify(formattedAnswers), // Send the formatted answers
      headers: {
        "Authorization": `Bearer ${token}`, // Attach token
        "Content-Type": "application/json",
      },
    })
      .then((res) => res.json())
      .then((result) => {
        console.log("Quiz Result:", result); // Log the response for debugging

        // Calculate total marks
        const total = result.reduce((sum, res) => sum + (res.isCorrect ? res.marks : 0), 0);
        setTotalMarks(total); // Store total marks in state

        // Store results in state
        setQuizResults(result);
      })
      .catch((err) => console.error("Error submitting quiz:", err));
  };

  return (
    <>
      <Navbar />
      <div className="student-quiz-container">
        <h2 className="ava-qz">Available Exams</h2>
        {!currentQuiz ? (
          // Show available quizzes
          <div className="quiz-list">
            {quizzes.length > 0 ? (
              quizzes.map((quiz) => (
                <div key={quiz.id} className="quiz-card">
                  <h3>{quiz.title}</h3>
                  <p>Subject: {quiz.subject}</p>
                  <p>Duration: {quiz.duration} mins</p>
                  <p>Passing Criteria: {quiz.passingCriteria}%</p>
                  <p>Total Marks: {quiz.totalMarks}</p>
                  <p>Start Date: {new Date(quiz.startDateTime).toLocaleString()}</p>
                  <button onClick={() => startQuiz(quiz)}>Start Quiz</button>
                </div>
              ))
            ) : (
              <p>No Exams available</p>
            )}
          </div>
        ) : (
          // Show quiz interface
          <div className="quiz-container">
            <h2>{currentQuiz.title}</h2>
            {currentQuiz.questions.map((q, index) => (
              <div key={q.questionId} className="question">
                <p>
                  {index + 1}. {q.question} (Marks: {q.marks})
                </p>
                <div className="options">
                  {q.optionList.map((option, i) => (
                    <label key={i} className="option">
                      <input
                        type="radio"
                        name={`question-${q.questionId}`}
                        value={option.optionText}
                        onChange={() => handleAnswerChange(q.questionId, option.optionText)}
                      />
                      {option.optionText}
                    </label>
                  ))}
                </div>
              </div>
            ))}
            <button onClick={submitQuiz} disabled={submitted}>
              Submit Quiz
            </button>

            {/* Display results below the button */}
            {quizResults.length > 0 && (
              <div className="quiz-results">
                <h3>Quiz Results</h3>
                {quizResults.map((res) => (
                  <div key={res.questionId} className="result">
                    <p>Question ID: {res.questionId}</p>
                    <p>Correct Answer: {res.answer}</p> {/* Use the 'answer' field */}
                    <p>Correct: {res.isCorrect ? "Yes" : "No"}</p>
                  </div>
                ))}
                <h3>Total Marks: {totalMarks}</h3>
              </div>
            )}
          </div>
        )}
      </div>
    </>
  );
};

export default StudentExams;