-- CREATE DATABASE ewallet;

DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS audit_log CASCADE;

-- Data Defition Language (DDL) beserta Insert Data Dummy-nya
CREATE TABLE categories (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ
);

CREATE TABLE users (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  fullname VARCHAR(100) NOT NULL,
  username VARCHAR(60) NOT NULL,
  email VARCHAR(60) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  phone BIGINT,
  photo VARCHAR(255),
  pin INTEGER NOT NULL UNIQUE,
  balance BIGINT DEFAULT 0 CHECK(balance >= 0),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ
);

DROP TYPE IF EXISTS transaction_type CASCADE;
CREATE TYPE transaction_type AS ENUM ('income', 'expense');
CREATE TABLE transactions (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  transaction_number VARCHAR(100) NOT NULL,
  amount INT NOT NULL,
  type transaction_type,
  receiver VARCHAR(100),
  description VARCHAR(255),
  transaction_date TIMESTAMPTZ DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (category_id) REFERENCES categories (id)
);

CREATE TABLE audit_log (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id INTEGER NOT NULL,
  login_at TIMESTAMPTZ,
  logout_at TIMESTAMPTZ,
  FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Insert Data Dummy
INSERT INTO categories (name) VALUES
('gaji'), ('makanan'), ('transfer'), ('tagihan');

INSERT INTO users (fullname, username, email, password, phone, photo, pin, balance) VALUES
('Rizal Kadamong', 'rizal123', 'rizal@gmail.com', '$4hd72h', 82347711639, 'rizal.png', 423454, 35000000),
('Ucup Kurniawan', 'ucupp32', 'ucup_3@outlook.com', '$8jjbbdA8', 81245517656, NULL, 123644, 685000);

INSERT INTO transactions (user_id, category_id, transaction_number, amount, type, receiver, description, transaction_date) VALUES
(1, 1, 'TRX-0001', 15000000, 'income', 'PT Jaya Abadi', 'Gaji Bulan Oktober', '2026-10-01 08:00:00+07'),
(1, 4, 'TRX-0002', 450000, 'expense', 'PLN', 'Tagihan Listrik Rumah', '2026-10-02 09:15:00+07'),
(1, 2, 'TRX-0003', 85000, 'expense', 'Warung Nasi Padang', 'Makan Siang Kolega', '2026-10-05 12:30:00+07'),
(1, 3, 'TRX-0004', 1500000, 'expense', 'Ucup Kurniawan', 'Pinjaman teman', '2026-10-10 14:00:00+07'),
(1, 2, 'TRX-0005', 45000, 'expense', 'Kopi Kenangan', 'Ngopi sore', '2026-10-15 16:45:00+07'),
(2, 3, 'TRX-0006', 1500000, 'income', 'Rizal Kadamong', 'Terima pinjaman dana', '2026-10-10 14:05:00+07'),
(2, 1, 'TRX-0007', 3500000, 'income', 'Klien Freelance', 'Pembayaran project UI/UX', '2026-10-12 10:00:00+07'),
(2, 2, 'TRX-0008', 120000, 'expense', 'McDonalds', 'Makan malam', '2026-10-13 19:20:00+07'),
(2, 4, 'TRX-0009', 150000, 'expense', 'Telkomsel', 'Paket Data Internet', '2026-10-18 07:30:00+07'),
(2, 3, 'TRX-0010', 500000, 'expense', 'Rizal Kadamong', 'Cicilan bayar utang', '2026-10-21 11:15:00+07');

INSERT INTO audit_log (user_id, login_at, logout_at) VALUES
(1, '2026-10-20 07:45:00+07', '2026-10-20 08:15:00+07'),
(2, '2026-10-20 10:00:00+07', '2026-10-20 10:30:00+07'),
(1, '2026-10-21 13:20:00+07', '2026-10-21 14:05:00+07'),
(2, '2026-10-22 08:30:00+07', '2026-10-22 09:45:00+07'),
(1, '2026-10-22 18:50:00+07', NULL);