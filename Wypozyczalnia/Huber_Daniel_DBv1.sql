USE [master]
GO
/****** Object:  Database [Blockbuster]    Script Date: 28.05.2021 22:42:23 ******/
CREATE DATABASE [Blockbuster]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Blockbuster', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Blockbuster.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Blockbuster_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Blockbuster_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Blockbuster] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Blockbuster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Blockbuster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Blockbuster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Blockbuster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Blockbuster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Blockbuster] SET ARITHABORT OFF 
GO
ALTER DATABASE [Blockbuster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Blockbuster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Blockbuster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Blockbuster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Blockbuster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Blockbuster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Blockbuster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Blockbuster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Blockbuster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Blockbuster] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Blockbuster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Blockbuster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Blockbuster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Blockbuster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Blockbuster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Blockbuster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Blockbuster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Blockbuster] SET RECOVERY FULL 
GO
ALTER DATABASE [Blockbuster] SET  MULTI_USER 
GO
ALTER DATABASE [Blockbuster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Blockbuster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Blockbuster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Blockbuster] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Blockbuster] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Blockbuster] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Blockbuster', N'ON'
GO
ALTER DATABASE [Blockbuster] SET QUERY_STORE = OFF
GO
USE [Blockbuster]
GO
/****** Object:  Table [dbo].[SLKat_Muzyki]    Script Date: 28.05.2021 22:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLKat_Muzyki](
	[KategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlKat_Nosnika]    Script Date: 28.05.2021 22:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlKat_Nosnika](
	[NosnikID] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NosnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SLPowod]    Script Date: 28.05.2021 22:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLPowod](
	[PowodID] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PowodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TKlienci]    Script Date: 28.05.2021 22:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TKlienci](
	[KlientID] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [varchar](30) NOT NULL,
	[Nazwisko] [varchar](30) NOT NULL,
	[Adr_ulica] [varchar](30) NOT NULL,
	[Adr_nr] [varchar](6) NOT NULL,
	[Adr_kod] [varchar](9) NOT NULL,
	[Adr_msc] [varchar](50) NOT NULL,
	[Telefon] [varchar](9) NULL,
	[Email] [varchar](30) NULL,
	[Data_dodania] [date] NOT NULL,
	[Data_usuniecia] [date] NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KlientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TPlyty]    Script Date: 28.05.2021 22:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TPlyty](
	[PlytaID] [int] IDENTITY(1,1) NOT NULL,
	[Autor] [varchar](50) NOT NULL,
	[Tytul] [varchar](50) NOT NULL,
	[Data_wydania] [date] NOT NULL,
	[KategoriaID] [int] NOT NULL,
	[NosnikID] [int] NOT NULL,
	[Ilosc] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlytaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUsuniecia_Plyt]    Script Date: 28.05.2021 22:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUsuniecia_Plyt](
	[UsunieciaID] [int] IDENTITY(1,1) NOT NULL,
	[PlytaID] [int] NOT NULL,
	[Data_usuniecia] [datetime] NOT NULL,
	[Ilosc_plyt] [int] NOT NULL,
	[PowodID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsunieciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TWypozyczenia]    Script Date: 28.05.2021 22:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TWypozyczenia](
	[WypozyczenieID] [int] IDENTITY(1,1) NOT NULL,
	[KlientID] [int] NOT NULL,
	[PlytyID] [int] NOT NULL,
	[Data_wydania] [datetime] NOT NULL,
	[Data_zwrotu] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[WypozyczenieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SLKat_Muzyki] ON 

INSERT [dbo].[SLKat_Muzyki] ([KategoriaID], [Nazwa]) VALUES (1, N'Rock')
INSERT [dbo].[SLKat_Muzyki] ([KategoriaID], [Nazwa]) VALUES (2, N'Pop')
INSERT [dbo].[SLKat_Muzyki] ([KategoriaID], [Nazwa]) VALUES (3, N'Industrial Metal')
INSERT [dbo].[SLKat_Muzyki] ([KategoriaID], [Nazwa]) VALUES (4, N'Folk Rock')
INSERT [dbo].[SLKat_Muzyki] ([KategoriaID], [Nazwa]) VALUES (5, N'Classical')
INSERT [dbo].[SLKat_Muzyki] ([KategoriaID], [Nazwa]) VALUES (6, N'Metal')
SET IDENTITY_INSERT [dbo].[SLKat_Muzyki] OFF
GO
SET IDENTITY_INSERT [dbo].[SlKat_Nosnika] ON 

INSERT [dbo].[SlKat_Nosnika] ([NosnikID], [Nazwa]) VALUES (1, N'CD')
INSERT [dbo].[SlKat_Nosnika] ([NosnikID], [Nazwa]) VALUES (2, N'Vinyl')
INSERT [dbo].[SlKat_Nosnika] ([NosnikID], [Nazwa]) VALUES (3, N'Dyskietka')
INSERT [dbo].[SlKat_Nosnika] ([NosnikID], [Nazwa]) VALUES (4, N'Inny nośnik')
INSERT [dbo].[SlKat_Nosnika] ([NosnikID], [Nazwa]) VALUES (5, N'CD')
INSERT [dbo].[SlKat_Nosnika] ([NosnikID], [Nazwa]) VALUES (6, N'Vinyl')
INSERT [dbo].[SlKat_Nosnika] ([NosnikID], [Nazwa]) VALUES (7, N'Dyskietka')
INSERT [dbo].[SlKat_Nosnika] ([NosnikID], [Nazwa]) VALUES (8, N'Inny nośnik')
SET IDENTITY_INSERT [dbo].[SlKat_Nosnika] OFF
GO
SET IDENTITY_INSERT [dbo].[SLPowod] ON 

INSERT [dbo].[SLPowod] ([PowodID], [Nazwa]) VALUES (1, N'Zarysowanie')
INSERT [dbo].[SLPowod] ([PowodID], [Nazwa]) VALUES (2, N'Zniszczenie')
INSERT [dbo].[SLPowod] ([PowodID], [Nazwa]) VALUES (3, N'Kradzież')
INSERT [dbo].[SLPowod] ([PowodID], [Nazwa]) VALUES (4, N'Inny powód')
SET IDENTITY_INSERT [dbo].[SLPowod] OFF
GO
SET IDENTITY_INSERT [dbo].[TKlienci] ON 

INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (1, N'John', N'Doe', N'Mullerstrasse', N'23', N'34-200', N'Drezno', N'123456789', N'e@mail.com', CAST(N'2077-11-22' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (2, N'Ian', N'Matejko', N'Hauptstrasse', N'12', N'34-200', N'Munich', N'321456789', N'e2@mail.com', CAST(N'2008-08-22' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (3, N'Ivan', N'Grozny', N'Tatary', N'1500', N'34-201', N'Moskau', N'987654321', N'emaileeee@mail.com', CAST(N'2024-01-22' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (4, N'Naruto', N'Uzumaki', N'wakaranai', N'4', N'30-211', N'Konohagakure', N'32131412', N'', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (5, N'Anakin', N'Skywalker', N'Piaskowa', N'21', N'100', N'Tattoine', N'', N'', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (6, N'Froddo', N'Baggins', N'Długa', N'33', N'10-210', N'Shire', N'', N'', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (7, N'Han', N'Solo', N'Sokoła', N'1300', N'1232', N'Correlia', N'501510501', N'carbonite@Cloudcity.bespine', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (8, N'Edward', N'Elric', N'Jakaśtam', N'149', N'1231', N'Amestis', N'', N'', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (9, N'Itachi', N'Uchicha', N'AkaAoi', N'11', N'30-201', N'Konohagakure', N'314212', N'', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (10, N'Jonasz', N'Koran-Mekka', N'Króla', N'1', N'4-9', N'Warszawa', N'', N'Nadnieoceanu@rurururkowce.ru', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (11, N'Slavomir', N'Mentzen', N'XDStrasse', N'2', N'21-300', N'Thorn', N'314115', N'rurkowiec@XD.com', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (12, N'Ozajasz', N'Goldenberg', N'Sciany płaczu', N'73', N'13', N'Kazimierz', N'512415', N'Czy@wiedzial', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (13, N'Mariusz', N'Pudzian', N'To', N'by', N'nic ', N'nie', N'dało', N'', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (14, N'Rin', N'Okumura', N'diabua', N'66', N'777', N'Tokyo', N'', N'', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (15, N'Hinata', N'Hyuga', N'Narutowicza', N'8', N'23-12', N'Dom Hokage', N'', N'', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (16, N'Narcin', N'Najman', N'Powstańców', N'45', N'2123', N'Częstohowa', N'', N'', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (17, N'Richalieu', N'Petruscu', N'Nowoczesna', N'9', N'31-21', N'Varsovie', N'', N'', CAST(N'2021-05-28' AS Date), NULL, 1)
INSERT [dbo].[TKlienci] ([KlientID], [Imie], [Nazwisko], [Adr_ulica], [Adr_nr], [Adr_kod], [Adr_msc], [Telefon], [Email], [Data_dodania], [Data_usuniecia], [Status]) VALUES (18, N'Grigori', N'Braunov', N'Agentov', N'12', N'231-1', N'Kaliningrad', N'', N'Slava@Boh.ru', CAST(N'2021-05-28' AS Date), NULL, 1)
SET IDENTITY_INSERT [dbo].[TKlienci] OFF
GO
SET IDENTITY_INSERT [dbo].[TPlyty] ON 

INSERT [dbo].[TPlyty] ([PlytaID], [Autor], [Tytul], [Data_wydania], [KategoriaID], [NosnikID], [Ilosc]) VALUES (1, N'Eisbrecher', N'Das Gesetz', CAST(N'2018-06-08' AS Date), 3, 1, 21)
INSERT [dbo].[TPlyty] ([PlytaID], [Autor], [Tytul], [Data_wydania], [KategoriaID], [NosnikID], [Ilosc]) VALUES (2, N'Unheilig', N'Geboren um zu leben', CAST(N'2010-03-08' AS Date), 3, 1, 37)
SET IDENTITY_INSERT [dbo].[TPlyty] OFF
GO
ALTER TABLE [dbo].[TPlyty]  WITH CHECK ADD FOREIGN KEY([KategoriaID])
REFERENCES [dbo].[SLKat_Muzyki] ([KategoriaID])
GO
ALTER TABLE [dbo].[TPlyty]  WITH CHECK ADD  CONSTRAINT [FK_TPlyty_SlKat_Nosnika] FOREIGN KEY([NosnikID])
REFERENCES [dbo].[SlKat_Nosnika] ([NosnikID])
GO
ALTER TABLE [dbo].[TPlyty] CHECK CONSTRAINT [FK_TPlyty_SlKat_Nosnika]
GO
ALTER TABLE [dbo].[TUsuniecia_Plyt]  WITH CHECK ADD  CONSTRAINT [FK_TUsuniecia_Plyt_SLPowod] FOREIGN KEY([PowodID])
REFERENCES [dbo].[SLPowod] ([PowodID])
GO
ALTER TABLE [dbo].[TUsuniecia_Plyt] CHECK CONSTRAINT [FK_TUsuniecia_Plyt_SLPowod]
GO
ALTER TABLE [dbo].[TUsuniecia_Plyt]  WITH CHECK ADD  CONSTRAINT [FK_TUsuniecia_Plyt_TPlyty] FOREIGN KEY([PlytaID])
REFERENCES [dbo].[TPlyty] ([PlytaID])
GO
ALTER TABLE [dbo].[TUsuniecia_Plyt] CHECK CONSTRAINT [FK_TUsuniecia_Plyt_TPlyty]
GO
ALTER TABLE [dbo].[TWypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK_TWypozyczenia_TKlienci] FOREIGN KEY([KlientID])
REFERENCES [dbo].[TKlienci] ([KlientID])
GO
ALTER TABLE [dbo].[TWypozyczenia] CHECK CONSTRAINT [FK_TWypozyczenia_TKlienci]
GO
ALTER TABLE [dbo].[TWypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK_TWypozyczenia_TPlyty] FOREIGN KEY([PlytyID])
REFERENCES [dbo].[TPlyty] ([PlytaID])
GO
ALTER TABLE [dbo].[TWypozyczenia] CHECK CONSTRAINT [FK_TWypozyczenia_TPlyty]
GO
USE [master]
GO
ALTER DATABASE [Blockbuster] SET  READ_WRITE 
GO
