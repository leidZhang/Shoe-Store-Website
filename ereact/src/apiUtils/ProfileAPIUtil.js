import axios from "axios";

export const fetchProfile = async () => {
    try {
        const res = await axios.get('api/identity/user-info');
        const { id, username, first_name, last_name } = res.data.customer;
        const { address_1, address_2, city, phone_num, postal_code, province } = res.data;

        const newForm = {
            id: id,
            username: username,
            firstName: first_name,
            lastName: last_name,
            address1: address_1,
            address2: address_2,
            city: city,
            phoneNum: phone_num,
            postalCode: postal_code,
            province: province
        };

        return newForm;
    } catch (error) {
        console.log(error);
        throw error; // Re-throw the error if needed
    }
};