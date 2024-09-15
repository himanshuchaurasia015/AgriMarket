const Product = require("../models/Product");
const Farmer = require("../models/Farmer");

// Configure multer for image uploads
// const storage = multer.diskStorage({
//   destination: function (req, file, cb) {
//     cb(null, "./uploads");
//   },
//   filename: function (req, file, cb) {
//     cb(null, Date.now() + "-" + file.originalname);
//   },
// });
// const upload = multer({ storage: storage }).array("images", 5); // Max 5 images

// Create Product
// Create Product
const createProduct = async (req, res) => {
  try {
    const {
      name,
      type,
      season,
      fertilizer,
      pesticides,
      phone,
      duration,
      quality,
      minprice,
      maxprice,
      baseprice,
    } = req.body;

    const newProduct = await Product.create({
      name,
      type,
      season,
      fertilizer,
      pesticides,
      phone,
      duration,
      quality,
      minprice,
      maxprice,
      baseprice,
    });

    return res
      .status(201)
      .json({ message: "Product created successfully", product: newProduct });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: "Failed to create product", details: error.message });
  }
};

// Get all active products
getActiveProducts = async (req, res) => {
  try {
    const products = await Product.find({ status: "active" });

    return res.status(200).json(products);
  } catch (error) {
    return res.status(500).json({
      error: "Failed to fetch active products",
      details: error.message,
    });
  }
};

// Get all products (for a specific farmer)

const getFarmerProducts = async (req, res) => {
  try {
    const farmerId = req.user.id; // Get farmer's ID from JWT token

    const products = await Product.find({ farmerId });

    return res.status(200).json(products);
  } catch (error) {
    return res
      .status(500)
      .json({ error: "Failed to fetch products", details: error.message });
  }
};

// Deactivate product after its duration
const deactivateExpiredProducts = async () => {
  const now = new Date();
  try {
    const products = await Product.find({ status: "active" });
    products.forEach(async (product) => {
      const expiryTime =
        new Date(product.time).getTime() + product.duration * 3600000; // duration in hours
      if (now.getTime() > expiryTime) {
        product.status = "inactive";
        await product.save();
      }
    });
  } catch (error) {
    console.error("Error in deactivating expired products:", error.message);
  }
};

// Manual deactivation for testing purposes
const deactivateProduct = async (req, res) => {
  try {
    const { productId } = req.params;

    const product = await Product.findById(productId);
    if (!product) {
      return res.status(404).json({ error: "Product not found" });
    }

    product.status = "inactive";
    await product.save();

    return res
      .status(200)
      .json({ message: "Product deactivated successfully" });
  } catch (error) {
    return res
      .status(500)
      .json({ error: "Failed to deactivate product", details: error.message });
  }
};

module.exports = {
  createProduct,
  getActiveProducts,
  getFarmerProducts,
  deactivateExpiredProducts,
  deactivateProduct,
};
