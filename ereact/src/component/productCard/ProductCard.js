import React, {useEffect, useState} from "react";
import {Card, CardImg, CardSubtitle, Col, Row} from "react-bootstrap";
import {useNavigate} from "react-router-dom";
import "./ProductCard.css"

const ProductCard = ({ data }) => {
    const navigate = useNavigate();

    const handleNavigate = () => {
        navigate(`/product/${data?.id}`);
    }

    return (
        <Col xs={12} sm={6} md={4} lg={3} xl={3} className="mb-4">
            <Card id="product-card-content" onClick={() => handleNavigate()} className="box">
                <div className="product-card-img-container">
                    <CardImg id="product-card-img" src={data?.image} alt={data?.title} />
                </div>
                <Card.Body style={{ padding: "0px" }}>
                    <CardSubtitle id="product-card-title">{data?.title}</CardSubtitle>
                    <Card.Text id="product-card-price" style={{textAlign: "center" }}>
                        ${data?.price}
                    </Card.Text>
                </Card.Body>
            </Card>
        </Col>
    );
};


export default ProductCard;