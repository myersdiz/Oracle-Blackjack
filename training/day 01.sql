--DDL - data definition language (creating tables, altering tables, creating indexes)

DROP TABLE menu_item;

CREATE TABLE menu_item (
   menu_item_num          INTEGER
  ,menu_item_desc         VARCHAR2(30)
  ,menu_item_price        NUMBER(6,2)  --xxxx.xx
  ,menu_item_intro_dt     DATE  --including a time by default it's midnight
);

ALTER TABLE menu_item ADD CONSTRAINT menu_item_PK PRIMARY KEY (menu_item_num);

ALTER TABLE menu_item ADD menu_item_prod_cost NUMBER(6,2);

--DML - data manipulation language (inserting, updating, deleting, merging)

INSERT INTO menu_item VALUES (1,'Taco',1.50,'01-JAN-1990',0.75);
INSERT INTO menu_item (menu_item_desc, menu_item_num, menu_item_price, menu_item_prod_cost, menu_item_intro_dt) VALUES ('Burrinto', 2, 3, .90, '01-JAN-1991');
INSERT INTO menu_item VALUES (3,'Nachos',2.00,'01-JAN-1992',1.00);
COMMIT;

INSERT INTO menu_item VALUES (4,'Refried beans',.50,'01-JAN-1990',.10);
COMMIT;

UPDATE menu_item SET menu_item_price = 1000;
ROLLBACK;

DELETE FROM menu_item WHERE menu_item_desc = 'Taco';
COMMIT;
ROLLBACK;

INSERT INTO menu_item VALUES (1,'Cheesy Potatoes',1.00,'15-OCT-2019',.75);
COMMIT;

UPDATE menu_item SET menu_item_num = 5 WHERE menu_item_desc = 'Cheesy Potatoes';

INSERT INTO menu_item VALUES (6,'Cheezz Balls',1.80,'15-OCT-2019',1.25);
COMMIT;
