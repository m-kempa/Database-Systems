--Zadanie 1
--select id_zesp, nazwa, adres from zespoly z where id_zesp not in (select id_zesp from pracownicy where z.id_zesp = id_zesp);
--Zadanie 2
--select nazwisko, placa_pod, etat from pracownicy p where placa_pod > (select avg(placa_pod) from pracownicy z where p.etat=z.etat group by etat);
---Zadanie 3
--select nazwisko, placa_pod from pracownicy p where placa_pod >=( select placa_pod*0.75 from pracownicy z where z.id_prac=p.id_szefa);
--Zadanie 4
--select nazwisko from pracownicy p where etat like 'PROFESOR' and 'STAZYSTA' not in (select etat from pracownicy z where p.id_prac=z.id_szefa);
--Zadanie 5
--select nazwa,suma from (select max(sum(placa_pod)) as suma from pracownicy group by id_zesp) p join
--(select sum(placa_pod)as suma2,id_zesp from pracownicy group by id_zesp) z on p.suma=z.suma2
--join (select id_zesp,nazwa from zespoly) n on z.id_zesp=n.id_zesp;
--Zadanie 6
--select nazwisko, placa_pod from pracownicy p where 3>= (select count(*) from pracownicy z where p.placa_pod<=z.placa_pod);
--Zadanie 7
--select extract(year from p.zatrudniony) as rok, (select count(*) from pracownicy where  extract(year from zatrudniony)= extract(year from p.zatrudniony)) as liczba
--from pracownicy p group by extract(year from p.zatrudniony) order by liczba desc;
--Zadanie 8
--select extract(year from p.zatrudniony) as rok, (select count(*) from pracownicy where  extract(year from zatrudniony)= extract(year from p.zatrudniony)) as liczba
--from pracownicy p having count(*) >= all(select count(*)from pracownicy group by extract(year from zatrudniony))			
--group by extract(year from p.zatrudniony) order by liczba desc;
--Zadanie 9.1
--select nazwisko, placa_pod, (select p.placa_pod-avg(placa_pod)  from pracownicy where p.id_zesp=id_zesp)as roznica from pracownicy p order by nazwisko;
--Zadanie 9.2
--select nazwisko, placa_pod, placa_pod-liczba as roznica from pracownicy p join (select avg(placa_pod) as liczba, id_zesp from pracownicy group by id_zesp) z on z.id_zesp=p.id_zesp order by nazwisko;
--Zadanie 10.1
--select nazwisko, placa_pod, (select p.placa_pod-avg(placa_pod)  from pracownicy where p.id_zesp=id_zesp)as roznica from pracownicy p
--where p.placa_pod > (select avg(placa_pod) from pracownicy where p.id_zesp = id_zesp) order by nazwisko;
--Zadadnie 10.2
--select nazwisko, placa_pod, placa_pod-liczba as roznica from pracownicy p join (select avg(placa_pod) as liczba, 
--id_zesp from pracownicy group by id_zesp) z on (z.id_zesp=p.id_zesp and placa_pod-liczba>0) order by nazwisko;
--Zadanie 11
--select nazwisko, (select count(*) from pracownicy where p.id_prac=id_szefa) as podwladni 
--from pracownicy p where p.id_zesp in (select id_zesp from zespoly where adres like 'PIOTROWO 3A') and etat like 'PROFESOR';
--Zadanie 12
--select nazwa,avg(placa_pod),srednia, case when srednia<avg(placa_pod)then':)' when srednia>avg(placa_pod)then':(' else '???'end
--from zespoly z left join pracownicy p on z.id_zesp=p.id_zesp, (select avg(placa_pod) as srednia from pracownicy) group by z.nazwa,srednia order by z.nazwa;
--Zadanie 13
select * from etaty e order by (select count(*) from pracownicy where e.nazwa = etat) desc, nazwa;