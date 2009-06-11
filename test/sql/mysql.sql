CREATE TABLE authors(
	author_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	parent_author_id INT,
	name VARCHAR(25) NOT NULL DEFAULT 'default_name',
	updated_at datetime,
	created_at datetime,
	some_date date
) ENGINE=InnoDB;

CREATE TABLE books(
	book_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	author_id INT,
	secondary_author_id INT,
	name VARCHAR(50),
	numeric_test VARCHAR(10) DEFAULT '0',
	special NUMERIC(10,2) DEFAULT 0
);

CREATE TABLE venues (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(50),
	city varchar(60),
	state char(2),
	address varchar(50),
	phone varchar(10) default NULL,
	UNIQUE(name,address)
);

CREATE TABLE events (
	id int NOT NULL auto_increment PRIMARY KEY,
	venue_id int NOT NULL,
	host_id int NOT NULL,
	title varchar(60) NOT NULL,
	description varchar(50),
	type varchar(15) default NULL
);

CREATE TABLE hosts(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(25)
);

CREATE TABLE employees (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	nick_name VARCHAR(255) NOT NULL
);

CREATE TABLE positions (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	employee_id int NOT NULL,
	title VARCHAR(255) NOT NULL,
	active SMALLINT NOT NULL
);

CREATE TABLE `rm-bldg`(
    `rm-id` INT NOT NULL,
    `rm-name` VARCHAR(10) NOT NULL,
    `space out` VARCHAR(1) NOT NULL
);