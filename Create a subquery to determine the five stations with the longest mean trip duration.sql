# Create a subquery to determine the five stations with the longest mean trip duration
/*creating a query that will filter data to include only the trips from the five stations with the longest mean trip duration*/

SELECT 
  tripduration,
  start_station_id
from bigquery-public-data.new_york_citibike.citibike_trips
where start_station_id IN
  (
    SELECT
        start_station_id
    FROM
    (
      SELECT
        start_station_id,
        AVG(tripduration) AS avg_duration
      FROM bigquery-public-data.new_york_citibike.citibike_trips
      GROUP BY start_station_id
    ) AS top_five
    ORDER BY avg_duration DESC
    LIMIT 5
  );