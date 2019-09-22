use labor_sql;
#-1
SELECT * FROM printer ORDER BY price DESC;

#-2
SELECT * FROM ships where name rlike 'e{2}';

#-3
SELECT product.model, product.maker FROM product, printer WHERE product.model=printer.model and
printer.price > 300;

#-4
SELECT classes.country, classes.class FROM classes, ships WHERE classes.class=ships.class  and
classes.country='USA' ;

#-5
SELECT product.maker FROM product, pc WHERE pc.model=product.model and 
pc.speed > 750;

#-6
SELECT outcomes.ship, outcomes.battle, outcomes.result,
CASE outcomes.result
WHEN 'sunk' THEN 'затонув'
WHEN 'damaged' THEN 'пошкоджені'
WHEN 'OK' THEN 'добре'
END AS result FROM outcomes;

#-7
SELECT product.maker, printer.price FROM  product, printer WHERE printer.model=product.model 
ORDER BY printer.price ASC
LIMIT 3;

#-8
SELECT product.maker, MAX(pc.price) AS 'price' FROM product, pc WHERE pc.model=product.model AND product.type='PC'
GROUP BY product.maker ORDER BY product.maker;

#-9
select point, date, SUM(inc) as 'inc', SUM(outing) as 'outing' from (
SELECT Income.point, Income.date, SUM(Income.inc) AS 'inc', 0 AS 'outing' From Income
GROUP BY Income.point, Income.date
UNION 
SELECT  Outcome.point, Outcome.date, 0 AS 'inc' , SUM(Outcome.out) AS 'outing' From Outcome
GROUP BY Outcome.point, Outcome.date) as selecting
group by point, date
ORDER BY date, point;

#-10
SELECT product.type, product.model, MAX(selecting.price) FROM product,
(SELECT pc.model, pc.price FROM pc
UNION
SELECT printer.model, printer.price FROM printer
UNION 
SELECT laptop.model, laptop.price FROM laptop) AS selecting
WHERE product.model=selecting.model
GROUP BY type, model
ORDER BY type, model






