-- Get user history with option (income/expense, date range)

SELECT transaction_number AS trx_number, u.fullname AS name, amount, type, t.transaction_date AS date
FROM users u
JOIN transactions t
  ON u.id = t.user_id
ORDER BY trx_number;