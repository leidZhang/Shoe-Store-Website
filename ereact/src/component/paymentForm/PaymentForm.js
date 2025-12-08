import React, {useEffect, useState} from "react";
import {Col, Form, Row} from "react-bootstrap";
import Button from "react-bootstrap/Button";
import './PaymentForm.css';

const PaymentForm = ({onToggleNext, onTogglePrev, onSubmitPayment}) => {
    const [paymentMethod, setPaymentMethod] = useState("Debit Card");
    const [form, setForm] = useState({'from': 'Cheque', 'paymentMethod': 'Debit Card'});
    const [errors, setErrors] = useState({});

    const setField = (field, value) => {
        setForm({...form, [field]:value});

        if (errors[field]) {
            setErrors({...errors, [field]: null})
        }
    };

    const validateForm = () => {
        let validationTable = null;

        if (paymentMethod === "Credit Card") {
            validationTable = [
                {regex: /^(?:4[0-9]{12}(?:[0-9]{3})?)$/, name: "creditCardNum", errorMsg: "Invalid card number"},
                {regex: /^[0-9]{3,4}$/, name: "ccv", errorMsg: "Invalid CCV"},
                {regex: /^.+$/, name: "expireDate", errorMsg: "Please enter expire date"},
            ]
        } else {
            validationTable = [
                {regex: /^\d{16}$/, name: "debitCardNum", errorMsg: "Invalid card number"},
                {regex: /^.+$/, name: "password", errorMsg: "Please enter password"},
            ]
        }

        const newError = {};
        for (let item of validationTable) {
            const {regex, name, errorMsg} = item;
            const value = form[name];
            if (!value || !value.match(regex)) {
                newError[name] = errorMsg;
            }
        }

        return newError;
    };

    const handleConfirm = (event) => {
        event.preventDefault();

        const formErrors = validateForm();
        if (Object.keys(formErrors).length > 0) {
            setErrors(formErrors);
            return;
        }

        const paymentInfo = {paymentMethod: paymentMethod}
        onSubmitPayment(paymentInfo);
        onToggleNext();
    }

    return (
        <Form className="form" onSubmit={ handleConfirm }>
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>Payment Method</Form.Label>
                    <Form.Select
                        value={paymentMethod}
                        onChange={(e) => setPaymentMethod(e.target.value)}
                    >
                        <option>Debit Card</option>
                        <option>Credit Card</option>
                    </Form.Select>
                </Col>
            </Row>
            <Row className="form-row" id="checkout-form-row">
                {paymentMethod === "Debit Card" ? (
                    // render debit card form
                    <>
                        <Col md={2}>
                            <Form.Label>From</Form.Label>
                            <Form.Select
                                value={form.from}
                                onChange={(e) => setField("from", e.target.value)}
                                isInvalid={errors.from}
                            >
                                <option>Cheque</option>
                                <option>Saving</option>
                            </Form.Select>
                            <Form.Control.Feedback type="invalid">
                                {errors.from}
                            </Form.Control.Feedback>
                        </Col>
                        <Col>
                            <Form.Label>Debit Card Number</Form.Label>
                            <Form.Control
                                type="text"
                                placeholder="Enter your debit card number"
                                value={form.debitCardNum}
                                onChange={(e) => setField("debitCardNum", e.target.value)}
                                isInvalid={errors.debitCardNum}
                            />
                            <Form.Control.Feedback type="invalid">
                                {errors.debitCardNum}
                            </Form.Control.Feedback>
                        </Col>
                        <Col>
                            <Form.Label>Debit Card Password</Form.Label>
                            <Form.Control
                                type="password"
                                placeholder="Enter your debit card password"
                                value={form.password}
                                onChange={(e) => setField("password", e.target.value)}
                                isInvalid={errors.password}
                            />
                            <Form.Control.Feedback type="invalid">
                                {errors.password}
                            </Form.Control.Feedback>
                        </Col>
                    </>
                ) : (
                    // render credit card form
                    <>
                        <Col md={6}>
                            <Form.Label>Credit Card Number</Form.Label>
                            <Form.Control
                                type="text"
                                placeholder="Enter your credit card number"
                                value={form.creditCardNum}
                                onChange={(e) => setField("creditCardNum", e.target.value)}
                                isInvalid={errors.creditCardNum}
                            />
                            <Form.Control.Feedback type="invalid">
                                {errors.creditCardNum}
                            </Form.Control.Feedback>
                        </Col>
                        <Col md={2}>
                            <Form.Label>CCV</Form.Label>
                            <Form.Control
                                type="text"
                                placeholder="Enter ccv"
                                value={form.ccv}
                                onChange={(e) => setField("ccv", e.target.value)}
                                isInvalid={errors.ccv}
                            />
                            <Form.Control.Feedback type="invalid">
                                {errors.ccv}
                            </Form.Control.Feedback>
                        </Col>
                        <Col>
                            <Form.Label>Credit Card Expiry Date</Form.Label>
                            <Form.Control
                                type="date"
                                placeholder="Enter your credit card expiry date"
                                value={form.expireDate}
                                onChange={(e) => setField("expireDate", e.target.value)}
                                isInvalid={errors.expireDate}
                            />
                            <Form.Control.Feedback type="invalid">
                                {errors.expireDate}
                            </Form.Control.Feedback>
                        </Col>
                    </>
                )}
            </Row>
            <div className="button-container" id="payment-buttons">
                <Button
                    type="submit"
                    className="confirm-button"
                >
                    Confirm
                </Button>
                <Button className="confirm-button" onClick={onTogglePrev}>Back</Button>
            </div>
        </Form>
    );
};

export default PaymentForm;