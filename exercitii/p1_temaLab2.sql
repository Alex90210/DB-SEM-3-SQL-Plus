SELECT nume || prenume || ', ' || an AS "Studenti pe ani de studiu" FROM studenti ORDER BY an;

SELECT nume, prenume, data_nastere, an 
FROM studenti 
WHERE data_nastere >= TO_DATE('01/01/1995', 'DD/MM/YYYY') 
  AND data_nastere <= TO_DATE('10/06/1997', 'DD/MM/YYYY') 
ORDER BY an DESC