

-- Покупатели
INSERT INTO customer (customer_first_name, customer_last_name, customer_age, customer_email, customer_country, customer_postal_code)
SELECT DISTINCT customer_first_name, customer_last_name, customer_age, customer_email, customer_country, customer_postal_code
FROM mock_data
ON CONFLICT DO NOTHING;

-- Продавцы
INSERT INTO seller (seller_first_name, seller_last_name, seller_email, seller_country, seller_postal_code)
SELECT DISTINCT seller_first_name, seller_last_name, seller_email, seller_country, seller_postal_code
FROM mock_data
ON CONFLICT DO NOTHING;

-- Товары
INSERT INTO product (product_name, product_category, product_price, product_weight, product_color, product_size, product_brand, product_material, product_description, product_rating, product_reviews, product_release_date, product_expiry_date)
SELECT DISTINCT product_name, product_category, product_price, product_weight, product_color, product_size, product_brand, product_material, product_description, product_rating, product_reviews, product_release_date, product_expiry_date
FROM mock_data
ON CONFLICT DO NOTHING;

-- Магазины
INSERT INTO store (store_name, store_location, store_city, store_state, store_country, store_phone, store_email)
SELECT DISTINCT store_name, store_location, store_city, store_state, store_country, store_phone, store_email
FROM mock_data
ON CONFLICT DO NOTHING;

-- Поставщики
INSERT INTO supplier (supplier_name, supplier_contact, supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country)
SELECT DISTINCT supplier_name, supplier_contact, supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
FROM mock_data
ON CONFLICT DO NOTHING;

-- Домашние животные
INSERT INTO pet (pet_type, pet_name, pet_breed, pet_category)
SELECT DISTINCT m.customer_pet_type, m.customer_pet_name, m.customer_pet_breed, m.pet_category
FROM mock_data m
ON CONFLICT DO NOTHING;

-- Продажи (факт)
INSERT INTO sales (sale_date, customer_id, seller_id, product_id, store_id, supplier_id, pet_id, sale_quantity, sale_total_price)
SELECT m.sale_date,
       c.customer_id,
       s.seller_id,
       p.product_id,
       st.store_id,
       sp.supplier_id,
       pt.pet_id,
       m.sale_quantity,
       m.sale_total_price
FROM mock_data m
JOIN customer c ON c.customer_first_name = m.customer_first_name AND c.customer_last_name = m.customer_last_name AND c.customer_email = m.customer_email
JOIN seller s ON s.seller_first_name = m.seller_first_name AND s.seller_last_name = m.seller_last_name AND s.seller_email = m.seller_email
JOIN product p ON p.product_name = m.product_name AND p.product_category = m.product_category AND p.product_brand = m.product_brand
JOIN store st ON st.store_name = m.store_name AND st.store_city = m.store_city AND st.store_country = m.store_country
JOIN supplier sp ON sp.supplier_name = m.supplier_name AND sp.supplier_email = m.supplier_email
LEFT JOIN pet pt ON pt.pet_name = m.customer_pet_name AND pt.pet_breed = m.customer_pet_breed AND pt.pet_type = m.customer_pet_type
ON CONFLICT DO NOTHING;
