/* Populate database with vetinary data. */

INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-07-01', 1, FALSE, 15.04),
('Gabumon', '2018-11-15', 2, TRUE, 8.0),
('Devimon', '2017-05-17', 5, TRUE, 11.0);

INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Charmander', '2020-02-08', 0, FALSE, -11.0),
('Angemon', '2005-06-12', 1, TRUE, -45.0 ),
('Plantmon', '2021-11-15', 2, TRUE, -5.7 ),
('Squirtle', '1993-04-02', 3, FALSE, -12.13),
('Blossom', '1998-10-13', 3, TRUE, 17.0),
('Ditto', '2022-05-14', 4, TRUE, 22.0),
('Boarmon', '2005-07-06', 7, TRUE, 20.4);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animal
SET species_id = 1;

UPDATE animal
SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animal SET owner_id = 1
WHERE name LIKE 'Agumon';

UPDATE animal SET owner_id = 2
WHERE name LIKE 'Gabumon' OR name LIKE 'Pikachu';

UPDATE animal SET owner_id = 3
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animal SET owner_id = 4
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animal SET owner_id = 5
WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez', 64, '1981-05-04'),('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id)
VALUES
((SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM species WHERE species.name = 'Pokemon')),
((SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM species WHERE species.name = 'Digimon')),
((SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM species WHERE species.name = 'Pokemon')),
((SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM species WHERE species.name = 'Digimon'));


-- INSERT INTO visits (animal_id, vet_id, visit_date)
-- VALUES
-- ((SELECT id FROM animal WHERE animal.name = 'Agumon'), (SELECT id FROM vets WHERE vets.name = 'William Tatcher'), '2020-05-24'),
-- ((SELECT id FROM animal WHERE animal.name = 'Agumon'), (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), '2020-07-22'),
-- ((SELECT id FROM animal WHERE animal.name = 'Gabumon'), (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), '2021-02-02'),
-- ((SELECT id FROM animal WHERE animal.name = 'Pikachu'), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), '2020-01-05'),
-- ((SELECT id FROM animal WHERE animal.name = 'Pikachu'), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), '2020-03-08'),
-- ((SELECT id FROM animal WHERE animal.name = 'Pikachu'), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), '2020-05-14'),
-- ((SELECT id FROM animal WHERE animal.name = 'Devimon'), (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), '2021-05-04'),
-- ((SELECT id FROM animal WHERE animal.name = 'Charmander'), (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), '2021-02-24'),
-- ((SELECT id FROM animal WHERE animal.name = 'Plantmon'), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), '2019-12-21'),
-- ((SELECT id FROM animal WHERE animal.name = 'Plantmon'), (SELECT id FROM vets WHERE vets.name = 'William Tatcher'), '2020-08-10'),
-- ((SELECT id FROM animal WHERE animal.name = 'Plantmon'), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), '2021-04-07'),
-- ((SELECT id FROM animal WHERE animal.name = 'Squirtle'), (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), '2019-09-29'),
-- ((SELECT id FROM animal WHERE animal.name = 'Angemon'), (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), '2020-10-03'),
-- ((SELECT id FROM animal WHERE animal.name = 'Angemon'), (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), '2020-11-04'),
-- ((SELECT id FROM animal WHERE animal.name = 'Boarmon'), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), '2019-01-24'),
-- ((SELECT id FROM animal WHERE animal.name = 'Boarmon'), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), '2019-05-15'),
-- ((SELECT id FROM animal WHERE animal.name = 'Boarmon'), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), '2020-02-27'),
-- ((SELECT id FROM animal WHERE animal.name = 'Boarmon'), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), '2020-08-03'),
-- ((SELECT id FROM animal WHERE animal.name = 'Blossom'), (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), '2020-05-24'),
-- ((SELECT id FROM animal WHERE animal.name = 'Blossom'), (SELECT id FROM vets WHERE vets.name = 'William Tatcher'), '2021-01-11');

INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (5, 1, 'May 24 2020'),
    (5, 3, 'Jul 22 2020'),
    (2, 4, 'Feb 02 2021'),
    (1, 2, 'Jan 05 2020'),
    (1, 2, 'Mar 08 2020'),
    (1, 2, 'May 14 2020'),
    (3, 3, 'May 04 2021'),
    (4, 4, 'Feb 24 2021'),
    (6, 2, 'Dec 21 2019'),
    (6, 1, 'Aug 10 2020'),
    (6, 2, 'Apr 07 2021'),
    (7, 3, 'Sep 29 2019'),
    (5, 4, 'Oct 03 2020'),
    (5, 4, 'Nov 04 2020'),
    (10, 2, 'Jan 24 2019'),
    (10, 2, 'May 15 2019'),
    (10, 2, 'Feb 27 2020'),
    (10, 2, 'Aug 03 2020'),
    (8, 3, 'May 24 2020'),
    (8, 1, 'Jan 01 2021');

INSERT INTO visits (animal_id, vet_id, visit_date) SELECT * FROM (SELECT id FROM animal) animal_ids, (SELECT id FROM vets) vet_id, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

