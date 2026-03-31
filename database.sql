-- Create database
CREATE DATABASE subscription_manager;
USE subscription_manager;

-- Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email_reminders BOOLEAN DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Subscriptions table
CREATE TABLE subscriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    service_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    billing_date DATE NOT NULL,
    status ENUM('Active', 'Expired') DEFAULT 'Active',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert sample data
INSERT INTO users (username, email, password) VALUES 
('john_doe', 'john@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'); -- password: password

INSERT INTO subscriptions (user_id, service_name, amount, billing_date, status) VALUES 
(1, 'Netflix', 15.99, '2024-12-05', 'Active'),
(1, 'Spotify', 9.99, '2024-12-10', 'Active'),
(1, 'Adobe CC', 52.99, '2024-11-30', 'Active');