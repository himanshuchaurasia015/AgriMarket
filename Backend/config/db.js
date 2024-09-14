const mongoose = require('mongoose');

// Create a connection for Farmer DB
const connectFarmerDB = async () => {
    try {
        const farmerConnection = await mongoose.createConnection('mongodb://localhost:27017/farmerDB');
        console.log("Farmer Database connected");
        return farmerConnection;  // Return the farmer connection
    } catch (error) {
        console.error("Error connecting to Farmer DB:", error.message);
    }
};

// Create a connection for Buyer DB
const connectBuyerDB = async () => {
    try {
        const buyerConnection = await mongoose.createConnection('mongodb://localhost:27017/buyerDB');
        console.log("Buyer Database connected");
        return buyerConnection;  // Return the buyer connection
    } catch (error) {
        console.error("Error connecting to Buyer DB:", error.message);
    }
};

module.exports = { connectFarmerDB, connectBuyerDB };
