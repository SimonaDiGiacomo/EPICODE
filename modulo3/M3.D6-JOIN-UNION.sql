CREATE TABLE Studente (
MatricolaStudente INT,
Nome VARCHAR (25),
Città VARCHAR (25),
CONSTRAINT PK_MatricolaStudente PRIMARY KEY (MatricolaStudente))

CREATE TABLE Docente (
MatricolaDocente VARCHAR(25),
Nome VARCHAR (25),
CONSTRAINT PK_MatricolaDocente PRIMARY KEY (MatricolaDocente))

CREATE TABLE Corso (
CodiceCorso INT,
NomeCorso VARCHAR (25),
MatricolaDocente VARCHAR (25),
CONSTRAINT PK_CodiceCorso PRIMARY KEY (CodiceCorso),
CONSTRAINT FK_MatricolaDocente FOREIGN KEY (MatricolaDocente) REFERENCES Docente(MatricolaDocente))

CREATE TABLE Esame (
CodiceCorso INT,
MatricolaStudente INT,
Data DATE,
Voto INT,
SettoreScientifico VARCHAR (25),
CONSTRAINT FK_CodiceCorso FOREIGN KEY (CodiceCorso) REFERENCES Corso(CodiceCorso),
CONSTRAINT FK_MatricolaStudente FOREIGN KEY (MatricolaStudente) REFERENCES Studente(MatricolaStudente));

INSERT INTO Studente 
VALUES (1, 'Claudia Locci', 'Bologna'), (2, 'Michele Rossi', 'Cagliari'),  (3, 'Daniele Bianchi', 'Parma'),  (4, 'Rosa Viva', 'Reggio Emilia'),  (5, 'Gaia Peis', 'Oristano');

INSERT INTO Docente
VALUES ('BA002','Barbara Aghi'), ('DS001','Dario Sassi'), ('PI005','Piero Iva'), ('AT001','Agata Todi'), ('RG005','Rossano Giovi'), ('NR001','Nicola Rossi');

INSERT INTO Corso
VALUES (112056, 'Statistica','BA002'), (265610,'Economia Aziendale','DS001'), (832481,'Ragioneria Applicata','DS001'), (559561,'Diritto privato','PI005'), (594213,'Analisi 2','BA002'),
		(865045,'Diritto Bancario','PI005'), (526719,'Business English','AT001'), (327594,'Programmazione Controllo','DS001'), (203578,'Matematica finanziaria','RG005'), (396578,'Psicologia consumatore','NR001');

INSERT INTO Esame
VALUES 
(112056,2,'2022/02/01',22,'Statistica'), (265610,2,'2022/02/25',28,'Contabilità'), (832481,2,'2022/01/15',30,'Contabilità'),
(559561,2,'2022/06/03',25,'Diritto'),(594213,2,'2022/06/25',18,'Matematica'), (865045,2,'2022/07/17',25,'Diritto'),
(526719,2,'2023/01/15',27,'Inglese'),(327594,2,'2023/01/29',30,'Contabilità'), (203578,2,'2023/02/06',28,'Matematica'),
(396578,2,'2023/02/25',27,'Psicologia'), (112056,4,'2022/02/01',28,'Statistica'), (265610,4,'2022/02/25',25,'Contabilità'),
(832481,4,'2022/01/15',24,'Contabilità'), (559561,4,'2022/06/03',19,'Diritto'), (594213,4,'2022/06/25',23,'Matematica'),
(865045,4,'2022/07/17',21,'Diritto'),(526719,4,'2023/01/15',30,'Inglese'), (327594,4,'2023/01/29',29,'Contabilità'),
(203578,4,'2023/02/06',30,'Matematica'), (396578,4,'2023/02/25',27,'Psicologia'),(594213,1,'2022/06/25',30,'Matematica'),
(865045,1,'2022/07/17',30,'Diritto'), (526719,1,'2023/01/15',28,'Inglese'), (265610,3,'2022/02/25',27,'Contabilità'),
(832481,3,'2022/01/15',18,'Contabilità'),(396578, 3,'2023/02/25',20,'Psicologia'), (112056, 5,'2022/02/01',30,'Statistica'),
(265610,5,'2022/02/25',28,'Contabilità'),(832481,5,'2022/01/15',27,'Contabilità'), (559561,5,'2022/06/03',29,'Diritto'),
(594213,5,'2022/06/25',18,'Matematica'),(865045,5,'2022/07/17',21,'Diritto'), (526719,5,'2023/01/15',28,'Inglese'), (327594,5,'2023/01/29',25,'Contabilità'),
(203578,5,'2023/02/06',26,'Matematica');

