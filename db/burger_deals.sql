DROP TABLE deals;
DROP TABLE menu_items;
DROP TABLE eateries;
DROP TABLE burgers;
DROP TABLE days;

CREATE TABLE eateries(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  image VARCHAR(255)
);

CREATE TABLE burgers(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  image VARCHAR(255)
);

CREATE TABLE days(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE menu_items(
  id SERIAL2 PRIMARY KEY,
  eatery_id INT2 REFERENCES eateries(id),
  burger_id INT2 REFERENCES burgers(id),
  price INT2
);

CREATE TABLE deals(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  menu_item_id INT2 REFERENCES menu_items(id),
  day_id INT2 REFERENCES days(id)
);