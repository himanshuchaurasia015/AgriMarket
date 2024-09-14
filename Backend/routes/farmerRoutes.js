const express = require("express");
const {
  registerFarmer,
  createProduct,
  updateWallet,
} = require("../controllers/farmerController");
const router = express.Router();

router.post("/register", registerFarmer);
router.post("/product", createProduct);
router.put("/wallet", updateWallet);

module.exports = router;