/* 
 DATO IL SEGUENTE SCHEMA SCRIVERE LE INTERROGAZIONI DI SEGUITO:

 SRTUDENTE (MATRICOLA, Nome, Città)
 CORSO (CODICE, Nome, MatricolaDocente)
 DOCENTE (MATRICOLA, NOME)
 ESAME (CODICE, MATRICOLASTUDENTE, Data, Voto, SettoreScientifico)

*/

 /*A.1.Visualizzare per ogni studente la matricola, il nome, il voto massimo,
  minimo e medio conseguito negli esami*/

 SELECT
	 s.MatricolaStudente	 AS MatricolaStudente
	 ,s.Nome				 AS NomeStudente
	 ,MAX(e.Voto)			 AS VotoMassimo
	 ,MIN(e.Voto)			 AS VotoMinimo
	 ,AVG(e.Voto)			 AS VotoMedio
 FROM Studente s
 INNER JOIN Esame e
 ON s.MatricolaStudente = e.MatricolaStudente
 GROUP BY s.Nome, s.MatricolaStudente

 
 /*A.2.Visualizzare - per ogni studente con media voti maggiore a 25 e che ha sostenuto esami in alemo 10 date -
 la matricola, il nome, il voto massimo, minimo e medio conseguito negli esami. Ordinare per voto.*/

 SELECT
	 s.MatricolaStudente	 AS MatricolaStudente
	 ,s.Nome				 AS NomeStudente
	 ,MAX(e.Voto)			 AS VotoMassimo
	 ,MIN(e.Voto)			 AS VotoMinimo
	 ,AVG(e.Voto)			 AS VotoMedio
 FROM Studente s
 INNER JOIN Esame e
 ON s.MatricolaStudente = e.MatricolaStudente
 GROUP BY s.MatricolaStudente, s.Nome
 HAVING AVG (e.Voto) >= 25 AND COUNT (e.Data) >= 10
 
 CREATE TABLE Laureato (
MatricolaLaureato INT,
NomeLaureato VARCHAR (25),
AnnoLaurea DATE,
TitoloStudio VARCHAR (25),
VotoLaurea INT,
CONSTRAINT PK_MatricolaLaureato PRIMARY KEY (MatricolaLaureato));

CREATE TABLE Dipartimento (
CodiceDipartimento INT,
NomeDipartimento VARCHAR (25),
SettoreScientifico VARCHAR (25),
NumDocenti INT,
CONSTRAINT PK_CodiceDipartimento PRIMARY KEY (CodiceDipartimento));

CREATE TABLE ConcorsoMaster (
CodiceMaster INT,
CodiceDipartimento INT,
DataPubblicazione DATE,
DataScadenza DATE,
NumPostiDisponibili INT,
CONSTRAINT PK_CodiceMaster PRIMARY KEY (CodiceMaster),
CONSTRAINT FK_CodiceDipartimento FOREIGN KEY (CodiceDipartimento) REFERENCES Dipartimento(CodiceDipartimento));

CREATE TABLE Partecipanti (
CodiceDipartimento1 INT,
CodiceMaster INT,
MatricolaLaureato INT,
DataInvioDomanda DATE,
CONSTRAINT FK_CodiceDipartimento1 FOREIGN KEY(CodiceDipartimento1) REFERENCES Dipartimento(CodiceDipartimento),
CONSTRAINT FK_CodiceMaster FOREIGN KEY(CodiceMaster) REFERENCES ConcorsoMaster(CodiceMaster),
CONSTRAINT FK_MatricolaLaureato FOREIGN KEY(MatricolaLaureato) REFERENCES Laureato(MatricolaLaureato));


