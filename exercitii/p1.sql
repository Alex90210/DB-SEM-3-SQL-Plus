SELECT nume || prenume || ', ' || an AS "Studenti pe ani de studiu" FROM studenti ORDER BY an;

SELECT nume, prenume, data_nastere, an 
FROM studenti 
WHERE data_nastere >= TO_DATE('01/01/1995', 'DD/MM/YYYY') 
  AND data_nastere <= TO_DATE('10/06/1997', 'DD/MM/YYYY') 
ORDER BY an DESC;

SELECT nume, prenume, an 
FROM studenti 
WHERE data_nastere >= TO_DATE('01/01/1995', 'DD/MM/YYYY') 
AND data_nastere < TO_DATE('01/01/1996', 'DD/MM/YYYY');

SELECT * FROM studenti WHERE bursa IS NULL;

SELECT nume, prenume, bursa 
FROM studenti 
WHERE bursa IS NOT NULL
AND an > 1 
ORDER BY nume ASC, prenume DESC; 

SELECT nume, prenume,bursa, bursa + 15/100 * bursa AS bursa_faina
FROM studenti
WHERE bursa IS NOT NULL;

SELECT nume, prenume
FROM studenti 
WHERE nume LIKE 'P%'
AND an < 2;

SELECT *
FROM studenti 
WHERE LENGTH(prenume) - LENGTH(REPLACE(prenume, 'a', '')) = 2;

SELECT *
FROM studenti 
WHERE prenume = 'Alexandru' OR prenume = 'Ioana' OR prenume = 'Marius';

-- sau

SELECT *
FROM studenti
WHERE prenume IN ('Alexandru', 'Ioana', 'Marius');

SELECT nume, prenume, bursa, grupa 
FROM studenti 
WHERE bursa IS NOT NULL
AND grupa LIKE 'A%';

SELECT * FROM studenti 
WHERE REGEXP_COUNT(prenume, 'a') = 1;

SELECT nume, prenume
FROM profesori
WHERE RTRIM(prenume) LIKE '%n';

