----------
-- Step 0 - Create a Query
----------
-- Query: Find a count of `toys` records that have a price greater than
    -- 55 and belong to a cat that has the color "Olive".

SELECT COUNT(*) FROM toys
    JOIN cat_toys ON toys.id = cat_toys.toy_id
    JOIN cats ON cats.id = cat_toys.cat_id
    WHERE toys.price > 55 AND cats.color IN ('Olive');

-- Paste your results below (as a comment):

-- ┌──────────┐
-- │ COUNT(*) │
-- ├──────────┤
-- │ 215      │
-- └──────────┘

----------
-- Step 1 - Analyze the Query
----------
-- Query:

EXPLAIN QUERY PLAN SELECT COUNT(*) FROM toys
    JOIN cats ON cats.id = cat_toys.cat_id
    JOIN cat_toys ON toys.id = cat_toys.toy_id
    WHERE toys.price > 55 AND cats.color IN ('Olive');

-- Paste your results below (as a comment):


-- What do your results mean?

    -- Was this a SEARCH or SCAN?

-- QUERY PLAN
-- |--SCAN cat_toys
-- |--SEARCH toys USING INTEGER PRIMARY KEY (rowid=?)
-- `--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)

    -- What does that mean?




----------
-- Step 2 - Time the Query to get a baseline
----------
-- Query (to be used in the sqlite CLI):

-- .timer on

-- Paste your results below (as a comment):

-- Run Time: real 0.007 user 0.006613 sys 0.000000

----------
-- Step 3 - Add an index and analyze how the query is executing
----------

-- Create index:

CREATE INDEX
  idx_toys_price
  ON toys(price);

-- Analyze Query:
EXPLAIN QUERY PLAN SELECT COUNT(*) FROM toys
    JOIN cats ON cats.id = cat_toys.cat_id
    JOIN cat_toys ON toys.id = cat_toys.toy_id
    WHERE toys.price > 55 AND cats.color IN ('Olive');

-- Paste your results below (as a comment):
-- QUERY PLAN
-- |--SCAN cat_toys
-- |--SEARCH toys USING INTEGER PRIMARY KEY (rowid=?)
-- `--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)

-- Analyze Results:

    -- Is the new index being applied in this query?

    -- no


----------
-- Step 4 - Re-time the query using the new index
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here

-- Paste your results below (as a comment):


-- Analyze Results:
    -- Are you still getting the correct query results?


    -- Did the execution time improve (decrease)?


    -- Do you see any other opportunities for making this query more efficient?



---------------------------------
-- Notes From Further Exploration
---------------------------------
