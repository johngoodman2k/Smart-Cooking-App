USE
[SmartCookingApp]
GO
ALTER TABLE [dbo].[User_Post] DROP CONSTRAINT [FK_User_Post_User]
    GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Permission]
    GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Account]
    GO
ALTER TABLE [dbo].[Post_User_FeedBack] DROP CONSTRAINT [FK_Post_User_FeedBack_User]
    GO
ALTER TABLE [dbo].[Post_User_FeedBack] DROP CONSTRAINT [FK_Post_User_FeedBack_Post]
    GO
ALTER TABLE [dbo].[Post_User_FeedBack] DROP CONSTRAINT [FK_Post_User_FeedBack_FeedBack]
    GO
ALTER TABLE [dbo].[Post] DROP CONSTRAINT [FK_Post_User_Post]
    GO
ALTER TABLE [dbo].[Like] DROP CONSTRAINT [FK_Like_User]
    GO
ALTER TABLE [dbo].[Like] DROP CONSTRAINT [FK_Like_Post]
    GO
ALTER TABLE [dbo].[Cat_Post] DROP CONSTRAINT [FK_Cat_Post_Post]
    GO
ALTER TABLE [dbo].[Cat_Post] DROP CONSTRAINT [FK_Cat_Post_Category]
    GO
/****** Object:  Table [dbo].[User_Post]    Script Date: 4/18/2021 2:22:36 AM ******/
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Post]') AND type in (N'U'))
DROP TABLE [dbo].[User_Post]
    GO
/****** Object:  Table [dbo].[User]    Script Date: 4/18/2021 2:22:36 AM ******/
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
    GO
/****** Object:  Table [dbo].[Post_User_FeedBack]    Script Date: 4/18/2021 2:22:36 AM ******/
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Post_User_FeedBack]') AND type in (N'U'))
DROP TABLE [dbo].[Post_User_FeedBack]
    GO
/****** Object:  Table [dbo].[Post]    Script Date: 4/18/2021 2:22:36 AM ******/
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Post]') AND type in (N'U'))
DROP TABLE [dbo].[Post]
    GO
/****** Object:  Table [dbo].[Permission]    Script Date: 4/18/2021 2:22:36 AM ******/
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permission]') AND type in (N'U'))
DROP TABLE [dbo].[Permission]
    GO
/****** Object:  Table [dbo].[Like]    Script Date: 4/18/2021 2:22:36 AM ******/
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Like]') AND type in (N'U'))
DROP TABLE [dbo].[Like]
    GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 4/18/2021 2:22:36 AM ******/
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedBack]') AND type in (N'U'))
DROP TABLE [dbo].[FeedBack]
    GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/18/2021 2:22:36 AM ******/
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
    GO
/****** Object:  Table [dbo].[Cat_Post]    Script Date: 4/18/2021 2:22:36 AM ******/
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cat_Post]') AND type in (N'U'))
DROP TABLE [dbo].[Cat_Post]
    GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/18/2021 2:22:36 AM ******/
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
DROP TABLE [dbo].[Account]
    GO
    USE [master]
    GO
