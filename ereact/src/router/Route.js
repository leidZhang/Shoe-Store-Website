import Home from "../contents/home/Home";
import ProductDetail from "../contents/products/detail/ProductDetail";
import Register from "../contents/user/register/Register";
import Login from "../contents/user/login/Login";
import NotFound from "../contents/notfound/NotFound";
import Layout from "../Layout";
import NewProfile from "../contents/user/profile/add/NewProfile";
import Profile from "../contents/user/profile/update/Profile";
import Checkout from "../contents/order/checkout/Checkout";
import Cart from "../contents/user/cart/Cart";
import OrdersHistory from "../contents/order/history/OrdersHistory";
import SearchResult from "../contents/products/searchresult/SearchResult";
import OrderDetail from "../contents/order/detail/OrderDetail";

export default [
    // ===== login =====
    {
        path: '/login',
        element: <Login />
    },
    // ===== register (username, password) =====
    {
        path: '/register',
        element: <Register />
    },
    // ===== register (profile-create) =====
    {
        path: '/new-profile',
        element: <NewProfile />
    },
    // ===== layout =====
    {
        path: '/',
        element: <Layout />,
        children: [
            // ===== home =====
            {
                element: <Home />,
                index: true,
            },
            // ===== product detail =====
            {
                path: 'product/:id',
                element: <ProductDetail />
            },
            // ===== cart =====
            {
                path: 'cart',
                element: <Cart />
            },
            // ===== checkout =====
            {
                path: 'checkout',
                element: <Checkout />
            },
            // ===== order history =====
            {
                path: 'order-history',
                element: <OrdersHistory />
            },
            // ===== order detail =====
            {
              path: 'order-detail/:id',
              element: <OrderDetail />
            },
            // ===== search =====
            {
                path: '/search-result',
                element: <SearchResult />
            },
            // ===== profile =====
            {
                path: '/profile',
                element: <Profile />
            },
        ]
    },
    // ===== 404 =====
    {
        path: '*',
        element: <NotFound />
    }
]
