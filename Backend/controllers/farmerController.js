const Farmer = require('../models/Farmer');
const bcrypt = require('bcryptjs');

// Farmer registration (create)
const registerFarmer = async (req, res) => {
    const { name, phone, id } = req.body;
    try {
        const newFarmer = new Farmer({ name, phone, id });
        await newFarmer.save();
        res.status(201).json(newFarmer);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Create product by farmer
const createProduct = async (req, res) => {
    const { name, type, season, fertilizer, pesticides, phone, time, duration } = req.body;
    const farmerId = req.farmer.id;

    try {
        const product = new Product({
            name, type, season, fertilizer, pesticides, phone, time, duration
        });
        await product.save();

        const farmer = await Farmer.findById(farmerId);
        farmer.products.push(product._id);
        await farmer.save();

        res.status(201).json(product);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Wallet Update Logic
const updateWallet = async (req, res) => {
    const { amount } = req.body;
    const farmerId = req.farmer.id;
    try {
        const farmer = await Farmer.findById(farmerId);
        farmer.wallet += amount;
        await farmer.save();
        res.status(200).json(farmer);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

module.exports = { registerFarmer, createProduct, updateWallet };
