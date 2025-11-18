create database agri;
use agri;
SELECT * FROM agri_data;

#1.Year-wise Rice Production Trend for Top 3 States
SELECT year, state_name, Rice_Production
FROM ( 
		SELECT year, state_name, SUM(rice_production_1000_tons) AS Rice_Production,
		RANK() OVER (PARTITION BY year ORDER BY SUM(rice_production_1000_tons) DESC) AS rnk
        FROM agri_data GROUP BY year, state_name
        ) ranked
WHERE 
    rnk <= 3
ORDER BY 
    year, Rice_Production DESC;
    
   #2.Top 5 Districts by Wheat Yield Increase Over the Last 5 Years
select dist_name,
(sum(if(year=(select max(year) from agri_data), wheat_yield_kg_per_ha, null)) -
 sum(if(year=(select max(year)-4 from agri_data), wheat_yield_kg_per_ha, null))) as yield_increase
from agri_data
group by dist_name
order by yield_increase desc
limit 5;

#3.States with the highest growth in oilseed production (5-year growth rate)
set @current_year = (select max(year) from agri_data);
set @ago_5 = @current_year - 4;

select state_name,
sum(if(year=@current_year, oilseeds_production_1000_tons, 0)) as current_year,
sum(if(year=@ago_5, oilseeds_production_1000_tons, 0)) as five_year_ago,
round(((sum(if(year=@current_year, oilseeds_production_1000_tons, 0)) -
        sum(if(year=@ago_5, oilseeds_production_1000_tons, 0))) /
        sum(if(year=@ago_5, oilseeds_production_1000_tons, 0)) ) * 100, 2) as growth_rate
from agri_data
group by state_name
order by growth_rate desc
limit 5;

# 4.District-wise correlation between area and production
select dist_name, rice_area_1000_ha, rice_production_1000_tons, rice_yield_kg_per_ha,
wheat_area_1000_ha, wheat_production_1000_tons, wheat_yield_kg_per_ha,
maize_area_1000_ha, maize_production_1000_tons, maize_yield_kg_per_ha
from agri_data;

# 5.Yearly production growth of cotton in top 5 producing states
select a.state_name, a.year, sum(a.cotton_production_1000_tons) as cotton_production,
sum(a.cotton_production_1000_tons)-lag(sum(a.cotton_production_1000_tons)) over(partition by a.state_name order by a.year) as growth_rate
from agri_data a
join(
select state_name from agri_data
group by state_name
order by sum(cotton_production_1000_tons) desc
limit 5) t
on a.state_name = t.state_name
group by a.state_name, a.year
order by a.state_name, a.year;

# 6.Districts with the highest groundnut production in 2017
select dist_name, sum(groundnut_production_1000_tons) as groundnut_production
from agri_data
where year = 2017
group by dist_name
order by groundnut_production desc
limit 7;

# 7.Annual average maize yield across all states
select year, round(avg(maize_yield_kg_per_ha),2) as avg_maize_yield
from agri_data
group by year
order by year;

#8.Total area cultivated for oilseeds in each state
select state_name, sum(oilseeds_area_1000_ha) as total_oilseeds_area
from agri_data
group by state_name
order by total_oilseeds_area desc;

# 9.Districts with the highest rice yield
select dist_name, avg(rice_yield_kg_per_ha) as rice_yield
from agri_data
group by dist_name
order by rice_yield desc
limit 10;

# 10.Compare wheat & rice production for top 5 states over 10 years
select a.year, a.state_name, sum(a.rice_production_1000_tons) as rice_prod, sum(a.wheat_production_1000_tons) as wheat_prod from agri_data a 
join(select state_name, sum(rice_production_1000_tons) + sum(wheat_production_1000_tons) as total from agri_data 
where year between (select max(year) - 9 from agri_data) and (select max(year) from agri_data) group by state_name order by total desc limit 5) t
on a.state_name = t.state_name 
where a.year between (select max(year) - 9 from agri_data) and (select max(year) from agri_data)
group by a.year, a.state_name 
ORDER BY a.year, wheat_prod desc;
