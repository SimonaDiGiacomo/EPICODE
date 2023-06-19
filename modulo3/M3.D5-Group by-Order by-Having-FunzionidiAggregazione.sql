/*

ESERCIZIO M3.D5
Dato il seguente schema 

DISCO(NroSerie, TitoloAlbum, Anno, Prezzo)
CONTIENE(NroSerieDisco, CodiceReg, NroProg)
ESECUZIONE(CodiceReg, TitoloCanz, Anno)
AUTORE(Nome, TitoloCanzone)
CANTANTE(NomeCantante, CodiceReg)

A.1.I cantautori(persone che hanno cantato e scritto la stessa canzone) il cui nome inizia per 'D'

SELECT 
	 a.Nome
	 ,a.TitoloCanzone

FROM CANTANTE			 AS c

INNER JOIN AUTORE        AS a
ON c.NomeCntamte= a.Nome

WHERE c.NomeCantante LIKE 'D%'

A.2.I titoli dei dischi che contengono canzoni di cui non si conosce l'anno di registrazione

SELECT
	 d.Ttitolo Album	  AS TitoloDisco
	 ,e.TitoloCanzone	  AS TitoloCanzone

FROM DISCO				  AS d

INNER JOIN CONTIENE		  AS co
ON d.NroSerie=co.nroSerieDisco

INNER JOIN ESECUZIONE     AS e
ON co.CodiceReg=e.CodiceReg

WHERE e.Anno=NULL

A.3.I cantanti che hanno sempre registrato canzoni come solisti

SELECT NomeCantante
FROM CANTANTE
WHERE NomeCantante NOT IN (
SELECT c1.NomeCantante
FROM CANTANTE c1
INNER JOIN CANTANTE c2
ON c1.CodiceReg = c2.CodiceReg
WHERE c1.NomeCantante <> c2.NomeCantante)


Dato il seguente schema

STUDENTE (MATRICOLA, Nome, Città)
CORSO (CODICE, Nome, MatricolaDocente)
DOCENTE(MATRICOLA, NOME)
ESAME (CODICE, MATRICOLASTUDENTE, Data, Voto, SettoreScientifico)

B.1.Per ogni studente, visuallizzare gli esami sostenuti con voto maggiore di 28 assieme alla matricola dello studente e al nome del docente che ha tenuto il corso

SELECT
	 s.MATRICOLA	 AS MatricolaStudente
	 ,e.CODICE		 AS EsameSostenuto
	 ,e.Voto		 AS Voto
	 d.NOME			 AS Docente
FROM STUDENTE s
INNER JOIN ESAME e
ON s.MATRICOLA = e.Matricola
INNER JOIN CORSO c
ON e.CODICE = c.CODICE
INNER JOIN DOCENTE d
ON c.MatricolaDocente = d.MATRICOLA
WHERE e.Voto >= '28'

B.2.Per ogni docente, visualizzare il nome, il nome del corso di cui è titolare e il settore scientifico del corso

SELECT
	 d.NOME			             AS Docente
	 ,c.Nome	                 AS Corso
	 ,e.SettoreScientifico		 AS SettoreScientifico
FROM DOCENTE d
INNER JOIN CORSO c
ON d.MATRICOLA = c.MatricolaDocente
INNER JOIN ESAME e
ON c.CODICE = e.CODICE









