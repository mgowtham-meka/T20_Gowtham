CREATE DATABASE t20_world_cup;
USE t20_world_cup;
CREATE TABLE teams (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL UNIQUE,
  country VARCHAR(50) NOT NULL,
  founded YEAR
);

INSERT INTO teams (name, country, founded)
VALUES
  ('India Heros', 'India', 2008),
  ('Zimbabwe stars', 'Zimbabwe', 2008),
  ('WestIndies heroers', 'WestIndies', 2008),
  ('Pakistan Cricket Team', 'Pakistan', 2009),
  ('Australia Cricket Team', 'Australia', 2009),
  ('England Cricket Team', 'England', 2008),
  ('South Africa Cricket Team', 'South Africa', 2009),
  ('New Zealand Cricket Team', 'New Zealand', 2007);
  
  select * from teams;
  
  select country from teams where name="India Heros";
  
  select country from teams where founded < 2009
  
  INSERT INTO teams (name, country, founded) VALUES ('Pitapuram', 'India', 2008);
  
  update teams set name = "Tuni" where country ="England"
  
  delete from teams where name = "Pitapuram"
