import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Container, TextField, Button, Typography, Box } from "@mui/material";
import { signInWithGoogle, signInWithFacebook } from "../firebase";

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  const handleLogin = (e) => {
    e.preventDefault();
    if (email === "admin@example.com" && password === "password") {
      alert("Login successful!!!");
      navigate("/home");
    } else {
      alert("Invalid credentials!");
    }
  };

  const handleGoogleLogin = async () => {
    try {
      await signInWithGoogle();
      alert("Google login successful!");
      navigate("/home");
    } catch (error) {
      alert(error.message);
    }
  };

  const handleFacebookLogin = async () => {
    try {
      await signInWithFacebook();
      alert("Facebook login successful!");
      navigate("/home");
    } catch (error) {
      alert(error.message);
    }
  };

  return (
    <Container maxWidth="xs" sx={{ 
      display: "flex", flexDirection: "column", alignItems: "center",
      justifyContent: "center", height: "100vh", background: "linear-gradient(to bottom, #6a8edb, #4f4cd7)"
    }}>
      <Box sx={{ 
        backgroundColor: "#F5F5F5", padding: "30px", borderRadius: "10px",
        boxShadow: "0px 4px 10px rgba(0, 0, 0, 0.2)", textAlign: "center"
      }}>
        <Typography variant="h5" gutterBottom sx={{ fontWeight: "bold" }}>
          AUTOMATED EXAMINATION SYSTEM - LOGIN
        </Typography>
        <form onSubmit={handleLogin}>
          <TextField
            label="USER NAME / USER EMAIL"
            type="email"
            fullWidth
            margin="normal"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
          <TextField
            label="PASSWORD"
            type="password"
            fullWidth
            margin="normal"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
          <Button type="submit" variant="contained" fullWidth sx={{ backgroundColor: "#000", mt: 2 }}>
            LOGIN
          </Button>
        </form>

        <Typography variant="body2" sx={{ marginTop: "15px", marginBottom: "5px" }}>
          Or continue with
        </Typography>

        <Button onClick={handleFacebookLogin} variant="outlined" fullWidth sx={{ marginBottom: "10px" }}>
          <img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg" alt="Facebook" width="20" />
          &nbsp; Continue with Facebook
        </Button>

        <Button onClick={handleGoogleLogin} variant="outlined" fullWidth>
          <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png" alt="Google" width="20" />
          &nbsp; Continue with Google
        </Button>
      </Box>
    </Container>
  );
};

export default Login;
