import React, {useEffect, useState} from "react";
import {Col, Form, Row} from "react-bootstrap";
import Button from "react-bootstrap/Button";
import axios from "axios";

const OrderSummaryForm = ({ onTogglePrev, onSubmitOrder }) => {

    const [total, setTotal] = useState(0.00);
    const [tax, setTax] = useState(0.00);

    useEffect(() => {
        axios.get(`/api/shopping-cart/cart`).then(res => {
            const sum = parseFloat(res.data[0]['total']);
            setTotal(sum);
            setTax(sum * 0.15);
        }).catch(error => {
            console.log(error);
        })
    }, []);

    return (
        <Form className="form">
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>Items: ${total}</Form.Label>
                </Col>
            </Row>
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>Estimated tax: ${tax.toFixed(2)}</Form.Label>
                </Col>
            </Row>
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>Order total: ${(total + tax).toFixed(2)}</Form.Label>
                </Col>
            </Row>
            <div className="button-container" id="payment-buttons">
                <Button
                    className="confirm-button"
                    onClick={onSubmitOrder}>
                    Place Your Order
                </Button>
                <Button
                    className="confirm-button"
                    onClick={onTogglePrev}
                >
                    Back
                </Button>
            </div>
        </Form>
    );
};

export default OrderSummaryForm;