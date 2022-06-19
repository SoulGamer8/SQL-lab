-- 1

BEGIN
    SELECT
        book_name, book_price, publisher_name ,shape_name
    FROM
        book
    JOIN publisher ON publisher.publisher_id = book.publisher_id
    JOIN shape ON shape.shape_id = book.shape_id;
END

-- 2

