import React, {useEffect, useState} from "react";
import './Register.css';
import Card from 'react-bootstrap/Card';
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import {useNavigate} from "react-router-dom";
import cookie from "react-cookies";
import axios from "axios";

const Register = () => {
    const navigate = useNavigate();
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [reEntered, setReEntered] = useState('');
    const [errorMessage, setErrorMessage] = useState('');

    useEffect(() => {
        if (cookie.load('user')) navigate('/'); // redirect to home if already login
    }, []);

    const handleRegister = async (event) => {
        event.preventDefault();

        const credentials = {
            aaa: "aaa",
            username: username,
            password: password,
        };

        setErrorMessage('');
        if (password !== reEntered) {
            setErrorMessage('Password must match!');
            return; // stop here if not matched
        }

        try {
            // register the user
            const res1 = await axios.post(`auth/users/`, credentials);
            console.log('Register successful');
            console.log(res1.data);
            // login the user
            const res2 = await axios.post(`/auth/token/login/`, credentials);
            // get token from the backend
            const token = res2.data['auth_token'];
            // save token in the cookie and cookie expire after 1 year
            cookie.save('user', token, { path: '/', expires: new Date(Date.now() + 31536000000) });
            // navigate to profile page
            navigate('/new-profile');
        } catch (error) {
            console.log(error);
            console.log(error.response.data);
            setErrorMessage('Register failed. Please check your credentials.');
        }
    }

    return (
        <Card className="register-card" style={{backgroundColor: 'rgba(229,209,208,0.5)'}}>
            <h1 className="form-title">Create Account </h1>
            <Form className="form" onSubmit={ handleRegister }>
                <Form.Group className="form-row" controlId="formBasicEmail">
                    <Form.Label>Your Username</Form.Label>
                        <Form.Control
                            type="text"
                            placeholder="Enter username"
                            value={ username }
                            onChange={(e) => setUsername(e.target.value)}
                        />
                    </Form.Group>
                    <Form.Group className="form-row" controlId="formBasicPassword">
                       <Form.Label>Password</Form.Label>
                       <Form.Control
                            type="password"
                            placeholder="Password"
                            value={ password }
                            onChange={(e) => setPassword(e.target.value)}
                       />
                    </Form.Group>
                    <Form.Group id="last-row" className="form-row" controlId="formBasicPassword">
                       <Form.Label>Re-enter password</Form.Label>
                       <Form.Control
                           type="password"
                           placeholder="Re-enter password"
                           value={ reEntered }
                           onChange={(e) => setReEntered(e.target.value)}
                       />
                    </Form.Group>
                    {errorMessage && <div className="form-error-message">{errorMessage}</div>}
                    <div className="button-container">
                        <Button className="form-button bg-dark" variant="primary" type="submit">
                            Register
                        </Button>
                    </div>
               </Form>
        </Card>
    );
}

export default Register;