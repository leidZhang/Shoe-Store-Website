import React from "react";
import {Form} from "react-bootstrap";

const GroupFilter = ({productList, handleSelection, selectedProduct, handleProduct}) => {
   return (
       <Form.Group className="filter-group">
           <Form.Label className="filter-tag">Product</Form.Label>
           {productList && productList.map(product => (
               <Form.Text key={product.id}>
                   <p className="filter-text">
                       <input
                           type="checkbox"
                           className="filter-input"
                           value={product.title}
                           onChange={() => {
                               const isChecked = selectedProduct.has(product.title);
                               const newSet = handleSelection(selectedProduct, product.title, isChecked);
                               console.log(newSet);
                               handleProduct(newSet);
                           }}
                       />
                       {product.title}
                   </p>
               </Form.Text>
           ))}
       </Form.Group>
   );
};

export default GroupFilter;