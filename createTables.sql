CREATE DATABASE inventory_management_system;
USE inventory_management_system;

CREATE TABLE unit (
    unit_code VARCHAR(50) PRIMARY KEY,
    unit_name VARCHAR(100) NOT NULL,
    is_fractional BOOLEAN NOT NULL,
    fractional_digits INT
);

CREATE TABLE address (
    addr_Id INT AUTO_INCREMENT PRIMARY KEY,
    addr_line_1 VARCHAR(255),
    addr_line_2 VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    pincode VARCHAR(20)
);

CREATE TABLE company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    headquarter_addr_id INT,
    gstin VARCHAR(50),
    FOREIGN KEY (headquarter_addr_id) REFERENCES address(addr_id)
);

CREATE TABLE branch_location (
    bl_id INT AUTO_INCREMENT PRIMARY KEY,
    bl_name VARCHAR(255) NOT NULL,
    company_id INT,
    bl_addr_id INT,
    FOREIGN KEY (company_id) REFERENCES company(company_id),
    FOREIGN KEY (bl_addr_id) REFERENCES address(addr_id)
);

CREATE TABLE item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    batch_number VARCHAR(50),
    unit_code VARCHAR(50),
    purchase_price DECIMAL(10, 2),
    selling_price DECIMAL(10, 2),
    expiry_date DATE,
    FOREIGN KEY (unit_code) REFERENCES unit(unit_code)
);

CREATE TABLE purchase_invoice (
    pi_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_location_id INT,
    vendor_name VARCHAR(255),
    bill_to_addr_id INT,
    bill_amount DECIMAL(10, 2),
    total_gst DECIMAL(10, 2),
    invoice_date DATE,
    FOREIGN KEY (branch_location_id) REFERENCES branch_location(bl_id),
    FOREIGN KEY (bill_to_addr_id) REFERENCES address(addr_id)
);

CREATE TABLE pi_items (
    item_id INT,
    pi_id INT,
    quantity DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    gst_amount DECIMAL(10, 2),
    PRIMARY KEY (item_id, pi_id),
    FOREIGN KEY (item_id) REFERENCES item(item_id),
    FOREIGN KEY (pi_id) REFERENCES purchase_invoice(pi_id)
);

CREATE TABLE sales_invoice (
    si_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_location_id INT,
    customer_name VARCHAR(255),
    ship_to_addr_id INT,
    bill_to_addr_id INT,
    bill_amount DECIMAL(10, 2),
    total_gst DECIMAL(10, 2),
    invoice_date DATE,
    FOREIGN KEY (branch_location_id) REFERENCES branch_location(bl_id),
    FOREIGN KEY (ship_to_addr_id) REFERENCES address(addr_id),
    FOREIGN KEY (bill_to_addr_id) REFERENCES address(addr_id)
);


CREATE TABLE si_items (
    item_id INT,
    si_id INT,
    quantity DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    gst_amount DECIMAL(10, 2),
    PRIMARY KEY (item_id, si_id),
    FOREIGN KEY (item_id) REFERENCES item(item_id),
    FOREIGN KEY (si_id) REFERENCES sales_invoice(si_id)
);

CREATE TABLE inventory (
    item_id INT,
    branch_location_id INT,
    stock_qty DECIMAL(10, 2),
    expiry_date DATE,
    PRIMARY KEY (item_id, branch_location_id),
    FOREIGN KEY (item_id) REFERENCES item(item_id),
    FOREIGN KEY (branch_location_id) REFERENCES branch_location(bl_id)
);
