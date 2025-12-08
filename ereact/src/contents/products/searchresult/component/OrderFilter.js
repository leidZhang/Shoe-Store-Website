import React from "react";
import {Form} from "react-bootstrap";

const OrderFilter = ({ setOrder }) => {
    return (
        <Form.Group className="filter-group">
            <Form.Label className="filter-tag">Order by</Form.Label>
            <Form.Text>
                <p className="filter-text">
                    <input
                        type="radio"
                        className="filter-input"
                        name="order"
                        value="price"
                        onChange={(e) => setOrder(e.target.value)}
                    />price ascending
                </p>
                <p className="filter-text">
                    <input
                        type="radio"
                        className="filter-input"
                        name="order"
                        value="-price"
                        onChange={(e) => setOrder(e.target.value)}
                    />price descending
                </p>
                <p className="filter-text">
                    <input
                        type="radio"
                        className="filter-input"
                        name="order"
                        value="title"
                        onChange={(e) => setOrder(e.target.value)}
                    />name ascending
                </p>
                <p className="filter-text">
                    <input
                        type="radio"
                        className="filter-input"
                        name="order"
                        value="-title"
                        onChange={(e) => setOrder(e.target.value)}
                    />name descending
                </p>
            </Form.Text>
        </Form.Group>
    );
};

export default OrderFilter;