--Zadanie 1
--select MIN(PLACA_POD) as minimum, max(PLACA_POD) as maksimum, max(PLACA_POD)-MIN(PLACA_POD) as roznica from pracownicy;
--Zadanie 2
--select   etat, avg(PLACA_POD) as srednia from pracownicy GROUP BY etat ORDER BY avg(PLACA_POD) DESC;
--Zadanie 3
--select count(etat) as PROFESOROWIE  from pracownicy WHERE etat = 'PROFESOR' group by etat ;
--Zadanie 4
--select id_zesp, sum(placa_pod)+sum(placa_dod) as SUMARYCZNE_PLACE from pracownicy group by id_zesp order by id_zesp;
--Zadanie 5
--select  id_zesp, sum(placa_pod)+sum(placa_dod) as SUMARYCZNE_PLACE from pracownicy
--group by id_zesp  order by sum(placa_pod)+sum(placa_dod) desc fetch first row only;
--Zadanie 6
--select id_szefa, min(placa_pod) as MINIMALNA  from pracownicy where id_szefa is not null group by id_szefa order by min(placa_pod) desc;
--Zadanie 7
--select id_zesp, count(id_prac) from pracownicy group by id_zesp order by count(id_prac) desc;
--Zadanie 8
--select id_zesp, count(id_prac) from pracownicy  group by id_zesp having count(id_prac)>3;
--Zadanie 9
--SELECT id_prac FROM pracownicy WHERE COUNT(*) > 1 GROUP BY id_prac;
--zadanie 10
--select etat, sum(placa_pod)/count(etat)as Srednia, count(etat) as Liczba from pracownicy WHERE zatrudniony < DATE '2000-01-01' group by etat;
--Zadanie 11
--select id_zesp,etat, ROUND(sum(placa_pod+NVL(placa_dod, 0))/count(id_zesp),0)as Srednia, ROUND(max(placa_pod+NVL(placa_dod, 0)),0) as MAX from pracownicy 
--where etat='PROFESOR' or etat='ASYSTENT' group by id_zesp, etat  order by id_zesp, etat;
--Zadanie 12
select year(zatrudniony), id_prac from pracownicy ;