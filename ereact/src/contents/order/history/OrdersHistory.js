import React, {useEffect, useState} from "react";
import cookie from "react-cookies";
import axios from "axios";
import {Link, useNavigate} from "react-router-dom";
import './OrderHistory.css';
import PaginationComponent from "../../../component/pagination/PaginationComponent";

const OrdersHistory = () => {
    const navigate = useNavigate();
    const [totalNum, setTotalNum] = useState(1);
    const [orderList, setOrderList] = useState(null);

    useEffect(() => {
        const fetchData = async () => {
            try {
                if (!cookie.load('user')) {
                    navigate('/login');
                } else {
                    const response = await axios.get(`/api/ordering/orders`);
                    console.log(response.data['results']);
                    setOrderList(response.data['results']);
                    setTotalNum(response.data['count']);
                }
            } catch (error) {
                console.log(error);
            }
        };

        fetchData();
    }, []);

    const handleChangePage = async (param) => {
        axios.get(`/api/ordering/orders?${param}`).then(res => {
            console.log(res.data);
            setOrderList(res.data['results']);
        }).catch(error => {
            console.log(error);
        });
    }

    return (
        <div className="order-history-container">
            <h1>Order History</h1>
            <div className="order-history-list-container">
                {orderList && orderList.length > 0 && orderList.map(order => (
                    // temp history list, please implement pagination component
                    <p key={order.id}><Link to={`/order-detail/${order.id}`}>
                        Order ID: {order.id} - Date: {order.date} - Total: ${order.total}
                    </Link></p>
                ))}
            </div>
            <div className="pagination-container">
                <PaginationComponent
                    data={totalNum}
                    pageSize={20}
                    onPageChange={handleChangePage}
                />
            </div>
        </div>
    );
};

export default OrdersHistory;