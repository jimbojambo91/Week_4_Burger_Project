DROP TABLE menu_items;
DROP TABLE eateries;
DROP TABLE burgers;

CREATE TABLE eateries(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
)

CREATE TABLE burgers(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255)
)

CREATE TABLE menu_items(
  id SERIAL2 PRIMARY KEY,
  eatery_id INT2 REFERENCES eateries(id),
  burger_id INT2 REFERENCES burgers(id),
  price INT2
)