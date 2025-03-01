import { useState } from "react";
import { useNavigate } from "react-router-dom";
import './login.css'; // Import the CSS file

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  const handleLogin = (e) => {
    e.preventDefault();
    if (email === "admin@example.com" && password === "password") {
      alert("Login successful!");
      navigate("/home");
    } else {
      alert("Invalid credentials!");
    }
  };

  const handleGoogleLogin = async () => {
    try {
      await signInWithGoogle(); // You'll need to implement signInWithGoogle in your Firebase file
      alert("Google login successful!");
      navigate("/home");
    } catch (error) {
      alert(error.message);
    }
  };

  const handleFacebookLogin = async () => {
    try {
      await signInWithFacebook(); // You'll need to implement signInWithFacebook in your Firebase file
      alert("Facebook login successful!");
      navigate("/home");
    } catch (error) {
      alert(error.message);
    }
  };

  return (
    <div className="login-container">
      <div className="login-box">
        <h1 className="login-title">AUTOMATED EXAMINER LOGIN</h1>
        <form onSubmit={handleLogin}>
          <label>USER NAME / USER EMAIL</label>
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
          <label>PASSWORD</label>
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
          <button type="submit" className="login-btn">
            LOGIN
          </button>
        </form>

        <p className="or-continue">Or continue with</p>

        <button onClick={handleFacebookLogin} className="social-btn">
          <img
            src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg"
            alt="Facebook"
            width="20"
          />
          &nbsp; Continue with Facebook
        </button>

        <button onClick={handleGoogleLogin} className="social-btn">
          <img
            src="https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png"
            alt="Google"
            width="20"
          />
          &nbsp; Continue with Google
        </button>
      </div>
    </div>
  );
};

export default Login;
