-- 1 10 results with information on all columns

SELECT *
FROM tutorial.us_housing_units
LIMIT 10

-- 2 Housing starts in the Midwest

SELECT midwest
FROM tutorial.us_housing_units

-- 3 All housing starts in December since 1985

SELECT *
FROM tutorial.us_housing_units
WHERE month = 12 AND year >= 1985

-- 4 All housing starts in the second half of the year since 1990

SELECT *
FROM tutorial.us_housing_units
WHERE month > 6 AND year >= 1990

-- 5 All rows where housing starts were above 30,000 in the South region

SELECT *
FROM tutorial.us_housing_units
WHERE south > 30

-- 6 The sum of all housing starts in the full data set

SELECT sum(midwest) + sum(northeast) + sum(south) + sum(west)
FROM tutorial.us_housing_units

-- 7 All rows where the sum of all housing starts is above 70,000

SELECT *
FROM tutorial.us_housing_units
WHERE (midwest + northeast + south + west) > 70

-- 8 All rows where the sum of all housing starts is between 50-80k

SELECT *
FROM tutorial.us_housing_units
WHERE (midwest + northeast + south + west) BETWEEN 50 AND 80

-- 9 The average of all housing starts across all regions for each row

SELECT (midwest + northeast + south + west)/4
FROM tutorial.us_housing_units

-- 10 All rows where the housing starts in the South are above the sum of the other three regions

SELECT *
FROM tutorial.us_housing_units
WHERE south > (midwest + northeast + west)

-- 11 The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately

SELECT (sum(south)/(sum(south) + sum(northeast) + sum(west) + sum(midwest)))*100 AS percent_south,
       (sum(west)/(sum(south) + sum(northeast) + sum(west) + sum(midwest)))*100 AS percent_west,
       (sum(midwest)/(sum(south) + sum(northeast) + sum(west) + sum(midwest)))*100 AS percent_midwest,
       (sum(northeast)/(sum(south) + sum(northeast) + sum(west) + sum(midwest)))*100 AS percent_northeast
FROM tutorial.us_housing_units
WHERE year >= 1990

-- tutorial.billboard_top_100_year_end

-- 1

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE 'Elvis Presley'

-- 2


