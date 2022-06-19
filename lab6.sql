--1

SELECT 
	book_name, 
    book_price, 
    publisher_name 
    FROM book, publisher
	WHERE 
    	book.publisher_id = publisher.publisher_id;


--2

SELECT 
	book_name, 
    category_name 
    FROM book
INNER JOIN category ON category.category_id = book.category_id;

--3

SELECT 
	book_name, 
    book_price, 
    publisher_name, 
    shape_name 
    FROM book
JOIN publisher ON publisher.publisher_id = book.publisher_id
JOIN shape ON shape.shape_id = book.shape_id;

--4

SELECT 
	theme_name, 
    category_name, 
    book_name, 
    publisher_name 
    FROM book
JOIN theme ON theme.theme_id = book.theme_id
JOIN category ON category.category_id = book.category_id
JOIN publisher ON publisher.publisher_id = book.publisher_id
ORDER BY 
	theme_name, 
    category_name;

--5

SELECT 
	book_name, 
    publisher_name 
    FROM book
JOIN publisher ON publisher.publisher_id = book.publisher_id
WHERE 
	year(book_date) > 2000 AND publisher_name LIKE "%BHV%";

--6

SELECT 
	SUM(book_pages) AS all_pages, 
    category_name 
    FROM book
JOIN category ON category.category_id = book.category_id
GROUP BY category_name
ORDER BY all_pages DESC;

--7

SELECT 
	AVG(book_price) AS avg_price 
    FROM book
JOIN theme ON theme.theme_id = book.theme_id
JOIN categoryONon category.category_id = book.category_id
WHERE 
	category_name = 'Linux' AND theme_name = 'Використання ПК';

--8

SELECT * FROM book, 
	category, 
    publisher, 
    shape, 
    theme
WHERE
	book.publisher_id = publisher.publisher_id
	AND theme.theme_id = book.theme_id
	AND category.category_id = book.category_id
	AND shape.shape_id = book.shape_id
ORDER BY book_id;

--9

SELECT * FROM book
INNER JOIN publisher ON book.publisher_id = publisher.publisher_id
INNER JOIN theme ON theme.theme_id = book.theme_id
INNER JOIN category ON category.category_id = book.category_id
INNER JOIN shape ON shape.shape_id = book.shape_id
ORDER BY book_id;

--10

SELECT * FROM book
RIGHT JOIN publisher ON book.publisher_id = publisher.publisher_id
RIGHT JOIN theme ON theme.theme_id = book.theme_id
RIGHT JOIN category ON category.category_id = book.category_id
RIGHT JOIN shape ON shape.shape_id = book.shape_id
ORDER BY book_id;

--11

SELECT 
	b1.book_name, 
    b1.book_pages 
FROM book AS b1, book AS b2
WHERE 
	b1.book_pages = b2.book_pages and 
    b1.book_id != b2.book_id
ORDER BY book_pages;

--12

SELECT DISTINCT 
	b1.book_name, 
    b1.book_price 
FROM book AS b1, book AS b2, book as b3
WHERE 
	b1.book_price = b2.book_price AND
    b2.book_price = b3.book_price AND
    b1.book_price = b3.book_price AND
    b1.book_id != b2.book_id AND
    b2.book_id != b3.book_id AND
    b1.book_id != b3.book_id
ORDER BY book_price;

--13

SELECT 
	book_name 
FROM book 
WHERE category_id IN
(
    SELECT 
    	category_id
    FROM 
    	category 
    WHERE 
    	category_name like "%C++%" )

--14

SELECT 
	book_name 
FROM book 
WHERE YEAR(book_date)>2000 AND publisher_id IN
(
    SELECT 
    	publisher_id
    FROM 
    	publisher 
    WHERE 
    	publisher_name like "%BHV%" )

--15

SELECT
    *
FROM
    publisher
WHERE
    (
    SELECT
        MIN(book_pages)
    FROM
        book
    WHERE
        book.book_id = publisher.publisher_id
) >= 400;

--16

SELECT
    *
FROM
    category
WHERE
    (
    SELECT
        COUNT(*)
    FROM
        book
    WHERE
        book.category_id = category.category_id
) > 3

--17

SELECT 
	book_name 
FROM 
	book
WHERE EXISTS (
	SELECT publisher_id FROM publisher
	WHERE publisher_name = 'Видавнича група BHV'
    AND publisher.publisher_id = book.publisher_id
);

--18

SELECT 
	book_name 
FROM 
	book
WHERE NOT EXISTS (
	SELECT publisher_id FROM publisher
	WHERE publisher_name = 'Видавнича група BHV'
    AND publisher.publisher_id = book.publisher_id
);

--19

SELECT 
	theme_name 
AS name
FROM 
	theme
UNION
SELECT 
	category_name
AS name
FROM 
	category 
ORDER BY name;

--20

SELECT 
	substring_index(book_name, ' ', 1) 
AS name 
FROM book
UNION
SELECT 
	category_name 
AS 
	name 
FROM 
	category
ORDER BY name DESC;