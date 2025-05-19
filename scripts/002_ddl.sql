
-- Измерение: Покупатель
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    customer_first_name VARCHAR(100),
    customer_last_name VARCHAR(100),
    customer_age INT,
    customer_email VARCHAR(255),
    customer_country VARCHAR(100),
    customer_postal_code VARCHAR(50)
);

-- Измерение: Продавец
CREATE TABLE seller (
    seller_id SERIAL PRIMARY KEY,
    seller_first_name VARCHAR(100),
    seller_last_name VARCHAR(100),
    seller_email VARCHAR(255),
    seller_country VARCHAR(100),
    seller_postal_code VARCHAR(50)
);

-- Измерение: Товар
CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    product_category VARCHAR(100),
    product_price NUMERIC(10,2),
    product_weight NUMERIC(10,2),
    product_color VARCHAR(50),
    product_size VARCHAR(50),
    product_brand VARCHAR(100),
    product_material VARCHAR(100),
    product_description TEXT,
    product_rating NUMERIC(3,1),
    product_reviews INT,
    product_release_date VARCHAR(50),
    product_expiry_date VARCHAR(50)
);

-- Измерение: Магазин
CREATE TABLE store (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(255),
    store_location VARCHAR(255),
    store_city VARCHAR(100),
    store_state VARCHAR(100),
    store_country VARCHAR(100),
    store_phone VARCHAR(50),
    store_email VARCHAR(255)
);

-- Измерение: Поставщик
CREATE TABLE supplier (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(255),
    supplier_contact VARCHAR(255),
    supplier_email VARCHAR(255),
    supplier_phone VARCHAR(50),
    supplier_address VARCHAR(255),
    supplier_city VARCHAR(100),
    supplier_country VARCHAR(100)
);

-- Измерение: Домашнее животное
CREATE TABLE pet (
    pet_id SERIAL PRIMARY KEY,
    pet_type VARCHAR(50),
    pet_name VARCHAR(100),
    pet_breed VARCHAR(100),
    pet_category VARCHAR(100),
    UNIQUE (pet_type, pet_name, pet_breed)
);

-- Таблица фактов: Продажи
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    sale_date VARCHAR(50),
    customer_id INT REFERENCES customer(customer_id),
    seller_id INT REFERENCES seller(seller_id),
    product_id INT REFERENCES product(product_id),
    store_id INT REFERENCES store(store_id),
    supplier_id INT REFERENCES supplier(supplier_id),
    pet_id INT REFERENCES pet(pet_id),
    sale_quantity INT,
    sale_total_price NUMERIC(12,2)
);
