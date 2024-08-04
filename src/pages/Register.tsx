// src/pages/Register.tsx
import React from "react";
import RegisterUserForm from "../components/RegisterUserForm";

const Register: React.FC = () => {
  return (
    <div>
      <h1>Register Page!!!</h1>
      <p>Sign up for an account here!</p>
      <RegisterUserForm />
    </div>
  );
};

export default Register;
