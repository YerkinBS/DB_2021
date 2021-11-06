-- 1. A
SELECT * FROM dealer CROSS JOIN client;

-- 1. B
SELECT c.name as client,c.city,c.priority,d.name as dealer ,s.id,s.date,s.amount
FROM client c RIGHT OUTER JOIN dealer d ON c.dealer_id=d.id
     RIGHT OUTER JOIN sell s ON s.client_id = c.id;

-- 1. C
SELECT dealer.id, dealer.name,client.id,client.name,client.city
FROM dealer CROSS JOIN client
WHERE dealer.location=client.city;

-- 1. D
SELECT sell.id,amount,client.name,client.city
FROM sell,client
WHERE sell.client_id=client.id AND sell.amount BETWEEN 100 AND 500;

-- 1. E
SELECT d.id, d.name, count(c.id) as num
FROM dealer d LEFT OUTER JOIN client c
ON d.id = c.dealer_id
GROUP BY d.id, d.name;

-- 1. F
SELECT client.name,client.city,dealer.name, dealer.charge as "commission"
FROM dealer INNER JOIN client
ON dealer.id = client.dealer_id;

-- 1. G
SELECT client.name,client.city,dealer.name, dealer.charge as "commission"
FROM dealer,client
WHERE dealer.id = client.dealer_id AND dealer.charge*100>12;

-- 1. H
SELECT c.name, c.city,s.id,s.date,s.amount,d.name,d.charge 
FROM client c LEFT OUTER JOIN sell s ON c.id = s.client_id
    LEFT OUTER JOIN dealer d on d.id = s.dealer_id;

-- 1. I
SELECT c.name, c.priority,d.name,s.id,s.amount
FROM client c RIGHT OUTER JOIN dealer d ON d.id=c.dealer_id
    LEFT OUTER JOIN sell s ON s.client_id= c.id
WHERE s.amount>=2000 AND c.priority IS NOT NULL;

-- 2. A
CREATE TEMP VIEW by_date AS
    SELECT date,count(DISTINCT client_id) clients,sum(amount) AS total,avg(amount)
    FROM sell
    GROUP BY date;

SELECT * from by_date;
DROP VIEW by_date;

-- 2. B
CREATE TEMP VIEW top5 AS
    SELECT *
    FROM by_date
    ORDER BY total DESC
    LIMIT 5;
SELECT * FROM top5;
DROP VIEW top5;

-- 2. C
CREATE VIEW dealers AS
    SELECT d.id,d.name,count(DISTINCT s.id),sum(s.amount),avg(s.amount)
    FROM dealer d INNER JOIN sell s ON d.id = s.dealer_id
    GROUP BY d.id, d.name;

SELECT * FROM dealers;

-- 2. D
CREATE VIEW d1 AS --Each location made on their dealers on charge
    SELECT location,SUM(charge*amount)
    FROM dealer d LEFT JOIN sell s ON d.id = s.dealer_id
    GROUP BY location;

-- 2. E
CREATE VIEW e1 AS --Each location made on their dealers
    SELECT location,count(DISTINCT s.id),SUM(amount) as sales,AVG(amount)
    FROM dealer d LEFT JOIN sell s ON d.id = s.dealer_id
    GROUP BY location;

-- 2. F
CREATE VIEW f1 AS --Each city made on their citizens
    SELECT city,count(s.id),SUM(amount) as expenses,AVG(amount)
    FROM client c LEFT OUTER JOIN sell s ON s.client_id=c.id
    GROUP BY city;

DROP VIEW f1;

-- 2. G
CREATE VIEW comp AS
SELECT location as "Продавец",city as "Потребитель",sales as "Доход", expenses as "Расход"
FROM e1 FULL OUTER JOIN f1 ON location=city
WHERE expenses>sales or sales is NULL or sales=0;

SELECT * FROM comp;
DROP VIEW comp;