/****** Object:  Database [SmartCookingApp]    Script Date: 4/18/2021 2:22:36 AM ******/
DROP
DATABASE [SmartCookingApp]
GO
/****** Object:  Database [SmartCookingApp]    Script Date: 4/18/2021 2:22:36 AM ******/
CREATE
DATABASE [SmartCookingApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartCookingApp', FILENAME = N'D:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\SmartCookingApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmartCookingApp_log', FILENAME = N'D:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\SmartCookingApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER
DATABASE [SmartCookingApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartCookingApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER
DATABASE [SmartCookingApp] SET ANSI_NULL_DEFAULT OFF
GO
ALTER
DATABASE [SmartCookingApp] SET ANSI_NULLS OFF
GO
ALTER
DATABASE [SmartCookingApp] SET ANSI_PADDING OFF
GO
ALTER
DATABASE [SmartCookingApp] SET ANSI_WARNINGS OFF
GO
ALTER
DATABASE [SmartCookingApp] SET ARITHABORT OFF
GO
ALTER
DATABASE [SmartCookingApp] SET AUTO_CLOSE OFF
GO
ALTER
DATABASE [SmartCookingApp] SET AUTO_SHRINK OFF
GO
ALTER
DATABASE [SmartCookingApp] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER
DATABASE [SmartCookingApp] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER
DATABASE [SmartCookingApp] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER
DATABASE [SmartCookingApp] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER
DATABASE [SmartCookingApp] SET NUMERIC_ROUNDABORT OFF
GO
ALTER
DATABASE [SmartCookingApp] SET QUOTED_IDENTIFIER OFF
GO
ALTER
DATABASE [SmartCookingApp] SET RECURSIVE_TRIGGERS OFF
GO
ALTER
DATABASE [SmartCookingApp] SET  DISABLE_BROKER
GO
ALTER
DATABASE [SmartCookingApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER
DATABASE [SmartCookingApp] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER
DATABASE [SmartCookingApp] SET TRUSTWORTHY OFF
GO
ALTER
DATABASE [SmartCookingApp] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER
DATABASE [SmartCookingApp] SET PARAMETERIZATION SIMPLE
GO
ALTER
DATABASE [SmartCookingApp] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER
DATABASE [SmartCookingApp] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER
DATABASE [SmartCookingApp] SET RECOVERY FULL
GO
ALTER
DATABASE [SmartCookingApp] SET  MULTI_USER
GO
ALTER
DATABASE [SmartCookingApp] SET PAGE_VERIFY CHECKSUM
GO
ALTER
DATABASE [SmartCookingApp] SET DB_CHAINING OFF
GO
ALTER
DATABASE [SmartCookingApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER
DATABASE [SmartCookingApp] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER
DATABASE [SmartCookingApp] SET DELAYED_DURABILITY = DISABLED
GO
ALTER
DATABASE [SmartCookingApp] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'SmartCookingApp', N'ON'
GO
ALTER
DATABASE [SmartCookingApp] SET QUERY_STORE = OFF
GO
USE [SmartCookingApp]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/18/2021 2:22:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account]
(
    [
    id_account] [
    int]
    NOT
    NULL, [
    account] [
    varchar]
(
    10
) NULL,
    [password] [varchar]
(
    10
) NULL,
    CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED
(
[
    id_account] ASC
)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
    ON [PRIMARY]
    )
    ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Cat_Post]    Script Date: 4/18/2021 2:22:36 AM ******/
    SET ANSI_NULLS
    ON
    GO
    SET QUOTED_IDENTIFIER
    ON
    GO
CREATE TABLE [dbo].[Cat_Post]
(
    [
    id_cat] [
    int]
    NOT
    NULL, [
    id_post] [
    int]
    NULL,
    CONSTRAINT [
    PK_Cat_Post]
    PRIMARY
    KEY
    CLUSTERED
    (
[
    id_cat]
    ASC
)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
    ON [PRIMARY]
    )
    ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/18/2021 2:22:36 AM ******/
    SET ANSI_NULLS
    ON
    GO
    SET QUOTED_IDENTIFIER
    ON
    GO
CREATE TABLE [dbo].[Category]
(
    [
    id_cat] [
    int]
    NOT
    NULL, [
    catname] [
    nvarchar]
(
    50
) NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED
(
[
    id_cat] ASC
)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
    ON [PRIMARY]
    )
    ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 4/18/2021 2:22:36 AM ******/
    SET ANSI_NULLS
    ON
    GO
    SET QUOTED_IDENTIFIER
    ON
    GO
CREATE TABLE [dbo].[FeedBack]
(
    [
    id_feedback] [
    int]
    NOT
    NULL, [
    comment] [
    text]
    NULL, [
    emotion] [
    int]
    NULL,
    CONSTRAINT [
    PK_FeedBack]
    PRIMARY
    KEY
    CLUSTERED
    (
[
    id_feedback]
    ASC
)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
    ON [PRIMARY]
    )
    ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Like]    Script Date: 4/18/2021 2:22:36 AM ******/
    SET ANSI_NULLS
    ON
    GO
    SET QUOTED_IDENTIFIER
    ON
    GO
CREATE TABLE [dbo].[Like]
(
    [
    id_user] [
    int]
    NOT
    NULL, [
    id_post] [
    int]
    NOT
    NULL, [
    status] [
    int]
    NULL,
    CONSTRAINT [
    PK_Like]
    PRIMARY
    KEY
    CLUSTERED
    (
    [
    id_user]
    ASC,
[
    id_post]
    ASC
)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
    ON [PRIMARY]
    )
    ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Permission]    Script Date: 4/18/2021 2:22:36 AM ******/
    SET ANSI_NULLS
    ON
    GO
    SET QUOTED_IDENTIFIER
    ON
    GO
