-- Find receiver with pagination

SELECT receiver FROM transactions WHERE receiver ILIKE '%rizal%' LIMIT 5 OFFSET 0;