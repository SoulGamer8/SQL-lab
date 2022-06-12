-- 1
SELECT 
	COUNT(*) AS COUNT,
	SUM(book_price) AS SUM,
    AVG(book_price) AS AVG,
    MIN(book_price) AS MIN,
	MAX(book_price) AS MAX
FROM books;

-- 2
SELECT 
	COUNT(*) AS COUNT
FROM books
WHERE book_price IS NOT NULL;

-- 3
SELECT 
	COUNT(*) AS COUNT,
	SUM(book_price) AS SUM,
    AVG(book_price) AS AVG,
    MIN(book_price) AS MIN,
	MAX(book_price) AS MAX
FROM books
GROUP BY book_novelty;

-- 4
SELECT 
	COUNT(*) AS COUNT,
	SUM(book_price) AS SUM,
    AVG(book_price) AS AVG,
    MIN(book_price) AS MIN,
	MAX(book_price) AS MAX
FROM books
GROUP BY YEAR(book_date);

-- 5
SELECT 
	COUNT(*) AS COUNT,
	SUM(book_price) AS SUM,
    AVG(book_price) AS AVG,
    MIN(book_price) AS MIN,
	MAX(book_price) AS MAX
FROM books
WHERE book_price NOT BETWEEN 10 AND 20
GROUP BY YEAR(book_date);

-- 6
SELECT 
	COUNT(*) AS COUNT,
	SUM(book_price) AS SUM,
    AVG(book_price) AS AVG,
    MIN(book_price) AS MIN,
	MAX(book_price) AS MAX
FROM books
WHERE book_price NOT BETWEEN 10 AND 20
GROUP BY YEAR(book_date) 
ORDER BY COUNT DESC ;

-- 7
SELECT 
	COUNT(book_item) AS total_items, 
    COUNT(DISTINCT book_item) AS total_unique_items 
FROM books;

-- 8
SELECT 
	SUBSTRING(book_name,1,1) AS First_Letter,
	COUNT(*) AS total_number,
	SUM(book_price) AS total_price
FROM books
GROUP BY First_Letter;

--9

SELECT 
	SUBSTRING(book_name,1,1) AS First_Letter,
	COUNT(*) AS total_number,
	SUM(book_price) AS total_price
FROM books
where substring(book_name, 1, 1) not regexp '^[0-9]' and substring(book_name, 1, 1) not regexp '^[a-z]'
GROUP BY First_Letter;

--10

SELECT 
	SUBSTRING(book_name,1,1) AS First_Letter,
	COUNT(*) AS total_number,
	SUM(book_price) AS total_price 
    FROM books
	WHERE substring(book_name, 1, 1) 
		NOT REGEXP '^[0-9]' 
    	AND substring(book_name, 1, 1) 
    	NOT REGEXP '^[a-z]' 
    	AND year(book_date) >2000
GROUP BY First_Letter;

--11

SELECT 
	SUBSTRING(book_name,1,1) AS First_Letter,
	COUNT(*) AS total_number,
	SUM(book_price) AS total_price 
	FROM books
	WHERE substring(book_name, 1, 1) 
		NOT REGEXP '^[0-9]' 
		AND substring(book_name, 1, 1) 
    	NOT REGEXP '^[a-z]' 
		AND year(book_date) >2000
	GROUP BY First_Letter
	ORDER BY first_letter DESC;

--12

SELECT 
	COUNT(*) AS COUNT_, 
	SUM(book_price) AS SUM_, 
	AVG(book_price) AS AVG_, 
	MIN(book_price) AS MIN_, 
	MAX(book_price) AS MAX_, 
	month(book_date) AS MONTH_, 
	YEAR(book_date) AS YEAR_ FROM books
	GROUP BY MONTH_;

--13

SELECT 
	COUNT(*) AS COUNT_, 
	SUM(book_price) AS SUM_, 
	AVG(book_price) AS AVG_, 
	MIN(book_price) AS MIN_, 
	MAX(book_price) AS MAX_, 
	month(book_date) AS MONTH_, 
	YEAR(book_date) AS YEAR_ 
    FROM books
    WHERE book_date not NULL
	GROUP BY MONTH_;

--14

SELECT 
	COUNT(*) AS COUNT_, 
	SUM(book_price) AS SUM_, 
	AVG(book_price) AS AVG_, 
	MIN(book_price) AS MIN_, 
	MAX(book_price) AS MAX_, 
	month(book_date) AS MONTH_, 
	YEAR(book_date) AS YEAR_ 
    FROM books
    WHERE book_date not NULL
    ORDER BY book_year DESC, book_month ASC;

--15

select book_novelty,
	sum(book_price) as total_price_dollars,
	sum(book_price * 29.46) as total_price_UAH,
	sum(book_price * 0.93) as total_price_EUR,
	sum(book_price * 63.36) as total_price_RUB
	from books
	group by book_novelty;

--16

select book_novelty,
	ROUND(SUM(book_price)) AS total_price_dollars,
	ROUND(SUM(book_price * 29.46)) AS total_price_UAH,
	ROUND(SUM(book_price * 0.93)) AS total_price_EUR,
	ROUND(SUM(book_price * 63.36)) AS total_price_RUB
	from books
	group by book_novelty;

--17

SELECT 
	COUNT(*) AS COUNT_, 
	SUM(book_price) AS SUM_, 
	AVG(book_price) AS AVG_, 
	MIN(book_price) AS MIN_, 
	MAX(book_price) AS MAX_
    FROM books
	GROUP BY book_publisher;

--18

SELECT 
	COUNT(*) AS COUNT_, 
	SUM(book_price) AS SUM_, 
	AVG(book_price) AS AVG_, 
	MIN(book_price) AS MIN_, 
	MAX(book_price) AS MAX_
    FROM books
	GROUP BY book_publisher, book_subject
	ORDER BY book_publisher;

--19

SELECT 
	COUNT(*) AS COUNT_, 
	SUM(book_price) AS SUM_, 
	AVG(book_price) AS AVG_, 
	MIN(book_price) AS MIN_, 
	MAX(book_price) AS MAX_
    FROM books
	GROUP BY book_publisher
	ORDER BY book_publisher, book_subject, book_category;

--20

SELECT book_publisher, 
    round(((book_price* 29.46)/book_pages)*100) AS price_page 
    FROM books
	WHERE round(((book_price* 29.46)/book_pages)*100) > 10;