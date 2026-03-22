javascript
// OP1: insertMany() — insert all documents
db.products.insertMany([
  {
    category: "Electronics",
    product_id: "E101",
    name: "iPhone 14",
    price: 75000,
    brand: "Apple",
    specs: {
      ram: "6GB",
      storage: "128GB",
      warranty_years: 1
    }
  },
  {
    category: "Clothing",
    product_id: "C201",
    name: "Men T-Shirt",
    price: 799,
    brand: "Nike",
    attributes: {
      size: ["S", "M", "L"],
      color: "Black",
      fabric: "Cotton"
    }
  },
  {
    category: "Groceries",
    product_id: "G301",
    name: "Organic Milk",
    price: 60,
    brand: "Amul",
    details: {
      expiry_date: new Date("2024-12-01"),
      weight: "1L",
      nutrition: {
        calories: 150,
        protein: "8g"
      }
    }
  }
]);

// OP2: find() — Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  "details.expiry_date": { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add discount_percent
db.products.updateOne(
  { product_id: "E101" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — index on category
db.products.createIndex({ category: 1 });

// Explanation:
// Index improves query performance for filtering by category,
// especially useful for large datasets.
