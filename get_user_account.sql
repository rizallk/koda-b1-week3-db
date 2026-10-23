-- Get user account information (balance, income, expense)

SELECT transaction_number AS trx_number, u.fullname AS name, amount, type, c.name AS category
FROM transactions t
JOIN categories c
  ON t.category_id = c.id
JOIN users u
  ON u.id = t.user_id;