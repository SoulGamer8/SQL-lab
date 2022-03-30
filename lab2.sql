-- 1

USE library;
SELECT book_id, book_item, book_novelty, book_name, book_price, book_pages FROM books;

-- 2

SELECT * FROM books;

-- 3

SELECT book_item,book_name,book_novelty,book_pages,book_price,book_id FROM books;

-- 4

SELECT * FROM books WHERE book_id<=10;

-- 5



-- 6

SELECT DISTINCT book_item FROM books;

-- 7

SELECT * FROM books WHERE book_novelty="Yes";

-- 8

SELECT * FROM books WHERE book_novelty="Yes" AND book_price BETWEEN 20 AND 30;

-- 9

SELECT * FROM books WHERE book_novelty="Yes" AND (book_price < 20 OR book_price> 30);

-- 10

SELECT * FROM books WHERE  (book_price < 20 OR book_price> 30) AND book_pages BETWEEN 300 AND 400;

-- 11

SELECT * FROM books WHERE book_date BETWEEN "2000-01-01" AND "2000-02-29" ;

-- 12 

SELECT * FROM books WHERE book_item IN (5110, 5141, 4985, 4241);

-- 13

SELECT * FROM books WHERE year(book_date) IN (1999, 2001, 2003, 2005) ;

-- 14

SELECT * FROM books WHERE book_name REGEXP '^[а-к]';


-- 15

SELECT * FROM books WHERE book_name LIKE "АПП%" AND year(book_date) = 2000 AND book_price<20 ;

-- 16

SELECT * FROM books WHERE book_name LIKE "АПП%" AND book_name LIKE '%е' AND book_date BETWEEN "2000-01-01" AND "2000-06-30"  ;

-- 17

SELECT * FROM books WHERE book_name LIKE "%Microsoft%" AND book_name NOT LIKE "%Windows%";

-- 18

SELECT * FROM books WHERE  CHAR_LENGTH(REGEXP_REPLACE (book_name, "[^0-9]", "")) > 0;

-- 19

SELECT * FROM books WHERE  CHAR_LENGTH(REGEXP_REPLACE (book_name, "[^0-9]", "")) >3;

--20

SELECT * FROM books WHERE  CHAR_LENGTH(REGEXP_REPLACE (book_name, "[^0-9]", "")) =5;