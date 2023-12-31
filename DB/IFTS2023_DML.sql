INSERT INTO [dbo].[Banche]
           ([Nome])
     VALUES
           ('Credit Agricole');

INSERT INTO [dbo].[Banche]
           ([Nome])
     VALUES
           ('Che Banca!');

INSERT INTO [dbo].[Banche]
           ([Nome])
     VALUES
           ('Intesa San Paolo');

INSERT INTO [dbo].[Banche]
           ([Nome])
     VALUES
           ('BPM');
	   
INSERT INTO [dbo].[Banche]
           ([Nome])
     VALUES
           ('Fineco');


INSERT INTO [dbo].[Utenti]
           ([IdBanca]
           ,[NomeUtente]
           ,[Password]
           ,[Bloccato])     
     (SELECT b.Id 
           ,'dario'
           ,'dario'
           ,0 FROM BANCHE b WHERE b.Nome = 'Fineco');

INSERT INTO [dbo].[Utenti]
           ([IdBanca]
           ,[NomeUtente]
           ,[Password]
           ,[Bloccato])     
     (SELECT b.Id 
           ,'carlo'
           ,'carlo'
           ,0 FROM BANCHE b WHERE b.Nome = 'Intesa San Paolo');


INSERT INTO [dbo].[Utenti]
           ([IdBanca]
           ,[NomeUtente]
           ,[Password]
           ,[Bloccato])     
     (SELECT b.Id 
           ,'sara'
           ,'sara'
           ,0 FROM BANCHE b WHERE b.Nome = 'Credit Agricole');


INSERT INTO [dbo].[Utenti]
           ([IdBanca]
           ,[NomeUtente]
           ,[Password]
           ,[Bloccato])     
     (SELECT b.Id 
           ,'anna'
           ,'anna'
           ,0 FROM BANCHE b WHERE b.Nome = 'Che Banca!');


INSERT INTO [dbo].[Utenti]
           ([IdBanca]
           ,[NomeUtente]
           ,[Password]
           ,[Bloccato])     
     (SELECT b.Id 
           ,'piero'
           ,'piero'
           ,0 FROM BANCHE b WHERE b.Nome = 'BPM');



INSERT INTO [dbo].ContiCorrente 
           ([IdUtente]
           ,[Saldo]
           )     
     (SELECT u.Id 
           ,5000
           FROM Utenti u WHERE u.NomeUtente = 'dario');

INSERT INTO [dbo].ContiCorrente 
           ([IdUtente]
           ,[Saldo]
           )     
     (SELECT u.Id 
           ,5000
		   FROM Utenti u WHERE u.NomeUtente = 'carlo');


INSERT INTO [dbo].ContiCorrente 
           ([IdUtente]
           ,[Saldo]
           )     
     (SELECT u.Id 
           ,50000
		   FROM Utenti u WHERE u.NomeUtente = 'anna');



INSERT INTO [dbo].ContiCorrente 
           ([IdUtente]
           ,[Saldo]
           )     
     (SELECT u.Id 
           ,75000
		   FROM Utenti u WHERE u.NomeUtente = 'sara');
		   
		   

INSERT INTO [dbo].ContiCorrente 
           ([IdUtente]
           ,[Saldo]
           )     
     (SELECT u.Id 
           ,910
		   FROM Utenti u WHERE u.NomeUtente = 'piero');
		   


INSERT INTO [dbo].[Funzionalita]
           ([Nome])
     VALUES
           ('Report Saldo');

INSERT INTO [dbo].[Funzionalita]
           ([Nome])
     VALUES
           ('Versamento');

INSERT INTO [dbo].[Funzionalita]
           ([Nome])
     VALUES
           ('Prelievo');

INSERT INTO [dbo].[Funzionalita]
           ([Nome])
     VALUES
           ('Registro Operazioni');


INSERT INTO [dbo].[Banche_Funzionalita]
           ([IdBanca]
           ,[IdFunzionalita])
     VALUES
           ((SELECT id FROM Banche WHERE Nome = 'Che Banca!')
           ,(SELECT id FROM Funzionalita WHERE Nome = 'Report Saldo'));

INSERT INTO [dbo].[Banche_Funzionalita]
           ([IdBanca]
           ,[IdFunzionalita])
     VALUES
           ((SELECT id FROM Banche WHERE Nome = 'Intesa San Paolo')
           ,(SELECT id FROM Funzionalita WHERE Nome = 'Prelievo'));

INSERT INTO [dbo].[Banche_Funzionalita]
           ([IdBanca]
           ,[IdFunzionalita])
     VALUES
           ((SELECT id FROM Banche WHERE Nome = 'BPM')
           ,(SELECT id FROM Funzionalita WHERE Nome = 'Prelievo'));

INSERT INTO [dbo].[Banche_Funzionalita]
           ([IdBanca]
           ,[IdFunzionalita])
     VALUES
           ((SELECT id FROM Banche WHERE Nome = 'BPM')
           ,(SELECT id FROM Funzionalita WHERE Nome = 'Report Saldo'));

INSERT INTO [dbo].[Banche_Funzionalita]
           ([IdBanca]
           ,[IdFunzionalita])
     VALUES
           ((SELECT id FROM Banche WHERE Nome = 'Fineco')
           ,(SELECT id FROM Funzionalita WHERE Nome = 'Report Saldo'));

INSERT INTO [dbo].[Banche_Funzionalita]
           ([IdBanca]
           ,[IdFunzionalita])
     VALUES
           ((SELECT id FROM Banche WHERE Nome = 'Fineco')
           ,(SELECT id FROM Funzionalita WHERE Nome = 'Prelievo'));

INSERT INTO [dbo].[Banche_Funzionalita]
           ([IdBanca]
           ,[IdFunzionalita])
     VALUES
           ((SELECT id FROM Banche WHERE Nome = 'Fineco')
           ,(SELECT id FROM Funzionalita WHERE Nome = 'Registro Operazioni'));


