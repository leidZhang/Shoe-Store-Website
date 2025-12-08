import './Login.css'
import axios from "axios";
import cookie from 'react-cookies';
import React, {useEffect, useState} from "react";
import Button from 'react-bootstrap/Button';
import Card from 'react-bootstrap/Card';
import Form from 'react-bootstrap/Form';
import Breadcrumb from 'react-bootstrap/Breadcrumb';
import {useNavigate} from "react-router-dom";

const Login = () => {
    const navigate = useNavigate();
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [errorMessage, setErrorMessage] = useState('');

    useEffect(() => {
        if (cookie.load('user')) navigate('/'); // redirect to home if already login
    }, []);

    const handleLogin = (event) => {
        event.preventDefault();

        const credentials = {
            username: username,
            password: password,
        };

        axios.post(`/auth/token/login/`, credentials).then(res => {
            // get token from the backend
            const token = res.data['auth_token'];
            // save token in the cookie and cookie expire after 1 year
            cookie.save('user', token, { path: '/', expires: new Date(Date.now() + 31536000000) });

            navigate('/'); // jump to homepage
        }).catch(error => {
            setErrorMessage('Login failed. Please check your credentials.');
        });
    }

    return (
        <div className="login-header">
            <Card className="login-card" style={{backgroundColor: 'rgba(229,209,208,0.5)'}}>
                <h1 className="form-title">Log in</h1>
                <Form className="form" onSubmit={ handleLogin }>
                    <Form.Group className="form-row" controlId="formBasicEmail">
                        <Form.Label>Username</Form.Label>
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
                    <Breadcrumb id="register">
                        New customer?&nbsp;
                        <Breadcrumb.Item  onClick={ () => navigate('/register') }>
                            Register here
                        </Breadcrumb.Item>
                    </Breadcrumb>
                    {errorMessage && <div className="form-error-message">{errorMessage}</div>}
                    <div className="button-container">
                        <Button id="button" className="form-button bg-dark" variant="primary" type="submit">
                            Login
                        </Button>
                    </div>
                </Form>
            </Card>
        </div>
    );
}

export default Login;