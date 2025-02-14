USE [Hamster]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 30.11.2024 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
	[Yetki] [int] NOT NULL,
	[KayitTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Legal]    Script Date: 30.11.2024 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Legal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sol] [nvarchar](50) NULL,
	[Sag] [nvarchar](50) NULL,
	[SaatlikKazanc] [int] NOT NULL,
	[YukseltmeMaliyeti] [int] NOT NULL,
	[Sonuc] [decimal](18, 2) NOT NULL,
	[KullaniciId] [int] NOT NULL,
 CONSTRAINT [PK_Legal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markets]    Script Date: 30.11.2024 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sol] [nvarchar](50) NULL,
	[Sag] [nvarchar](50) NULL,
	[SaatlikKazanc] [int] NOT NULL,
	[YukseltmeMaliyeti] [int] NOT NULL,
	[Sonuc] [decimal](18, 2) NOT NULL,
	[KullaniciId] [int] NOT NULL,
 CONSTRAINT [PK_Markets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PR&Team]    Script Date: 30.11.2024 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PR&Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sol] [nvarchar](50) NULL,
	[Sag] [nvarchar](50) NULL,
	[SaatlikKazanc] [int] NOT NULL,
	[YukseltmeMaliyeti] [int] NOT NULL,
	[Sonuc] [decimal](18, 2) NOT NULL,
	[KullaniciId] [int] NOT NULL,
 CONSTRAINT [PK_PR&Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specials]    Script Date: 30.11.2024 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SiraNo] [int] NOT NULL,
	[Sol] [nvarchar](50) NULL,
	[Orta] [nvarchar](50) NULL,
	[Sag] [nvarchar](50) NULL,
	[SaatlikKazanc] [int] NOT NULL,
	[YukseltmeMaliyeti] [int] NOT NULL,
	[Sonuc] [decimal](18, 2) NOT NULL,
	[GeriSayim] [datetime] NULL,
	[KullaniciId] [int] NOT NULL,
 CONSTRAINT [PK_Specials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Web3]    Script Date: 30.11.2024 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Web3](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sol] [nvarchar](50) NULL,
	[Sag] [nvarchar](50) NULL,
	[SaatlikKazanc] [int] NOT NULL,
	[YukseltmeMaliyeti] [int] NOT NULL,
	[Sonuc] [decimal](18, 2) NOT NULL,
	[KullaniciId] [int] NOT NULL,
 CONSTRAINT [PK_Web3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yetki]    Script Date: 30.11.2024 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yetki](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YetkiAdi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Yetki] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([Id], [Ad], [Soyad], [KullaniciAdi], [Sifre], [Yetki], [KayitTarihi]) VALUES (1, N'Ali', N'Çiftçi', N'alicftci', N'12345', 1, CAST(N'2024-08-08T02:06:32.640' AS DateTime))
INSERT [dbo].[Kullanici] ([Id], [Ad], [Soyad], [KullaniciAdi], [Sifre], [Yetki], [KayitTarihi]) VALUES (9, N'Deneme', N'Çiftçi', N'deneme', N'123456', 2, CAST(N'2024-08-07T15:25:45.560' AS DateTime))
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[Legal] ON 

INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (1, N'KYC', NULL, 54, 2099999999, CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (2, N'Legal opinion', NULL, 190, 4001113, CAST(4.75 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (3, N'Anti money loundering', NULL, 884, 12003340, CAST(7.36 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (4, N'Licence Europe', NULL, 2430, 50553069, CAST(4.81 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (5, N'Licence South America', NULL, 1230, 20005566, CAST(6.15 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (6, N'Licence North America', NULL, 3030, 40011132, CAST(7.57 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (7, N'Licence Japan', NULL, 7680, 83127259, CAST(9.24 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (8, N'Licence India', NULL, 7380, 74814534, CAST(9.86 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (9, N'Licence Indonesia', NULL, 14760, 166254519, CAST(8.88 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (10, N'Licence Turkey', NULL, 8860, 124690889, CAST(7.11 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (11, NULL, N'KYB', 190, 2000557, CAST(9.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (12, NULL, N'SEC transparancy', 177, 1995054, CAST(8.87 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (13, NULL, N'Licence UAE', 1770, 20005566, CAST(8.85 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (14, NULL, N'Licence Asia', 1170, 20005566, CAST(5.85 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (15, NULL, N'Licence Australia', 2300, 50553069, CAST(4.55 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (16, NULL, N'Licence Nigeria', 537, 6001670, CAST(8.95 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (17, NULL, N'Licence Ethiopia', 5310, 58189082, CAST(9.13 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (18, NULL, N'Licence Bangladesh', 10330, 116378163, CAST(8.88 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (19, NULL, N'Licence Vietnam', 11810, 141316341, CAST(8.36 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (20, NULL, N'Licence Philippines', 19190, 249381778, CAST(7.70 AS Decimal(18, 2)), 1)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (21, N'KYC', NULL, 30, 166255, CAST(18.04 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (22, N'Legal opinion', NULL, 166, 725363, CAST(22.89 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (23, N'Anti money loundering', NULL, 827, 4987636, CAST(16.58 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (24, N'Licence Europe', NULL, 2270, 20005566, CAST(11.35 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (25, N'Licence South America', NULL, 1080, 3626815, CAST(29.78 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (26, N'Licence North America', NULL, 2650, 7253630, CAST(36.53 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (27, N'Licence Japan', NULL, 7170, 36268148, CAST(19.77 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (28, N'Licence India', NULL, 6900, 32641333, CAST(21.14 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (29, N'Licence Indonesia', NULL, 13800, 72536296, CAST(19.02 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (30, N'Licence Turkey', NULL, 7740, 24922285, CAST(31.06 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (31, NULL, N'KYB', 177, 831273, CAST(21.29 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (32, NULL, N'SEC transparancy', 166, 870436, CAST(19.07 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (33, NULL, N'Licence UAE', 1650, 8312726, CAST(19.85 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (34, NULL, N'Licence Asia', 1020, 3626815, CAST(28.12 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (35, NULL, N'Licence Australia', 2010, 8312726, CAST(24.18 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (36, NULL, N'Licence Nigeria', 502, 2493818, CAST(20.13 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (37, NULL, N'Licence Ethiopia', 4970, 25387704, CAST(19.58 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (38, NULL, N'Licence Bangladesh', 9020, 23260799, CAST(38.78 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (39, NULL, N'Licence Vietnam', 10310, 28245256, CAST(36.50 AS Decimal(18, 2)), 9)
INSERT [dbo].[Legal] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (40, NULL, N'Licence Philippines', 16760, 49844569, CAST(33.62 AS Decimal(18, 2)), 9)
SET IDENTITY_INSERT [dbo].[Legal] OFF
GO
SET IDENTITY_INSERT [dbo].[Markets] ON 

INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (1, N'Fan tokens', NULL, 3000, 40011132, CAST(7.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (2, N'BTC pairs', NULL, 135, 2527653, CAST(5.34 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (3, N'Top 10 cmc pairs', NULL, 253, 4001113, CAST(6.32 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (4, N'Defi2.0 tokens', NULL, 126, 2000557, CAST(6.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (5, N'Meme coins', NULL, 325, 3325090, CAST(9.77 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (6, N'Margin trading x10', NULL, 869, 10002783, CAST(8.69 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (7, N'Margin trading x30', NULL, 1690, 35387149, CAST(4.78 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (8, N'Margin trading x75', NULL, 3720, 75829604, CAST(4.91 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (9, N'Derivatives', NULL, 1670, 25276535, CAST(6.61 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (10, N'Web3 integration', NULL, 2500, 26007236, CAST(9.61 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (11, N'P2P trading', NULL, 1230, 16804676, CAST(7.32 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (12, N'LayerZero Listing', NULL, 2840, 40011132, CAST(7.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (13, NULL, N'Staking', 2030, 35387149, CAST(5.74 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (14, NULL, N'ETH pairs', 126, 1200334, CAST(10.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (15, NULL, N'GameFi tokens', 221, 2000557, CAST(11.05 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (16, NULL, N'SocialFi tokens', 158, 2000557, CAST(7.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (17, NULL, N'Shit coins', 1860, 20005566, CAST(9.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (18, NULL, N'Margin trading x20', 1110, 10002783, CAST(11.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (19, NULL, N'Margin trading x50', 3480, 40011132, CAST(8.70 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (20, NULL, N'Margin trading x100', 3300, 50553069, CAST(6.53 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (21, NULL, N'Prediction markets', 1170, 17693574, CAST(6.61 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (22, NULL, N'DAO', 832, 26826469, CAST(3.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (23, NULL, N'Trading bots', 616, 8402338, CAST(7.33 AS Decimal(18, 2)), 1)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (25, N'Fan tokens', NULL, 2620, 7253630, CAST(36.12 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (26, N'BTC pairs', NULL, 118, 415636, CAST(28.39 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (27, N'Top 10 cmc pairs', NULL, 221, 725363, CAST(30.47 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (28, N'Defi2.0 tokens', NULL, 110, 362681, CAST(30.33 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (29, N'Meme coins', NULL, 303, 1450726, CAST(20.89 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (30, N'Margin trading x10', NULL, 812, 4156363, CAST(19.54 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (31, N'Margin trading x30', NULL, 1580, 14003896, CAST(11.28 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (32, N'Margin trading x75', NULL, 3250, 12469089, CAST(26.06 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (33, N'Derivatives', NULL, 1460, 4156363, CAST(35.13 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (34, N'Web3 integration', NULL, 2330, 10806544, CAST(21.56 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (35, N'P2P trading', NULL, 1070, 3046524, CAST(35.12 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (36, N'LayerZero Listing', NULL, 2480, 7253630, CAST(34.19 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (37, NULL, N'Staking', 1900, 14003896, CAST(13.57 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (38, NULL, N'ETH pairs', 126, 1200334, CAST(10.50 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (39, NULL, N'GameFi tokens', 221, 2000557, CAST(11.05 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (40, NULL, N'SocialFi tokens', 138, 362681, CAST(38.05 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (41, NULL, N'Shit coins', 1740, 8312726, CAST(20.93 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (42, NULL, N'Margin trading x20', 1030, 4156363, CAST(24.78 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (43, NULL, N'Margin trading x50', 3250, 16625452, CAST(19.55 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (44, NULL, N'Margin trading x100', 2880, 8312726, CAST(34.65 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (45, NULL, N'Prediction markets', 1170, 17693574, CAST(6.61 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (46, NULL, N'DAO', 777, 10110614, CAST(7.68 AS Decimal(18, 2)), 9)
INSERT [dbo].[Markets] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (47, NULL, N'Trading bots', 576, 3491345, CAST(16.50 AS Decimal(18, 2)), 9)
SET IDENTITY_INSERT [dbo].[Markets] OFF
GO
SET IDENTITY_INSERT [dbo].[PR&Team] ON 

INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (1, N'CEO', NULL, 316, 4001113, CAST(7.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (2, N'IT team', NULL, 758, 8002226, CAST(9.47 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (3, N'HamsterBook', NULL, 221, 2000557, CAST(11.05 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (4, N'X', NULL, 270, 5560838, CAST(4.86 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (5, N'HamsterGram', NULL, 158, 2000557, CAST(7.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (6, N'Coindesk', NULL, 253, 4001113, CAST(6.32 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (7, N'Partnership program', NULL, 237, 5055307, CAST(4.69 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (8, N'BisDev team', NULL, 158, 2000557, CAST(7.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (9, N'UX and UI team', NULL, 591, 7684067, CAST(7.69 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (10, N'QA team', NULL, 642, 12891033, CAST(4.98 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (11, N'Risk manegement team', NULL, 837, 8002226, CAST(10.46 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (12, N'Anonymous transactions ban', NULL, 1010, 9099552, CAST(11.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (13, N'Tokenomics expert', NULL, 1580, 20005566, CAST(7.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (14, N'VC labs', NULL, 1480, 25769450, CAST(5.74 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (15, N'Welcome to Amsterdam', NULL, 1100, 30331842, CAST(3.63 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (16, NULL, N'Marketing', 221, 4001113, CAST(5.52 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (17, NULL, N'Support team', 221, 3000835, CAST(7.36 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (18, NULL, N'HamsterTube', 304, 6066368, CAST(5.01 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (19, NULL, N'Cointelegraph', 145, 9389264, CAST(1.54 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (20, NULL, N'TikTok', 316, 3000835, CAST(10.53 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (21, NULL, N'Influencers', 913, 25276535, CAST(3.61 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (22, NULL, N'Product team', 316, 4001113, CAST(7.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (23, NULL, N'Two factor authentication', 395, 4001113, CAST(9.87 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (24, NULL, N'Security team', 723, 26826469, CAST(2.70 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (25, NULL, N'Antihacking shield', 347, 8002226, CAST(4.34 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (26, NULL, N'Security Audition', 295, 4987636, CAST(5.91 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (27, NULL, N'Blocking suspicious accounts', 505, 5001392, CAST(10.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (28, NULL, N'Consensus Explorer pass', 4430, 41563630, CAST(10.66 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (29, NULL, N'Compliance officer', 354, 5818908, CAST(6.08 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (30, NULL, N'Development Hub Mumbai', 11810, 149629067, CAST(7.89 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (31, N'Data Center Tokyo', NULL, 19190, 332509038, CAST(5.77 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (32, NULL, N'Leaderboards', 2210, 33250904, CAST(6.65 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (34, N'Minigame', NULL, 2760, 29014518, CAST(9.51 AS Decimal(18, 2)), 1)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (35, N'CEO', NULL, 316, 4001113, CAST(7.90 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (36, N'IT team', NULL, 709, 3325090, CAST(21.32 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (37, N'HamsterBook', NULL, 207, 831273, CAST(24.90 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (38, N'X', NULL, 236, 914400, CAST(25.81 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (39, N'HamsterGram', NULL, 158, 2000557, CAST(7.90 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (40, N'Coindesk', NULL, 221, 725363, CAST(30.47 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (41, N'Partnership program', NULL, 207, 831273, CAST(24.90 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (42, N'BisDev team', NULL, 138, 362681, CAST(38.05 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (43, N'UX and UI team', NULL, 553, 3040846, CAST(18.19 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (44, N'QA team', NULL, 561, 2119745, CAST(26.47 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (45, N'Risk manegement team', NULL, 782, 3325090, CAST(23.52 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (46, N'Anonymous transactions ban', NULL, 948, 3601002, CAST(26.33 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (47, N'Tokenomics expert', NULL, 1480, 8312726, CAST(17.80 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (48, N'VC labs', NULL, 1380, 11243126, CAST(12.27 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (49, N'Welcome to Amsterdam', NULL, 959, 4987636, CAST(19.23 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (50, NULL, N'Marketing', 207, 1662545, CAST(12.45 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (51, NULL, N'Support team', 193, 544022, CAST(35.48 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (52, NULL, N'HamsterTube', 284, 2400668, CAST(11.83 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (53, NULL, N'Cointelegraph', 135, 3538715, CAST(3.81 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (54, NULL, N'TikTok', 295, 1246909, CAST(23.66 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (55, NULL, N'Influencers', 797, 4156363, CAST(19.18 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (56, NULL, N'Product team', 295, 1662545, CAST(17.74 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (57, NULL, N'Two factor authentication', 369, 1662545, CAST(22.19 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (58, NULL, N'Security team', 723, 26826469, CAST(2.70 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (59, NULL, N'Antihacking shield', 303, 1450726, CAST(20.89 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (60, NULL, N'Security Audition', 276, 2176089, CAST(12.68 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (61, NULL, N'Blocking suspicious accounts', 472, 2078181, CAST(22.71 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (62, NULL, N'Consensus Explorer pass', 4140, 18134074, CAST(22.83 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (63, NULL, N'Compliance officer', 331, 2538770, CAST(13.04 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (64, NULL, N'Development Hub Mumbai', 10310, 29906742, CAST(34.47 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (65, N'Data Center Tokyo', NULL, 16760, 66459426, CAST(25.22 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (66, NULL, N'Leaderboards', 1930, 6645943, CAST(29.04 AS Decimal(18, 2)), 9)
INSERT [dbo].[PR&Team] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (67, N'Minigame', NULL, 2410, 6393624, CAST(37.69 AS Decimal(18, 2)), 9)
SET IDENTITY_INSERT [dbo].[PR&Team] OFF
GO
SET IDENTITY_INSERT [dbo].[Specials] ON 

INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (1, 71, N'HamsterStore launch', NULL, NULL, 14760, 157941793, CAST(9.35 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (2, 74, N'X Network 10 Million', NULL, NULL, 1260, 28007793, CAST(4.50 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (3, 174, NULL, NULL, N'Hamster Green energy', 6760, 171880436, CAST(3.93 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (4, 175, NULL, NULL, N'TG Leaders', 7270, 88024491, CAST(8.26 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (5, 176, NULL, NULL, N'Hamster Kombat merch', 295, 4987636, CAST(5.91 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (6, 177, NULL, NULL, N'Consensus Piranha Pass', 5610, 83127259, CAST(6.75 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (7, 78, N'Web3 academy launch', NULL, NULL, 4740, 44012246, CAST(10.77 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (8, 79, N'Hamster YouTube Channel', NULL, NULL, 904, 40239703, CAST(2.25 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (9, 80, N'Top 10 Global Ranking', NULL, NULL, 3790, 40011132, CAST(9.47 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (10, 81, N'Special Hamster Conference', NULL, NULL, 3040, 50553069, CAST(6.01 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (11, 82, N'There are two chairs…', NULL, NULL, 5900, 83127259, CAST(7.10 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (12, 83, N'Villa for the Dev team', NULL, NULL, 1520, 20221228, CAST(7.52 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (13, 84, N'Bagdanoff is calling', NULL, NULL, 1500, 20005566, CAST(7.50 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (14, 73, N'CX Hub Istanbul', NULL, NULL, 8860, 91439985, CAST(9.69 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (15, 173, NULL, NULL, N'Hamsters break records', 6630, 79920300, CAST(8.30 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (17, 75, N'Youtube 25 Million', NULL, NULL, 6630, 72020038, CAST(9.21 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (18, 76, N'Premarket Launch', NULL, NULL, 19340, 332297129, CAST(5.82 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (19, 77, N'TON + Hamster Kombat = Success', NULL, NULL, 12050, 159840601, CAST(7.54 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (20, 178, NULL, NULL, N'YouTube Gold Button', 995, 67066171, CAST(1.48 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (21, 179, NULL, NULL, N'Bitcoin, Pizza Day', 338, 10110614, CAST(3.34 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (22, 180, NULL, NULL, N'NFT Collection Launch', 3790, 68018925, CAST(5.57 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (23, 181, NULL, NULL, N'Short squeeze', 2950, 58189082, CAST(5.07 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (24, 182, NULL, NULL, N'Long squeeze', 6320, 120033397, CAST(5.27 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (25, 183, NULL, NULL, N'Apps Center Listing', 3160, 60016698, CAST(5.27 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (26, 184, NULL, NULL, N'USDT on TON', 4260, 40011132, CAST(10.65 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (30, 172, NULL, NULL, N'Business jet', 4500, 44801476, CAST(10.04 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (31, 72, N'Call for BTC to rise', NULL, NULL, 9840, 119199503, CAST(8.26 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (32, 171, NULL, NULL, N'HamsterWatch for soulmate', 1970, 23839901, CAST(8.26 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (42, 170, NULL, NULL, N'50M Telegram channel', 2760, 36268148, CAST(7.61 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (46, 70, N'Hamster Analytics', NULL, NULL, 5520, 54402222, CAST(10.15 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (60, 194, NULL, NULL, N'Fight fight fight', 21050, 64219554, CAST(32.78 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (62, 93, N'Strategic session in Australia', NULL, NULL, 9030, 33229713, CAST(27.17 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (63, 100, N'Sport integration', NULL, NULL, 5900, 834397, CAST(707.10 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (64, 99, N'Sport integration', NULL, NULL, 8860, 58189082, CAST(15.23 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (65, 98, N'Quarterfinals are coming', NULL, NULL, 8280, 25387704, CAST(32.61 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (66, 97, N'Only 4 best left', NULL, NULL, 8280, 25387704, CAST(32.61 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (67, 96, N'Semi-final England vs Netherlands', NULL, NULL, 8860, 58189082, CAST(15.23 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (68, 195, NULL, NULL, N'Percussion taps', 4140, 14507259, CAST(28.54 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (69, 169, NULL, NULL, N'Telegram Miniapp Launch', 2950, 41563630, CAST(7.10 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (70, 200, NULL, NULL, N'Sports integration', 8280, 25387704, CAST(32.61 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (71, 199, NULL, NULL, N'Riyadh Masters 2024', 8860, 58189082, CAST(15.23 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (72, 198, NULL, NULL, N'Quarterfinals are coming', 8860, 58189082, CAST(15.23 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (73, 197, NULL, NULL, N'Semi-final Spain vs France', 8280, 25387704, CAST(32.61 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (74, 196, NULL, NULL, N'Final England vs Spain', 5160, 299500, CAST(1722.87 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (75, 95, N'Web3 Game Con', NULL, NULL, 3310, 21760889, CAST(15.21 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (76, 94, N'250M Hamster players', NULL, NULL, 4430, 33250904, CAST(13.32 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (77, 193, NULL, NULL, N'Kamala is calling', 10330, 83127259, CAST(12.43 AS Decimal(18, 2)), CAST(N'2024-07-31T14:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (78, 69, N'Telegram Stars integration', NULL, NULL, 2360, 28263268, CAST(8.35 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (79, 92, N'Bitcoin Conference 2024', NULL, NULL, 8000, 43521778, CAST(18.38 AS Decimal(18, 2)), CAST(N'2024-08-01T14:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (80, 192, NULL, NULL, N'The water is clear', 8860, 58189082, CAST(15.23 AS Decimal(18, 2)), CAST(N'2024-07-28T07:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (81, 91, N'Carry it like it''s hot', NULL, NULL, 5520, 36268148, CAST(15.22 AS Decimal(18, 2)), CAST(N'2024-08-02T20:30:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (92, 168, NULL, NULL, N'HamsterBank', 56090, 498763557, CAST(11.25 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (95, 30, N'HamsterStore launch', NULL, NULL, 12890, 31568227, CAST(40.83 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (96, 85, NULL, NULL, N'X Network 10 Million', 1100, 5077541, CAST(21.66 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (97, 35, N'Hamster Green energy', NULL, NULL, 5900, 28263268, CAST(20.88 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (98, 36, N'TG Leaders', NULL, NULL, 7270, 88024491, CAST(8.26 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (99, 37, N'Hamster Kombat merch', NULL, NULL, 276, 2176089, CAST(12.68 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (100, 38, N'Consensus Piranha Pass', NULL, NULL, 4900, 16614856, CAST(29.49 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (101, 39, N'Web3 academy launch', NULL, NULL, 4430, 18287997, CAST(24.22 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (102, 40, N'Hamster YouTube Channel', NULL, NULL, 845, 15165921, CAST(5.57 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (103, 41, N'Top 10 Global Ranking', NULL, NULL, 3790, 40011132, CAST(9.47 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (104, 42, N'Special Hamster Conference', NULL, NULL, 2840, 20005566, CAST(14.20 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (105, 43, N'There are two chairs…', NULL, NULL, 5160, 16614856, CAST(31.06 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (106, 44, N'Villa for the Dev team', NULL, NULL, 1420, 8002226, CAST(17.75 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (107, 45, N'Bagdanoff is calling', NULL, NULL, 1310, 3626815, CAST(36.12 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (108, 33, N'CX Hub Istanbul', NULL, NULL, 8280, 39894963, CAST(20.75 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (109, 84, NULL, NULL, N'Hamsters break records', 5790, 21406518, CAST(27.05 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (110, 86, NULL, NULL, N'Youtube 25 Million', 6630, 72020038, CAST(9.21 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (111, 87, NULL, NULL, N'Premarket Launch', 15790, 42813036, CAST(36.88 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (112, 88, NULL, NULL, N'TON + Hamster Kombat = Success', 10520, 42813036, CAST(24.57 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (113, 89, NULL, NULL, N'YouTube Gold Button', 929, 25276535, CAST(3.68 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (114, 90, NULL, NULL, N'Bitcoin, Pizza Day', 316, 4001113, CAST(7.90 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (115, 91, NULL, NULL, N'NFT Collection Launch', 3540, 28263268, CAST(12.53 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (116, 92, NULL, NULL, N'Short squeeze', 2580, 11630400, CAST(22.18 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (117, 93, NULL, NULL, N'Long squeeze', 5520, 21760889, CAST(25.37 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (118, 94, NULL, NULL, N'Apps Center Listing', 2760, 10880444, CAST(25.37 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (119, 95, NULL, NULL, N'USDT on TON', 3990, 16625452, CAST(24.00 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (120, 82, NULL, NULL, N'Business jet', 3210, 13230000, CAST(24.26 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (121, 31, N'Call for BTC to rise', NULL, NULL, 7010, 13266489, CAST(52.84 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (122, 81, NULL, NULL, N'HamsterWatch for soulmate', 1610, 5516015, CAST(29.19 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (123, 29, N'50M Telegram channel', NULL, NULL, 2410, 7992030, CAST(30.16 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (124, 79, NULL, NULL, N'Hamster Analytics', 4820, 11988045, CAST(40.21 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (125, 80, NULL, NULL, N'Fight fight fight', 21050, 64219554, CAST(32.78 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (126, 28, N'Strategic session in Australia', NULL, NULL, 9030, 33229713, CAST(27.17 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (127, 100, NULL, NULL, N'Sport integration', 5900, 834397, CAST(707.10 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (128, 99, NULL, NULL, N'Sport integration', 8860, 58189082, CAST(15.23 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (129, 98, NULL, NULL, N'Quarterfinals are coming', 8280, 25387704, CAST(32.61 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (130, 97, NULL, NULL, N'Only 4 best left', 8280, 25387704, CAST(32.61 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (131, 96, NULL, NULL, N'Semi-final England vs Netherlands', 8860, 58189082, CAST(15.23 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (132, 83, NULL, NULL, N'Percussion taps', 4140, 14507259, CAST(28.54 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (133, 78, NULL, NULL, N'Telegram Miniapp Launch', 2580, 8307428, CAST(31.06 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (134, 50, N'Sports integration', NULL, NULL, 8280, 25387704, CAST(32.61 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (135, 49, N'Riyadh Masters 2024', NULL, NULL, 8860, 58189082, CAST(15.23 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (136, 48, N'Quarterfinals are coming', NULL, NULL, 8860, 58189082, CAST(15.23 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (137, 47, N'Semi-final Spain vs France', NULL, NULL, 8280, 25387704, CAST(32.61 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (138, 46, N'Final England vs Spain', NULL, NULL, 5160, 299500, CAST(1722.87 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (139, 34, N'Web3 Game Con', NULL, NULL, 3310, 21760889, CAST(15.21 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (140, 32, N'250M Hamster players', NULL, NULL, 4430, 33250904, CAST(13.32 AS Decimal(18, 2)), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (141, 26, N'Kamala is calling', NULL, NULL, 9030, 16614856, CAST(54.35 AS Decimal(18, 2)), CAST(N'2024-07-31T14:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (142, 27, N'Telegram Stars integration', NULL, NULL, 2060, 5649051, CAST(36.47 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (143, 76, NULL, NULL, N'Bitcoin Conference 2024', 7480, 19937828, CAST(37.52 AS Decimal(18, 2)), CAST(N'2024-08-01T14:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (144, 24, N'Hamsterlar suyun saflığını test etti', NULL, NULL, 8280, 25387704, CAST(32.61 AS Decimal(18, 2)), CAST(N'2024-07-28T07:00:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (145, 25, N'Carry it like it''s hot', NULL, NULL, 4820, 7992030, CAST(60.31 AS Decimal(18, 2)), CAST(N'2024-08-02T20:30:00.000' AS DateTime), 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (146, 77, NULL, NULL, N'HamsterBank', 32650, 2567145, CAST(1271.84 AS Decimal(18, 2)), NULL, 9)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (152, 191, NULL, NULL, N'Ethereum birthday', 6900, 65282666, CAST(10.57 AS Decimal(18, 2)), CAST(N'2024-08-06T14:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (153, 90, N'This is fine', NULL, NULL, 8860, 58189082, CAST(15.23 AS Decimal(18, 2)), CAST(N'2024-08-02T14:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (163, 190, NULL, NULL, N'Games in Paris', 8860, 58189082, CAST(15.23 AS Decimal(18, 2)), CAST(N'2024-08-06T23:59:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (164, 68, N'HamsterGPT', NULL, NULL, 5310, 91439985, CAST(5.81 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (165, 167, NULL, NULL, N'Sleeping hamster', 1770, 24938178, CAST(7.10 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (166, 67, N'Healthy nutrition hamster', NULL, NULL, 2360, 28263268, CAST(8.35 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (167, 166, NULL, NULL, N'Gym hamster', 1480, 19950542, CAST(7.42 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (168, 89, N'TON listing on Binance', NULL, NULL, 6900, 65282666, CAST(10.57 AS Decimal(18, 2)), CAST(N'2024-08-15T13:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (169, 66, N'University hamster', NULL, NULL, 3250, 38238539, CAST(8.50 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (171, 165, NULL, NULL, N'Vipassana hamster', 1900, 36010019, CAST(5.28 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (172, 189, NULL, NULL, N'Finals are approaching', 11810, 83127259, CAST(14.21 AS Decimal(18, 2)), CAST(N'2024-08-12T23:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (173, 65, N'Hamster helps whales', NULL, NULL, 6320, 124034510, CAST(5.10 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (174, 164, NULL, NULL, N'Hamster with friends', 886, 8312726, CAST(10.66 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (175, 88, N'11 years Telegram', NULL, NULL, 34750, 444123568, CAST(7.82 AS Decimal(18, 2)), CAST(N'2024-08-21T16:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (176, 188, NULL, NULL, N'Investing in gold', 8860, 58189082, CAST(15.23 AS Decimal(18, 2)), CAST(N'2024-08-18T11:59:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (185, 87, N'Energy investments', NULL, NULL, 51570, 49844569, CAST(103.46 AS Decimal(18, 2)), CAST(N'2024-08-26T11:59:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (186, 64, N'Communication with a mentor', NULL, NULL, 2950, 41563630, CAST(7.10 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (187, 163, NULL, NULL, N'Company development planning', 2360, 24938178, CAST(9.46 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (188, 63, N'Negotiations with partners', NULL, NULL, 5900, 74814534, CAST(7.89 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (189, 162, NULL, NULL, N'Speaking on a TV show', 2660, 33250904, CAST(8.00 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (190, 62, N'Electric car production', NULL, NULL, 5520, 54402222, CAST(10.15 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (191, 161, NULL, NULL, N'Launching a rocket to Mars', 8280, 108804444, CAST(7.61 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (192, 187, NULL, NULL, N'Business skills', 51570, 49844569, CAST(103.46 AS Decimal(18, 2)), CAST(N'2024-09-02T11:59:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (193, 160, NULL, NULL, N'Collection of vintage cars', 5900, 91439985, CAST(6.45 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (194, 61, N'Investments in farming', NULL, NULL, 12640, 240066794, CAST(5.27 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (195, 159, NULL, NULL, N'Speaking to employees', 1180, 16625452, CAST(7.10 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (196, 60, N'Setting up business processes', NULL, NULL, 2360, 28263268, CAST(8.35 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (197, 158, NULL, NULL, N'Hiring employees', 4430, 58189082, CAST(7.61 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (198, 59, N'Hotel construction', NULL, NULL, 11060, 180050095, CAST(6.14 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (199, 86, N'Largest diamond', NULL, NULL, 4110, 120033397, CAST(3.42 AS Decimal(18, 2)), CAST(N'2024-09-10T18:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (200, 186, NULL, NULL, N'CEOs moves confidently', 9480, 140038963, CAST(6.77 AS Decimal(18, 2)), CAST(N'2024-09-07T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (201, 157, NULL, NULL, N'Telegram top ever', 8860, 88114895, CAST(10.06 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (202, 85, N'Hamster on vacation', NULL, NULL, 9480, 140038963, CAST(6.77 AS Decimal(18, 2)), CAST(N'2024-09-11T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (203, 58, N'HamsterPhone 16', NULL, NULL, 14760, 266007230, CAST(5.55 AS Decimal(18, 2)), CAST(N'2024-09-17T14:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (204, 185, NULL, NULL, N'Hamster Investor', 19310, 54402222, CAST(35.49 AS Decimal(18, 2)), CAST(N'2024-09-12T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (205, 57, N'Best Restaurant', NULL, NULL, 9480, 140038963, CAST(6.77 AS Decimal(18, 2)), CAST(N'2024-09-15T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (206, 156, NULL, NULL, N'Youtube 1B views', 8860, 166254519, CAST(5.33 AS Decimal(18, 2)), CAST(N'2024-09-19T14:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (207, 155, NULL, NULL, N'OKX listing', 10330, 124690889, CAST(8.28 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (208, 56, N'Bybit listing', NULL, NULL, 10330, 124690889, CAST(8.28 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (209, 154, NULL, NULL, N'Binance listing', 10330, 124690889, CAST(8.28 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (210, 55, N'Chihuahua pet', NULL, NULL, 10140, 353871485, CAST(2.87 AS Decimal(18, 2)), CAST(N'2024-09-18T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (211, 153, NULL, NULL, N'Feat with a star', 1050, 642196, CAST(163.50 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Specials] ([Id], [SiraNo], [Sol], [Orta], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [GeriSayim], [KullaniciId]) VALUES (212, 54, N'Water on Mars', NULL, NULL, 631, 513756, CAST(122.82 AS Decimal(18, 2)), NULL, 1)
SET IDENTITY_INSERT [dbo].[Specials] OFF
GO
SET IDENTITY_INSERT [dbo].[Web3] ON 

INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (1, N'DEX', NULL, 8860, 124690889, CAST(7.11 AS Decimal(18, 2)), 1)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (2, NULL, N'Oracle', 2360, 29094541, CAST(8.11 AS Decimal(18, 2)), 1)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (3, N'Vesting Smartcontracts', NULL, 3310, 29739881, CAST(11.13 AS Decimal(18, 2)), 1)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (4, NULL, N'Launchpad', 8860, 157941793, CAST(5.61 AS Decimal(18, 2)), 1)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (6, N'NFT Marketplace', NULL, 5520, 56578311, CAST(9.76 AS Decimal(18, 2)), 1)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (8, N'DEX', NULL, 7740, 24922285, CAST(31.06 AS Decimal(18, 2)), 9)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (9, NULL, N'Oracle', 2060, 5815200, CAST(35.42 AS Decimal(18, 2)), 9)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (10, N'Vesting Smartcontracts', NULL, 3090, 13624182, CAST(22.68 AS Decimal(18, 2)), 9)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (11, NULL, N'Launchpad', 7740, 31568227, CAST(24.52 AS Decimal(18, 2)), 9)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (12, N'NFT Marketplace', NULL, 5160, 25919176, CAST(19.91 AS Decimal(18, 2)), 9)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (16, NULL, N'Grant for Developers', 11810, 166254519, CAST(7.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (17, N'NFT Metaverse', NULL, 4820, 79920300, CAST(6.03 AS Decimal(18, 2)), 1)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (18, NULL, N'Crypto Farming', 8280, 108804444, CAST(7.61 AS Decimal(18, 2)), 1)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (19, N'Sport Collectibles Marketplace', NULL, 2070, 24938178, CAST(8.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (20, NULL, N'Market Making', 1770, 28263268, CAST(6.26 AS Decimal(18, 2)), 1)
INSERT [dbo].[Web3] ([Id], [Sol], [Sag], [SaatlikKazanc], [YukseltmeMaliyeti], [Sonuc], [KullaniciId]) VALUES (21, N'Web3 Advertising Platform', NULL, 1180, 21613087, CAST(5.46 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Web3] OFF
GO
SET IDENTITY_INSERT [dbo].[Yetki] ON 

INSERT [dbo].[Yetki] ([Id], [YetkiAdi]) VALUES (1, N'Admin')
INSERT [dbo].[Yetki] ([Id], [YetkiAdi]) VALUES (2, N'Kullanıcı')
SET IDENTITY_INSERT [dbo].[Yetki] OFF
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Yetki] FOREIGN KEY([Yetki])
REFERENCES [dbo].[Yetki] ([Id])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_Yetki]
GO
ALTER TABLE [dbo].[Legal]  WITH CHECK ADD  CONSTRAINT [FK_Legal_Kullanici] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanici] ([Id])
GO
ALTER TABLE [dbo].[Legal] CHECK CONSTRAINT [FK_Legal_Kullanici]
GO
ALTER TABLE [dbo].[Markets]  WITH CHECK ADD  CONSTRAINT [FK_Markets_Kullanici] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanici] ([Id])
GO
ALTER TABLE [dbo].[Markets] CHECK CONSTRAINT [FK_Markets_Kullanici]
GO
ALTER TABLE [dbo].[PR&Team]  WITH CHECK ADD  CONSTRAINT [FK_PR&Team_Kullanici] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanici] ([Id])
GO
ALTER TABLE [dbo].[PR&Team] CHECK CONSTRAINT [FK_PR&Team_Kullanici]
GO
ALTER TABLE [dbo].[Specials]  WITH CHECK ADD  CONSTRAINT [FK_Specials_Kullanici] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanici] ([Id])
GO
ALTER TABLE [dbo].[Specials] CHECK CONSTRAINT [FK_Specials_Kullanici]
GO
ALTER TABLE [dbo].[Web3]  WITH CHECK ADD  CONSTRAINT [FK_Web3_Kullanici] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanici] ([Id])
GO
ALTER TABLE [dbo].[Web3] CHECK CONSTRAINT [FK_Web3_Kullanici]
GO
