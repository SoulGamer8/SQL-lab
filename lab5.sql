-- 2.a
CREATE TABLE theme(
	theme_id INT PRIMARY KEY auto_increment,
    theme_name VARCHAR(50) NOT NULL UNIQUE  
);

CREATE TABLE category(
	category_id INT PRIMARY KEY auto_increment,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE publisher(
	publisher_id INT PRIMARY KEY auto_increment,
    publisher_name VARCHAR(50)  NOT NULL UNIQUE 
);

CREATE TABLE shape(
	shape_id int primary key auto_increment,
    shape_name varchar(20) NOT NULL UNIQUE  
);

CREATE TABLE book(
	book_id INT PRIMARY KEY auto_increment, 
    book_item INT NOT NULL,                  
    book_novelty VARCHAR(3) CHECK (book_novelty in ("Yes", "No")), 			  
    book_name VARCHAR(100) NOT NULL,
    book_price FLOAT DEFAULT NULL,
    book_pages INT NOT NULL     CHECK (book_pages > 0),
    book_date DATE DEFAULT NULL,
    book_circulation INT NOT NULL CHECK(book_circulation > 0),
    theme_id INT,
    category_id INT,
    publisher_id INT,
    shape_id int
    
);

-- 2.b

insert into theme(theme_name)
select distinct book_subject from books;

insert into category(category_name)
select distinct book_category from books;

insert into publisher(publisher_name)
select distinct book_publisher from books;

insert into shape(shape_name)
select distinct book_format from books;

insert into book(book_item, book_novelty, book_name, book_price, book_pages, book_date, book_circulation, theme_id, category_id, publisher_id, shape_id)
select book_item, book_novelty, book_name, book_price, book_pages, book_date, book_circulation, theme_id, category_id, publisher_id, shape_id from books
join theme on theme.theme_name = books.book_subject
join category on category.category_name = books.book_category
join publisher on publisher.publisher_name = books.book_publisher
join shape on shape.shape_name = books.book_format;

select * from book;