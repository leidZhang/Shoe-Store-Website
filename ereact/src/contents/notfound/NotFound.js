import './NotFound.css';
import React from "react";
import { Link } from "react-router-dom";

const NotFound = () => { // implement 404 page
    return (
        <div className="not-fount">
            <h2 className="not-fount-title">404 Not Found</h2>
            <p className="not-fount-text-break">Have a break?</p>
            <p className="not-fount-text">That page cannot be found</p>
            <Link to="/ ">Back to the homepage...</Link>
        </div>
    );
}

export default NotFound;