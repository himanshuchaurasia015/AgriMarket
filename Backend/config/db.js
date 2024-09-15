const mongoose = require("mongoose");

// Create a connection for Farmer DB
const connectFarmerDB = async () => {
  try {
    const farmerConnection = await mongoose.connect(
      "mongodb://localhost:27017/farmerDB",
      {
        useNewUrlParser: true,
        useUnifiedTopology: true,
        serverSelectionTimeoutMS: 30000, // Increase the timeout to 30 seconds
      }
    );
    console.log("Farmer Database connected");
    return farmerConnection; // Return the farmer connection
  } catch (error) {
    console.error("Error connecting to Farmer DB:", error.message);
  }
};

// Create a connection for Buyer DB


module.exports = { connectFarmerDB };
