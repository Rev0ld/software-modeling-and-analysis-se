INSERT INTO DBSchema (TableName, FlagDeleted) VALUES
('Authors', 0),
('Copyrights', 0),
('DBSchema', 0),
('Formats', 0),
('Genres', 0),
('Tags', 0),
('UserActions', 0),
('Users', 0),
('VideoAuthors', 0),
('VideoCopyrights', 0),
('VideoGenres', 0),
('Videos', 0),
('VideoTags', 0);

INSERT INTO Users (Username, Password, FirstName, LastName, AzureID, FlagDeleted) VALUES
('admin', 'admin123', 'System', 'Administrator', NULL, 0),
('jdoe', 'password1', 'John', 'Doe', NEWID(), 0),
('msmith', 'password2', 'Maria', 'Smith', NEWID(), 0),
('aroberts', 'password3', 'Alice', 'Roberts', NEWID(), 0),
('tadams', 'password4', 'Thomas', 'Adams', NEWID(), 0),
('devuser', 'password5', 'Developer', 'User', NEWID(), 0);

INSERT INTO Copyrights (Name, ShortName, Description, FlagDeleted) VALUES
('Creative Commons', 'CC', 'Creative Commons license', 0),
('Public Domain', 'PD', 'No copyright restrictions', 0),
('Standard Copyright', 'COPY', 'Protected under standard copyright', 0),
('Open License', 'OL', 'Open content license', 0),
('Private License', 'PRIV', 'Restricted use license', 0),
('Educational Use Only', 'EDU', 'Licensed only for educational environments', 0);

INSERT INTO Formats (Type, Extension, IsPhysical, FlagDeleted) VALUES
('MP4 Video', '.mp4', 0, 0),
('MKV Video', '.mkv', 0, 0),
('AVI Video', '.avi', 0, 0),
('BluRay Disk', NULL, 1, 0),
('DVD Disk', NULL, 1, 0),
('Streaming Format', NULL, 0, 0);

INSERT INTO Tags (Name, Description, FlagDeleted) VALUES
('Classic', 'Recognized as a classic work.', 0),
('Bestseller', 'Has sold large volumes.', 0),
('Short', 'Short-length content.', 0),
('Longform', 'Long and detailed works.', 0),
('Dark', 'Dark tone or themes.', 0),
('Lighthearted', 'Soft and easy-going.', 0),
('Philosophical', 'Contains philosophical themes.', 0),
('Award-Winning', 'Recipient of literary awards.', 0),
('Debut', 'Author’s debut work.', 0),
('Series', 'Part of a larger series.', 0),
('Standalone', 'Independent content.', 0),
('Modern', 'Modern-era themes.', 0),
('Classic-Fiction', 'Old-school literature.', 0),
('Epic', 'Large-scale or epic storytelling.', 0),
('Experimental', 'Unconventional narrative style.', 0);

INSERT INTO Genres (Name, Description, FlagDeleted) VALUES
('Horror', 'Fiction intended to scare or unsettle.', 0),
('Sci-Fi', 'Science fiction themes.', 0),
('Fantasy', 'Magical or mythical storytelling.', 0),
('Romance', 'Stories centered on romantic relationships.', 0),
('Thriller', 'Tension-filled and suspenseful fiction.', 0),
('Mystery', 'Stories focused on solving a crime or puzzle.', 0),
('Drama', 'Emotional and narrative-driven fiction.', 0),
('Adventure', 'Exciting journeys and quests.', 0),
('Comedy', 'Humorous storytelling.', 0),
('Historical', 'Stories based on or inspired by history.', 0);

INSERT INTO Authors (FirstName, MiddleName, LastName, Biography, FlagDeleted) VALUES
('Stephen', NULL, 'King', 'American author of horror, supernatural fiction, suspense, and fantasy novels.', 0),
('Agatha', NULL, 'Christie', 'English writer known for her detective novels.', 0),
('Isaac', NULL, 'Asimov', 'American writer and professor of biochemistry, famous for works of hard science fiction.', 0),
('Haruki', NULL, 'Murakami', 'Japanese writer known for magical realism and surrealism.', 0),
('Brandon', NULL, 'Sanderson', 'American fantasy and science fiction writer.', 0),
('J. K.', NULL, 'Rowling', 'British author, best known for the Harry Potter series.', 0),
('Neil', NULL, 'Gaiman', 'English author of short fiction, novels, comic books, and films.', 0),
('Alice', NULL, 'Marwood', 'Fictional writer specializing in folklore and myth-inspired fantasy.', 0),
('Daniel', NULL, 'Kerron', 'Fictional author of sci-fi thrillers.', 0),
('Maria', 'Elena', 'Costa', 'Fictional European novelist focused on historical romance.', 0),
('Nora', NULL, 'Langford', 'Fictional contemporary drama writer.', 0),
('Victor', NULL, 'Drexel', 'Fictional horror and surrealism author.', 0);

