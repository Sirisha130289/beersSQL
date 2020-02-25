# Playlist Maker

#select the title of all songs from the artist with the name "Carbon Based Lifeforms"

SELECT title
FROM playlist_maker
WHERE artist LIKE 'Carbon Based Lifeforms';

#Select the name of all artists from the genre 'Ambient'.

SELECT artist,title
FROM ambient_playlist
WHERE artist IN (SELECT artist
    FROM playlist_maker)



