import React from "react";
import {Form} from "react-bootstrap";

const BrandFilter = ({ brands, selectedBrand, handleSelection, handleBrand }) => {
    return (
        <Form.Group className="filter-group">
            <Form.Label className="filter-tag">Brand</Form.Label>
            {brands && Array.from(brands).map(brand => (
                <Form.Text key={brand}>
                    <p className="filter-text">
                        <input
                            type="checkbox"
                            name="brand"
                            value={brand}
                            className="filter-input"
                            onChange={() => {
                                const hasBrand = selectedBrand.has(brand);
                                const newSet = handleSelection(selectedBrand, brand, hasBrand);
                                console.log(hasBrand);
                                handleBrand(newSet);
                            }}
                        />
                        {brand}
                    </p>
                </Form.Text>
            ))}
        </Form.Group>
    );
};

export default BrandFilter;