create database  if not exists  SalesDataWalmart;
Create table if not exists WMsales (
	invoice_id  varchar(30) Not null primary Key,
	branch  varchar (5) not null,
    city varchar (30) not null,
    customer_type varchar (30) not null,
    gender  varchar(10) not null,
    product_line varchar (100) not null,
    unit_price  decimal(10,2) not null,
    quantity int not null,
    VAT  float(6,4) not null,
    total decimal (12,4) not null,
    date datetime not null,
    time TIME not null,
    payment_method varchar (15)  not null, 
    cogs  decimal (10, 2) not null,
    gross_margin_pct float (11,9),
    gross_income decimal(12, 4) not null,
    rating float (2, 1)
);
select * from WMsales ; 
----------------------------------------------------------------------------------------------------------
------ ---------------------------------------Feature Engineering-------------------------------------------

------- ----------time_of_day-----------
select 
	time,
    (case 
		when `time` between "00:00:00" and "12:00:00" then "Morning"
        when `time` between "00:00:00" and "12:00:00" then "Afternoon"
        else  "Evening" 
    end 
    ) As time_of_day
from wmsales; 
alter table wmsales add column time_of_day  varchar(30);
update wmsales
set time_of_day= (
	case 
		when `time` between "00:00:00" and "12:00:00" then "Morning"
        when `time` between "00:00:00" and "12:00:00" then "Afternoon"
        else  "Evening" 
    end
);

--- -day name
select
	date,
    dayname(date)
from wmsales;
alter table wmsales add column day_name varchar(10);
update  wmsales
set day_name= dayname(date);
-----------  Month_name
select 
	date,
    monthname(date)
from wmsales;
alter table wmsales add column month_name varchar(15);
update  wmsales
set month_name= monthname(date);
select * from wmsales;




