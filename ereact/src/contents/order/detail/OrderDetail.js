import React, {useEffect, useState} from "react";
import {useNavigate, useParams} from "react-router-dom";
import axios from "axios";
import {Card, CardText, ListGroup} from "react-bootstrap";
import cookie from "react-cookies";
import OrderItem from "../../../component/orderItem/OrderItem";
import './OrderDetail.css';

const OrderDetail = () => {
    const navigate = useNavigate();
    const { id } = useParams();
    const [orderForm, setOrderForm] = useState(null);
    const [inventories, setInventories] = useState(null);

    useEffect(() => {
        const checkLoginAndFetchData = async () => {
            if (!cookie.load('user')) {
                navigate('/login');
            } else {
                try {
                    const orderRes = await axios.get(`/api/ordering/orders/${id}`);
                    console.log(orderRes.data);
                    setOrderForm(orderRes.data);

                    const itemsRes = await axios.get(`/api/ordering/orders/${id}/items`);
                    console.log(itemsRes.data);
                    setInventories(itemsRes.data);
                } catch (error) {
                    console.log(error);
                }
            }
        };

        checkLoginAndFetchData();
    }, [id, navigate]);

    return (
        <div className="order-detail-container">
            <div className="general-order-info-container">
                <h3>Order Details - ID: {orderForm?.id}</h3>
                <p>Total: ${orderForm?.total}</p>
                <p>First Name: {orderForm?.first_name}</p>
                <p>Last Name: {orderForm?.last_name}</p>
                <p>Date: {orderForm?.date}</p>
                <p>Phone Number: {orderForm?.phone_num}</p>
                <p>Status: {orderForm?.status}</p>
                <p>Address 1: {orderForm?.address_1}</p>
                <p>Address 2: {orderForm?.address_2}</p>
                <p>City: {orderForm?.city}</p>
                <p>Province: {orderForm?.province}</p>
            </div>
            <div className="card-container" id="order-card-container">
                <Card id="order-item-card">
                    <Card.Title id="cart-card-title" className="card-title">Order Items</Card.Title>
                    <ListGroup>
                        {inventories?.length > 0 && inventories.map(inventory => (
                            <OrderItem data={inventory} key={inventory.id} />
                        ))}
                    </ListGroup>
                </Card>
            </div>
        </div>
    );
};

export default OrderDetail;