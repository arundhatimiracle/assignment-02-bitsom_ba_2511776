## ETL Decisions

### Decision 1 — Date Standardization
Problem: The raw dataset had inconsistent date formats such as DD-MM-YYYY and MM/DD/YYYY.
Resolution: Converted all dates into a standard ISO format (YYYY-MM-DD) before loading into dim_date.

### Decision 2 — Handling NULL Values
Problem: Some records had missing values for category and revenue.
Resolution: Replaced NULL values with appropriate defaults or removed incomplete rows to maintain data quality.

### Decision 3 — Category Normalization
Problem: Product categories had inconsistent casing (e.g., "electronics", "Electronics", "ELECTRONICS").
Resolution: Standardized all category values into consistent format (Title Case) to ensure accurate grouping and reporting.

