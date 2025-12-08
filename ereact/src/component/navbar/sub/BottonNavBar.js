import React, {useEffect, useState} from "react";
import Navbar from "react-bootstrap/Navbar";
import Nav from "react-bootstrap/Nav";
import NavDropdown from "react-bootstrap/NavDropdown";
import axios from "axios";
import {useNavigate} from "react-router-dom";


const BottomNavBar = () => {
    const navigate = useNavigate();
    const [categories, setCategories] = useState(null);

    useEffect(() =>{
        axios.get(`/api/data-access/categories`).then(res => {
            setCategories(res.data);
        }).catch(error => {
            console.error(error);
        })
    }, []);

    const handleNavigate = (category) => {
        navigate(`/search-result?category=${category}`);
    }

    return (
        <Navbar expand="lg" className="navbar navbar-light" style={{backgroundColor: 'rgba(131,151,136,0.7)'}}>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse>
                <Nav className="me-auto">
                    {categories && categories.map(category => (
                        <Nav.Link
                            className="nav-bar-component"
                            key={category['id']}
                            onClick={() => handleNavigate(category['title'])}
                        >
                            {category['title']}
                        </Nav.Link>
                    ))}
                </Nav>
            </Navbar.Collapse>
        </Navbar>
    );
}

export default BottomNavBar;