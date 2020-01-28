/*
Write queries to answer the following questions
Save your work to this .sql file
Right click on the file name in the Project pane and select Refactor > Rename, and replace STU_NUM with your student number.
*/

--1. Which employees have 'IT' in their job title? (list their EmployeeId, FirstName, LastName and Title)
SELECT EmployeeId, LastName, FirstName, Title
FROM  Employee
WHERE Title LIKE 'IT%';

--2. List the names of all Artists and the titles of their albums
SELECT  Name, Title
FROM Artist
JOIN Album A on Artist.ArtistId = A.ArtistId GROUP BY Name;

--3. Which track is features on the greatest number of times in playlists and how many times is it included? (display Trac
SELECT PlaylistTrack.TrackId, Name, COUNT(*) AS NumberOfTracks
FROM PlaylistTrack
JOIN Track T on PlaylistTrack.TrackId = T.TrackId
GROUP BY T.TrackId
ORDER BY COUNT(*) DESC LIMIT 41; -- 41 tracks which feature 5 times in playlists

--4. Provide a list of the number of tracks by each artist
SELECT Artist.Name, COUNT(*) AS NumberOfTracks
FROM Artist
JOIN Album A on Artist.ArtistId = A.ArtistId
JOIN Track T on A.AlbumId = T.AlbumId
GROUP BY Artist.ArtistId;

--5. How much money has been invoiced for the artist Deep Purple? (display each line item from the invoices and the total amount)
SELECT Artist.Name, COUNT(*) * 0.99 AS TotalMoney
FROM Artist
JOIN Album A on Artist.ArtistId = A.ArtistId
JOIN Track T on A.AlbumId = T.AlbumId
JOIN InvoiceLine IL on T.TrackId = IL.TrackId
JOIN Invoice I on IL.InvoiceId = I.InvoiceId
GROUP BY Artist.Name WHERE Artist.Name = 'Deep Purple';