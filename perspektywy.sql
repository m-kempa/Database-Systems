--Zadanie 1
--create view ASYSTENCI AS
--select nazwisko, (placa_pod+nvl(placa_dod,0)) as placa,((to_date('2020-01-01','YYYY-MM-DD')-ZATRUDNIONY) year to month) as staz
--from pracownicy where ETAT='ASYSTENT';
--select * from ASYSTENCI;

--Zadanie 2
--create view PLACE as
--select z.id_zesp,avg(PLACA_POD+nvl(PLACA_DOD,0)) as srednia,min(PLACA_POD+nvl(PLACA_DOD,0)) as minimum,max(PLACA_POD+nvl(PLACA_DOD,0)) as maximum,z.nazwa,count(*) as l_pensji,count(PLACA_DOD) as l_dodatkow
--from zespoly z join pracownicy p on z.ID_ZESP=p.ID_ZESP group by z.id_zesp,z.nazwa;
--select * from PLACE;			

--Zadanie 3
--select nazwisko, placa_pod from pracownicy p where (placa_pod+nvl(placa_dod,0))<(select srednia from PLACE where p.id_zesp=id_zesp) order by nazwisko;

--Zadanie 4
--create view PLACE_MINIMALNE as
--select * from pracownicy where placa_pod< 700 with check option constraint za_wysoka_placa;
--select id_prac,etat,PLACA_POD from PLACE_MINIMALNE order by PLACA_POD;

--Zadanie 5
--update PLACE_MINIMALNE set placa_pod=800 where nazwisko='HAPKE';
--[44000][1402] ORA-01402: view WITH CHECK OPTION where-clause violation

--Zadanie 6
--create view prac_szef as
--select id_prac, id_szefa, nazwisko as pracownik, etat, (select nazwisko from pracownicy s where p.id_szefa=s.id_prac) as szef from pracownicy p;
--INSERT INTO PRAC_SZEF (ID_PRAC, ID_SZEFA, PRACOWNIK, ETAT) VALUES (280,150, 'MORZY','ASYSTENT');
--UPDATE PRAC_SZEF SET ID_SZEFA = 130 WHERE ID_PRAC = 280;
--DELETE FROM PRAC_SZEF WHERE ID_PRAC = 280;

--Zadanie 7
--create or replace  view ZAROBKI as
--select ID_PRAC,NAZWISKO, ETAT, PLACA_POD from pracownicy p where placa_pod<(select placa_pod from pracownicy s where p.id_szefa=s.id_prac) with check option constraint za_wysoko;
--select * from zarobki order by nazwisko;

--Zadanie 8
select column_name,updatable,insertable,DELETABLE from USER_UPDATABLE_COLUMNS
where TABLE_NAME= 'PRAC_SZEF';