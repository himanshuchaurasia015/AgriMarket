const express = require("express");
const {
  createProduct,
  getActiveProducts,
  getFarmerProducts,
  deactivateProduct,
} = require("../controllers/productController");

const router = express.Router();

// Farmer creates a product
router.post("/create", createProduct);

// Get all active products (for buyers or any users)
router.get("/active", getActiveProducts);

// Get all products of a specific farmer (only farmer)
router.get("/my-products", getFarmerProducts);

// Manually deactivate a product (testing or admin purpose)
router.put("/deactivate/:productId", deactivateProduct);

module.exports = router;
