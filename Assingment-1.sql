#23 airplanes with listed speeds
SELECT count(speed)
from planes
where speed is not NULL;


#minimum listed speed is 90
SELECT MIN(speed)
from planes
where speed is not NULL;

#maximum listed speed is 432
SELECT MAX(speed)
from planes
where speed is not NULL;


#Total distance by all planes in january 2013 '2501370060'
SELECT SUM(distance)
from flights
inner join planes
ON planes.year = flights.year
Where flights.month = '1' and flights.year = '2013';

#Total distance by all planes in january 2013 with missinf tailnum is '7522196'
SELECT SUM(distance)
from flights
inner join planes
ON planes.year = flights.year
Where flights.month = '1' and flights.year = '2013' and flights.tailnum = '';


#Total distance by planes flown on July 5 2013 grouped by manufacturer using inner join
SELECT SUM(distance), manufacturer
from flights
inner join planes on flights.year = planes.year
where flights.month = '7' and flights.day = '5' and flights.year ='2013'
GROUP by manufacturer;


#Total distance by planes  flown on July 5 2013 grouped by manufacturer using outer left join, difference is that columns are switched.
SELECT manufacturer, SUM(distance)
from flights
LEFT OUTER join planes on flights.year = planes.year
where flights.month = '7' and flights.day = '5' and flights.year ='2013'
GROUP by planes.manufacturer;

#Which airport had the most arr_delays in 2013?
SELECT MAX(arr_delay)
from flights
LEFT join airports on flights.year = airports.year 
where flights.year = '2013'
GROUP by airports.name;




