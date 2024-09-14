const mongoose = require("mongoose");

const buyerSchema = new mongoose.Schema({
  name: { type: String, required: true },
  phone: { type: String, required: true },
  id: { type: String, unique: true, required: true },
  wallet: { type: Number, default: 0 },
  purchasedProducts: [{ type: mongoose.Schema.Types.ObjectId, ref: "Product" }],
});

module.exports = mongoose.model("Buyer", buyerSchema);
