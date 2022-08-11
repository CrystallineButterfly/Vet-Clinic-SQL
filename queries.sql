/*Queries that provide answers to the questions from all projects.*/

SELECT * from animal WHERE name LIKE '%mon';
SELECT name from animal WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animal WHERE neutered = 't' AND escape_attempts < 3;
SELECT date_of_birth from animal WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animal WHERE weight_kg > 10.5;
SELECT * from animal WHERE neutered = 't';
SELECT * from animal WHERE name <> 'Gabumon';
SELECT * from animal WHERE weight_kg BETWEEN 10.4 AND 17.3;


BEGIN;
UPDATE animal
SET species = 'unspecified';
SELECT * from animal;
ROLLBACK;
SELECT * from animal;

BEGIN;
UPDATE animal SET species = 'digimon'
WHERE name like '%mon';
UPDATE animal SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animal
WHERE data_of_birth > 'January 1, 2022';
SAVEPOINT SP1;
UPDATE animal SET weight_kg = (weight_kg * -1);
ROLLBACK TO SP1;
UPDATE animal SET weight_kg = (weight_kg * -1) WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animal;
SELECT * from animal WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animal;
SELECT neutered, MAX(escape_attempts) FROM animal GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animal GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animal WHERE data_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
