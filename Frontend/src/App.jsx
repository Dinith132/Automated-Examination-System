import { createBrowserRouter, createRoutesFromElements, RouterProvider, Route } from 'react-router-dom';
import Login from './pages/Login';
import StudentHomepage from './pages/StudentHomePage';
import StudentQuiz from './pages/StudentQuiz';
import StudentAssignment from './pages/StudentAssignment';
import StudentExams from './pages/StudentExams';
import StudentNotes from './pages/StudentNotes';
import StudentReports from './pages/StudentReports';
import Scomplains from './pages/Scomplains';
import { UserProvider } from "./components/userContext"; 
import AdminHome from './pages/AdminHome';
<<<<<<< HEAD
=======

>>>>>>> 97396686aa32552f05488ed25f526f48d153d683
const router = createBrowserRouter(
  createRoutesFromElements(
    <Route>
      <Route path="/" element={<Login />} />
      <Route path="/student" element={<StudentHomepage />} />
      <Route path="/student-quiz" element={<StudentQuiz />} />
      <Route path="/student-assign" element={<StudentAssignment />} />
      <Route path="/student-exam" element={<StudentExams />} />
      <Route path="/student-note" element={<StudentNotes />} />
      <Route path="/student-report" element={<StudentReports />} />
      <Route path="/student-complain" element={<Scomplains />} />
      <Route path="/admin" element={<AdminHome />} />
     </Route>
  )
);

function App() {
  return (
    <UserProvider>  {/* Wrap RouterProvider with UserProvider */}
      <RouterProvider router={router} />
    </UserProvider>
  );
}

export default App;
