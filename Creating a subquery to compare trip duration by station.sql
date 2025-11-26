/*a subquery is a query that is nested inside of another query
the subquery filters or sorts data to prepare it to be used by the outher query to produce its final result*/

#  compare trip duration by station

SELECT 
  starttime,
  start_station_id,
  tripduration,
  (
   SELECT ROUND(AVG(tripduration),2)
   FROM bigquery-public-data.new_york_citibike.citibike_trips
   WHERE start_station_id = outer_trips.start_station_id
  ) AS avg_duration_for_station,
  ROUND(tripduration - (
    select avg(tripduration)
    from bigquery-public-data.new_york_citibike.citibike_trips
    where start_station_id = outer_trips.start_station_id),2) AS difference_from_avg
  FROM
    bigquery-public-data.new_york_citibike.citibike_trips AS outer_trips
  ORDER BY difference_from_avg DESC
  LIMIT 25;

