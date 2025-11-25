USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[Authors]    Script Date: 25/11/2025 20:40:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Authors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Biography] [nvarchar](max) NULL,
	[FlagDeleted] [int] NOT NULL,
 CONSTRAINT [PK_Authors1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[Copyrights]    Script Date: 25/11/2025 20:40:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Copyrights](
	[Name] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[FlagDeleted] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Copyrights] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[DBSchema]    Script Date: 25/11/2025 20:41:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DBSchema](
	[TableName] [nvarchar](50) NOT NULL,
	[FlagDeleted] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DBSchema] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[Formats]    Script Date: 25/11/2025 20:41:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Formats](
	[Type] [nvarchar](50) NOT NULL,
	[Extension] [nvarchar](10) NULL,
	[IsPhysical] [int] NOT NULL,
	[FlagDeleted] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Formats] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[Genres]    Script Date: 25/11/2025 20:41:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Genres](
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[FlagDeleted] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[Tags]    Script Date: 25/11/2025 20:41:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tags](
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[FlagDeleted] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[UserActions]    Script Date: 25/11/2025 20:41:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserActions](
	[TableID] [int] NOT NULL,
	[RecordID] [int] NOT NULL,
	[ChangedData] [nvarchar](max) NULL,
	[ChangeAction] [nvarchar](200) NULL,
	[UserID] [int] NOT NULL,
	[FlagDeleted] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChagngeDate] [date] NULL,
 CONSTRAINT [PK_UserActions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[UserActions]  WITH CHECK ADD  CONSTRAINT [FK_UserActions_DBSchema] FOREIGN KEY([TableID])
REFERENCES [dbo].[DBSchema] ([ID])
GO

ALTER TABLE [dbo].[UserActions] CHECK CONSTRAINT [FK_UserActions_DBSchema]
GO

ALTER TABLE [dbo].[UserActions]  WITH CHECK ADD  CONSTRAINT [FK_UserActions_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[UserActions] CHECK CONSTRAINT [FK_UserActions_Users]
GO

USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 25/11/2025 20:41:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[AzureID] [uniqueidentifier] NULL,
	[FlagDeleted] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[VideoAuthors]    Script Date: 25/11/2025 20:41:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VideoAuthors](
	[VideoID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL,
	[FlagDeleted] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_VideoAuthors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[VideoAuthors]  WITH CHECK ADD  CONSTRAINT [FK_VideoAuthors_Authors] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([ID])
GO

ALTER TABLE [dbo].[VideoAuthors] CHECK CONSTRAINT [FK_VideoAuthors_Authors]
GO

ALTER TABLE [dbo].[VideoAuthors]  WITH CHECK ADD  CONSTRAINT [FK_VideoAuthors_Videos] FOREIGN KEY([VideoID])
REFERENCES [dbo].[Videos] ([ID])
GO

ALTER TABLE [dbo].[VideoAuthors] CHECK CONSTRAINT [FK_VideoAuthors_Videos]
GO

USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[VideoCopyrights]    Script Date: 25/11/2025 20:41:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VideoCopyrights](
	[VideoID] [int] NOT NULL,
	[CopyrightID] [int] NOT NULL,
	[FlagDeleted] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_VideoCopyrights] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[VideoCopyrights]  WITH CHECK ADD  CONSTRAINT [FK_VideoCopyrights_Copyrights] FOREIGN KEY([CopyrightID])
REFERENCES [dbo].[Copyrights] ([ID])
GO

ALTER TABLE [dbo].[VideoCopyrights] CHECK CONSTRAINT [FK_VideoCopyrights_Copyrights]
GO

ALTER TABLE [dbo].[VideoCopyrights]  WITH CHECK ADD  CONSTRAINT [FK_VideoCopyrights_Videos] FOREIGN KEY([VideoID])
REFERENCES [dbo].[Videos] ([ID])
GO

ALTER TABLE [dbo].[VideoCopyrights] CHECK CONSTRAINT [FK_VideoCopyrights_Videos]
GO

USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[VideoGenres]    Script Date: 25/11/2025 20:41:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VideoGenres](
	[VideoID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
	[FlagDeleted] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_VideoGenres] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[VideoGenres]  WITH CHECK ADD  CONSTRAINT [FK_VideoGenres_Genres] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([ID])
GO

ALTER TABLE [dbo].[VideoGenres] CHECK CONSTRAINT [FK_VideoGenres_Genres]
GO

ALTER TABLE [dbo].[VideoGenres]  WITH CHECK ADD  CONSTRAINT [FK_VideoGenres_Videos] FOREIGN KEY([VideoID])
REFERENCES [dbo].[Videos] ([ID])
GO

ALTER TABLE [dbo].[VideoGenres] CHECK CONSTRAINT [FK_VideoGenres_Videos]
GO

USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[Videos]    Script Date: 25/11/2025 20:41:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Videos](
	[VideoUUID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Size] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[YearOfPublishing] [date] NOT NULL,
	[FormatID] [int] NOT NULL,
	[FlagDeleted] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Videos]  WITH CHECK ADD  CONSTRAINT [FK_Videos_Formats] FOREIGN KEY([FormatID])
REFERENCES [dbo].[Formats] ([ID])
GO

ALTER TABLE [dbo].[Videos] CHECK CONSTRAINT [FK_Videos_Formats]
GO

USE [PlexSystem2]
GO

/****** Object:  Table [dbo].[VideoTags]    Script Date: 25/11/2025 20:42:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VideoTags](
	[VideoID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
	[FlagDeleted] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_VideoTags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[VideoTags]  WITH CHECK ADD  CONSTRAINT [FK_VideoTags_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
GO

ALTER TABLE [dbo].[VideoTags] CHECK CONSTRAINT [FK_VideoTags_Tags]
GO

ALTER TABLE [dbo].[VideoTags]  WITH CHECK ADD  CONSTRAINT [FK_VideoTags_Videos] FOREIGN KEY([VideoID])
REFERENCES [dbo].[Videos] ([ID])
GO

ALTER TABLE [dbo].[VideoTags] CHECK CONSTRAINT [FK_VideoTags_Videos]
GO

