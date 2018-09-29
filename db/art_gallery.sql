
DROP TABLE IF EXISTS exhibitions;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists (
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);
-- Potentially extra variables...

CREATE TABLE exhibitions (
  id SERIAL8 primary key,
  name VARCHAR(255),
  category VARCHAR(255),
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE
);

-- Again, potentially other variables or maybe a new class
