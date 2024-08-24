---------------------------------------- Exploratory Data Analysis (EDA) --------------------------------------------------------------------------------------
----------------------------------- Generic Question
--------------- 1. How many unique cities does the data have? 
select
	distinct city
from wmsales;
-- 2. In which city is each branch?
select
	distinct city,
    branch
from wmsales;
---------------------------------------------- Prodcuct----------------------------------------------------------
--------------- 1. How many unique product lines does the data have?-----------
select 
	count(distinct product_line)
from wmsales;
------------------------- 2. What is the most common payment method?-----------
select 
	payment_method,
	count( payment_method) as cnt
from wmsales
group by payment_method
order by  cnt desc;
----------- 3. What is the most selling product line?---------------
select 
	product_line,
	count( product_line) as cnt
from wmsales
group by product_line
order by  cnt desc;
--------------- 4. What is the total revenue by month? ------------
Select 
	month_name as Month,
    sum(total) as Total_Revenue 
from wmsales
group by month_name
order by Total_Revenue Desc ;
----------------------- 5. What month had the largest COGS?----------
select 
	month_name as month,
    sum(cogs) as cogs
from wmsales
group by month_name
order by cogs desc;
---------------- 6. What product line had the largest revenue? ---------------
select 
	product_line,
    sum(total) as Total_revenue 
from wmsales
group by product_line
order by Total_revenue  desc;
---------------------- 5. What is the city with the largest revenue?-----------------
select 
	city,
    sum(total) as Total_revenue 
from wmsales
group by city
order by Total_revenue  desc;
-------------- -6. What product line had the largest VAT?
select 
	product_line,
    sum(VAT) as Valueable_Tax
from wmsales
group by product_line
order by Valueable_Tax  desc;

---------------- 7. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales -----------
---- 8. Which branch sold more products than average product sold?-----
select 
	branch ,
    sum(quantity) as qty
from wmsales
group by branch
having sum(quantity) > 
	(select  avg(quantity) from wmsales);
------------ 9. What is the most common product line by gender?-------
select
	gender,
    product_line,
    count(gender) as total_count
from wmsales
group by gender, product_line
order by total_count desc;

------- 10. What is the average rating of each product line?-----------
select
	round(avg (rating) , 2) as avg_rating,
    product_line
from wmsales
group by product_line
order by avg_rating desc;

----------- -------------------------------Sales-------------------------------------------
---------------------------------------------------------------------------------------------
--------- -----1. Number of sales made in each time of the day per weekday--------
select
	time_of_day,
    count(*) as total_sales
from wmsales
where day_name = "Sunday"
group by time_of_day
order by total_sales desc;

----------- 2. Which of the customer types brings the most revenue?---
select
	customer_type,
    round (sum(total), 2) as total_revenue
from wmsales
group by customer_type
order by total_revenue;
--------------------------- 3. Which city has the largest tax percent/ VAT (**Value Added Tax**)?--
select
	city,
    avg(VAT) as value_added_tax
from wmsales
group by city
order by value_added_tax desc;
--------------------- 4. Which customer type pays the most in VAT?-----------
select
	customer_type,
    avg(VAT) as value_added_tax
from wmsales
group by customer_type
order by value_added_tax desc;

-------------------------------------------------------------------------------------------
------------------------------- -------Customer ----------------------------
------------- 1. How many unique customer types does the data have?----------
select
	distinct (customer_type)
from wmsales;

----------- . How many unique payment methods does the data have?-----
select
	distinct (payment_method)
from wmsales;

-------------------------- 3. What is the most common customer type?--
select
	customer_type,
    count(*) as total_count
from wmsales
group by customer_type
order by total_count;

------------ 4. Which customer type buys the most?----------
select
	customer_type,
    count(*) as total_count
from wmsales
group by customer_type
order by total_count;
-------------------------- 5. What is the gender of most of the customers?------
select
	gender,
    count(*) as gender_count
from wmsales
group by gender
order by gender_count desc;

------------------ 6. What is the gender distribution per branch?---------
select
	gender,
    count(*) as gender_count
from wmsales
where branch = "C"
group by gender
order by gender_count desc;
-------------- 7. Which time of the day do customers give most ratings?-----
select
	time_of_day,
    avg(rating) as avg_rating
from wmsales
group by time_of_day
order by avg_rating desc;

------------ 8. Which time of the day do customers give most ratings per branch?----
select
	time_of_day,
    branch,
    avg(rating) as avg_rating
from wmsales
group by time_of_day, branch
order by avg_rating ;


select
	time_of_day,
    avg(rating) as avg_rating
from wmsales
where branch = "C"
group by time_of_day
order by avg_rating ;
---------------------- 9. Which day fo the week has the best avg ratings?--------------
select
	day_name,
    avg(rating) as avg_rating
from wmsales
group by day_name
order by avg_rating desc;

----- 10. Which day of the week has the best average ratings per branch?--
select
	day_name,
    avg(rating) as avg_rating
from wmsales
where branch= "A"
group by day_name
order by avg_rating desc;

--------------------- Revenue And Profit Calculation----------------------------------------------
--------------------------------------------------------------------------------------
------ $ total(gross_sales) 
select
	sum(VAT+cogs) as total_grass_sales
from  wmsales;
----- gross profit-----------
SELECT 
	(SUM(VAT + COGS) - COGS) 
FROM wmsales;

SELECT (SUM(ROUND(VAT, 2) + COGS) - COGS) FROM wmsales;


