SELECT
	COUNT(*)
FROM (
	SELECT
		maker
	FROM Product
	GROUP BY maker
	HAVING COUNT(model) = 1
) as maker_one_model_count