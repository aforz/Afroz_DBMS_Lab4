Que: 1)	You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for
the E-commerce with the schema definition given below.

Ans:
create database query : create database e_commerce;

Table:supplier: create table supplier (supp_id int primary key, supp_name varchar(50) not null, supp_city varchar(50) not null, supp_phone varchar(50) not null);
Table:customer: create table customer (cus_id int primary key, cus_name varchar(20) not null, cus_phone varchar(10) not null, cus_city varchar(30) not null, cus_gender char);
Table:category: create table category (cat_id int primary key, cat_name varchar(20) not null);
Table:product:  create table product (pro_id int primary key, pro_name varchar(20) not null default "Dummy", pro_desc varchar(60), cat_id int, foreign key (cat_id)
                references category(cat_id));
Table:supplier_pricing: create table supplier_pricing (pricing_id int primary key, pro_id int, supp_id int, supp_price int default 0, foreign key(pro_id) references product(pro_id), foreign key (supp_id) references supplier(supp_id));
Table:orders:  create table orders (ord_id int primary key, ord_amount int not null, ord_date date not null, cus_id int, pricing_id int, foreign key(cus_id) references customer(cus_id), foreign key(pricing_id) references supplier_pricing(pricing_id));
Table:rating:   create table rating (rat_id int primary key, ord_id int, rat_ratstars int not null, foreign key (ord_id) references orders (ord_id))

Que: 2)	Insert the following data in the table created above.

Ans:
Supplier Table-
insert into supplier (supp_id, supp_name, supp_city, supp_phone) values
(1,'Rajesh Retails', 'Delhi', '1234567890'),
(2,'Appario Ltd.', 'Mumbai', '2589631470'),
(3,'Knome products', 'Banglore', '9785462315'),
(4,'Bansal Retails', 'Kochi', '8975463285'),
(5,'Mittal Ltd.', 'Lucknow', '7898456532');

Customer Table-
insert into customer (cus_id, cus_name, cus_phone, cus_city, cus_gender) values
(1,'AAKASH', '9999999999', 'DELHI', 'M'),
(2,'AMAN', '9785463215', 'NOIDA', 'M'),
(3,'NEHA', '9999999999', 'MUMBAI', 'F'),
(4,'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5,'PULKIT', '7895999999', 'LUCKNOW', 'M');

Category Table-
insert into category(cat_id, cat_name) values
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'),
(5, 'CLOTHES');

Product Table-
insert into product (pro_id, pro_name, pro_desc, cat_id) values
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);

Supplier_pricing Table-
insert into supplier_pricing (pricing_id, pro_id, supp_id, supp_price) values
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000);

Orders Table-
insert into orders (ord_id, ord_amount, ord_date, cus_id, pricing_id) values
(101, 1500, '2021-10-06', 2, 1),
(102, 1000, '2021-10-12', 3, 5),
(103, 30000, '2021-09-16', 5, 2),
(104, 1500, '2021-10-05', 1, 1),
(105, 3000, '2021-08-16', 4, 3),
-- (106, 1450, '2021-08-18', 1, 9),
-- (107, 789, '2021-09-01', 3, 7),
-- (108, 780, '2021-09-07', 5, 6),
(109, 3000, '2021-00-10', 5, 3),
(110, 2500, '2021-09-10', 2, 4),
(111, 1000, '2021-09-15', 4, 5),
-- (112, 789, '2021-09-16', 4, 7),
-- (113, 31000, '2021-09-16', 1, 8),
(114, 1000, '2021-09-16', 3, 5),
(115, 3000, '2021-09-16', 5, 3);
-- (116, 99, '2021-09-17', 2, 14);

Rating table-

insert into rating (rat_id, ord_id, rat_ratstars) values
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
-- (6, 106, 3),
-- (7, 107, 4),
-- (8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
-- (12, 112, 4),
-- (13, 113, 2),
(14, 114, 1),
(15, 115, 1);
-- (16, 116, 0);

Que: 3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
Ans:    select count(r2.cus_gender) as customerCounts, r2.cus_gender from (select r1.cus_id, r1.cus_gender, r1.ord_amount, r1.cus_name from (select orders.*, customer.cus_gender, customer.cus_name from orders inner join customer where orders.cus_id = customer.cus_id having orders.ord_amount >= 3000) as r1 group by r1.cus_id) as r2 group by r2.cus_gender;

Que: 4)	Display all the orders along with product name ordered by a customer having Customer_Id=2.
Ans:    select p.pro_name, o.* from orders o, supplier_pricing sp, product p where o.cus_id = 2 and o.pricing_id = sp.pricing_id and sp.pro_id = p.pro_id;

Que: 5)	Display the Supplier details who can supply more than one product.
Ans:    select s.* from supplier s where s.supp_id in (select sp.supp_id from supplier_pricing sp group by sp.supp_id having count(sp.supp_id) > 1);

Que: 6)	Find the least expensive product from each category and print the table with category id, name, product name and price of the product.
Ans:   select category.cat_id, category.cat_name, a3.pro_name, min(a3.min_price) as min_price from category inner join (select product.cat_id, product.pro_name, a2.* from product inner join
       (select pro_id, min(supp_price) as min_price from supplier_pricing group by pro_id) as a2
        where a2.pro_id = product.pro_id) as a3
        where a3.cat_id = category.cat_id group by a3.cat_id;

Que: 7)	Display the Id and Name of the Product ordered after “2021-10-05”.
Ans:    select p.pro_id, p.pro_name from product p left join supplier_pricing sp on p.pro_id = sp.pro_id
        inner join orders o on sp.pricing_id = o.pricing_id where o.ord_date > '2021-10-05'

Que: 8)	Display customer name and gender whose names start or end with character 'A'.
Ans:    select cus_name, cus_gender from customer where cus_name like 'A%' or cus_name like '%A'

Que: 9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
Ans:    CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_supplier`()
        BEGIN
        	select s.supp_id, s.supp_name, r.rat_ratstars,
            case
        		when r.rat_ratstars = 5 THEN 'Excellent Service'
                when r.rat_ratstars > 4 THEN 'Good Service'
                when r.rat_ratstars > 2 THEN 'Average Service'
                ELSE 'Poor Service'
        	END as Type_of_Service
            from supplier s inner join supplier_pricing sp
            on s.supp_id = sp.supp_id inner join orders o on sp.pricing_id = o.pricing_id
        	inner join rating r on o.ord_id = r.ord_id;
        END



