import React, {useEffect, useState} from "react";
import {Link, useNavigate} from "react-router-dom";
import Popover from "react-bootstrap/Popover";
import {Col, Row} from "react-bootstrap";

const LoginPopover = () => {
    return (
        <div style={{textAlign: "center"}}>
            <Popover.Body>
                <Row style={{margin: "5px"}}>
                    <Col><Link to='/register'>Register</Link></Col>
                </Row>
                <Row>
                   <Col><Link to='/login'>Log in</Link></Col>
                </Row>
            </Popover.Body>
        </div>
    );
};

export default LoginPopover;