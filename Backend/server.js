const express = require("express");
const { connectFarmerDB, connectBuyerDB } = require("./config/db");
// const cron = require('node-cron');
const {
  deactivateExpiredProducts,
} = require("./controllers/productController");

// Cron job to deactivate expired products every hour
// cron.schedule('0 * * * *', deactivateExpiredProducts);
const farmerRoutes = require("./routes/farmerRoutes");
const buyerRoutes = require("./routes/buyerRoutes");
const productRoutes = require("./routes/productRoutes");

const app = express();
app.use(express.json());
app.use("/uploads", express.static("uploads"));

connectFarmerDB();
connectBuyerDB();

app.use("/api/farmers", farmerRoutes);
app.use("/api/buyers", buyerRoutes);
app.use("/api/products", productRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
