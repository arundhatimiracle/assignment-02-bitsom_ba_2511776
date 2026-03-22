## Storage Systems

To meet the hospital’s requirements, a hybrid architecture using multiple storage systems is essential.

For transactional data such as patient records, prescriptions, and billing, an OLTP relational database like MySQL is used. This ensures strong consistency and reliability, which are critical in healthcare systems.

A Data Lake (e.g., AWS S3) is used to store raw data from multiple sources, including ICU device streams, logs, and unstructured clinical notes. This allows flexible storage of both structured and unstructured data.

A Data Warehouse (e.g., Snowflake) is used for analytical workloads such as monthly reporting on bed occupancy and department costs. It enables fast SQL-based queries and supports business intelligence dashboards.

A Vector Database (e.g., Pinecone) is used to enable semantic search over patient records. This allows doctors to query patient history in natural language and retrieve relevant information efficiently.

Finally, a machine learning pipeline uses historical data from the warehouse and data lake to predict patient readmission risk.

## OLTP vs OLAP Boundary

The OLTP system (MySQL) handles real-time transactional operations such as patient admissions, updates, and billing. It is optimized for fast inserts and updates.

The OLAP system begins at the Data Warehouse, where data is transformed and loaded from the OLTP system and Data Lake. This system is optimized for analytical queries and reporting.

The boundary lies at the data ingestion and ETL layer, where transactional data is extracted and transformed before being loaded into the warehouse for analysis.

## Trade-offs

One major trade-off in this architecture is between data latency and consistency. Real-time data processing using streaming systems like Kafka introduces complexity and may result in slightly delayed consistency in downstream systems.

To mitigate this, a hybrid approach can be used where critical data is processed in near real-time, while less critical analytics are handled through batch processing.

Another trade-off is increased system complexity due to multiple components such as Data Lake, Warehouse, and Vector DB. This can be mitigated by using managed cloud services and proper monitoring tools to ensure reliability and scalability.
