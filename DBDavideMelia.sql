USE [BankomatV2]
GO
/****** Object:  Table [dbo].[Banche]    Script Date: 29/09/2023 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banche](
	[ID] [int] NOT NULL,
	[nome] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Banche] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContiCorrenti]    Script Date: 29/09/2023 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContiCorrenti](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[saldo] [float] NOT NULL,
	[utente] [nvarchar](20) NOT NULL,
	[banca] [int] NOT NULL,
 CONSTRAINT [PK_ContiCorrentii] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FunzionalitaBanca]    Script Date: 29/09/2023 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunzionalitaBanca](
	[Banca] [int] NOT NULL,
	[Funzionalita] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FunzionalitaExtra]    Script Date: 29/09/2023 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunzionalitaExtra](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[funzionalita] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FunzionalitaExtra] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transazioni]    Script Date: 29/09/2023 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transazioni](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [nvarchar](20) NOT NULL,
	[data] [datetime] NOT NULL,
	[contoCorrente] [int] NOT NULL,
	[ammontare] [float] NOT NULL,
 CONSTRAINT [PK_Transazioni] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utenti]    Script Date: 29/09/2023 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utenti](
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[nome] [nvarchar](50) NOT NULL,
	[cognome] [nvarchar](50) NOT NULL,
	[bloccato] [bit] NOT NULL,
 CONSTRAINT [PK_Utenti] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Utenti] ADD  CONSTRAINT [DF_Utenti_bloccato]  DEFAULT ((0)) FOR [bloccato]
GO
ALTER TABLE [dbo].[ContiCorrenti]  WITH CHECK ADD  CONSTRAINT [FK_ContiCorrentii_Banche] FOREIGN KEY([banca])
REFERENCES [dbo].[Banche] ([ID])
GO
ALTER TABLE [dbo].[ContiCorrenti] CHECK CONSTRAINT [FK_ContiCorrentii_Banche]
GO
ALTER TABLE [dbo].[ContiCorrenti]  WITH CHECK ADD  CONSTRAINT [FK_ContiCorrentii_Utenti] FOREIGN KEY([utente])
REFERENCES [dbo].[Utenti] ([username])
GO
ALTER TABLE [dbo].[ContiCorrenti] CHECK CONSTRAINT [FK_ContiCorrentii_Utenti]
GO
ALTER TABLE [dbo].[FunzionalitaBanca]  WITH CHECK ADD  CONSTRAINT [FK_FunzionalitaBanca_Banche] FOREIGN KEY([Banca])
REFERENCES [dbo].[Banche] ([ID])
GO
ALTER TABLE [dbo].[FunzionalitaBanca] CHECK CONSTRAINT [FK_FunzionalitaBanca_Banche]
GO
ALTER TABLE [dbo].[FunzionalitaBanca]  WITH CHECK ADD  CONSTRAINT [FK_FunzionalitaBanca_FunzionalitaExtra] FOREIGN KEY([Funzionalita])
REFERENCES [dbo].[FunzionalitaExtra] ([ID])
GO
ALTER TABLE [dbo].[FunzionalitaBanca] CHECK CONSTRAINT [FK_FunzionalitaBanca_FunzionalitaExtra]
GO
ALTER TABLE [dbo].[Transazioni]  WITH CHECK ADD  CONSTRAINT [FK_Transazioni_ContiCorrentii] FOREIGN KEY([contoCorrente])
REFERENCES [dbo].[ContiCorrenti] ([ID])
GO
ALTER TABLE [dbo].[Transazioni] CHECK CONSTRAINT [FK_Transazioni_ContiCorrentii]
GO
