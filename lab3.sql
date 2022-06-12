-- 1

SELECT * FROM books WHERE  book_price IS null OR book_price=0;

-- 2

SELECT * FROM books WHERE  book_price IS NOT null AND book_circulation IS null;

-- 3

SELECT * FROM books WHERE  book_date IS null;

-- 4

SELECT * FROM books WHERE  book_date>=(CURDATE()-INTERVAL 1 YEAR);

-- 5

SELECT * FROM books WHERE book_novelty="Yes" ORDER BY book_price ASC;

-- 6

SELECT * FROM books WHERE book_pages BETWEEN 300 AND 400 ORDER BY book_name DESC;

-- 7

SELECT * FROM books WHERE book_price BETWEEN 20 AND 40 ORDER BY book_date DESC;

-- 8

SELECT * FROM books  ORDER BY book_name ASC,book_price DESC  ;

-- 9

SELECT * FROM books WHERE book_price/book_pages <0.10 ;