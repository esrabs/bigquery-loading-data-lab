CREATE TABLE nyctaxi.january_trips AS
SELECT *
FROM nyctaxi.2018trips
WHERE EXTRACT(MONTH FROM pickup_datetime) = 1;
