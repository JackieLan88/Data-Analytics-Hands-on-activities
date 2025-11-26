/*a subquery is a query that is nested inside of another query
the subquery filters or sorts data to prepare it to be used by the outher query to produce its final result*/


#average trip duration by station,
SELECT # outer query
  subquery.start_station_id,
  subquery.avg_duration
FROM
  (
    SELECT # subquery
        start_station_id,
        AVG(tripduration) AS avg_duration
    FROM bigquery-public-data.new_york_citibike.citibike_trips
    GROUP BY start_station_id
  ) AS subquery
  ORDER BY start_station_id DESC
