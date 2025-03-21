import { useState, useEffect, useContext } from "react";
import { useNavigate } from "react-router-dom";
import "./login.css";
import { UserContext } from "../components/userContext";

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [users, setUsers] = useState([]);
  const [errors, setErrors] = useState("");
  const navigate = useNavigate();
  const { setUser } = useContext(UserContext); // Get user from context

  useEffect(() => {
    fetch('/users.json')
      .then((res) => res.json())
      .then((data) => {
        setUsers(data.users);
        console.log("Fetched Users: ", data.users);
      })
      .catch((err) => console.error("Error in fetching users: ", err));
  }, []);

  const handleLogin = (e) => {
    e.preventDefault();

    if (!email || !password) {
      setErrors("Please enter both email and password");
      return;
    }
    console.log("Checking credentials for:", email, password);

    const user = users.find((u) => 
      u.email.toLowerCase() === email.toLowerCase() && u.password === password
    );

    console.log("Matched user:", user);

    if (user) {
      setUser(user.username); // Update context
      localStorage.setItem("username", user.username); // Save to localStorage
      console.log("Saved to localStorage:", localStorage.getItem("username"));

      console.log("Login Successful!");
      setEmail("");
      setPassword("");
      setErrors("");
      navigate("/student"); // Redirect after login
    } else {
      console.log("Invalid credentials");
      setErrors("Invalid email or password");
    }
  };

  return (
    <div className="login-container">
      <div className="login-box">
        <h1 className="login-title">AUTOMATED EXAMINER LOGIN</h1>
        <form onSubmit={handleLogin}>
          <label>USER EMAIL</label>
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
          <label>USER PASSWORD</label>
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
          <button type="submit" className="login-submit-btn">
            Submit
          </button>
        </form>
        {errors && <p style={{ color: "red" }}>{errors}</p>}
      </div>
    </div>
  );
};

export default Login;
