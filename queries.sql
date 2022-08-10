/*Queries that provide answers to the questions from all projects.*/

SELECT * from animal WHERE name LIKE '%mon';
SELECT name from animal WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animal WHERE neutered = 't' AND escape_attempts < 3;
SELECT date_of_birth from animal WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animal WHERE weight_kg > 10.5;
SELECT * from animal WHERE neutered = 't';
SELECT * from animal WHERE name <> 'Gabumon';
SELECT * from animal WHERE weight_kg BETWEEN 10.4 AND 17.3;
