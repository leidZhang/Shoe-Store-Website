import React from "react";
import {Link} from "react-router-dom";
import axios from "axios";
import cookie from "react-cookies";
import Popover from "react-bootstrap/Popover";
import {Col, Row} from "react-bootstrap";

const UserPopover = () => {
    // logout function
    const handleLogout = async () => {
        try {
            cookie.remove('user', { path: '/' }); // remove token in the cookie
            console.log(cookie.load('user'));
            if (!cookie.load('user')) {
                await axios.post(`auth/token/logout/`);
                delete axios.defaults.headers.common['Authorization']; // remove token in the request header
                window.location.reload();
            }
        } catch (error) {
            console.log(error.response.data);
        }
    };

    return (
        <div style={{textAlign: "center"}}>
            <Popover.Body>
                <Row style={{margin: "5px"}}>
                    <Col><Link to='/profile'>My Profile</Link></Col>
                </Row>
                <Row style={{margin: "5px"}}>
                    <Col><Link to='/order-history'>My Orders</Link></Col>
                </Row>
                <Row style={{margin: "5px"}}>
                    <Col><Link onClick={() => handleLogout()}>Sign out</Link></Col>
                </Row>
            </Popover.Body>
        </div>
    );
};

export default UserPopover;