CREATE TABLE [dbo].[Permission]
(
    [
    id_per] [
    varchar]
(
    10
) NOT NULL,
    [pername] [nvarchar]
(
    50
) NULL,
    CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED
(
[
    id_per] ASC
)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
    ON [PRIMARY]
    )
    ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Post]    Script Date: 4/18/2021 2:22:36 AM ******/
    SET ANSI_NULLS
    ON
    GO
    SET QUOTED_IDENTIFIER
    ON
    GO
CREATE TABLE [dbo].[Post]
(
    [
    id_post] [
    int]
    NOT
    NULL, [
    postname] [
    nvarchar]
(
    50
) NULL,
    [fulldes] [text] NULL,
    [tinydes] [text] NULL,
    [rating] [float] NULL,
    [likes] [int] NULL,
    CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED
(
[
    id_post] ASC
)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
    ON [PRIMARY]
    )
    ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Post_User_FeedBack]    Script Date: 4/18/2021 2:22:36 AM ******/
    SET ANSI_NULLS
    ON
    GO
    SET QUOTED_IDENTIFIER
    ON
    GO
CREATE TABLE [dbo].[Post_User_FeedBack]
(
    [
    id_post] [
    int]
    NOT
    NULL, [
    id_user] [
    int]
    NOT
    NULL, [
    id_feedback] [
    int]
    NOT
    NULL,
    CONSTRAINT [
    PK_Post_User_FeedBack]
    PRIMARY
    KEY
    CLUSTERED
    (
    [
    id_post]
    ASC, [
    id_user]
    ASC,
[
    id_feedback]
    ASC
)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
    ON [PRIMARY]
    )
    ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[User]    Script Date: 4/18/2021 2:22:36 AM ******/
    SET ANSI_NULLS
    ON
    GO
    SET QUOTED_IDENTIFIER
    ON
    GO
CREATE TABLE [dbo].[User]
(
    [
    id_user] [
    int]
    NOT
    NULL, [
    username] [
    nvarchar]
(
    50
) NULL,
    [dob] [date] NULL,
    [avatar] [varchar]
(
    50
) NULL,
    [email] [varchar]
(
    50
) NULL,
    [phone] [varchar]
(
    50
) NULL,
    [description] [nvarchar]
(
    50
) NULL,
    [permission] [varchar]
(
    10
) NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED
(
[
    id_user] ASC
)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
    ON [PRIMARY]
    )
    ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[User_Post]    Script Date: 4/18/2021 2:22:36 AM ******/
    SET ANSI_NULLS
    ON
    GO
    SET QUOTED_IDENTIFIER
    ON
    GO