INSERT INTO Videos (VideoUUID, Title, Size, Description, YearOfPublishing, FormatID, FlagDeleted) VALUES
-- UUIDs generated using NEWID() for example purposes
(NEWID(), 'The Art of AI', 1500, 'A documentary on AI evolution.', '2021-01-01', 1, 0),
(NEWID(), 'Mystery of the Oceans', 2000, 'Exploring deep sea mysteries.', '2019-01-01', 2, 0),
(NEWID(), 'Comedy Nights', 800, 'Stand-up comedy special.', '2022-01-01', 3, 0),
(NEWID(), 'History Uncovered', 1200, 'Unveiling lost civilizations.', '2018-01-01', 2, 0),
(NEWID(), 'Tech Innovations', 1750, 'Latest in tech and gadgets.', '2023-01-01', 1, 0),
(NEWID(), 'Cooking with Spices', 600, 'Exotic spice recipes.', '2020-01-01', 4, 0),
(NEWID(), 'Space Exploration', 2300, 'The journey beyond Earth.', '2017-01-01', 1, 0),
(NEWID(), 'Wildlife Safari', 1900, 'Journey through African wildlife.', '2021-01-01', 2, 0),
(NEWID(), 'Indie Music Live', 900, 'Live concert of indie bands.', '2022-01-01', 3, 0),
(NEWID(), 'Art Masters', 1600, 'Profile of famous painters.', '2019-01-01', 1, 0),
(NEWID(), 'Yoga for Beginners', 700, 'Intro to yoga exercises.', '2020-01-01', 4, 0),
(NEWID(), 'Futuristic Cars', 2200, 'Review of concept cars.', '2023-01-01', 1, 0),
(NEWID(), 'Urban Legends', 1100, 'Stories from around the world.', '2018-01-01', 2, 0),
(NEWID(), 'Gardening Tips', 650, 'How to grow a home garden.', '2021-01-01', 4, 0),
(NEWID(), 'Classic Cinema', 1800, 'Highlights of classic films.', '2019-01-01', 3, 0);


INSERT INTO VideoAuthors (VideoID, AuthorID, FlagDeleted) VALUES
(1, 1, 0),
(1, 2, 0),
(2, 3, 0),
(3, 1, 0),
(4, 4, 0),
(5, 5, 0),
(6, 6, 0),
(7, 7, 0),
(8, 8, 0),
(9, 9, 0),
(10, 10, 0),
(11, 1, 0),
(12, 2, 0),
(13, 3, 0),
(14, 4, 0),
(15, 5, 0);
INSERT INTO VideoGenres (VideoID, GenreID, FlagDeleted) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 4, 0),
(5, 5, 0),
(6, 6, 0),
(7, 7, 0),
(8, 8, 0),
(9, 9, 0),
(10, 10, 0),
(11, 1, 0),
(12, 2, 0),
(13, 3, 0),
(14, 4, 0),
(15, 5, 0);
INSERT INTO VideoTags (VideoID, TagID, FlagDeleted) VALUES
(1, 1, 0),
(1, 2, 0),
(2, 3, 0),
(3, 4, 0),
(4, 5, 0),
(5, 6, 0),
(6, 7, 0),
(7, 8, 0),
(8, 9, 0),
(9, 10, 0),
(10, 1, 0),
(11, 2, 0),
(12, 3, 0),
(13, 4, 0),
(14, 5, 0),
(15, 6, 0);
INSERT INTO VideoCopyrights (VideoID, CopyrightID, FlagDeleted) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 2, 0),
(4, 2, 0),
(5, 3, 0),
(6, 3, 0),
(7, 4, 0),
(8, 4, 0),
(9, 5, 0),
(10, 5, 0),
(11, 1, 0),
(12, 2, 0),
(13, 3, 0),
(14, 4, 0),
(15, 5, 0);

