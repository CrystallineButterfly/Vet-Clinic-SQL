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
UPDATE animal SET species = 'unspecified';
SELECT * from animal;
ROLLBACK;
SELECT * from animal;

BEGIN;
UPDATE animal SET species = 'digimon' WHERE name like '%mon';
UPDATE animal  SET species='pokemon' WHERE species = 'unspecified';
COMMIT;

BEGIN;
DELETE FROM animal WHERE data_of_birth > 'January 1, 2022';
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

SELECT name FROM animal A
JOIN owners O ON A.owner_id = O.id
WHERE O.full_name = 'Melody Pond';

SELECT A.name FROM animal A
JOIN species S ON A.species_id = S.id
WHERE S.name = 'Pokemon';

SELECT full_name, name
FROM animals A
FULL OUTER JOIN owners O on O.id = A.owner_id;

SELECT S.name, COUNT(*) FROM animals A
JOIN species S ON A.species_id = S.id
GROUP BY S.name;

SELECT A.name
FROM animals A
JOIN owners O ON A.owner_id = O.id
JOIN species S ON A.species_id = S.id
WHERE O.full_name = 'Jennifer Orwell'
AND S.name = 'Digimon';

SELECT A.name
FROM animals A
JOIN owners O ON A.owner_id = O.id
WHERE A.escape_attempts = 0
AND O.full_name = 'Dean Winchester';

SELECT COUNT(*) as count, full_name
FROM animals as A
JOIN owners O ON A.owner_id = O.id
GROUP BY full_name
ORDER BY count desc;


SELECT animal.name FROM visits
JOIN animal ON animal.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.visit_date DESC
LIMIT 1;

SELECT COUNT(animal.name) FROM visits
JOIN animal ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name FROM specializations
FULL OUTER JOIN vets ON vets.id = specializations.vet_id
FULL OUTER JOIN species ON species.id = specializations.species_id;

SELECT animal.name FROM visits
JOIN animal ON animal.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
AND visits.visit_date BETWEEN '2020-04-03' AND '2020-08-30';

SELECT animal.name FROM visits
JOIN animal ON animals.id = visits.animal_id
GROUP BY animal.name
ORDER BY COUNT(visits.visit_date) DESC
LIMIT 1;

SELECT animal.name FROM visits
JOIN animal ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
GROUP BY animals.name, visits.visit_date
ORDER BY visits.visit_date ASC
LIMIT 1;

SELECT animal.name, vets.name, visits.visit_date FROM visits
JOIN animal ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
ORDER BY visits.visit_date DESC
LIMIT 1;

CREATE VIEW Specialty as
SELECT vets.name, species.id
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON species.id = specializations.species_id;

SELECT COUNT (visits.visit_date) FROM animal
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id
LEFT JOIN specializations ON vets.id = specializations.vet_id
WHERE (animals.species_id != specializations.species_id OR specializations.species_id IS NULL)
AND 2 != (
  SELECT COUNT(Specialty.name)
  FROM Specialty
  WHERE Specialty.name = vets.name
);

SELECT species.name, COUNT(species.name) as visits
FROM animals
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY visits DESC
LIMIT 1;
