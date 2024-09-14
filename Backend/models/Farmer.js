const mongoose = require("mongoose");

const farmerSchema = new mongoose.Schema({
  name: { type: String, required: true },
  phone: { type: String, required: true },
  id: { type: String, unique: true, required: true },
  wallet: { type: Number, default: 0 },
  products: [{ type: mongoose.Schema.Types.ObjectId, ref: "Product" }],
});

module.exports = mongoose.model("Farmer", farmerSchema);
