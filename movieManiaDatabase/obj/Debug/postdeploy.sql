/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- Insert sample records into Customers table
INSERT INTO [dbo].[Customers] ([email], [first_name], [last_name], [date_of_birth], [address], [contact_number])
VALUES
('customer1@example.com', 'John', 'Doe', '1990-01-01', '123 Main St', 12345678901),
('customer2@example.com', 'Jane', 'Smith', '1985-05-10', '456 Elm St', 98765432102),
('customer3@example.com', 'Michael', 'Johnson', '1995-09-15', '789 Oak St', 55555555503),
('customer4@example.com', 'Sarah', 'Williams', '1988-07-22', '321 Maple Ave', 11122233304),
('customer5@example.com', 'David', 'Brown', '1992-04-12', '567 Pine St', 44455566605),
('customer6@example.com', 'Emily', 'Davis', '1991-11-03', '890 Cedar Rd', 77788899906),
('customer7@example.com', 'Andrew', 'Taylor', '1987-02-28', '432 Oak St', 10101010107),
('customer8@example.com', 'Olivia', 'Anderson', '1993-09-07', '765 Elm St', 12121212108),
('customer9@example.com', 'Matthew', 'Wilson', '1986-06-16', '098 Main St', 13131313109),
('customer10@example.com', 'Sophia', 'Martinez', '1994-03-25', '654 Cedar Rd', 141414141010),
('customer11@example.com', 'James', 'Lopez', '1997-12-14', '987 Pine St', 151515151011),
('customer12@example.com', 'Ava', 'Garcia', '1999-08-03', '321 Maple Ave', 161616161012),
('customer13@example.com', 'Daniel', 'Hernandez', '1998-05-22', '654 Cedar Rd', 171717171013),
('customer14@example.com', 'Isabella', 'Rivera', '1996-02-09', '890 Cedar Rd', 181818181014),
('customer15@example.com', 'Joseph', 'Lee', '1990-09-18', '432 Oak St', 191919191015),
('customer16@example.com', 'Mia', 'Gonzalez', '1989-06-27', '123 Main St', 202020201016),
('customer17@example.com', 'David', 'Walker', '1991-01-06', '456 Elm St', 212121212017),
('customer18@example.com', 'Sophia', 'Mitchell', '1987-10-15', '789 Oak St', 222222222018),
('customer19@example.com', 'Logan', 'Young', '1993-07-24', '098 Main St', 232323232019),
('customer20@example.com', 'Olivia', 'Scott', '1995-04-03', '765 Elm St', 242424242020);

