import React, {useEffect, useState} from "react";
import Navbar from "react-bootstrap/Navbar";
import {Link, useLocation, useNavigate, useSearchParams} from "react-router-dom";
import Container from "react-bootstrap/Container";
import InputGroup from "react-bootstrap/InputGroup";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import Nav from "react-bootstrap/Nav";
import OverlayTrigger from "react-bootstrap/OverlayTrigger";
import cookie from "react-cookies";
import axios from "axios";
import Popover from "react-bootstrap/Popover";
import {DropdownButton, DropdownItem} from "react-bootstrap";
import UserPopover from "./UserPopover";
import LoginPopover from "./LoginPopover";

const TopNavBar = () => {
    const navigate = useNavigate();
    const [searchParams] = useSearchParams();
    const [option, setOption] = useState("all");
    const [optionList, setOptionList] = useState(null);
    const [query, setQuery] = useState("");
    const [category, setCategory] = useState("");

    useEffect(() =>{
        axios.get(`/api/data-access/categories`).then(res => {
            const data = res.data;
            setOptionList(data);

            // init option
            const selectedCategory = searchParams.get("category");
            if (selectedCategory != null) {
                setOption(selectedCategory);
                setCategory(selectedCategory);
            } else {
                setOption("all");
                setCategory("all");
            }
        }).catch(error => {
            console.error(error);
        })
    }, [searchParams]);



    // temp popout menu, put components related to log in and logout here
    const renderPopover = (props) => (
        <Popover id="popover-basic" {...props}>
            <Popover.Header as="h3">  </Popover.Header>
            {cookie.load('user') ? <UserPopover /> : <LoginPopover />}
        </Popover>
    );

    const handleOption = (value) => {
        setOption(value);
        setCategory(value);
    }

    const handleSearch = () => {
       // search button, more functions will be added
       let search = `search=${query}`;
       if (category !== "all") { // handle category
            search += `&category=${category}`;
       }

       navigate(`/search-result?${search}`);
    };

    return (
        <Navbar className="navbar navbar-light" style={{backgroundColor: 'rgba(131,151,136,0.7)'}}>
            <Navbar.Brand id="brand" className="nav-bar-component" as={Link} to="/">
                Nike
            </Navbar.Brand>
            <Container id="search">
                <InputGroup>
                    <DropdownButton id="all" variant="outline-secondary" title={option}>
                        <DropdownItem  key="0" onClick={() => handleOption("all")}>
                            all
                        </DropdownItem>
                        {optionList && optionList.map(item => (
                            <DropdownItem id="all" key={item['id']} onClick={() => handleOption(item['title'])}>
                                {item['title']}
                            </DropdownItem>
                        ))}
                    </DropdownButton>
                    <Form.Control id="search-input" size="15"
                        placeholder="Search items in the website"
                        aria-label="Nike"
                        aria-describedby="basic-addon2"
                        value={query}
                        onChange={(e) => setQuery(e.target.value)}
                    />
                    <Button variant="outline-secondary" id="button-addon2" onClick={() => handleSearch()}>
                        search
                    </Button>
                </InputGroup>
            </Container>
            <Nav>
                <OverlayTrigger
                    placement="bottom"
                    delay={{ show: 250, hide: 400 }}
                    trigger='click' rootClose
                    overlay={renderPopover}
                >
                    <Nav.Link  id="overlay-trigger">My Account</Nav.Link>
                </OverlayTrigger>
                <Nav.Link id="cart" as={Link} to="/cart">Cart</Nav.Link>
                <Nav.Link id="order-link" as={Link} to="/order-history">Orders</Nav.Link>
            </Nav>
        </Navbar>
    );
}

export default TopNavBar;