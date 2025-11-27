SELECT 
  start_station_id,
  tripduration,
  AVG(tripduration) OVER (PARTITION BY start_station_id) AS avg_tripduration
FROM `bigquery-public-data.new_york_citibike.citibike_trips` LIMIT 5000;
