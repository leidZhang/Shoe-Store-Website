/** // FetchData.js
import React, { useState, useEffect } from 'react';

const FetchData = ({ apiUrl, onDataFetched }) => {
  const [data, setData] = useState([]);

  useEffect(() => {
    fetch(apiUrl)
      .then((response) => response.json())
      .then((fetchedData) => {
        setData(fetchedData);
        onDataFetched(fetchedData);
      })
      .catch((error) => console.error('Error fetching data:', error));
  }, [apiUrl, onDataFetched]);

  return <></>; // or you can return a loading indicator if needed
};

export default FetchData;
*/