INSERT INTO Laureato 
VALUES (1, 'Claudia Locci','2019','Economia aziendale',103), (2, 'Michele Rossi','2020','Ingegneria Gestionale',98),  (3, 'Daniele Bianchi','2020','Marketing',108),
(4, 'Rosa Viva','2021','Giurisprudenza',110),  (5, 'Gaia Peis','2019','Comunicazione Impresa',108);

INSERT INTO Dipartimento
VALUES (6,'ComunicazioneEconomia','SocietàCultura',20), (13,'Giurisprudenza','SocietàCultura',30),(5,'Economia','SocietàCultura',21);

INSERT INTO ConcorsoMaster
VALUES (1,10,'2023/02/01','2023/06/30',5),(2,10,'2023/01/20','2023/04/15',2),(3,14,'2022/03/01','2022/06/06',10),(4,14,'2023/04/10','2023/06/05',10)
,(5,11,'2023/03/01','2023/04/01',12),(6,11,'2023/06/01','2023/07/31',25);

INSERT INTO Partecipanti
VALUES (10,1,5,'2023/04/20'),(10,2,2,'2023/02/12'),(14,3,4,'2023/05/30'),(11,5,3,'2023/03/15');
 /*
 DATO IL SEGUENTE SCHEMA SCRIVERE LE INTERROGAZIONI DI SEGUITO:

 STUDENTE (Matricola, NomeStudente, AnnoLaurea, TitoloStudio, VotoLaurea)
 DIPARTIMENTO (CodiceDipartimeno, NomeDipartimento, SettoreScientifico, NumDocenti)
 CONCORSOMASTER (CodiceMaster, CodiceDipartimento, DataPubblicazione, DataScadenza, NumPostiDisponibili)
 PARTECIPACONCORSOMASTER (CodiceDipartimento, CodiceMaster, MatricolaStudente, DataInvioDomanda)

*/

/*Per ogni studente che ha partecipato a 3 concorsi di master, visualizza il nome dello studente e il settore scientifico
per cui ha partecipato a tutti i concorsi. ordina per nome dello studente*/

SELECT
	 l.NomeLaureato
	 ,l.MatricolaLaureato
	 ,d.SettoreScientifico
FROM Laureato l
INNER JOIN Partecipanti p
ON l.MatricolaLaureato = p.MatricolaLaureato
INNER JOIN Dipartimento d
ON p.CodiceDipartimento1 = d.CodiceDipartimento
GROUP BY l.MatricolaLaureato, l.NomeLaureato, d.SettoreScientifico
HAVING COUNT(p.MatricolaLaureato) >=3
ORDER BY l.NomeLaureato

/*Per i dipartimenti in cui sono stati effettuati solo concorsi di master aventi ciascuno un numero di posti disponibili
> 7, visualizzare il nome del dipartimento, il settore scientifico di afferenza e il n di concorsi di master. Ordina per nome
del dipartimento e settore scientifico*/
SELECT
	 d.NomeDipartimento
	 ,d.SettoreScientifico
	 ,COUNT (c.CodiceMaster) AS NumConcorsi
FROM ConcorsoMaster c
INNER JOIN Dipartimento d
ON d.CodiceDipartimento=c.CodiceDipartimento
WHERE c.NumPostiDisponibili >7
GROUP BY d.CodiceDipartimento, d.NomeDipartimento, d.SettoreScientifico
ORDER BY d.NomeDipartimento, d.SettoreScientifico

/*Visualizza la matricola e il nome degli studenti che hanno conseguito un voto di laurea > 100 ed hanno partecipato
ad almeno due concorsi di master con la stessa data di pubblicazione*/

SELECT
	 l.MatricolaLaureato
	 ,l.NomeLaureato
	 ,c.DataPubblicazione
FROM Laureato l
INNER JOIN Partecipanti p
ON l.MatricolaLaureato = p.MatricolaLaureato
INNER JOIN ConcorsoMaster c
ON p.CodiceMaster = c.CodiceDipartimento
WHERE l.VotoLaurea > 100
GROUP BY l.MatricolaLaureato, l.NomeLaureato, c.DataPubblicazione
HAVING COUNT (c.CodiceMaster) >= 1