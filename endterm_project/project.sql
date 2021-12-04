CREATE TABLE purchase(
    id INT PRIMARY KEY,
    total_price VARCHAR(60),
    purchase_date DATE,
    purchase_weight INT,
    courier_id INT,
    late_delivery BOOL
);

CREATE TABLE tracking_delivery(
    id INT PRIMARY KEY,
    purchase_id INT,
    location VARCHAR(100),
    status DATE,
    days_left INT,
    transport VARCHAR(100),
    FOREIGN KEY(purchase_id) REFERENCES purchase(id)
);

CREATE TABLE client(
    id INT PRIMARY KEY,
    age INT,
    phone_number VARCHAR(100),
    debit_card VARCHAR(100),
    email VARCHAR(100),
    purchase_id INT,
    FOREIGN KEY(purchase_id) REFERENCES purchase(id)
);

CREATE TABLE client_address(
    client_id INTEGER REFERENCES client(id) PRIMARY KEY,
    postal_code INT,
    country VARCHAR(60),
    city VARCHAR(60),
    street_name VARCHAR(60),
    street_num INT
);

CREATE TABLE client_name(
    client_id INTEGER REFERENCES client(id) PRIMARY KEY,
    first_name VARCHAR(60),
    last_name VARCHAR(60)
);

CREATE TABLE courier(
    id INT PRIMARY KEY,
    email VARCHAR(100),
    age INT,
    door_to_door_delivery BOOL,
    phone_number VARCHAR(100),
    rating INT,
    purchase_id INT,
    FOREIGN KEY(purchase_id) REFERENCES purchase(id)
);

CREATE TABLE courier_name(
    courier_id INTEGER REFERENCES courier(id) PRIMARY KEY,
    first_name VARCHAR(60),
    last_name VARCHAR(60)
);

CREATE TABLE courier_address(
    courier_id INTEGER REFERENCES courier(id) PRIMARY KEY,
    country VARCHAR(60),
    city VARCHAR(60),
    street_name VARCHAR(60),
    street_num INT
);

CREATE TABLE company(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    avg_price INT,
    refund_exchange BOOL
);

CREATE TABLE company_location(
    company_id INT REFERENCES company(id) PRIMARY KEY,
    country VARCHAR(60),
    city VARCHAR(60),
    street_name VARCHAR(60),
    street_num INT
);

CREATE TABLE product(
    id INT PRIMARY KEY,
    cost VARCHAR(100),
    weight INT,
    company_id INT,
    client_id INT,
    purchase_id INT,
    FOREIGN KEY(company_id) REFERENCES company(id),
    FOREIGN KEY(client_id) REFERENCES client(id),
    FOREIGN KEY(purchase_id) REFERENCES purchase(id)
);

CREATE TABLE product_size(
    product_id INTEGER REFERENCES product(id) PRIMARY KEY,
    height INT,
    width INT,
    depth INT
);

CREATE TABLE transport(
    id INT PRIMARY KEY,
    mark VARCHAR(100),
    is_crashed BOOL,
    crash_date DATE,
    purchase_id INT,
    tracking_id INT,
    FOREIGN KEY(purchase_id) REFERENCES purchase(id),
    FOREIGN KEY(tracking_id) REFERENCES tracking_delivery(id)
);

insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (1, '$3194.09', '2021-07-06 10:09:31', 233, 11, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (2, '$190.50', '2021-08-30 04:58:00', 27, 15, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (3, '$5472.13', '2020-12-06 16:27:11', 45, 4, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (4, '$1332.41', '2021-02-02 01:20:09', 38, 15, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (5, '$1724.47', '2021-02-19 02:34:42', 33, 12, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (6, '$8013.19', '2021-04-19 17:28:20', 927, 5, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (7, '$6250.21', '2021-10-17 10:40:31', 559, 9, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (8, '$1579.26', '2021-08-05 06:30:17', 221, 15, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (9, '$2222.18', '2021-04-16 12:57:02', 353, 9, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (10, '$4376.29', '2021-10-20 17:05:38', 51, 14, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (11, '$932.03', '2021-06-14 00:07:48', 395, 6, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (12, '$7660.71', '2021-04-13 07:15:18', 755, 14, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (13, '$566.95', '2021-09-25 21:49:16', 54, 5, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (14, '$9117.48', '2021-06-25 02:16:29', 186, 9, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (15, '$7706.03', '2021-06-03 08:50:05', 771, 7, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (16, '$4046.13', '2021-08-14 09:25:55', 678, 9, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (17, '$1699.19', '2021-08-14 18:27:23', 353, 13, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (18, '$9290.68', '2021-05-18 01:48:32', 646, 11, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (19, '$3281.85', '2021-09-28 06:30:50', 510, 1, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (20, '$8213.86', '2020-12-04 23:46:36', 624, 5, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (21, '$2614.74', '2021-06-21 00:20:25', 765, 8, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (22, '$9412.51', '2021-02-06 05:20:38', 41, 9, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (23, '$9041.31', '2021-09-30 21:03:33', 595, 8, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (24, '$127.26', '2021-10-01 21:10:35', 179, 4, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (25, '$7575.38', '2021-05-12 21:02:03', 979, 12, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (26, '$3001.98', '2021-06-16 19:30:15', 778, 9, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (27, '$6658.03', '2020-12-05 02:48:13', 288, 15, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (28, '$294.83', '2021-08-08 01:28:13', 139, 13, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (29, '$7822.15', '2020-12-31 23:32:28', 16, 10, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (30, '$4609.22', '2021-09-22 05:33:56', 93, 6, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (31, '$6607.98', '2021-02-25 22:25:48', 365, 14, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (32, '$8470.71', '2021-08-13 04:01:45', 460, 14, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (33, '$497.75', '2021-05-23 21:47:15', 737, 2, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (34, '$2263.98', '2021-11-13 04:27:35', 993, 5, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (35, '$7023.81', '2021-01-28 12:23:46', 673, 14, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (36, '$9889.21', '2021-05-17 17:08:04', 516, 3, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (37, '$1348.62', '2021-05-18 01:15:38', 777, 2, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (38, '$8501.86', '2021-08-21 19:02:04', 15, 8, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (39, '$1411.20', '2021-07-24 16:25:42', 427, 5, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (40, '$9587.63', '2021-10-21 08:16:05', 296, 9, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (41, '$9632.44', '2021-01-22 05:10:08', 513, 11, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (42, '$2557.02', '2021-05-21 02:15:41', 315, 3, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (43, '$2585.84', '2021-02-01 20:04:18', 797, 7, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (44, '$6649.86', '2020-12-16 12:10:39', 437, 9, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (45, '$9944.14', '2021-04-28 02:29:10', 569, 15, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (46, '$3320.02', '2021-10-10 01:05:23', 467, 11, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (47, '$3515.47', '2021-11-19 20:21:23', 163, 4, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (48, '$7079.87', '2021-09-29 08:22:57', 101, 11, false);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (49, '$3105.36', '2021-06-07 10:43:34', 838, 13, true);
insert into purchase (id, total_price, purchase_date, purchase_weight, courier_id, late_delivery) values (50, '$5106.67', '2021-02-05 20:15:13', 631, 8, false);

insert into client (id, age, phone_number, debit_card, email, purchase_id) values (1, 22, '+51 885 728 2496', 'diners-club-enroute', 'rgreenrde0@wunderground.com', 1);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (2, 63, '+86 408 594 2884', 'jcb', 'gdoud1@about.me', 2);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (3, 62, '+54 605 119 1685', 'diners-club-carte-blanche', 'meyrl2@wikia.com', 3);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (4, 21, '+7 528 954 2963', 'jcb', 'zdeverill3@nymag.com', 4);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (5, 54, '+595 975 341 0299', 'switch', 'marderne4@vimeo.com', 5);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (6, 82, '+7 338 692 6610', 'americanexpress', 'pskeel5@telegraph.co.uk', 6);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (7, 56, '+218 457 541 0778', 'jcb', 'rsiemons6@marriott.com', 7);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (8, 95, '+86 546 825 3764', 'maestro', 'tingerson7@howstuffworks.com', 8);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (9, 36, '+267 298 396 6060', 'diners-club-enroute', 'sbedminster8@adobe.com', 9);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (10, 91, '+371 853 263 7794', 'laser', 'bmuckart9@lycos.com', 10);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (11, 57, '+992 583 658 1858', 'americanexpress', 'glaughtona@paginegialle.it', 11);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (12, 31, '+33 859 351 8122', 'jcb', 'cpoterb@bandcamp.com', 12);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (13, 74, '+62 276 961 1442', 'maestro', 'jlempertzc@people.com.cn', 13);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (14, 83, '+62 147 845 8488', 'instapayment', 'amcquilkind@prlog.org', 14);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (15, 17, '+351 438 301 6282', 'switch', 'aiansone@shareasale.com', 15);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (16, 21, '+62 409 294 6159', 'jcb', 'lcoplandf@marriott.com', 16);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (17, 85, '+33 286 837 2677', 'jcb', 'abrazenorg@plala.or.jp', 17);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (18, 95, '+86 808 758 0379', 'laser', 'fbeateyh@eepurl.com', 18);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (19, 91, '+234 595 401 4778', 'jcb', 'wziemeckii@themeforest.net', 19);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (20, 85, '+1 789 526 0068', 'switch', 'rewerj@google.com.br', 20);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (21, 91, '+86 324 650 9730', 'jcb', 'mzannellik@independent.co.uk', 21);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (22, 83, '+62 567 293 5366', 'jcb', 'kmacdonnelll@desdev.cn', 22);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (23, 16, '+371 205 904 1056', 'diners-club-enroute', 'flarkinm@seesaa.net', 23);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (24, 75, '+86 855 958 2030', 'china-unionpay', 'nmecon@ebay.co.uk', 24);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (25, 93, '+86 608 377 4217', 'jcb', 'lwyldero@simplemachines.org', 25);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (26, 93, '+30 611 905 3829', 'visa', 'acorbishleyp@blogs.com', 26);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (27, 99, '+54 807 289 1263', 'laser', 'jtillertonq@pbs.org', 27);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (28, 82, '+62 999 794 5383', 'mastercard', 'rfitchetr@g.co', 28);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (29, 73, '+86 733 854 1755', 'china-unionpay', 'abalmas@foxnews.com', 29);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (30, 50, '+63 549 114 3396', 'mastercard', 'mwardinglyt@foxnews.com', 30);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (31, 30, '+86 469 939 5276', 'visa-electron', 'tkrikorianu@sfgate.com', 31);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (32, 21, '+86 913 838 0168', 'jcb', 'gennorv@wsj.com', 32);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (33, 28, '+46 444 395 3620', 'bankcard', 'sfydoew@umn.edu', 33);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (34, 99, '+33 540 648 3504', 'maestro', 'mhinkensenx@ovh.net', 34);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (35, 35, '+86 600 639 9894', 'visa-electron', 'agilbertsony@umich.edu', 35);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (36, 53, '+57 109 926 3286', 'jcb', 'fkeavesz@prlog.org', 36);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (37, 60, '+255 773 365 5462', 'bankcard', 'gpetford10@whitehouse.gov', 37);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (38, 15, '+62 832 681 9375', 'laser', 'ecaig11@mysql.com', 38);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (39, 65, '+62 405 155 6827', 'jcb', 'afaunch12@feedburner.com', 39);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (40, 80, '+48 804 575 9817', 'china-unionpay', 'szuanazzi13@nih.gov', 40);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (41, 31, '+55 451 350 6514', 'visa', 'kserrier14@ibm.com', 41);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (42, 74, '+351 399 949 8397', 'laser', 'vrougier15@pagesperso-orange.fr', 42);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (43, 56, '+86 632 334 2793', 'diners-club-enroute', 'bshoulders16@google.ca', 43);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (44, 99, '+54 729 855 0975', 'jcb', 'nnorthey17@clickbank.net', 44);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (45, 60, '+351 102 304 6916', 'americanexpress', 'mtydd18@cbsnews.com', 45);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (46, 33, '+27 600 687 3278', 'jcb', 'nbedson19@ocn.ne.jp', 46);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (47, 92, '+60 238 109 0413', 'americanexpress', 'znurse1a@xing.com', 47);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (48, 44, '+55 375 784 2167', 'jcb', 'schurchman1b@1688.com', 48);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (49, 62, '+52 229 565 8445', 'china-unionpay', 'dbergen1c@hexun.com', 49);
insert into client (id, age, phone_number, debit_card, email, purchase_id) values (50, 32, '+48 423 363 4787', 'mastercard', 'mpaddefield1d@github.io', 50);

insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (1, 77, 'Brazil', 'Sidrolândia', 'Utepova', '0627');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (2, 57, 'Indonesia', 'Cibenda', 'Paget', '07654');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (3, 91, 'El Salvador', 'San Rafael Oriente', 'Sloan', '4161');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (4, 82, 'China', 'Keli', 'Erie', '85883');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (5, 18, 'Indonesia', 'Bofuer', 'Carberry', '022');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (6, 72, 'Portugal', 'Vila Nova', 'Utepova',  '997');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (7, 53, 'China', 'Taojiahe', 'Petterle', '64');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (8, 60, 'Jamaica', 'Hayes', 'Utepova',  '73730');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (9, 89, 'China', 'Dartang', 'Meadow Vale', '224');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (10, 69, 'Philippines', 'Tabango', 'Park Meadow', '00532');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (11, 55, 'Argentina', 'La Viña', 'Westridge', '98');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (12, 17, 'Czech Republic', 'Ludgeřovice', 'Carey', '2886');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (13, 82, 'Mexico', 'Benito Juarez', 'Eagan', '5408');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (14, 79, 'Philippines', 'Maanas', 'Saint Paul', '3693');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (15, 90, 'Ireland', 'Annacotty', 'Larry', '9114');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (16, 6, 'Saudi Arabia', 'Al Muwayh', 'Annamark', '84');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (17, 54, 'South Africa', 'Senekal', '4th', '83209');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (18, 83, 'Honduras', 'Concordia', 'Utepova',  '5234');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (19, 43, 'Japan', 'Namie', 'Fairfield', '865');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (20, 14, 'China', 'Dahongmen', 'Caliangt', '1176');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (21, 18, 'Indonesia', 'Hauhena', 'Utepova', '695');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (22, 64, 'Portugal', 'Canha', 'Transport', '13');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (23, 48, 'Greece', 'Néa Kíos', 'Dunning', '1');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (24, 61, 'China', 'Huanghai', 'Kipling', '832');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (25, 93, 'Albania', 'Lukovë', 'Bobwhite', '5863');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (26, 94, 'China', 'Qianyou', 'Chinook', '077');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (27, 94, 'Kazakhstan', 'Sayaq', 'Scott', '7052');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (28, 57, 'Indonesia', 'Kaulon', 'Anderson', '6570');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (29, 48, 'China', 'Zhaocun', 'Heffernan', '24');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (30, 63, 'Mauritius', 'Providence', 'South', '3');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (31, 2, 'Russia', 'Konobeyevo', '4th', '05');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (32, 75, 'Macedonia', 'Kavadarci', 'Oakridge', '67627');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (33, 13, 'China', 'Yaxi', 'Del Sol', '54');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (34, 6, 'Bulgaria', 'Opaka', 'Summerview', '0924');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (35, 100, 'Philippines', 'Ungus-Ungus', 'Lien', '61789');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (36, 56, 'Canada', 'Labelle', 'Buena Vista', '444');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (37, 21, 'Indonesia', 'Wanasari Baleran', 'Autumn Leaf', '8');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (38, 68, 'Montenegro', 'Plužine', 'Burning Wood', '51');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (39, 20, 'Brazil', 'Ferraz de Vasconcelos', 'Anniversary', '281');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (40, 93, 'China', 'Meilin', 'Brown', '22124');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (41, 67, 'Indonesia', 'Nakajah', 'Sachs', '7');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (42, 6, 'China', 'Jishi', 'Utepova',  '2');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (43, 18, 'Thailand', 'Utepova', 'Tennyson', '64');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (44, 100, 'Indonesia', 'Kostarea Satu', 'Trailsway', '0');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (45, 77, 'Ukraine', 'Prosyana', 'Talisman', '28327');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (46, 24, 'Czech Republic', 'Jevišovice', 'Algoma', '15');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (47, 38, 'Czech Republic', 'Žiželice', 'Marcy', '289');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (48, 12, 'Sweden', 'Luleå', 'Forster', '36957');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (49, 3, 'France', 'Paris 19', 'Summit', '6');
insert into client_address (client_id, postal_code, country, city, street_name, street_num) values (50, 25, 'Sweden', 'Ånge', 'Utepova', '8');

insert into client_name (client_id, first_name, last_name) values (1, 'Casandra', 'Riggey');
insert into client_name (client_id, first_name, last_name) values (2, 'Amelina', 'Dorking');
insert into client_name (client_id, first_name, last_name) values (3, 'Lorilee', 'Dimnage');
insert into client_name (client_id, first_name, last_name) values (4, 'Carny', 'Poultney');
insert into client_name (client_id, first_name, last_name) values (5, 'Norrie', 'Leidl');
insert into client_name (client_id, first_name, last_name) values (6, 'Giulia', 'Peacop');
insert into client_name (client_id, first_name, last_name) values (7, 'Gabriele', 'Conechie');
insert into client_name (client_id, first_name, last_name) values (8, 'Malchy', 'Crips');
insert into client_name (client_id, first_name, last_name) values (9, 'Eugen', 'Ferminger');
insert into client_name (client_id, first_name, last_name) values (10, 'Laureen', 'Marginson');
insert into client_name (client_id, first_name, last_name) values (11, 'Falkner', 'Dries');
insert into client_name (client_id, first_name, last_name) values (12, 'Myrilla', 'Roalfe');
insert into client_name (client_id, first_name, last_name) values (13, 'Myrah', 'Elliston');
insert into client_name (client_id, first_name, last_name) values (14, 'Phaidra', 'Lotherington');
insert into client_name (client_id, first_name, last_name) values (15, 'Gerald', 'McIlmorie');
insert into client_name (client_id, first_name, last_name) values (16, 'Weston', 'Mankor');
insert into client_name (client_id, first_name, last_name) values (17, 'Crystie', 'Gather');
insert into client_name (client_id, first_name, last_name) values (18, 'Gregorio', 'Berthe');
insert into client_name (client_id, first_name, last_name) values (19, 'Carrie', 'Willbraham');
insert into client_name (client_id, first_name, last_name) values (20, 'Richardo', 'Ashwood');
insert into client_name (client_id, first_name, last_name) values (21, 'Mariann', 'Bodleigh');
insert into client_name (client_id, first_name, last_name) values (22, 'Sibel', 'McBain');
insert into client_name (client_id, first_name, last_name) values (23, 'Sargent', 'Garlette');
insert into client_name (client_id, first_name, last_name) values (24, 'Ferrel', 'Jamison');
insert into client_name (client_id, first_name, last_name) values (25, 'Melanie', 'Fullicks');
insert into client_name (client_id, first_name, last_name) values (26, 'Cherri', 'Banghe');
insert into client_name (client_id, first_name, last_name) values (27, 'Brendis', 'Bartram');
insert into client_name (client_id, first_name, last_name) values (28, 'Myrna', 'Packwood');
insert into client_name (client_id, first_name, last_name) values (29, 'Riordan', 'Franzen');
insert into client_name (client_id, first_name, last_name) values (30, 'Pace', 'Dell ''Orto');
insert into client_name (client_id, first_name, last_name) values (31, 'Che', 'Rochelle');
insert into client_name (client_id, first_name, last_name) values (32, 'Allys', 'Happel');
insert into client_name (client_id, first_name, last_name) values (33, 'Valdemar', 'Rubbens');
insert into client_name (client_id, first_name, last_name) values (34, 'Elijah', 'Turneaux');
insert into client_name (client_id, first_name, last_name) values (35, 'Pinchas', 'Pinkie');
insert into client_name (client_id, first_name, last_name) values (36, 'Napoleon', 'Livesley');
insert into client_name (client_id, first_name, last_name) values (37, 'Barbette', 'Kristufek');
insert into client_name (client_id, first_name, last_name) values (38, 'Margarita', 'Coventry');
insert into client_name (client_id, first_name, last_name) values (39, 'Cindy', 'Dodell');
insert into client_name (client_id, first_name, last_name) values (40, 'Lori', 'Davenell');
insert into client_name (client_id, first_name, last_name) values (41, 'Neddy', 'Dufton');
insert into client_name (client_id, first_name, last_name) values (42, 'Grange', 'Maton');
insert into client_name (client_id, first_name, last_name) values (43, 'Arleen', 'Wakeling');
insert into client_name (client_id, first_name, last_name) values (44, 'Jade', 'Breffit');
insert into client_name (client_id, first_name, last_name) values (45, 'Porter', 'Snugg');
insert into client_name (client_id, first_name, last_name) values (46, 'Evangelina', 'Olcot');
insert into client_name (client_id, first_name, last_name) values (47, 'Grayce', 'Medcalf');
insert into client_name (client_id, first_name, last_name) values (48, 'Esmeralda', 'Perrat');
insert into client_name (client_id, first_name, last_name) values (49, 'Pooh', 'Macken');
insert into client_name (client_id, first_name, last_name) values (50, 'Jasmin', 'McDuffy');

insert into company (id, name, avg_price, refund_exchange) values (1, 'Heidenreich and Sons', 628, false);
insert into company (id, name, avg_price, refund_exchange) values (2, 'Abernathy LLC', 2408, true);
insert into company (id, name, avg_price, refund_exchange) values (3, 'Larkin Group', 2131, false);
insert into company (id, name, avg_price, refund_exchange) values (4, 'Gusikowski-Price', 5916, true);
insert into company (id, name, avg_price, refund_exchange) values (5, 'Strosin and Sons', 2775, false);
insert into company (id, name, avg_price, refund_exchange) values (6, 'Rogahn-Hartmann', 8256, false);
insert into company (id, name, avg_price, refund_exchange) values (7, 'Purdy-Watsica', 4348, false);
insert into company (id, name, avg_price, refund_exchange) values (8, 'Koch, Quitzon and Okuneva', 2624, true);
insert into company (id, name, avg_price, refund_exchange) values (9, 'Ritchie, Cassin and Stamm', 9132, false);
insert into company (id, name, avg_price, refund_exchange) values (10, 'Lindgren-Metz', 5309, false);
insert into company (id, name, avg_price, refund_exchange) values (11, 'Effertz LLC', 2753, true);
insert into company (id, name, avg_price, refund_exchange) values (12, 'Lehner, Kuhn and Hartmann', 2302, false);
insert into company (id, name, avg_price, refund_exchange) values (13, 'Batz and Sons', 3747, false);
insert into company (id, name, avg_price, refund_exchange) values (14, 'Wilderman LLC', 7203, false);
insert into company (id, name, avg_price, refund_exchange) values (15, 'Dietrich, Walsh and Kunde', 6414, false);
insert into company (id, name, avg_price, refund_exchange) values (16, 'Will Group', 2778, false);
insert into company (id, name, avg_price, refund_exchange) values (17, 'Kiehn-Hintz', 6656, true);
insert into company (id, name, avg_price, refund_exchange) values (18, 'Bauch Group', 938, false);
insert into company (id, name, avg_price, refund_exchange) values (19, 'Shanahan-Durgan', 5993, false);
insert into company (id, name, avg_price, refund_exchange) values (20, 'Berge, Torphy and Deckow', 219, false);
insert into company (id, name, avg_price, refund_exchange) values (21, 'Cormier, Howe and Davis', 93, false);
insert into company (id, name, avg_price, refund_exchange) values (22, 'Rohan Group', 5992, true);
insert into company (id, name, avg_price, refund_exchange) values (23, 'O''Kon LLC', 6697, true);
insert into company (id, name, avg_price, refund_exchange) values (24, 'Grimes-Spinka', 8727, false);
insert into company (id, name, avg_price, refund_exchange) values (25, 'Sawayn Group', 7248, true);
insert into company (id, name, avg_price, refund_exchange) values (26, 'Kemmer-Hermiston', 46, true);
insert into company (id, name, avg_price, refund_exchange) values (27, 'Reilly, Willms and Russel', 7262, true);
insert into company (id, name, avg_price, refund_exchange) values (28, 'Koch-Wintheiser', 7166, false);
insert into company (id, name, avg_price, refund_exchange) values (29, 'Haag-Lueilwitz', 7285, false);
insert into company (id, name, avg_price, refund_exchange) values (30, 'Collier, Kunde and Keeling', 9299, false);
insert into company (id, name, avg_price, refund_exchange) values (31, 'Will, Harris and Wisozk', 4472, false);
insert into company (id, name, avg_price, refund_exchange) values (32, 'Reichert-Weissnat', 5911, false);
insert into company (id, name, avg_price, refund_exchange) values (33, 'Huel and Sons', 5359, false);
insert into company (id, name, avg_price, refund_exchange) values (34, 'Kautzer, Crooks and Ledner', 9037, true);
insert into company (id, name, avg_price, refund_exchange) values (35, 'Harber-Flatley', 3196, true);
insert into company (id, name, avg_price, refund_exchange) values (36, 'Shields LLC', 4412, false);
insert into company (id, name, avg_price, refund_exchange) values (37, 'Schuster, Maggio and Wunsch', 7493, false);
insert into company (id, name, avg_price, refund_exchange) values (38, 'Osinski-Hagenes', 4512, true);
insert into company (id, name, avg_price, refund_exchange) values (39, 'Baumbach-White', 6054, true);
insert into company (id, name, avg_price, refund_exchange) values (40, 'Kirlin-O''Conner', 8327, false);
insert into company (id, name, avg_price, refund_exchange) values (41, 'Krajcik-Green', 1678, false);
insert into company (id, name, avg_price, refund_exchange) values (42, 'Gleason, Abbott and Erdman', 4868, false);
insert into company (id, name, avg_price, refund_exchange) values (43, 'McKenzie LLC', 2536, false);
insert into company (id, name, avg_price, refund_exchange) values (44, 'Macejkovic, Abernathy and Huel', 4350, true);
insert into company (id, name, avg_price, refund_exchange) values (45, 'Walker LLC', 5394, false);
insert into company (id, name, avg_price, refund_exchange) values (46, 'Okuneva, Rath and Effertz', 644, true);
insert into company (id, name, avg_price, refund_exchange) values (47, 'Hartmann Inc', 4497, false);
insert into company (id, name, avg_price, refund_exchange) values (48, 'Lockman LLC', 9111, true);
insert into company (id, name, avg_price, refund_exchange) values (49, 'West and Sons', 6285, true);
insert into company (id, name, avg_price, refund_exchange) values (50, 'Mills, Leannon and O''Kon', 684, true);

insert into company_location (company_id, country, city, street_name, street_num) values (1, 'Botswana', 'Francistown', 'Del Mar', '0');
insert into company_location (company_id, country, city, street_name, street_num) values (2, 'Benin', 'Parakou', 'Kim', '2');
insert into company_location (company_id, country, city, street_name, street_num) values (3, 'Cuba', 'Cienfuegos', 'Chinook', '02373');
insert into company_location (company_id, country, city, street_name, street_num) values (4, 'Russia', 'Gorodets', 'Tomscot', '91');
insert into company_location (company_id, country, city, street_name, street_num) values (5, 'Ukraine', 'Kamieniec Podolski', 'Magdeline', '1');
insert into company_location (company_id, country, city, street_name, street_num) values (6, 'Lithuania', 'Seda', 'Grover', '9580');
insert into company_location (company_id, country, city, street_name, street_num) values (7, 'Indonesia', 'Taluncemara', 'Springs', '998');
insert into company_location (company_id, country, city, street_name, street_num) values (8, 'Portugal', 'Constance', 'Killdeer', '38');
insert into company_location (company_id, country, city, street_name, street_num) values (9, 'Russia', 'Rodnikovskaya', 'Tennessee', '0');
insert into company_location (company_id, country, city, street_name, street_num) values (10, 'Poland', 'Żabieniec', 'Quincy', '844');
insert into company_location (company_id, country, city, street_name, street_num) values (11, 'Lithuania', 'Žiežmariai', 'Bashford', '38663');
insert into company_location (company_id, country, city, street_name, street_num) values (12, 'Indonesia', 'Banjar Swastika', 'Almo', '7844');
insert into company_location (company_id, country, city, street_name, street_num) values (13, 'Vietnam', 'Cần Giờ', 'Schurz', '3206');
insert into company_location (company_id, country, city, street_name, street_num) values (14, 'Croatia', 'Vrbovec', 'Bowman', '95016');
insert into company_location (company_id, country, city, street_name, street_num) values (15, 'Hungary', 'Debrecen', 'Laurel', '4');
insert into company_location (company_id, country, city, street_name, street_num) values (16, 'Yemen', 'Qishn', 'Stone Corner', '1989');
insert into company_location (company_id, country, city, street_name, street_num) values (17, 'China', 'Tuofeng', 'Fieldstone', '382');
insert into company_location (company_id, country, city, street_name, street_num) values (18, 'Colombia', 'Neiva', 'Walton', '2842');
insert into company_location (company_id, country, city, street_name, street_num) values (19, 'Brazil', 'Tianguá', 'Amoth', '039');
insert into company_location (company_id, country, city, street_name, street_num) values (20, 'Philippines', 'Kawayan', 'Springview', '0');
insert into company_location (company_id, country, city, street_name, street_num) values (21, 'Azerbaijan', 'Dzhalilabad', 'Anzinger', '63');
insert into company_location (company_id, country, city, street_name, street_num) values (22, 'Portugal', 'Memória', 'Sauthoff', '41317');
insert into company_location (company_id, country, city, street_name, street_num) values (23, 'France', 'Nice', 'Rusk', '852');
insert into company_location (company_id, country, city, street_name, street_num) values (24, 'Portugal', 'Légua', 'Fallview', '150');
insert into company_location (company_id, country, city, street_name, street_num) values (25, 'Ukraine', 'Nova Kakhovka', 'Brickson Park', '7');
insert into company_location (company_id, country, city, street_name, street_num) values (26, 'Mexico', 'La Soledad', 'Meadow Ridge', '116');
insert into company_location (company_id, country, city, street_name, street_num) values (27, 'China', 'Houjia', 'Declaration', '651');
insert into company_location (company_id, country, city, street_name, street_num) values (28, 'France', 'Chantepie', 'Glendale', '93');
insert into company_location (company_id, country, city, street_name, street_num) values (29, 'United States', 'Fullerton', 'Prentice', '8');
insert into company_location (company_id, country, city, street_name, street_num) values (30, 'China', 'Bulianhe', 'Kings', '75710');
insert into company_location (company_id, country, city, street_name, street_num) values (31, 'Portugal', 'Gafanha da Encarnação', 'Moose', '01');
insert into company_location (company_id, country, city, street_name, street_num) values (32, 'Malta', 'Għaxaq', '6th', '0');
insert into company_location (company_id, country, city, street_name, street_num) values (33, 'China', 'Shiquan', 'Harbort', '411');
insert into company_location (company_id, country, city, street_name, street_num) values (34, 'Russia', 'Yekimovichi', 'Ramsey', '4749');
insert into company_location (company_id, country, city, street_name, street_num) values (35, 'Ukraine', 'Tayirove', 'Forster', '95');
insert into company_location (company_id, country, city, street_name, street_num) values (36, 'Portugal', 'Santiago dos Velhos', 'Columbus', '0507');
insert into company_location (company_id, country, city, street_name, street_num) values (37, 'Argentina', 'Garupá', 'Orin', '42444');
insert into company_location (company_id, country, city, street_name, street_num) values (38, 'Albania', 'Rrasa e Sipërme', 'Iowa', '5039');
insert into company_location (company_id, country, city, street_name, street_num) values (39, 'China', 'Shanmu', 'Sunbrook', '6099');
insert into company_location (company_id, country, city, street_name, street_num) values (40, 'Sweden', 'Tungelsta', 'Starling', '96');
insert into company_location (company_id, country, city, street_name, street_num) values (41, 'Philippines', 'Malicboy', 'Ryan', '98528');
insert into company_location (company_id, country, city, street_name, street_num) values (42, 'Madagascar', 'Marolambo', 'Bashford', '7865');
insert into company_location (company_id, country, city, street_name, street_num) values (43, 'Serbia', 'Banovo Polje', 'Hallows', '40563');
insert into company_location (company_id, country, city, street_name, street_num) values (44, 'Indonesia', 'Senggreng', 'Dorton', '14');
insert into company_location (company_id, country, city, street_name, street_num) values (45, 'Czech Republic', 'Veselí nad Moravou', '2nd', '05');
insert into company_location (company_id, country, city, street_name, street_num) values (46, 'Netherlands', 'Alkmaar', 'Novick', '71');
insert into company_location (company_id, country, city, street_name, street_num) values (47, 'Russia', 'Shilovo', 'Rigney', '0');
insert into company_location (company_id, country, city, street_name, street_num) values (48, 'Indonesia', 'Ponggok', 'John Wall', '62669');
insert into company_location (company_id, country, city, street_name, street_num) values (49, 'Canada', 'Macamic', 'Maryland', '3');
insert into company_location (company_id, country, city, street_name, street_num) values (50, 'Greece', 'Saronída', 'Becker', '21433');

insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (1, 'jpancast0@tmall.com', 88, true, '+48 588 875 1116', 4, 1);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (2, 'hsandyford1@barnesandnoble.com', 58, true, '+93 867 215 3531', 4, 2);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (3, 'mtodhunter2@uiuc.edu', 18, false, '+1 602 911 6214', 5, 3);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (4, 'cfelder3@woothemes.com', 53, true, '+380 816 519 5516', 2, 4);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (5, 'acasetta4@livejournal.com', 22, false, '+258 822 394 7248', 3, 5);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (6, 'kfarndale5@joomla.org', 14, false, '+7 222 323 5253', 3, 6);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (7, 'hmallabund6@hexun.com', 81, false, '+55 681 450 8508', 5, 7);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (8, 'mmacness7@jalbum.net', 50, true, '+234 318 629 9536', 5, 8);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (9, 'lcrysell8@cam.ac.uk', 41, false, '+261 622 986 0113', 1, 9);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (10, 'tmorris9@washington.edu', 18, true, '+86 239 677 7152', 4, 10);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (11, 'lthongera@facebook.com', 37, true, '+352 157 709 7610', 2, 11);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (12, 'dlebarrb@samsung.com', 28, false, '+63 959 707 8175', 3, 12);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (13, 'vwillcocksc@clickbank.net', 44, false, '+216 764 550 1387', 5, 13);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (14, 'bodcroftd@miibeian.gov.cn', 82, false, '+62 783 351 4566', 5, 14);
insert into courier (id, email, age, door_to_door_delivery, phone_number, rating, purchase_id) values (15, 'lluske@sphinn.com', 32, false, '+48 678 101 5052', 4, 15);

insert into courier_address (courier_id, country, city, street_name, street_num) values (1, 'Bangladesh', 'Lalmanirhat', 'Rusk', '64982');
insert into courier_address (courier_id, country, city, street_name, street_num) values (2, 'Palestinian Territory', 'Qaţanah', 'Shoshone', '80');
insert into courier_address (courier_id, country, city, street_name, street_num) values (3, 'China', 'Xiacang', 'Prentice', '02761');
insert into courier_address (courier_id, country, city, street_name, street_num) values (4, 'China', 'Hanjia', 'Village', '71');
insert into courier_address (courier_id, country, city, street_name, street_num) values (5, 'Russia', 'Sel’tso', 'Lyons', '0607');
insert into courier_address (courier_id, country, city, street_name, street_num) values (6, 'Canada', 'Bonavista', 'Claremont', '6');
insert into courier_address (courier_id, country, city, street_name, street_num) values (7, 'Israel', 'Na''ale', 'Oakridge', '3');
insert into courier_address (courier_id, country, city, street_name, street_num) values (8, 'Canada', 'Dieppe', 'Dayton', '10');
insert into courier_address (courier_id, country, city, street_name, street_num) values (9, 'China', 'Handaqi', 'Carberry', '12');
insert into courier_address (courier_id, country, city, street_name, street_num) values (10, 'Indonesia', 'Sumbergedong', 'Waywood', '54');
insert into courier_address (courier_id, country, city, street_name, street_num) values (11, 'Philippines', 'Josefina', 'Amoth', '45554');
insert into courier_address (courier_id, country, city, street_name, street_num) values (12, 'Croatia', 'Šenkovec', 'Center', '90');
insert into courier_address (courier_id, country, city, street_name, street_num) values (13, 'Brazil', 'Vilhena', 'Springs', '6918');
insert into courier_address (courier_id, country, city, street_name, street_num) values (14, 'Canada', 'Camrose', 'Lindbergh', '96973');
insert into courier_address (courier_id, country, city, street_name, street_num) values (15, 'China', 'Shuidun', 'Crest Line', '60720');

insert into courier_name (courier_id, first_name, last_name) values (1, 'Zak', 'Bollom');
insert into courier_name (courier_id, first_name, last_name) values (2, 'Nealson', 'McRae');
insert into courier_name (courier_id, first_name, last_name) values (3, 'Dorolice', 'Dymocke');
insert into courier_name (courier_id, first_name, last_name) values (4, 'Garry', 'Lawrence');
insert into courier_name (courier_id, first_name, last_name) values (5, 'Chrisse', 'Balnaves');
insert into courier_name (courier_id, first_name, last_name) values (6, 'Marijo', 'Kleen');
insert into courier_name (courier_id, first_name, last_name) values (7, 'Reggis', 'Ewence');
insert into courier_name (courier_id, first_name, last_name) values (8, 'Nissy', 'Ghilks');
insert into courier_name (courier_id, first_name, last_name) values (9, 'Yoshiko', 'Rahlof');
insert into courier_name (courier_id, first_name, last_name) values (10, 'Marvin', 'Stocken');
insert into courier_name (courier_id, first_name, last_name) values (11, 'Marylynne', 'Pigny');
insert into courier_name (courier_id, first_name, last_name) values (12, 'Boony', 'Searby');
insert into courier_name (courier_id, first_name, last_name) values (13, 'Ellynn', 'Shinefield');
insert into courier_name (courier_id, first_name, last_name) values (14, 'Sheilah', 'Epsly');
insert into courier_name (courier_id, first_name, last_name) values (15, 'Maudie', 'Scantlebury');

insert into product (id, cost, weight, company_id, client_id, purchase_id) values (1, '$2109.43', 471, 1, 1, 1);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (2, '$3891.97', 979, 2, 2, 2);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (3, '$3948.25', 76, 3, 3, 3);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (4, '$856.00', 665, 4, 4, 4);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (5, '$7742.96', 739, 5, 5, 5);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (6, '$5845.77', 321, 6, 6, 6);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (7, '$7990.10', 536, 7, 7, 7);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (8, '$1750.78', 40, 8, 8, 8);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (9, '$7545.26', 148, 9, 9, 9);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (10, '$8115.70', 962, 10, 10, 10);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (11, '$2940.56', 353, 11, 11, 11);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (12, '$6226.75', 24, 12, 12, 12);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (13, '$755.95', 900, 13, 13, 13);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (14, '$7022.34', 379, 14, 14, 14);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (15, '$5207.57', 950, 15, 15, 15);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (16, '$2816.32', 442, 16, 16, 16);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (17, '$5308.14', 501, 17, 17, 17);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (18, '$3495.12', 576, 18, 18, 18);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (19, '$9941.51', 745, 19, 19, 19);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (20, '$881.01', 513, 20, 20, 20);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (21, '$8948.38', 497, 21, 21, 21);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (22, '$3444.35', 926, 22, 22, 22);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (23, '$1893.86', 645, 23, 23, 23);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (24, '$4597.40', 960, 24, 24, 24);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (25, '$3913.25', 461, 25, 25, 25);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (26, '$6523.60', 952, 26, 26, 26);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (27, '$3268.67', 620, 27, 27, 27);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (28, '$8447.65', 484, 28, 28, 28);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (29, '$1172.63', 698, 29, 29, 29);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (30, '$4373.42', 106, 30, 30, 30);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (31, '$2091.68', 313, 31, 31, 31);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (32, '$2794.45', 380, 32, 32, 32);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (33, '$1334.04', 10, 33, 33, 33);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (34, '$7474.07', 864, 34, 34, 34);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (35, '$4663.62', 975, 35, 35, 35);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (36, '$4861.55', 362, 36, 36, 36);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (37, '$2824.18', 594, 37, 37, 37);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (38, '$6350.92', 238, 38, 38, 38);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (39, '$2035.18', 354, 39, 39, 39);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (40, '$4302.56', 174, 40, 40, 40);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (41, '$5040.68', 930, 41, 41, 41);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (42, '$9209.92', 744, 42, 42, 42);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (43, '$3809.23', 776, 43, 43, 43);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (44, '$9798.95', 171, 44, 44, 44);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (45, '$2283.20', 800, 45, 45, 45);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (46, '$9146.56', 855, 46, 46, 46);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (47, '$9800.00', 693, 47, 47, 47);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (48, '$2829.59', 951, 48, 48, 48);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (49, '$353.43', 806, 49, 49, 49);
insert into product (id, cost, weight, company_id, client_id, purchase_id) values (50, '$4247.63', 731, 50, 50, 50);

insert into product_size (product_id, height, width, depth) values (1, 4, 8, 4);
insert into product_size (product_id, height, width, depth) values (2, 6, 2, 10);
insert into product_size (product_id, height, width, depth) values (3, 2, 3, 1);
insert into product_size (product_id, height, width, depth) values (4, 8, 5, 7);
insert into product_size (product_id, height, width, depth) values (5, 4, 3, 1);
insert into product_size (product_id, height, width, depth) values (6, 7, 7, 1);
insert into product_size (product_id, height, width, depth) values (7, 5, 4, 3);
insert into product_size (product_id, height, width, depth) values (8, 9, 10, 9);
insert into product_size (product_id, height, width, depth) values (9, 5, 7, 5);
insert into product_size (product_id, height, width, depth) values (10, 7, 7, 4);
insert into product_size (product_id, height, width, depth) values (11, 5, 9, 10);
insert into product_size (product_id, height, width, depth) values (12, 5, 4, 6);
insert into product_size (product_id, height, width, depth) values (13, 10, 1, 8);
insert into product_size (product_id, height, width, depth) values (14, 6, 1, 2);
insert into product_size (product_id, height, width, depth) values (15, 10, 9, 5);
insert into product_size (product_id, height, width, depth) values (16, 4, 5, 3);
insert into product_size (product_id, height, width, depth) values (17, 3, 10, 3);
insert into product_size (product_id, height, width, depth) values (18, 3, 8, 2);
insert into product_size (product_id, height, width, depth) values (19, 8, 5, 6);
insert into product_size (product_id, height, width, depth) values (20, 8, 5, 7);
insert into product_size (product_id, height, width, depth) values (21, 9, 1, 7);
insert into product_size (product_id, height, width, depth) values (22, 2, 8, 10);
insert into product_size (product_id, height, width, depth) values (23, 4, 8, 5);
insert into product_size (product_id, height, width, depth) values (24, 7, 6, 4);
insert into product_size (product_id, height, width, depth) values (25, 10, 3, 6);
insert into product_size (product_id, height, width, depth) values (26, 4, 6, 10);
insert into product_size (product_id, height, width, depth) values (27, 7, 1, 5);
insert into product_size (product_id, height, width, depth) values (28, 6, 1, 3);
insert into product_size (product_id, height, width, depth) values (29, 8, 8, 7);
insert into product_size (product_id, height, width, depth) values (30, 6, 2, 6);
insert into product_size (product_id, height, width, depth) values (31, 2, 3, 8);
insert into product_size (product_id, height, width, depth) values (32, 10, 7, 9);
insert into product_size (product_id, height, width, depth) values (33, 4, 1, 1);
insert into product_size (product_id, height, width, depth) values (34, 10, 10, 7);
insert into product_size (product_id, height, width, depth) values (35, 5, 3, 10);
insert into product_size (product_id, height, width, depth) values (36, 5, 10, 9);
insert into product_size (product_id, height, width, depth) values (37, 1, 10, 5);
insert into product_size (product_id, height, width, depth) values (38, 8, 9, 10);
insert into product_size (product_id, height, width, depth) values (39, 4, 2, 4);
insert into product_size (product_id, height, width, depth) values (40, 1, 2, 9);
insert into product_size (product_id, height, width, depth) values (41, 2, 10, 1);
insert into product_size (product_id, height, width, depth) values (42, 5, 6, 4);
insert into product_size (product_id, height, width, depth) values (43, 8, 7, 6);
insert into product_size (product_id, height, width, depth) values (44, 2, 5, 10);
insert into product_size (product_id, height, width, depth) values (45, 6, 1, 5);
insert into product_size (product_id, height, width, depth) values (46, 2, 4, 5);
insert into product_size (product_id, height, width, depth) values (47, 5, 10, 2);
insert into product_size (product_id, height, width, depth) values (48, 5, 3, 2);
insert into product_size (product_id, height, width, depth) values (49, 9, 3, 3);
insert into product_size (product_id, height, width, depth) values (50, 1, 1, 3);

insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (1, 1, '135.7.240.31', '2021-09-25 14:56:01', 4, 'Ford');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (2, 2, '25.201.136.129', '2021-09-25 23:36:07', 23, 'Nissan');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (3, 3, '45.228.36.118', '2019-11-15 15:59:56', 15, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (4, 4, '36.242.142.76', '2018-10-19 16:29:46', 22, 'Ford');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (5, 5, '249.141.177.139', '2020-03-23 23:24:25', 26, 'Nissan');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (6, 6, '94.210.164.254', '2018-10-19 15:59:56', 11, 'Subaru');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (7, 7, '241.124.215.80', '2021-09-25 23:36:07', 20, 'Chevrolet');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (8, 8, '174.15.3.81', '2021-09-25 23:36:07', 13, 'Nissan');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (9, 9, '148.79.243.45', '2021-09-25 13:54:56', 15, 'Subaru');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (10, 10, '255.93.26.58', '2021-09-25 23:36:07', 16, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (11, 11, '38.63.144.61', '2018-09-06 15:02:03', 8, 'Hyundai');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (12, 12, '165.0.155.142', '2018-10-19 15:59:56', 24, 'Nissan');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (13, 13, '61.182.170.134', '2018-10-19 15:59:56', 18, 'Ford');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (14, 14, '119.148.58.157', '2021-04-06 05:46:03', 21, 'Ford');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (15, 15, '220.108.93.223', '2021-09-25 23:36:07', 17, 'Nissan');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (16, 16, '154.155.200.35', '2021-04-05 05:46:03', 8, 'Ford');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (17, 17, '148.165.225.102', '2021-04-24 05:46:03', 13, 'Ford');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (18, 18, '55.118.68.200', '2018-10-19 15:59:56', 12, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (19, 19, '43.183.2.167', '2021-08-12 22:15:16', 12, 'Nissan');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (20, 20, '7.150.34.195', '2021-09-25 23:36:07', 5, 'Nissan');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (21, 21, '130.10.123.100', '2021-04-06 05:46:03', 8, 'Ford');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (22, 22, '66.180.140.162', '2021-09-26 05:46:03', 22, 'Ford');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (23, 23, '5.71.229.223', '2018-10-19 15:59:56', 7, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (24, 24, '153.135.148.148', '2018-10-19 15:59:56', 16, 'Ford');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (25, 25, '70.125.251.219', '2021-04-26 05:46:03', 7, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (26, 26, '214.34.122.174', '2021-04-26 05:46:03', 20, 'Chevrolet');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (27, 27, '65.60.209.100', '2018-10-19 15:59:56', 20, 'Chevrolet');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (28, 28, '136.155.35.124', '2021-09-26 23:36:07', 23, 'Nissan');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (29, 29, '10.157.46.170', '2018-10-19 15:59:56', 13, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (30, 30, '132.164.42.237', '2018-10-19 15:59:56', 12, 'Chevrolet');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (31, 31, '39.119.210.28', '2018-10-19 15:59:56', 18, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (32, 32, '76.231.50.84', '2021-06-19 15:59:56', 19, 'Nissan');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (33, 33, '122.191.201.103', '2017-06-14 04:55:56', 17, 'Chevrolet');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (34, 34, '60.206.190.31', '2018-10-19 15:59:56', 25, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (35, 35, '38.128.62.181', '2021-09-25 23:36:07', 1, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (36, 36, '136.211.141.240', '2021-09-25 23:36:07', 5, 'Nissan');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (37, 37, '252.104.250.250', '2021-10-19 15:59:56', 16, 'Chevrolet');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (38, 38, '87.121.164.132', '2021-09-12 03:46:07', 8, 'Chevrolet');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (39, 39, '143.140.231.58', '2018-10-19 15:59:56', 6, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (40, 40, '248.143.134.244', '2021-09-26 23:36:07', 17, 'Nissan');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (41, 41, '10.195.124.4', '2021-04-16 05:46:03', 4, 'Hyundai');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (42, 42, '96.123.255.200', '2018-10-19 15:59:56', 20, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (43, 43, '182.176.101.114', '2020-12-17 15:59:56', 19, 'Hyundai');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (44, 44, '64.186.46.27', '2018-08-29 14:39:24', 1, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (45, 45, '90.95.142.38', '2018-10-19 15:59:56', 2, 'Chevrolet');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (46, 46, '144.190.255.42', '2018-10-19 15:59:56', 22, 'Hyundai');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (47, 47, '7.244.154.214', '2022-11-06 19:16:17', 9, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (48, 48, '94.254.25.137', '2021-09-26 23:36:07', 7, 'Nissan');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (49, 49, '152.166.204.154', '2021-12-26 20:30:27', 2, 'Toyota');
insert into tracking_delivery (id, purchase_id, location, status, days_left, transport) values (50, 50, '88.16.229.225', '2021-09-26 23:36:07', 4, 'Nissan');

insert into transport (id, mark, is_crashed, crash_date, purchase_id, tracking_id) values (1, 'Hyundai', false, NULL, 10, 10);
insert into transport (id, mark, is_crashed, crash_date, purchase_id, tracking_id) values (2, 'Nissan', true, '2021-09-26 23:36:07', 1, 1);
insert into transport (id, mark, is_crashed, crash_date, purchase_id, tracking_id) values (3, 'Chevrolet', false, NULL, 2, 2);
insert into transport (id, mark, is_crashed, crash_date, purchase_id, tracking_id) values (4, 'GMC', false, NULL, 3, 3);
insert into transport (id, mark, is_crashed, crash_date, purchase_id, tracking_id) values (5, 'Ford', false, NULL, 4, 4);
insert into transport (id, mark, is_crashed, crash_date, purchase_id, tracking_id) values (6, 'Subaru', false, NULL, 5, 5);
insert into transport (id, mark, is_crashed, crash_date, purchase_id, tracking_id) values (7, 'Volkswagen', false, NULL, 6, 6);
insert into transport (id, mark, is_crashed, crash_date, purchase_id, tracking_id) values (8, 'Mitsubishi', false, NULL, 7, 7);
insert into transport (id, mark, is_crashed, crash_date, purchase_id, tracking_id) values (9, 'Toyota', false, NULL, 8, 8);
insert into transport (id, mark, is_crashed, crash_date, purchase_id, tracking_id) values (10, 'Ford', false, NULL, 9, 9);

-- 4.1 (The car model Nissan is crashed)
SELECT courier.id, courier_name.first_name, courier_name.last_name, transport.crash_date
FROM purchase, transport, tracking_delivery, courier, courier_name
WHERE tracking_delivery.transport = transport.mark
AND courier.id = courier_name.courier_id
AND tracking_delivery.purchase_id = courier.purchase_id
AND courier.purchase_id = purchase.id
AND transport.is_crashed = true
AND transport.crash_date = tracking_delivery.status;

SELECT client.id, client_name.first_name, client_name.last_name, transport.crash_date
FROM purchase, transport, tracking_delivery, client, client_name
WHERE tracking_delivery.transport = transport.mark
AND client.id = client_name.client_id
AND tracking_delivery.purchase_id = client.purchase_id
AND client.purchase_id = purchase.id
AND transport.is_crashed = true
AND transport.crash_date = tracking_delivery.status;

SELECT id, purchase_date AS Last_Succesfull_Purchase, total_price
FROM purchase
WHERE id =
(
    SELECT max(purchase.id)
    FROM purchase, transport, tracking_delivery, courier, courier_name
    WHERE tracking_delivery.transport = transport.mark
    AND courier.id = courier_name.courier_id
    AND tracking_delivery.purchase_id = courier.purchase_id
    AND courier.purchase_id = purchase.id
    AND transport.is_crashed = true
    AND transport.crash_date > tracking_delivery.status
);

-- 4.2
SELECT courier.id, courier_name.first_name, courier_name.last_name, courier.rating, courier.phone_number
FROM courier, courier_name
WHERE courier.id = courier_name.courier_id
AND courier_id IN
(
    SELECT ID FROM
    (
         SELECT courier_id AS ID, COUNT(courier_id) AS sum_of_ships
         FROM purchase
         WHERE purchase_date >= '2019-12-31 23:59' AND '2020-12-31 23:59' <= purchase_date
         GROUP BY courier_id
         ORDER BY sum_of_ships DESC
    )
    AS MX LIMIT 1
);

-- 4.3
SELECT client.id, client_name.first_name AS first_name, client_name.first_name as last_name, purchase.total_price AS the_most_money
FROM client, client_name, purchase
WHERE client.id = client_name.client_id
AND client.purchase_id = purchase.id
AND purchase.total_price IN
(
    SELECT MAX(total_price)
    FROM purchase
    WHERE total_price NOT IN('', 'null', 'OUT')
);

-- 4.4
SELECT STR, sum_of_streets FROM
(
     SELECT street_name AS STR, COUNT(street_name) AS sum_of_streets
     FROM client_address
     GROUP BY street_name
     ORDER BY sum_of_streets DESC
)
AS MX LIMIT 1;

-- 4.5
SELECT purchase.id AS purchase_id, purchase_date
FROM purchase
WHERE late_delivery = true;

-- 4.6
SELECT client_name.first_name, client_name.last_name, client_address.street_name, client_address.street_num, purchase.total_price
FROM client, client_name, client_address, purchase
WHERE client.id = client_name.client_id
AND client.id = client_address.client_id
AND client.purchase_id = purchase.id;