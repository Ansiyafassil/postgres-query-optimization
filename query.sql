-- Create table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT,
    product TEXT,
    amount INT
);

-- Insert sample data
INSERT INTO orders(user_id, product, amount)
SELECT (random()*1000)::int, 'product', (random()*100)::int
FROM generate_series(1,200000);

-- Slow query
EXPLAIN ANALYZE
SELECT * FROM orders WHERE user_id = 500;

-- Optimization
CREATE INDEX idx_user_id ON orders(user_id);

-- Optimized query
EXPLAIN ANALYZE
SELECT * FROM orders WHERE user_id = 500;
