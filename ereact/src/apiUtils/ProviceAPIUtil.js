import axios from 'axios';
import cookie from "react-cookies"; // Replace with the actual cookie library you are using

const removeAuthorizationHeader = () => {
    delete axios.defaults.headers.common['Authorization'];
};

export const fetchProvinces = async () => {
    try {
        removeAuthorizationHeader();

        const res = await axios.get('https://geogratis.gc.ca/services/geoname/en/codes/province');
        const data = res.data['definitions'];

        return data;
    } catch (error) {
        console.log(error);
        return [];
    } finally {
        const token = cookie.load('user');
        axios.defaults.headers.common['Authorization'] = `Token ${token}`;
    }
};
