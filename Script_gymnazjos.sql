USE [master]

GO
/****** Object:  Database [Gymnazjos]    Script Date: 22.11.2019 03:00:57 ******/
CREATE DATABASE [Gymnazjos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gymnazjos', FILENAME = N'D:\dBGym\Gymnazjos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gymnazjos_log', FILENAME = N'D:\dBGym\Gymnazjos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Gymnazjos] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gymnazjos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gymnazjos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gymnazjos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gymnazjos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gymnazjos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gymnazjos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gymnazjos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gymnazjos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gymnazjos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gymnazjos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gymnazjos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gymnazjos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gymnazjos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gymnazjos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gymnazjos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gymnazjos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Gymnazjos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gymnazjos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gymnazjos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gymnazjos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gymnazjos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gymnazjos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gymnazjos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gymnazjos] SET RECOVERY FULL 
GO
ALTER DATABASE [Gymnazjos] SET  MULTI_USER 
GO
ALTER DATABASE [Gymnazjos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gymnazjos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gymnazjos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gymnazjos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gymnazjos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Gymnazjos', N'ON'
GO
ALTER DATABASE [Gymnazjos] SET QUERY_STORE = OFF
GO
USE [Gymnazjos]
GO
/****** Object:  Table [dbo].[exercises]    Script Date: 22.11.2019 03:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exercise](
	[exercise_id] [int] IDENTITY(1,1) NOT NULL,
	[exercise_name] [varchar](55) NOT NULL,
	[exercise_description] [varchar](55) NOT NULL,
 CONSTRAINT [PK_exercise] PRIMARY KEY CLUSTERED 
(
	[exercise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persons]    Script Date: 22.11.2019 03:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[person_id] [int] IDENTITY(1,1) NOT NULL,
	[person_name] [varchar](50) NOT NULL,
	[person_lastname] [varchar](50) NOT NULL,
	[person_nick] [varchar](50) NOT NULL,
	[person_email] [varchar](50) NOT NULL,
	[person_gender] [varchar](1) NOT NULL,
	[person_height] [decimal](4, 1) NOT NULL,
	[person_weight] [decimal](4, 1) NOT NULL,
	[person_birthday] [date] NOT NULL,
	[person_password] [char](82) NOT NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [unique_person_email] UNIQUE NONCLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [unique_person_nick] UNIQUE NONCLUSTERED 
(
	[person_nick] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[series]    Script Date: 22.11.2019 03:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[series](
	[series_training_id] [int] NOT NULL,
	[series_exercise_id] [int] NOT NULL,
	[series_id] [int] IDENTITY(1,1) NOT NULL,
	[series_reps] [int] NOT NULL,
	[series_weight] [decimal](4, 1) NOT NULL,
 CONSTRAINT [PK_series] PRIMARY KEY CLUSTERED 
(
	[series_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trainings]    Script Date: 22.11.2019 03:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training](
	[training_id] [int] IDENTITY(1,1) NOT NULL,
	[training_person_id] [int] NOT NULL,
	[training_date] [date] NOT NULL,
 CONSTRAINT [PK_training] PRIMARY KEY CLUSTERED 
(
	[training_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[training] ADD  CONSTRAINT [DF_training_training_date]  DEFAULT (getdate()) FOR [training_date]
GO
ALTER TABLE [dbo].[series]  WITH CHECK ADD  CONSTRAINT [FK_series_exercise_id] FOREIGN KEY([series_exercise_id])
REFERENCES [dbo].[exercise] ([exercise_id])
GO
ALTER TABLE [dbo].[series] CHECK CONSTRAINT [FK_series_exercise_id]
GO
ALTER TABLE [dbo].[series]  WITH CHECK ADD  CONSTRAINT [FK_series_training_id] FOREIGN KEY([series_training_id])
REFERENCES [dbo].[training] ([training_id])
GO
ALTER TABLE [dbo].[series] CHECK CONSTRAINT [FK_series_training_id]
GO
ALTER TABLE [dbo].[training]  WITH CHECK ADD  CONSTRAINT [FK_training_person_id] FOREIGN KEY([training_person_id])
REFERENCES [dbo].[person] ([person_id])
GO
ALTER TABLE [dbo].[training] CHECK CONSTRAINT [FK_training_person_id]
GO
ALTER TABLE [dbo].[person]  WITH CHECK ADD  CONSTRAINT [CK_person_birthday] CHECK  (([person_birthday]<=getdate()))
GO
ALTER TABLE [dbo].[person] CHECK CONSTRAINT [CK_person_birthday]
GO
ALTER TABLE [dbo].[person]  WITH CHECK ADD  CONSTRAINT [CK_person_height] CHECK  (([person_height]>(0.0)))
GO
ALTER TABLE [dbo].[person] CHECK CONSTRAINT [CK_person_height]
GO
ALTER TABLE [dbo].[person]  WITH CHECK ADD  CONSTRAINT [CK_person_weight] CHECK  (([person_weight]>(0.0)))
GO
ALTER TABLE [dbo].[person] CHECK CONSTRAINT [CK_person_weight]
GO
ALTER TABLE [dbo].[series]  WITH CHECK ADD  CONSTRAINT [CK_series_reps] CHECK  (([series_reps]>=(0)))
GO
ALTER TABLE [dbo].[series] CHECK CONSTRAINT [CK_series_reps]
GO
ALTER TABLE [dbo].[series]  WITH CHECK ADD  CONSTRAINT [CK_series_weight] CHECK  (([series_weight]>(0.0)))
GO
ALTER TABLE [dbo].[series] CHECK CONSTRAINT [CK_series_weight]
GO
USE [master]
GO
ALTER DATABASE [Gymnazjos] SET  READ_WRITE 
GO
