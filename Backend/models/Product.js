// models/Product.js
const mongoose = require('mongoose');

// Product Schema
const productSchema = new mongoose.Schema({
  name: { type: String, required: true },
  type: { type: String, required: true },
  season: { type: String, required: true },
  fertilizer: { type: String, required: true },
  pesticides: { type: String, required: true },
  phone: { type: String, required: true },
  time: { type: String, required: true },
  duration: { type: String, required: true },
  images: { type: String, required: true },
  status: { type: String, default: 'active' },  // 'active' or 'inactive'
  quality: { type: String, required: true },
  minprice: { type: Number, required: true },
  maxprice: { type: Number, required: true },
  baseprice: { type: Number, required: true },
  createdAt: { type: Date, default: Date.now },
  farmerId: { type: mongoose.Schema.Types.ObjectId, ref: 'Farmer' },
});

// Create and export the Product model
module.exports = mongoose.model('Product', productSchema);
