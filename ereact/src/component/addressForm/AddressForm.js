import React, {useEffect, useState} from "react";
import "./AddressForm.css";
import {Col, Form, Row} from "react-bootstrap";
import Button from "react-bootstrap/Button";
import {fetchProfile} from "../../apiUtils/ProfileAPIUtil";
import {fetchProvinces} from "../../apiUtils/ProviceAPIUtil";

const AddressForm = ({ onToggleNext, onSubmitAddress }) => {
    const [provinceList, setProvinceList] = useState(null);
    const [form, setForm] = useState({'province': 'NL'});
    const [errors, setErrors] = useState({});

    useEffect(() => {
        const fetchData = async () => {
            try {
                // get user profile
                const newForm = await fetchProfile();
                setForm(newForm);
                // get provinces from 3rd party api
                const provinces = await fetchProvinces();
                setProvinceList(provinces);
            } catch (error) {
                console.error(error);
            }
        };

        fetchData();
    }, []); // The empty dependency array means this effect will run once on mount

    const setField = (field, value) => {
        setForm({...form, [field]:value});

        if (errors[field]) {
            setErrors({...errors, [field]: null})
        }
    };

    const validateForm = () => {
        const validationTable = [
            {regex: /^[A-Z][a-z]*$/, name: "firstName", errorMsg: "Invalid first name"},
            {regex: /^[A-Z][A-Za-z']*$/, name: "lastName", errorMsg: "Invalid last name"},
            {regex: /^\d{10}$/, name: "phoneNum", errorMsg: "Invalid phone number"},
            {regex: /^.+$/, name: "address1", errorMsg: "Please enter address"},
            {regex: /^.+$/, name: "city", errorMsg: "Please enter city"},
            {regex: /^[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d$/, name: "postalCode", errorMsg: "The post format should be like A1A 1A1"},
        ]

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

        console.log(form);
        onSubmitAddress(form);
        onToggleNext();
    };

    return (
        <Form className="form" onSubmit={ handleConfirm }>
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>First Name</Form.Label>
                    <Form.Control
                        type="text"
                        placeholder="Enter your first name"
                        value={form.firstName}
                        onChange={(e) => setField('firstName', e.target.value)}
                        isInvalid={errors.firstName}
                    />
                    <Form.Control.Feedback type="invalid">
                        {errors.firstName}
                    </Form.Control.Feedback>
                </Col>
                <Col>
                    <Form.Label>Last Name</Form.Label>
                    <Form.Control
                        type="text"
                        placeholder="Enter your last name"
                        value={form.lastName}
                        onChange={(e) => setField('lastName', e.target.value)}
                        isInvalid={errors.lastName}
                    />
                    <Form.Control.Feedback type="invalid">
                        {errors.lastName}
                    </Form.Control.Feedback>
                </Col>
            </Row>
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>Phone Number</Form.Label>
                    <Form.Control
                        type="text"
                        placeholder="Enter your phone number"
                        value={form.phoneNum}
                        onChange={(e) => setField('phoneNum', e.target.value)}
                        isInvalid={errors.phoneNum}
                    />
                    <Form.Control.Feedback type="invalid">
                        {errors.phoneNum}
                    </Form.Control.Feedback>
                </Col>
            </Row>
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>Address</Form.Label>
                    <Form.Control
                        type="text"
                        placeholder="Enter your street address"
                        value={form.address1}
                        onChange={(e) => setField('address1', e.target.value)}
                        isInvalid={errors.address1}
                    />
                    <Form.Control.Feedback type="invalid">
                        {errors.address1}
                    </Form.Control.Feedback>
                </Col>
            </Row>
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>Address 2</Form.Label>
                    <Form.Control
                        type="text"
                        placeholder="Apartment, studio, or floor"
                        value={form.address2}
                        onChange={(e) => setField('address2', e.target.value)}
                        isInvalid={errors.address2}
                    />
                    <Form.Control.Feedback type="invalid">
                        {errors.address2}
                    </Form.Control.Feedback>
                </Col>
            </Row>
            <Row className="form-row" id="checkout-form-row">
                <Col>
                    <Form.Label>City</Form.Label>
                    <Form.Control
                        type="text"
                        placeholder="Enter city name"
                        value={form.city}
                        onChange={(e) => setField('city', e.target.value)}
                        isInvalid={errors.city}
                    />
                    <Form.Control.Feedback type="invalid">
                        {errors.city}
                    </Form.Control.Feedback>
                </Col>
                <Col>
                    <Form.Label>Province</Form.Label>
                    <Form.Select
                        value={form.province}
                        onChange={(e) => setField('province', e.target.value)}
                    >
                        {provinceList && provinceList.map(province => (
                            <option key={province['term']}>{province['term']}</option>
                        ))}
                    </Form.Select>
                </Col>
                <Col>
                    <Form.Label>Postal Code</Form.Label>
                    <Form.Control
                        type="text"
                        placeholder="Enter postal code"
                        value={form.postalCode}
                        onChange={(e) => setField('postalCode', e.target.value)}
                        isInvalid={errors.postalCode}
                    />
                    <Form.Control.Feedback type="invalid">
                        {errors.postalCode}
                    </Form.Control.Feedback>
                </Col>
            </Row>
            <div className="button-container">
                <Button
                    className="form-button"
                    id="address-button"
                    type="submit"
                >Confirm</Button>
            </div>
        </Form>
    );
};

export default AddressForm;