-- 1.A
CREATE or REPLACE FUNCTION incrm(x INTEGER)
RETURNS INTEGER AS
    $$
        BEGIN
        RETURN $1 + 1;
    END;
    $$
LANGUAGE 'plpgsql';

-- 1.B
CREATE OR REPLACE FUNCTION suum(INTEGER, INTEGER)
RETURNS INTEGER AS
    $$
        BEGIN
            RETURN $1 + $2;
        END
    $$
LANGUAGE 'plpgsql';

-- 1.C
CREATE OR replace FUNCTION div2(x INTEGER)
RETURNS boolean AS
    $$
        BEGIN
            if x % 2 == 0 THEN
                RETURN TRUE;
            ELSE
                RETURN FALSE;
            END if;
        END;

    $$
LANGUAGE 'plpgsql';

-- 1. D
CREATE OR replace FUNCTION passw(x text)
RETURNS boolean AS
    $$
        BEGIN
            if LENGTH(x) >= 8 AND LENGTH(x) <= 15 THEN RETURN TRUE;
            ELSE RETURN FALSE;
            END if;
        END;
    $$
LANGUAGE 'plpgsql';

-- 1. E
CREATE FUNCTION two_out(a INTEGER, OUT a_plus INTEGER, OUT a_minus INTEGER) AS
    $$
    BEGIN
        a_plus = a + 1;
        a_minus = a - 1;
    END;
    $$
    LANGUAGE 'plpgsql';
SELECT * FROM two_out(1);

-- 2
CREATE TABLE people(
    id INTEGER PRIMARY KEY,
    age INT,
    name TEXT,
    birthday DATE,
    today DATE DEFAULT now()
);

-- 2. А
CREATE OR REPLACE FUNCTION timest()
RETURNS TRIGGER AS
    $$
        BEGIN
            if(name != NEW.name) THEN NEW.today = CURRENT_DATE;
            END if;
            RETURN NEW;
        END;
    $$
LANGUAGE 'plpgsql';

INSERT INTO people(id, name) VALUES (1, 'Yerkin');
UPDATE people SET name = 'Yerka' WHERE name = 'Yerkin';

CREATE TRIGGER today_1
    BEFORE UPDATE
    ON people
    FOR EACH ROW
    EXECUTE PROCEDURE timest();

-- 2. B
INSERT INTO people(id, name, birthday) VALUES (11, 'Yerka', '18-09-2003');
CREATE OR replace FUNCTION age()
RETURNS TRIGGER AS
    $$
        BEGIN
            UPDATE people
            SET age = round((current_date-NEW.birthday) / 365.25)
            WHERE id = NEW.id;
            RETURN NEW;
END;
    $$
LANGUAGE 'plpgsql';
CREATE TRIGGER neewagee AFTER INSERT ON people
    FOR EACH ROW EXECUTE PROCEDURE age();

-- 2. C
CREATE TABLE product(
    id INTEGER PRIMARY KEY,
    name_of_prod VARCHAR(80),
    price INTEGER
);

CREATE OR replace FUNCTION pricee()
RETURNS TRIGGER AS
    $$
        BEGIN
            UPDATE product
            SET price = price + 0.12 * price
            WHERE id = NEW.id;
            RETURN NEW;
        END;
    $$
LANGUAGE 'plpgsql';

CREATE TRIGGER cost AFTER INSERT ON product
    FOR EACH ROW EXECUTE PROCEDURE pricee();
INSERT INTO product(id, name_of_prod, price) VALUES(1, 'milk', 200);

INSERT INTO product(id, name_of_prod, price) VALUES(3, 'cheese', 223);

-- 2. D
CREATE OR replace FUNCTION stop_del() RETURNS TRIGGER LANGUAGE plpgsql
    AS $$
    BEGIN
        INSERT INTO product(id, name_of_prod, price) VALUES(OLD.id, OLD.name, OLD.price);
        RETURN OLD;
    END;
    $$;

CREATE TRIGGER del_changes
    AFTER DELETE
    ON product
    FOR EACH ROW
    EXECUTE PROCEDURE stop_del();
DELETE FROM product WHERE id = 2;
SELECT * FROM product;

-- 2. E????

-- 3
/*
What is the difference between procedure and function?
Differences between Stored Procedure and Function in SQL Server.
The procedure allows SELECT as well as DML(INSERT/UPDATE/DELETE)
statement in it whereas Function allows only SELECT statement in it.
Procedures cannot be utilized in a SELECT statement whereas Function
can be embedded in a SELECT statement.
 */

-- 4
CREATE TABLE employee(
    salary INT,
    id INT PRIMARY KEY,
    name VARCHAR(120),
    birthday DATE,
    exp INT,
    discount INT,
    age INT
);

-- 4. A
CREATE OR replace PROCEDURE salary() AS
$$
    BEGIN
        UPDATE employee
        SET salary = (exp / 2) * 0.1 * salary + salary,
            discount = (exp / 2) * 0.1 * employee.discount + employee.discount,
            discount = (exp / 5) * 0.01 * employee.discount + employee.discount;
        COMMIT;
    END;
    $$
LANGUAGE 'plpgsql';
-- 4. B
CREATE OR replace PROCEDURE sallarry() AS
    $$
        BEGIN
            UPDATE employee
            SET salary = salary*1.15
            WHERE age >= 40;
            UPDATE employee
            SET salary = salary * 1.15 * (exp / 8);
            UPDATE employee
            SET discount = 20 WHERE exp >= 8;
            COMMIT;
        END;
    $$
LANGUAGE 'plpgsql';

-- 5
CREATE TABLE members(
    memid INTEGER,
    surname VARCHAR(200),
    firstname VARCHAR(200),
    address VARCHAR(300),
    zipcode INTEGER,
    telephone VARCHAR(20),
    recommendedby INTEGER,
    joindate TIMESTAMP
);
CREATE TABLE bookings(
    facid INTEGER,
    memid INTEGER,
    starttime TIMESTAMP,
    slots INTEGER
);
CREATE TABLE facilities(
    facid INTEGER,
    name VARCHAR(200),
    membercost NUMERIC,
    guestcost NUMERIC,
    initialoutlay NUMERIC,
    monthlymaintenance NUMERIC
);
WITH RECURSIVE recommenders(recommender, member) AS(
	SELECT recommendedby, memid
		FROM members
	UNION ALL
	SELECT mems.recommendedby, recs.member
		FROM recommenders recs
		INNER JOIN members mems
			ON mems.memid = recs.recommender
)
SELECT recs.member member, recs.recommender, mems.firstname, mems.surname
	FROM recommenders recs
	INNER JOIN members mems
		ON recs.recommender = mems.memid
	WHERE recs.member = 22 OR recs.member = 12
ORDER BY recs.member ASC, recs.recommender DESC