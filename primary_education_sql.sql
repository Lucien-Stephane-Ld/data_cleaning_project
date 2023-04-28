create database education;

use education;

/* LOADING AND CLEANING DATA IN TABLES */

alter table primary_education_clean
drop column MyUnknownColumn;

select * from primary_education_clean ;


/* CREATING BY REGION TABLE */
create table `average_education_index_by_region`
as (
select Region `Countries and areas`,
round(avg(`Total`),2) as Total,
round(avg(`Residence Rural`),2) as `Residence Rural`,
round(avg(`Residence Urban`),2) as `Residence Urban`,
round(avg(`Wealth quintile Poorest`),2) as `Wealth quintile Poorest`,
round(avg(`Wealth quintile Richest`),2) as`Wealth quintile Richest`
from primary_education_clean
group by `Region`
)
;

/*
insert into average_education_index_by_region (`Region Name`)
values ('Southern Asia' , 'Latin America & Caribbean', 'Europe & Central Asia', 'Sub Saharan Africa', 'Eastern Asia & Pacific', 'Middle East and North Africa')
;
*/

/* CREATING BY INCOME GROUP TABLE*/
create table `average_education_index_by_income_group`
as (
select `Income Group`,
round(avg(`Total`),2) as Total,
round(avg(`Residence Rural`),2) as `Residence Rural`,
round(avg(`Residence Urban`),2) as `Residence Urban`,
round(avg(`Wealth quintile Poorest`),2) as `Wealth quintile Poorest`,
round(avg(`Wealth quintile Richest`),2) as`Wealth quintile Richest`
from primary_education_clean
group by `Income Group`
order by `Total`
)
;

/* CREATING BY YEAR TABLE */
create table `average_education_index_by_year`
as (
select `Time period`,
count(`Time period`) as `Amount of data per year`,
round(avg(`Total`),2) as Total,
round(avg(`Residence Rural`),2) as `Residence Rural`,
round(avg(`Residence Urban`),2) as `Residence Urban`,
round(avg(`Wealth quintile Poorest`),2) as `Wealth quintile Poorest`,
round(avg(`Wealth quintile Richest`),2) as`Wealth quintile Richest`
from primary_education_clean
group by `Time period`
order by `Time period`
)
;



