-- Get transaction history

SELECT transaction_number AS trx_number, amount, type, receiver, description, transaction_date AS date
FROM transactions;
