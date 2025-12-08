import React from "react";
import NavBar from "./component/navbar/NavBar";
import {Outlet} from "react-router-dom";
import './Layout.css';

const Layout = () => {
    return (
        <div className="layout-container">
            <NavBar />
            <Outlet />
        </div>
    )
};

export default Layout;