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

-- 1 All rows where Elvis Presley had a song on the top 100 charts

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE 'Elvis Presley'

-- 2 All rows where the artist's name contained "Tony" (not case sensitive)

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE '%Tony%'


-- 3. All rows where the song title contained the word "love" in any way

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE song_name ILIKE '%love%'

-- 4. All rows where the artist's name begins with the letter "A"

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE 'A%'

-- 5. The top 3 songs from each year between 1960-1969

SELECT song_name
FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1960 AND 1969 AND year_rank <= 3

-- 6. All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Elvis Presley' OR  artist = 'Rolling Stones' OR artist = 'Van Halen'

-- 7. All rows from 1970 where the songs were ranked 10-20th

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank BETWEEN 10 AND 20 AND year >= 1970

-- 8. All rows from the 1990's where Madonna was not ranked > 50th

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1990 AND 1999 AND (year_rank < 50 OR artist != 'Madonna')

-- 9. All rows from 1985 which do not include Madonna or Phil Collins in the group.

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 1985 AND  
("group" NOT ILIKE '%Madonna%' AND "group" NOT ILIKE '%Phil Collins%')

-- 10. All number 1 songs in the data set.

SELECT song_name
FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1

-- 11. All rows where the artist is not listed

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IS NULL

-- 12. All of Madonna's top 100 hits ordered by their ranking (1 to 100)

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna' 
ORDER BY year_rank

-- 13. All of Madonna's top 100 hits ordered by their ranking within each year

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
ORDER BY year, year_rank

-- 14. Every number 1 song since 1990 followed by every number 2 song and number 3 song.

SELECT DISTINCT song_name
FROM
    (SELECT song_name
    FROM tutorial.billboard_top_100_year_end
    WHERE (year >= 1990 AND year_rank = 1) OR year_rank = 2 OR year_rank = 3
    ORDER BY year_rank, year) AS T
