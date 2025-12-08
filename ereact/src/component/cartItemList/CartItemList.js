import React, {useEffect, useState} from "react";
import {CardText, ListGroup} from "react-bootstrap";
import CartItem from "../cartItem/CartItem";
import axios from "axios";

const CartItemList = ({ onItemList }) => {
    const [itemList, setItemList] = useState([]);
    const [total, setTotal] = useState(0.00);

    useEffect(() => {
        renderCart();
        renderTotal();
    }, []);

    const handleRerender = () => {
        renderCart();
        renderTotal();
    }

    const renderCart = () => {
        axios.get(`api/shopping-cart/cart/items`).then(res => {
            const data = res.data;
            setItemList(data);
            onItemList(data);
        }).catch(error => {
            console.log(error);
        });
    };

    const renderTotal = () => {
        axios.get(`api/shopping-cart/cart`).then(res => {
            console.log(res.data);
            const data = res.data[0];
            setTotal(data['total']);
        }).catch(error => {
            console.log(error);
        })
    }

    return (
        <div>
            <ListGroup>
                {itemList.length === 0 && <CardText className="cart-item-text">Your cart is empty</CardText>}
                {itemList.length > 0 && itemList.map(item => (
                    <CartItem
                        data={item}
                        key={item.id}
                        reRender={handleRerender}
                    />
                ))}
            </ListGroup>
            <CardText className="cart-item-text" id="cart-total-price">
                Total Price: ${total}
            </CardText>
        </div>
    );
};

export default CartItemList;