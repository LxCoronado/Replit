.header on
.mode column

CREATE TABLE mountains (
  name TEXT,
  height_meters INTEGER,
  first_ascent DATE
);

INSERT INTO mountains VALUES
  ('Mount Everest', 8848, '1953-05-29'),
  ('Kilimanjaro', 5895, '1889-10-06'),
  ('Denali', 6190, '1913-06-07'),
  ('Chimborazo', 6263, '1880-01-04'),
  ('K2', 8611, '1954-07-31'),
  ('Piz Palü', 3900, '1835-08-12'),
  ('Cho Oyu', 8188, '1954-10-19');

.print 'Average mountain height'
SELECT round(avg(height_meters),2) AS avg_height
FROM mountains;

.print
.print 'Number of ascents per century'
SELECT
  strftime(
    '%Y',
    date(first_ascent)
  ) / 100 + 1 AS Century,
  count(*) AS Ascents
FROM mountains
GROUP BY century;