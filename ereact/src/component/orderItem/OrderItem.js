import React from "react";
import { useNavigate } from "react-router-dom";
import {CardBody, CardImg, CardSubtitle, CardText, ListGroupItem} from "react-bootstrap";
import './OrderItem.css';

const OrderItem = ({data}) => {
    const navigate = useNavigate();
    const {inventory, quantity} = data;

    const handleNavigate = () => {
        navigate(`/product/${inventory.product.id}`);
    }

    return (
        <ListGroupItem id="order-item">
            <CardImg className="order-item-img" src={inventory.product.image} />
            <CardBody className="order-item-text-container">
                <CardSubtitle id="order-item-title" onClick={() => handleNavigate()}>
                    {inventory.product.title}
                </CardSubtitle>
                <CardText className="order-item-text">
                    Price: ${inventory.product.price}
                </CardText>
                <CardText className="order-item-text">
                    Color: {inventory.color.title} | Size: {inventory.size.title}
                </CardText>
                <CardText className="order-item-text">
                    Qty: {quantity}
                </CardText>
            </CardBody>
        </ListGroupItem>
   );
};

export default OrderItem;