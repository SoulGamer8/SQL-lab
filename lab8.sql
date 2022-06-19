-- 1

DELIMITER //
CREATE TRIGGER trig1 BEFORE INSERT ON theme
FOR EACH ROW
BEGIN
	DECLARE total_theme INT;
	SET total_theme = (SELECT count(*) FROM theme);
    IF total_theme > 10
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Кількість більша 10';
    ELSEIF total_theme < 5
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Кількість менша за 5';
	END IF;
END //
DELIMITER ;

-- 2

DELIMITER //
CREATE TRIGGER trig2 BEFORE INSERT ON book
FOR EACH ROW
BEGIN
	IF (book.new && YEAR(book.datee) != YEAR(NOW()))
	THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Новинкою може бути лише книга видана в поточному році';
	END IF;
END //
DELIMITER ;

-- 3

DELIMITER //
CREATE TRIGGER trig3 BEFORE INSERT ON book
FOR EACH ROW
BEGIN
	IF (
    	(book.price > 10 AND book.pages < 100) OR
    	(book.price > 20 AND book.pages < 200) OR
    	(book.price > 30 AND book.pages < 300)
	)
	THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Несумісна ціна та кількість сторінок';
	END IF;
END //
DELIMITER ;

-- 4

DELIMITER //
CREATE TRIGGER trig4 BEFORE INSERT ON book
FOR EACH ROW
BEGIN
	IF (
    	(book.id_publishing = 1 AND book.circulation < 5000) OR
    	(book.id_publishing = 4 AND book.circulation < 1000)
	)
	THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Занадто мале значення circulation для вказаного видавництва';
	END IF;
END //
DELIMITER ;

-- 5

-- 6

DELIMITER //
CREATE TRIGGER trig6 AFTER DELETE ON book
FOR EACH ROW
BEGIN
	IF user() != 'dbo@localhost' 
    THEN
		signal sqlstate "45000" SET message_text = 'Користувач не має права змінювати ціну книги';
	END IF;
	SET @deletion_sum = @deletion_sum + 1;
END //
DELIMITER ;

-- 7

DELIMITER //
CREATE TRIGGER trig7 BEFORE UPDATE ON books
FOR EACH ROW
BEGIN
    IF (REGEXP_SUBSTR(TRIM(CURRENT_USER()), '^[^\@]+') = 'root' AND books.price != books.price) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Користувач не має права змінювати ціну книги';
    END IF;
END //
DELIMITER ;

-- 8

DELIMITER //
CREATE TRIGGER trig8 BEFORE UPDATE ON books
FOR EACH ROW
BEGIN
    IF ((books.id_publishing IN (6, 8)) AND books.id_category = 1) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вказані видавництва не видають підручники';
    END IF;
END //
DELIMITER ;

-- 9

DELIMITER //
CREATE TRIGGER trig9 BEFORE UPDATE ON books
FOR EACH ROW
BEGIN
    SET @publisher_novelties_count = 0;
    SELECT COUNT(*) INTO @publisher_novelties_count
    FROM books
    WHERE books.id_publishing = books.id_publishing AND books.new AND YEAR(NOW()) = YEAR(books.datee) AND MONTH(NOW()) = MONTH(books.datee);

    IF (books.new AND @publisher_novelties_count IS NOT NULL AND @publisher_novelties_count > 10) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Видавництво не може видати більше 10 новинок за місяць';
    END IF;
END //
DELIMITER ;

-- 10

DELIMITER //
CREATE TRIGGER trig10 BEFORE UPDATE ON books
FOR EACH ROW
BEGIN
  IF (books.id_publishing = 1 AND books.format = 3) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вказане видавництво не видає кнниги в даному форматі';
    END IF;
END //
DELIMITER ;