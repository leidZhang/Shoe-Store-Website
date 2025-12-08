/** 
// ProductCarousel.js
import React from 'react';
import Slider from 'react-slick';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';
import { Carousel } from 'bootstrap';

const ProductCarousel = ({ products }) => {
  return (
    <div>
      <Carousel>
        {products.map((product) => (
          <div key={product.id}>
            {/* Render your product information here }
            <h3>{product.title}</h3>
            console.log(product.title)
            <p>{product.description}</p>
            <img src={product.image} alt={product.title} />
          </div>
        ))}
      </Carousel>
    </div>
  );
};

export default ProductCarousel;
*/
