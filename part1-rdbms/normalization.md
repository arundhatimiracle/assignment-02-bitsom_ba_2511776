## Anomaly Analysis
### Normalization Justification

Normalization is essential for maintaining data integrity and avoiding redundancy. In the given denormalized dataset, customer, product, and order details are stored in a single table, leading to multiple anomalies. For example, if a customer appears in multiple rows, their details such as city must be updated in all rows, increasing the risk of inconsistency (update anomaly). Similarly, inserting a new product without an associated order is not possible (insert anomaly), and deleting an order may remove critical customer or product information (delete anomaly).

By normalizing the schema into separate tables such as customers, products, orders, and order_items, we eliminate redundancy and ensure that each entity is stored independently. This design ensures that updates occur in only one place, reducing errors and improving maintainability. It also improves query flexibility, allowing efficient joins and aggregations.

While a single table may seem simpler initially, it becomes inefficient and error-prone as data grows. Normalization provides scalability, consistency, and better data organization, making it a necessary design choice rather than over-engineering.

### 1. Insert Anomaly

**Description:** In a denormalized table, new data cannot be inserted without the presence of related data from other entities.
**Example:** Suppose we want to add a new Sales Representative "SR05 – Arjun Singh". Since the table requires an order_id, we cannot insert this record unless the sales rep has made a sale.
**Impact:** This prevents storing independent data (like new employees or products) unless a transaction exists.
**Citation:** CSV columns: 'sales_rep_id' and 'order_id'.


### 2. Update Anomaly

**Description:** Redundant data stored across multiple rows requires multiple updates, increasing the risk of inconsistency.
**Example:** Customer "Rohan Mehta (C001)" appears in multiple rows (e.g., Rows 2, 10, 14). If his customer_city changes and only one row is updated, the data becomes inconsistent.
**Impact:** Leads to conflicting information and unreliable data.
**Citation:** 'customer_id' = C001, Column: 'customer_city', Rows: 2, 10, 14

### 3. Delete Anomaly

**Description:** Deleting a record may unintentionally remove important related data.
**Example:** Product "P008" exists only in one row (e.g., Row 12). If that order is deleted, all information about the product (price, category) is lost.
**Impact:** Loss of critical master data when deleting transactional data.
**Citation:** Row 12; 'order_id' ORD1085, 'product_id' P008.