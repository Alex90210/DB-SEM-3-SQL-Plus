SELECT CURRENT_DATE FROM DUAL;

SELECT nume, data_nastere, MONTHS_BETWEEN(CURRENT_DATE, data_nastere) / 30) 
FROM studenti;

-- 3

SELECT TO_CHAR(data_nastere, 'day') FROM studenti;

-- 4

SELECT CONCAT('Elevul ', CONCAT(prenume, CONCAT(' este in grupa ', grupa)))
FROM studenti;

-- 5

SELECT RPAD(bursa, 10, '$') FROM studenti;

-- 6

Pentru profesorii al căror nume începe cu B, afișați numele cu prima litera mică si restul mari,
precum și lungimea (nr. de caractere a) numelui.

SELECT SUBSTR(LOWER(nume), 1, 1) || SUBSTR(UPPER(nume), 2), LENGTH(nume) FROM profesori
WHERE nume LIKE TRIM('B%');

-- 7

SELECT nume, data_nastere, NEXT_DAY(data_nastere,'SUNDAY') FROM studenti;

-- 8

SELECT nume, prenume, TO_CHAR(data_nastere, 'month') AS luna 
FROM studenti
WHERE bursa IS NULL
ORDER BY TO_CHAR(data_nastere, 'MM');

-- 9

SELECT nume, prenume, bursa || ' ' || DECODE(bursa, 450, 'premiul 1', 350, 'premiul 2', 250, 'premiul 3', 'Mentiune' ) 
AS bursa
FROM studenti;

-- 10. Afişaţi numele tuturor studenților înlocuind apariţia literei i cu a şi apariţia literei a cu i.
-- ??????????? trebuie sa se intample simultan?

SELECT REPLACE(REPLACE(nume, 'i', 'x'), 'a', 'i') FROM studenti;
-- andrei -> andrea -> 

-- 11. Afișați pentru fiecare student numele, vârsta acestuia la data curentă sub forma '<x> ani <y>
-- luni și <z> zile' (de ex '19 ani 3 luni și 2 zile') și numărul de zile până își va sărbători 
-- (din nou) ziua de naștere.

SELECT nume, 

SELECT TO_CHAR (SYSDATE - data_nastere, 'YYYY "ani", MM "luni", DD "zile"') "TO_CHAR example" FROM studenti;

SELECT TO_DATE(SYSDATE - data_nastere) FROM studenti;

-- 12. Presupunând că în următoarea lună bursa de 450 RON se mărește cu 10%, 
-- cea de 350 RON cu 15% și cea de 250 RON cu 20%, afișați pentru fiecare student numele acestuia, 
-- data corespunzătoare primei zile din luna urmatoare și valoarea bursei pe care o va încasa luna următoare. 
-- Pentru cei care nu iau bursa, se va afisa valoarea 0.

SELECT nume, TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM') AS data_intrare_bursa,
DECODE(bursa, 450, 450 + 10/100 * 450, 350, 350 + 15/100 * 350, 250, 250 + 20/100 * 250, 0) AS bursa 
FROM studenti;

-- 13. Pentru studentii bursieri (doar pentru ei) afisati numele studentului 
-- si bursa in stelute: fiecare steluta valoreaza 50 RON. In tabel, alineati stelutele la dreapta.

SELECT nume, RPAD(' ', bursa/50, '*') AS bursa FROM studenti WHERE bursa IS NOT NULL;