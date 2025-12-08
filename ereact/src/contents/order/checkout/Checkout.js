import React, {useState} from "react";
import './Checkout.css';
import {Accordion, Card} from "react-bootstrap";
import AddressForm from "../../../component/addressForm/AddressForm";
import PaymentForm from "../../../component/paymentForm/PaymentForm";
import OrderSummaryForm from "../../../component/orderSummaryForm/OrderSummaryForm";
import axios from "axios";
import {useNavigate} from "react-router-dom";

const Checkout = () => {
    const navigate = useNavigate();
    const [activeKey, setActiveKey] = useState("0");
    const [addressForm, setAddressForm] = useState(null);
    const [paymentForm, setPaymentForm] = useState(null);

    const handleToggleNext = () => {
        switch (activeKey) {
            case "0":
                setActiveKey("1");
                break;
            case "1":
                setActiveKey("2");
                break;
            default:
                break;
        }
    }

    const handleTogglePrev = () => {
        switch (activeKey) {
            case "2":
                setActiveKey("1");
                break;
            case "1":
                setActiveKey("0");
                break;
            default:
                break;
        }
    }

    const handleAddress = (addressInfo) => {
        setAddressForm(addressInfo);
    }

    const handlePayment = (paymentInfo) => {
        setPaymentForm(paymentInfo);
    }

    const handleOrderPlace = () => {
        const orderInfo = {
            firstName: addressForm.firstName,
            lastName: addressForm.lastName,
            phoneNum: addressForm.phoneNum,
            address1: addressForm.address1,
            address2: addressForm.address2,
            city: addressForm.city,
            province: addressForm.province,
            postalCode: addressForm.postalCode,
            paymentMethod: paymentForm.paymentMethod
        }

        console.log(orderInfo);
        axios.post(`/api/ordering/orders`, orderInfo).then(res => {
            console.log(res.data);

            const orderId = res.data.id
            navigate(`/order-detail/${orderId}`);
        }).catch(error => {
            console.log(error);
        });
    };

    return (
        <div className="card-container" id="checkout-container">
            <Accordion defaultActiveKey="0" activeKey={activeKey} id="cart-accordion">
                <Accordion.Item eventKey="0">
                    <Accordion.Header id="cart-title">Shipping Address</Accordion.Header>
                    <Accordion.Body>
                        <Card className="checkout-card">
                            <AddressForm
                                onToggleNext={handleToggleNext}
                                onSubmitAddress={handleAddress}
                            />
                        </Card>
                    </Accordion.Body>
                </Accordion.Item>
                <Accordion.Item eventKey="1">
                    <Accordion.Header id="cart-title">Payment Method</Accordion.Header>
                    <Accordion.Body>
                        <Card className="checkout-card">
                            <PaymentForm
                                onToggleNext={handleToggleNext}
                                onTogglePrev={handleTogglePrev}
                                onSubmitPayment={handlePayment}
                            />
                        </Card>
                    </Accordion.Body>
                </Accordion.Item>
                <Accordion.Item eventKey="2">
                    <Accordion.Header id="cart-title">Order Summary</Accordion.Header>
                    <Accordion.Body>
                        <Card className="checkout-card">
                            <OrderSummaryForm
                                onTogglePrev={handleTogglePrev}
                                onSubmitOrder={handleOrderPlace}
                            />
                        </Card>
                    </Accordion.Body>
                </Accordion.Item>
            </Accordion>
        </div>
    )
};

export default Checkout;