--Zadanie 1.1
--select nazwisko, placa_pod from pracownicy FETCH FIRST 3 ROWS ONLY;
--Zadanie 1.2
--select ROWNUM as pozycja, nazwisko, placa_pod from pracownicy WHERE ROWNUM <= 3;
--Zadanie 2.1
--SELECT nazwisko, placa_pod FROM pracownicy ORDER BY placa_pod DESC OFFSET 5 ROWS FETCH NEXT 5 ROWS WITH TIES;
--Zadanie 2.2
--SELECT ROWNUM AS pozycja, T.nazwisko, T.placa_pod FROM (SELECT * FROM pracownicy  ORDER BY placa_pod DESC ) T WHERE ROWNUM <= 10 OFFSET 5 ROWS;
--Zadanie 3
--with praca as (select nazwisko, placa_pod, (select p.placa_pod-avg(placa_pod) from pracownicy where p.id_zesp=id_zesp)as roznica from pracownicy p)
--select * from praca where ROZNICA>0 order by nazwisko;
--Zadanie 4
--with lata as (select extract(year from p.zatrudniony) as rok, (select count(*) from pracownicy where extract(year from zatrudniony)= extract(year from p.zatrudniony)) as liczba
--from pracownicy p group by extract(year from p.zatrudniony)) select * from lata  order by liczba desc;
--Zadanie 5
--with lata as (select extract(year from p.zatrudniony) as rok, (select count(*) from pracownicy where extract(year from zatrudniony)= extract(year from p.zatrudniony)) as liczba
--from pracownicy p group by extract(year from p.zatrudniony)) select * from lata  order by liczba desc FETCH FIRST 1 ROWS ONLY;
--Zadanie 6
--WITH piotrowo AS (SELECT * FROM zespoly WHERE adres = 'PIOTROWO 3A'),
--asystenci AS (SELECT * FROM pracownicy WHERE etat = 'ASYSTENT')
--select a.nazwisko,a.etat,p.nazwa,p.adres from asystenci a join piotrowo p on a.id_zesp=p.id_zesp;
--Zadanie 7
--with placa as (select sum(p.placa_pod) as suma, p.id_zesp, z.nazwa as zespol from pracownicy p join zespoly z on p.ID_ZESP=z.ID_ZESP group by p.id_zesp,z.nazwa)
--select zespol, suma from placa order by suma desc fetch first 1 row only;
--Zadanie 8a
--with podwladni(id_prac,id_szefa,nazwisko,poziom)as (select id_prac,id_szefa,nazwisko,1 from pracownicy where nazwisko='BRZEZINSKI'
--union all select p.id_prac,p.id_szefa,p.nazwisko,poziom+1 from podwladni s join pracownicy p on s.id_prac=p.id_szefa)
--search depth first by nazwisko set porzadek_potomkow select nazwisko,poziom as pozycja_w_hierarchii from podwladni order by porzadek_potomkow;
--Zadanie 8b
--select nazwisko,level as poziom from pracownicy connect by id_szefa= prior id_prac
--start with nazwisko= 'BRZEZINSKI' order siblings by nazwisko;
--Zadanie 9a
--with 
--podwladni(id_prac,id_szefa,nazwisko,poziom)as
--(select id_prac,id_szefa,nazwisko,1
 --from pracownicy where nazwisko='BRZEZINSKI'
 --union all
 --select p.id_prac,p.id_szefa,lpad(p.nazwisko,length(p.nazwisko)+poziom,'~'),poziom+1 
 --from podwladni s join pracownicy p on s.id_prac=p.id_szefa)
 --search depth first by nazwisko set porzadek_potomkow
 --select nazwisko,poziom as pozycja_w_hierarchii
 --from podwladni
 --order by porzadek_potomkow;
 --Zadanie 9b
 select lpad(nazwisko,length(nazwisko)+level-1,'~') as nazwa,level as poziom 
from pracownicy connect by id_szefa= prior id_prac start with nazwisko= 'BRZEZINSKI' order siblings by nazwisko;