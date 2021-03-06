USE [ETicaretDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12.02.2018 23:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 12.02.2018 23:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](250) NULL,
	[Description] [ntext] NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [int] NULL,
	[SmallPhotoPath] [nvarchar](500) NULL,
	[LargePhotoPath] [nvarchar](500) NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Bilgisayar ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Telefon')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Elektrikli Ev Aletleri')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Hobi')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'Spor')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (6, N'Fotoğraf')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (7, N'Kamera')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (8, N'Beyaz Eşya')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (9, N'Aksesuarlar')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (10, N'Televizyon')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (11, N'Saat')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (12, N'Ses Sistemleri')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (1, N'ASUS N552VW-FW149T i7-6700HQ 16G 1TB 128G SSD WIN10 NOTEBOOK', N'UltraBook', 4799.0000, 15, N'images/small/asus_small.jpg', N'images/large/asus_large.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (2, N'SAMSUNG GALAXY BOOK SM-W620 10.6" WİFİ SİYAH 2in1 NOTEBOOK', N'NoteBook', 2499.0000, 4, N'images/small/samsung_small.jpg', N'images/large/samsung_large.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (3, N'HP X360 11-P100NT W6X07EA 2 Si 1 ARADA NOTEBOOK', N'NoteBook', 1099.0000, 22, N'images/small/hp_small.jpg', N'images/large/hp_large.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (4, N'APPLE MMGG2TU/A MACBOOK AiR 13" i5/8GB/256GB SSD', N'MacBook', 5199.0000, 9, N'images/small/apple_small.jpg', N'images/large/apple_large.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (5, N'LENOVO YOGA 710 i7-7500U/8GB/256GB SSD/GeForce 940MX 2GB', N'Yoga', 4799.0000, 12, N'images/small/lenovo_small.jpg', N'images/large/lenovo_large.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (6, N'ACER ES1-131 NX.MYGEY.001 CEL N3050 2GB/32 GB EMMC/11.6"/W10 NOTEBOOK', N'Emmc', 799.0000, 52, N'images/small/acer_small.jpg', N'images/large/acer_large.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (7, N'APPLE IPHONE 6S PLUS 32GB SPACE GRAY  APPLE IPHONE 6S PLUS 32GB   
', N'Akıllı Telefon', 3499.0000, 23, N'images/small/apple_cep_small.jpg', N'images/large/apple_cep_large.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (8, N'SAMSUNG GALAXY S7 EDGE G935F GOLD AKILLI TELEFON', N'S7', 2999.0000, 70, N'images/small/samsung_cep_small.jpg', N'images/large/samsung_cep_large.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (9, N'SONY XPERIA XA ULTRA BEYAZ AKILLI TELEFON', N'Su Geçirmez', 1599.0000, 88, N'images/small/sony_small.jpg', N'images/large/sony_large.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (10, N'HUAWEI P10 SİYAH AKILLI TELEFON', N'Siyah', 3299.0000, 27, N'images/small/huawei_small.jpg', N'images/large/huawei_large.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (11, N'LENOVO K6 GOLD AKILLI TELEFON', N'Gold', 899.0000, 1312, N'images/small/lenovo_cep_small.jpg', N'images/large/lenovo_cep_large.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (12, N'CASPER VIA F1 64GB SiYAH AKILLI TELEFON', N'Via F1', 1899.0000, 299, N'images/small/casper_small.jpg', N'images/large/casper_large.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (13, N'REEDER P11 3GB /32GB SİYAH ÇİFT SİM AKILLI TELEFON', N'Çift Sim', 1299.0000, 134, N'images/small/reeder_small.jpg', N'images/large/reeder_large.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (14, N'TEFAL TEA EXPERT (CAM DEMLiK) ÇAY MAKiNESi', N'Cam Demlik', 249.0000, 188, N'images/small/tefal_small.jpg', N'images/large/tefal_large.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (15, N'SİNBO STM-5700 ELEKTRİKLİ ÇAY MAKİNESİ', N'Elektrikli', 79.9000, 200, N'images/small/sinbo_small.jpg', N'images/large/sinbo_large.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (16, N'DJI SPARK ALPINE WHITE DRONE', N'Drone', 2649.0000, 3, N'images/small/drone_small.jpg', N'images/large/drone_large.jpg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (17, N'HATTRICK MERCURE KOŞU BANDI O.EĞiM MP3 USB 3', N'Usb', 3199.0000, 1, N'images/small/kosuBandi_small.jpg', N'images/large/kosuBandi_large.jpg', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (18, N'ALTIS DC 20 SIYAH DOKUM CANTALI SET 20 KG', N'Set', 179.0000, 44, N'images/small/dambil_small.jpg', N'images/large/dambil_large.jpg', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (19, N'NIKON D7200 18-105MM VR KIT DiJiTAL FOTOĞRAF MAKiNESi', N'Dslr', 5939.0000, 2, N'images/small/nikon_small.jpg', N'images/large/nikon_large.jpg', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (20, N'CANON EOS5D MARKIII 24-105 KiT DiJiTAL FOTOĞRAF MAKiNESi', N'Eos', 14999.0000, 1, N'images/small/canon_small.jpg', N'images/large/canon_large.jpg', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (21, N'KODAK PIXPRO S-1 BEYAZ 16MP KOMPAKT SİSTEM DSLR FOTOĞRAF MAKİNASI', N'Kompakt', 2989.0000, 5, N'images/small/kodak_small.jpg', N'images/large/kodak_large.jpg', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (22, N'SONY HDR-CX405 9.2 MP 30X OPTIK ZOOM DIJITAL KAMERA', N'HD', 899.0000, 67, N'images/small/sony_cam_small.jpg', N'images/large/sony_cam_large.jpg', 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (23, N'SHARP T-SJ-XP700G/SL BUZDOLABI', N'Gri', 4049.0000, 2, N'images/small/sharp_small.jpg', N'images/large/sharp_large.jpg', 8)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (24, N'INCA WONDER IVR-01 VR GLASSES', N'Giyilebilir', 69.9000, 34, N'images/small/giyilebilir_small.jpg', N'images/large/giyilebilir_large.jpg', 9)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (25, N'VESTEL 49UA9600 4K ULTRA HD SLIM SMART DVB-T2/C/S2 LED TV', N'4K', 3099.0000, 25, N'images/small/vestel_small.jpg', N'images/large/vestel_large.jpg', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (26, N'SAMSUNG UE32J5373ASXTK FHD SMART LED TV', N'FHD', 1599.0000, 24, N'images/small/samsung_tv_small.jpg', N'images/large/samsung_tv_large.jpg', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (27, N'APPLE WATCH S1 42MM UZAY GRİSİ ALÜMİNYUM KASA', N'Kordon', 1349.0000, 55, N'images/small/apple_saat_small.jpg', N'images/large/apple_saat_large.jpg', 11)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitsInStock], [SmallPhotoPath], [LargePhotoPath], [CategoryID]) VALUES (28, N'SONY HT-CT390 2.1 300W SOUNDBAR EV SiNEMA SiSTEMi', N'HT', 899.0000, 48, N'images/small/sony_ses_small.jpg', N'images/large/sony_ses_large.jpg', 12)
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
