--Выполнение SELECT-запросов (зададние 2)
-- Название и продолжительность самого длинного трека
SELECT name, duration
FROM tracks
WHERE duration = (SELECT MAX(duration) FROM tracks);

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT name, duration
FROM tracks
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name
FROM albums
WHERE year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT name
FROM artists
WHERE name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT name
FROM tracks
WHERE name ILIKE '%my%';

--Выполнение SELECT-запросов (зададние 3)
-- Количество исполнителей в каждом жанре
SELECT g.name, COUNT(ag.artists_id) AS artists_q
FROM genres g
JOIN artists_genres ag ON g.ID = ag.genre_id
GROUP BY g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.ID) AS tracks_albums_2019_2020_q
FROM albums a
JOIN tracks t ON a.ID = t.album_id
WHERE a.year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.name, AVG(t.duration)
FROM albums a
JOIN tracks t ON a.ID = t.album_id
GROUP BY a.name;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name
FROM artists ar
WHERE ar.ID NOT IN (
    SELECT aa.artist_id
    FROM albums_artists aa
    JOIN albums a ON aa.album_id = a.ID
    WHERE a.year = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT c.name
FROM collections c
JOIN collections_tracks ct ON c.ID = ct.collection_id
JOIN tracks t ON ct.track_id = t.id
JOIN albums a ON t.album_id = a.ID
JOIN albums_artists aa ON a.ID = aa.album_id
JOIN artists ar ON aa.artist_id = ar.ID
WHERE ar.name = 'John Lennon';

--Выполнение SELECT-запросов (зададние 4(необязательное))
-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT a.name
FROM albums a
JOIN albums_artists aa ON a.id = aa.album_id
WHERE aa.artist_id IN (
    SELECT ag.artists_id
    FROM artists_genres ag
    GROUP BY ag.artists_id
    HAVING COUNT(DISTINCT ag.genre_id) > 1
);

-- Наименования треков, которые не входят в сборники
SELECT t.name
FROM tracks t
LEFT JOIN collections_tracks ct ON t.ID = ct.track_id
GROUP BY t.name
HAVING COUNT(ct.collection_id) = 0;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT *
FROM artists ar
JOIN albums_artists aa ON ar.ID = aa.artist_id
LEFT JOIN albums a ON aa.album_id = a.ID
LEFT JOIN tracks t ON a.ID = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

-- Названия альбомов, содержащих наименьшее количество треков
SELECT a.name
FROM albums a
JOIN (
    SELECT album_id, COUNT(*) FROM tracks GROUP BY album_id
) t ON a.ID = t.album_id
WHERE t.count = (SELECT MIN(count) FROM (SELECT COUNT(*) as count FROM tracks GROUP BY album_id));
