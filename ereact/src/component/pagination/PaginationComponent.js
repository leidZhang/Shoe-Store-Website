import Pagination from 'react-bootstrap/Pagination';
import {useEffect, useState} from "react";
import {useLocation} from "react-router-dom";

const PaginationComponent = ({ data, pageSize, onPageChange }) => {
    const location = useLocation();
    let allParams = location.search;
    const maxPageNumbers = 5;
    const totalItems = data ? data : 0;
    const totalPages = Math.ceil(totalItems / pageSize);

    const [currentPage, setCurrentPage] = useState(1);
    const [startPage, setStartPage] = useState(1);
    const [endPage, setEndPage] = useState(totalPages);

    useEffect(() => {
        handlePaginationChange();
    }, [currentPage, totalPages]);

    const handlePaginationChange = () => {
        let newStartPage = Math.max(1, currentPage - Math.floor(maxPageNumbers / 2));
        let newEndPage = Math.min(totalPages, newStartPage + maxPageNumbers - 1);

        if (newEndPage - newStartPage + 1 < maxPageNumbers) {
            newStartPage = Math.max(1, newEndPage - maxPageNumbers + 1);
        }

        setStartPage(newStartPage);
        setEndPage(newEndPage);
    }

    const handlePageChange = (pageNum) => {
        if (pageNum >= 1 && pageNum <= totalPages) {
            console.log(pageNum);
            setCurrentPage(pageNum);
            handlePaginationChange();

            const pageRegex = /&page=\d+/;
            if (pageRegex.test(location.search)) {
                allParams = location.search.replace(pageRegex, `&page=${pageNum}`);
            } else {
                allParams = location.search + `&page=${pageNum}`;
            }

            onPageChange(allParams.substring(1));
        }
    }

    return (
        <Pagination>
            <Pagination.First onClick={() => handlePageChange(1)} />
            <Pagination.Prev onClick={() => handlePageChange(currentPage - 1)} />
            {startPage > 1 && <Pagination.Ellipsis />}
            {Array.from({ length: endPage - startPage + 1 }).map((_, index) => (
                <Pagination.Item
                    key={startPage + index}
                    active={startPage + index === currentPage}
                    onClick={() => handlePageChange(startPage + index)}
                >
                    {startPage + index}
                </Pagination.Item>
            ))}
            {endPage < totalPages && <Pagination.Ellipsis />}
            <Pagination.Next onClick={() => handlePageChange(currentPage + 1)} />
            <Pagination.Last onClick={() => handlePageChange(totalPages)} />
        </Pagination>
    );
}

export default PaginationComponent;