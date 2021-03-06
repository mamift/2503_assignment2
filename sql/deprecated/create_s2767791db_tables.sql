--    This SQL DDL script was generated by Microsoft Visual Studio (Release Date: LOCAL BUILD).

--    Driver Used : Microsoft Visual Studio - ODBC Generic Driver Driver.
--    Document    : F:\Dropbox\Code\2503ICT\assignment2\documentation\databaseERModel.vsd.
--    Time Created: 3 February 2013 11:50 AM.
--    Operation   : From Visio Generate Wizard.
--    Connected data source : No connection.
--    Connected server      : No connection.
--    Connected database    : Not applicable.



-- Create s2757691db database.
-- create database s2757691db; 

-- Create new table a2_Item.
-- a2_Item : Table of a2_Item
-- 	name : Name identifies a2_Item
-- 	description : Description describes a2_Item
-- 	category_id : a2_Category categorises a2_Item
-- 	starting_price : Starting price prices a2_Item
-- 	id : a2_Itemid identifies a2_Item
-- 	manufacturer : Manufacturer manufactured a2_Item
-- 	expiration_date : a2_Item has Expiration date
-- 	seller_username : a2_User selling a2_Item  
create table a2_Item ( 
	id INTEGER not null auto_increment,
	name VARCHAR(255) not null,
	description TEXT not null,
	category_name VARCHAR(255) not null,
	starting_price DECIMAL(8,2) not null,
	manufacturer VARCHAR(255) not null,
	expiration_date TIMESTAMP null,
	seller_username VARCHAR(255) not null, constraint a2_Item_PK primary key (id) ); 

-- Create new table a2_Category.
-- a2_Category : Table of a2_Category
-- 	description : Description describes a2_Category
-- 	name : a2_Categoryname identifies a2_Category  
create table a2_Category ( 
	name VARCHAR(255) not null, constraint a2_Category_PK primary key (name), 
	description VARCHAR(255) not null);

-- Create new table a2_User.
-- a2_User : Table of a2_User
-- 	username : username identifies a2_User
-- 	first_name : First name identifies a2_User
-- 	last_name : Last name identifies a2_User
-- 	description : Description descirbes a2_User
-- 	password : Password is a key for a2_User
-- 	e_mail : E_mail is for a2_User  
create table a2_User ( 
	username VARCHAR(255) not null,
	first_name VARCHAR(255) not null,
	last_name VARCHAR(255) not null,
	description TEXT null,
	password VARCHAR(255) not null,
	e_mail VARCHAR(255) not null, constraint a2_User_PK primary key (username) ); 

-- Create new table a2_Bid.
-- a2_Bid : Table of a2_Bid
-- 	id : a2_Bidid identifies a2_Bid
-- 	item_id : a2_Item sells for a2_Bid
-- 	username : a2_User places a2_Bid
-- 	amount : Value is a2_Bid
-- 	bid_date : Bid date dates a2_Bid  
create table a2_Bid ( 
	id INTEGER not null auto_increment,
	item_id INTEGER not null,
	username VARCHAR(255) not null,
	amount DECIMAL(8,2) not null,
	bid_date TIMESTAMP not null, constraint a2_Bid_PK primary key (id) ); 

-- Add the remaining keys, constraints and indexes for the table a2_User.
alter table a2_User add constraint a2_User_UC1 unique (
	e_mail); 

-- Add foreign key constraints to table a2_Item.
alter table a2_Item
	add constraint a2_User_a2_Item_FK1 foreign key (
		seller_username)
	 references a2_User (
		username); 

alter table a2_Item
	add constraint a2_Category_a2_Item_FK1 foreign key (
		category_name)
	 references a2_Category (
		name); 

-- Add foreign key constraints to table a2_Bid.
alter table a2_Bid
	add constraint a2_Item_a2_Bid_FK1 foreign key (
		item_id)
	 references a2_Item (
		id); 

alter table a2_Bid
	add constraint a2_User_a2_Bid_FK1 foreign key (
		username)
	 references a2_User (
		username); 


-- This is the end of the Microsoft Visual Studio generated SQL DDL script.
