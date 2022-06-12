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