-- Insert sample records into Movies table
INSERT INTO [dbo].[Movies] ([title], [release_date], [genre], [director], [actors], [price], [stock])
VALUES
('The Avengers', '2012-05-04', 'Action, Adventure, Sci-Fi', 'Joss Whedon', 'Robert Downey Jr., Chris Evans, Scarlett Johansson', 10, 5),
('The Dark Knight', '2008-07-18', 'Action, Crime, Drama', 'Christopher Nolan', 'Christian Bale, Heath Ledger, Gary Oldman', 8, 8),
('Jurassic Park', '1993-06-11', 'Adventure, Sci-Fi, Thriller', 'Steven Spielberg', 'Sam Neill, Laura Dern, Jeff Goldblum', 12, 3),
('Titanic', '1997-12-19', 'Drama, Romance', 'James Cameron', 'Leonardo DiCaprio, Kate Winslet, Billy Zane', 15, 6),
('The Lion King', '1994-06-24', 'Animation, Adventure, Drama', 'Roger Allers, Rob Minkoff', 'Matthew Broderick, Jeremy Irons, James Earl Jones', 7, 7),
('Avatar', '2009-12-18', 'Action, Adventure, Fantasy', 'James Cameron', 'Sam Worthington, Zoe Saldana, Sigourney Weaver', 9, 5),
('The Matrix', '1999-03-31', 'Action, Sci-Fi', 'Lana Wachowski, Lilly Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 11, 8),
('Forrest Gump', '1994-07-06', 'Drama, Romance', 'Robert Zemeckis', 'Tom Hanks, Robin Wright, Gary Sinise', 14, 3),
('Star Wars: Episode IV - A New Hope', '1977-05-25', 'Action, Adventure, Fantasy', 'George Lucas', 'Mark Hamill, Harrison Ford, Carrie Fisher', 6, 6),
('The Shawshank Redemption', '1994-09-23', 'Drama', 'Frank Darabont', 'Tim Robbins, Morgan Freeman, Bob Gunton', 13, 7),
('The Lord of the Rings: The Fellowship of the Ring', '2001-12-19', 'Adventure, Drama, Fantasy', 'Peter Jackson', 'Elijah Wood, Ian McKellen, Viggo Mortensen', 10, 5),
('Inception', '2010-07-16', 'Action, Adventure, Sci-Fi', 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page', 8, 8),
('Gone with the Wind', '1939-12-15', 'Drama, History, Romance', 'Victor Fleming', 'Clark Gable, Vivien Leigh, Thomas Mitchell', 12, 3),
('E.T. the Extra-Terrestrial', '1982-06-11', 'Family, Sci-Fi', 'Steven Spielberg', 'Henry Thomas, Drew Barrymore, Peter Coyote', 9, 6),
('The Great Gatsby', '2013-05-10', 'Drama, Romance', 'Baz Luhrmann', 'Leonardo DiCaprio, Tobey Maguire, Carey Mulligan', 11, 7),
('Jaws', '1975-06-20', 'Adventure, Thriller', 'Steven Spielberg', 'Roy Scheider, Robert Shaw, Richard Dreyfuss', 13, 5),
('The Princess Bride', '1987-09-25', 'Adventure, Family, Fantasy', 'Rob Reiner', 'Cary Elwes, Mandy Patinkin, Robin Wright', 7, 8),
('Interstellar', '2014-11-07', 'Adventure, Drama, Sci-Fi', 'Christopher Nolan', 'Matthew McConaughey, Anne Hathaway, Jessica Chastain', 10, 3),
('Casablanca', '1942-01-23', 'Drama, Romance, War', 'Michael Curtiz', 'Humphrey Bogart, Ingrid Bergman, Paul Henreid', 15, 6),
('The Wizard of Oz', '1939-08-25', 'Adventure, Family, Fantasy', 'Victor Fleming', 'Judy Garland, Frank Morgan, Ray Bolger', 8, 7);

-- Insert sample records into Rentals table
INSERT INTO [dbo].[Rentals] ([rental_date], [return_date], [status], [customer_id], [total_price])
VALUES
('2023-06-01', '2023-07-01', 'Returned', 1, 18),
('2023-06-02', '2023-07-02', 'Returned', 2, 10),
('2023-06-03', '2023-07-03', 'Returned', 3, 12),
('2023-06-04', '2023-07-04', 'Returned', 4, 15),
('2023-06-05', '2023-07-05', 'Returned', 5, 7),
('2023-06-06', '2023-07-06', 'Returned', 6, 9),
('2023-06-07', '2023-07-07', 'Returned', 7, 11),
('2023-06-08', '2023-07-08', 'Returned', 8, 14),
('2023-06-09', '2023-07-09', 'Returned', 9, 6),
('2023-06-10', '2023-07-10', 'Returned', 10, 13),
('2023-06-11', '2023-07-11', 'Returned', 11, 10),
('2023-06-12', '2023-07-12', 'Returned', 12, 8),
('2023-06-13', '2023-07-13', 'Returned', 13, 12),
('2023-06-14', '2023-07-14', 'Returned', 14, 9),
('2023-06-15', '2023-07-15', 'Returned', 15, 11),
('2023-06-16', '2023-07-16', 'Pending', 16, 13),
('2023-06-17', '2023-07-17', 'Pending', 17, 7),
('2023-06-18', '2023-07-18', 'Pending', 18, 10),
('2023-06-19', '2023-07-19', 'Pending', 19, 15),
('2023-06-20', '2023-07-20', 'Pending', 20, 8);

-- Insert sample records into RentalMovies table
INSERT INTO [dbo].[RentalMovies] ([rental_id], [movie_id], [individualstatus], [price])
VALUES
(1, 1, 'Returned', 10),
(1, 2, 'Returned', 8),
(2, 1, 'Returned', 10),
(3, 3, 'Returned', 12),
(4, 4, 'Returned', 15),
(5, 5, 'Returned', 7),
(6, 6, 'Returned', 9),
(7, 7, 'Returned', 11),
(8, 8, 'Returned', 14),
(9, 9, 'Returned', 6),
(10, 10, 'Returned', 13),
(11, 11, 'Returned', 10),
(12, 12, 'Returned', 8),
(13, 13, 'Returned', 12),
(14, 14, 'Returned', 9),
(15, 15, 'Returned', 11),
(16, 16, 'Pending', 13),
(17, 17, 'Pending', 7),
(18, 18, 'Pending', 10),
(19, 19, 'Pending', 15),
(20, 20, 'Pending', 8);











GO
