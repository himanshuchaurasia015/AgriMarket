const Buyer = require('../models/Buyer');

// Buyer registration (create)
const registerBuyer = async (req, res) => {
    const { name, phone, id } = req.body;
    try {
        const newBuyer = new Buyer({ name, phone, id });
        await newBuyer.save();
        res.status(201).json(newBuyer);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Buy product logic
const buyProduct = async (req, res) => {
    const { productId } = req.body;
    const buyerId = req.buyer.id;
    try {
        const buyer = await Buyer.findById(buyerId);
        buyer.purchasedProducts.push(productId);
        await buyer.save();
        res.status(200).json(buyer);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Wallet Update Logic
const updateWallet = async (req, res) => {
    const { amount } = req.body;
    const buyerId = req.buyer.id;
    try {
        const buyer = await Buyer.findById(buyerId);
        buyer.wallet += amount;
        await buyer.save();
        res.status(200).json(buyer);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

module.exports = { registerBuyer, buyProduct, updateWallet };
