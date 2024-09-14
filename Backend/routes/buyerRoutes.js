const express = require("express");
const {
  registerBuyer,
  buyProduct,
  updateWallet,
} = require("../controllers/buyerController");
const router = express.Router();

router.post("/register", registerBuyer);
router.post("/buy", buyProduct);
router.put("/wallet", updateWallet);

module.exports = router;
