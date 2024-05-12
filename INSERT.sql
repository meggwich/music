--Вставка данных в таблицы (задание 1)
INSERT INTO artists (ID, name)
VALUES
(1, 'John Lennon'),
(2, 'Paul McCartney'),
(3, 'Johnny Silverhand'),
(4, 'David Bowie'),
(5, 'Marcin'),
(6, 'Till Lindemann'),
(7, 'Ramones')
ON CONFLICT (ID) DO NOTHING;

INSERT INTO genres (ID, name)
VALUES
(1, 'rock'),
(2, 'pop'),
(3, 'folk-rock'),
(4, 'indi-rock')
ON CONFLICT (ID) DO NOTHING;

INSERT INTO albums(ID, name, year)
VALUES
(1, 'The Rise and Fall of Ziggy Stardust and the Spiders from Mars', 1972),
(2, 'Imagine', 1971),
(3, 'Samurai', 2019),
(4, 'The Beatles', 1968),
(5, 'Alle Tage ist kein Sonntag', 2020),
(6, 'Ramones', 1976),
(7, 'Hepl!', 1965)
ON CONFLICT (ID) DO NOTHING;

INSERT INTO tracks (ID, name, album_id, duration)
VALUES
(1, 'Imagine', 2, 187),
(2, 'Yesterday', 7, 125),
(3, 'FourFiveSeconds', NULL, 188),
(4, 'Let it be', 4, 243),
(5, 'Never Fade Away', 3, 190),
(6, 'Starman', 1, 254),
(7, 'Chipin In', 3, 213),
(8, 'My Bonnie', NULL, 163),
(9, 'In my life', NULL, 167),
(10, 'Blitzkrieg Bop', 6, 125)
ON CONFLICT (ID) DO NOTHING;

INSERT INTO collections (ID, name, year)
VALUES
(1, 'The Beatles rock', 2015),
(2, 'Samurai', 2020),
(3, 'My playlist', 2024),
(4, 'Singles', 2016)
ON CONFLICT (ID) DO NOTHING;

INSERT INTO collections_tracks (track_id, collection_id)
VALUES
(1, 1),
(2, 3),
(2, 4),
(3, 4),
(4, 1),
(4, 3),
(5, 2),
(5, 3),
(6, 3),
(7, 2),
(7, 3)
ON CONFLICT DO NOTHING;

INSERT INTO albums_artists (album_id, artist_id)
VALUES
(1, 4),
(2, 1),
(3, 3),
(4, 1),
(4, 2),
(5, 6),
(6, 7),
(7, 1),
(7, 2)
ON CONFLICT DO NOTHING;

INSERT INTO artists_genres (genre_id, artists_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 4),
(3, 1),
(3, 2),
(4, 3)
ON CONFLICT DO NOTHING;

