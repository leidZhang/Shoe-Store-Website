import React from "react";
import ProductCard from "../../../../component/productCard/ProductCard";
import PaginationComponent from "../../../../component/pagination/PaginationComponent";

const ProductList = ({productList, totalPageNum, pageSize, onPageChange}) => { // list by category
    return (
        <div className="result-container">
            <h2 className="result-title">Results</h2>
            <div className="card-container" id="result-card">
                {productList && productList.map(product => (
                    <ProductCard data={product} key={product.id}/>
                ))}
            </div>
            <div className="pagination-container" id="search-pagination">
                <PaginationComponent data={totalPageNum} pageSize={pageSize} onPageChange={onPageChange}/>
            </div>
        </div>
    );
}

export default ProductList;