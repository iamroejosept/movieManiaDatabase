CREATE TABLE [dbo].[RentalMovies]
(
	[rental_id] INT NOT NULL,
	[movie_id] INT NOT NULL,
	[individualstatus] VARCHAR(MAX) NULL,
	PRIMARY KEY ([rental_id], [movie_id]),
	FOREIGN KEY (rental_id) REFERENCES [dbo].[Rentals]([rental_id]) ON DELETE CASCADE,
	FOREIGN KEY (movie_id) REFERENCES [dbo].[Movies]([movie_id]) ON DELETE CASCADE
)