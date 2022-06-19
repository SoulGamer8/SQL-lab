-- 1
delimiter //
CREATE PROCEDURE task1()
BEGIN
    SELECT
        book_name, book_price, publisher_name ,shape_name
    FROM
        book
    JOIN publisher ON publisher.publisher_id = book.publisher_id
    JOIN shape ON shape.shape_id = book.shape_id;
END
DELIMITER ;

-- 2

delimiter //
CREATE PROCEDURE task2()
BEGIN
    SELECT
        theme_name,category_name book_name, book_price, publisher_name
    FROM
        book
    JOIN theme ON theme.theme_id = book.theme_id
    JOIN category ON category.category_id = book.category_id
    JOIN publisher ON publisher.publisher_id = book.publisher_id
	ORDER BY theme_name,category_name;
END //
DELIMITER ;

-- 3
delimiter //
CREATE PROCEDURE task3()
BEGIN
    SELECT
        book_name
    FROM
        book
    JOIN publisher ON publisher.publisher_id = book.publisher_id
    WHERE
    	publisher_name LIKE "%BHV%" AND YEAR(book_date);
END //
DELIMITER ;

-- 4

delimiter //
CREATE PROCEDURE task4()
BEGIN
	SELECT SUM(book_pages) AS all_pages, category_name 
    FROM 
        book
	JOIN category ON category.category_id = book.category_id
	GROUP BY category_name
	ORDER BY all_pages DESC;
END //
DELIMITER ;

-- 5

DELIMITER //
CREATE PROCEDURE task5()
BEGIN
	SELECT AVG(book_price) AS avg_price
    FROM 
        book
	JOIN theme ON theme.theme_id = book.theme_id
	JOIN category ON category.category_id = book.category_id
	WHERE category_name = 'Linux' AND theme_name = 'Використання ПК';
END //

-- 6

DELIMITER //
CREATE PROCEDURE task6()
BEGIN
	SELECT * 
    FROM 
        book, 
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
END //

-- 7

DELIMITER //
CREATE PROCEDURE task7()
BEGIN
	SELECT 
        b1.book_name, 
        b1.book_pages 
    FROM 
        book AS b1, book AS b2
	WHERE b1.book_pages = b2.book_pages AND b1.book_id != b2.book_id
	ORDER BY book_pages;
END //

-- 8

DELIMITER //
CREATE PROCEDURE task8()
BEGIN
	SELECT DISTINCT 
        b1.book_id, 
        b1.book_name, 
        b1.book_price 
    FROM 
        book AS b1, book AS b2, book AS b3
	WHERE 
	    b1.book_price = b2.book_price AND
	    b2.book_price = b3.book_price AND
	    b3.book_price = b1.book_price AND
	    b1.book_id != b2.book_id AND
	    b2.book_id != b3.book_id AND
	    b3.book_id != b1.book_id
	ORDER BY book_price;
END //

-- 9

DELIMITER //
CREATE PROCEDURE task9()
BEGIN
	SELECT 
        book_name 
    FROM    
        book
	WHERE category_id IN (
	SELECT 
        category_id 
    FROM 
        category
	WHERE category_name LIKE '%C++%'
	);
END //

-- 10 

DELIMITER //
CREATE PROCEDURE task10()
BEGIN
	SELECT 
        publisher_name, 
        book_pages 
    FROM book AS b
	JOIN publisher AS p ON b.publisher_id = p.publisher_id
	WHERE b.publisher_id IN (
		SELECT publisher_id FROM publisher
		WHERE b.book_pages > 400
	);
END //

-- 11 

DELIMITER //
CREATE PROCEDURE task11()
BEGIN
	SELECT 
        category_name, 
        total_books 
    FROM category, (
		SELECT 
            count(book_name) AS total_books, category_id 
        FROM 
            book
		GROUP BY category_id) AS c
	WHERE category.category_id = c.category_id AND total_books >= 3;
END //

-- 12

DELIMITER //
CREATE PROCEDURE task12()
BEGIN
	SELECT 
        book_name 
    FROM 
        book
	WHERE EXISTS (
		SELECT 
            publisher_id 
        FROM 
            publisher
		WHERE publisher_name = 'Видавнича група BHV' AND
		publisher.publisher_id = book.publisher_id
	);
END //

-- 13

DELIMITER //
CREATE PROCEDURE task12()
BEGIN
	SELECT 
        book_name 
    FROM 
        book
	WHERE NOT EXISTS (
		SELECT 
            publisher_id 
        FROM 
            publisher
		WHERE publisher_name = 'Видавнича група BHV' AND
		publisher.publisher_id = book.publisher_id
	);
END //

-- 14

DELIMITER //
CREATE PROCEDURE task14()
BEGIN
	SELECT 
        theme_name AS name 
    FROM 
        theme
	UNION 
	SELECT 
        category_name AS name 
    FROM category
	ORDER BY name;
END //

-- 15

DELIMITER //
CREATE PROCEDURE task15()
BEGIN
	SELECT 
        substring_index(book_name, ' ', 1) AS name 
    FROM 
        book
	UNION
	SELECT category_name AS name 
    FROM 
        category
	ORDER BY name DESC;
END //
