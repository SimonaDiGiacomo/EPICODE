/*

ESERCIZIO M3.D4

1.Le citt‡ di cui non Ë noto il numero di piste

SELECT 
	 Citt‡
	 ,Nazione
	 ,NumPiste
FROMO AERREOPORTO
WHERE NumPiste=NULL

2.I tipi di aereo usati nei voli che partono da Torino

SELECT 
	 IdVolo
	 ,Citt‡Part
	 ,TipoAereo
FROM VOLO
WHERE Citt‡Parte= 'Torino'

3.Le citt‡ da cui partono voli diretti a Bologna

SELECT 
	 IdVolo
	 ,Citt‡Part
	 ,Citt‡Arr
FROM VOLO
WHERE Citt‡Arr= 'Bologna'

4.Le citt‡ da cui parte e arriva il volo con codice AZ274

SELECT 
	 IdVolo
	 ,Citt‡Part
	 ,Citt‡Arr
FROM VOLO
WHERE IdVolo= 'AZ274'

5.Il tipo di aereo, il giorno della settimana, l'orario di partenza la cui citt‡ di partenza inizia per B e contiene O e la cui citt‡ di arrivo termina con A e contieme E

SELECT
	 TipoAereo
	 ,GiornoSett
	 ,OraPar
	 ,Citt‡Part
	 ,OraArr
	 ,Citt‡Arr
FROM VOLO
WHERE Citt‡Pert LIKE 'B%O%' AND Citt‡Arr LIKE '%E%A'

*/