CREATE TABLE [dbo].[User_Post]
(
    [
    id_post] [
    int]
    NOT
    NULL, [
    id_user] [
    int]
    NULL,
    CONSTRAINT [
    PK_User_Post]
    PRIMARY
    KEY
    CLUSTERED
    (
[
    id_post]
    ASC
)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
    ON [PRIMARY]
    )
    ON [PRIMARY]
    GO
ALTER TABLE [dbo].[Cat_Post] WITH CHECK ADD CONSTRAINT [FK_Cat_Post_Category] FOREIGN KEY ([id_cat])
    REFERENCES [dbo].[Category] ([id_cat])
    GO
ALTER TABLE [dbo].[Cat_Post] CHECK CONSTRAINT [FK_Cat_Post_Category]
    GO
ALTER TABLE [dbo].[Cat_Post] WITH CHECK ADD CONSTRAINT [FK_Cat_Post_Post] FOREIGN KEY ([id_post])
    REFERENCES [dbo].[Post] ([id_post])
    GO
ALTER TABLE [dbo].[Cat_Post] CHECK CONSTRAINT [FK_Cat_Post_Post]
    GO
ALTER TABLE [dbo].[Like] WITH CHECK ADD CONSTRAINT [FK_Like_Post] FOREIGN KEY ([id_post])
    REFERENCES [dbo].[Post] ([id_post])
    GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Post]
    GO
ALTER TABLE [dbo].[Like] WITH CHECK ADD CONSTRAINT [FK_Like_User] FOREIGN KEY ([id_user])
    REFERENCES [dbo].[User] ([id_user])
    GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_User]
    GO
ALTER TABLE [dbo].[Post] WITH CHECK ADD CONSTRAINT [FK_Post_User_Post] FOREIGN KEY ([id_post])
    REFERENCES [dbo].[User_Post] ([id_post])
    GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User_Post]
    GO
ALTER TABLE [dbo].[Post_User_FeedBack] WITH CHECK ADD CONSTRAINT [FK_Post_User_FeedBack_FeedBack] FOREIGN KEY ([id_feedback])
    REFERENCES [dbo].[FeedBack] ([id_feedback])
    GO
ALTER TABLE [dbo].[Post_User_FeedBack] CHECK CONSTRAINT [FK_Post_User_FeedBack_FeedBack]
    GO
ALTER TABLE [dbo].[Post_User_FeedBack] WITH CHECK ADD CONSTRAINT [FK_Post_User_FeedBack_Post] FOREIGN KEY ([id_post])
    REFERENCES [dbo].[Post] ([id_post])
    GO
ALTER TABLE [dbo].[Post_User_FeedBack] CHECK CONSTRAINT [FK_Post_User_FeedBack_Post]
    GO
ALTER TABLE [dbo].[Post_User_FeedBack] WITH CHECK ADD CONSTRAINT [FK_Post_User_FeedBack_User] FOREIGN KEY ([id_user])
    REFERENCES [dbo].[User] ([id_user])
    GO
ALTER TABLE [dbo].[Post_User_FeedBack] CHECK CONSTRAINT [FK_Post_User_FeedBack_User]
    GO
ALTER TABLE [dbo].[User] WITH CHECK ADD CONSTRAINT [FK_User_Account] FOREIGN KEY ([id_user])
    REFERENCES [dbo].[Account] ([id_account])
    GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Account]
    GO
ALTER TABLE [dbo].[User] WITH CHECK ADD CONSTRAINT [FK_User_Permission] FOREIGN KEY ([permission])
    REFERENCES [dbo].[Permission] ([id_per])
    GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Permission]
    GO
ALTER TABLE [dbo].[User_Post] WITH CHECK ADD CONSTRAINT [FK_User_Post_User] FOREIGN KEY ([id_user])
    REFERENCES [dbo].[User] ([id_user])
    GO
ALTER TABLE [dbo].[User_Post] CHECK CONSTRAINT [FK_User_Post_User]
    GO
    USE [master]
    GO
ALTER
DATABASE [SmartCookingApp] SET  READ_WRITE
GO
