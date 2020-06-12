--Analiza kierunków 
--Zadanie 1
--select count(STUDENT_ID)as Liczba_studentow from sphd_dane.STUDENCI;
--Zadanie 2
--select nazwa, symbol from sphd_dane.KIERUNKI_STUDIOW order by nazwa;
--Zadanie 3
--select nazwa, symbol, (select count(STUDENT_ID)as Liczba_studentow from sphd_dane.STUDENCI where symbol=kierunek)as Liczba_studentow from sphd_dane.KIERUNKI_STUDIOW order by nazwa;
--Zadanie 4
--select nazwa, symbol, (select count(STUDENT_ID)as Liczba_studentow from sphd_dane.STUDENCI where symbol=kierunek) as liczba_studentow from sphd_dane.KIERUNKI_STUDIOW order by liczba_studentow desc FETCH FIRST 3 ROWS ONLY;
--Zadanie 5
--select r.nazwa, r.symbol, count(s.student_id) as LICZBA_STUDENTOW from sphd_dane.RODZAJE_STUDIOW r 
 --join sphd_dane.KIERUNKI_STUDIOW k on r.symbol=k.rodzaj_studiow
 --join sphd_dane.STUDENCI s on k.symbol=s.kierunek group by r.nazwa,r.symbol;

--select ks.nazwa, ks.symbol, count(s.student_id) as LICZBA_STUDENTOW from sphd_dane.kategorie_studiow ks
 --join sphd_dane.RODZAJE_STUDIOW r on r.kategoria_studiow=ks.symbol
 --join sphd_dane.KIERUNKI_STUDIOW k on r.symbol=k.rodzaj_studiow
 --join sphd_dane.STUDENCI s on k.symbol=s.kierunek group by ks.nazwa,ks.symbol;
--Zadanie 6
--with kierunki as (SELECT K.NAZWA, K.SYMBOL, (SELECT COUNT(*) FROM sphd_dane.STUDENCI WHERE kierunek = K.SYMBOL) AS STUDENTOW FROM sphd_dane.KIERUNKI_STUDIOW K  ORDER BY NAZWA),
  --   rodzaje as (SELECT R.NAZWA, L.RODZAJ, L.STUDENTOW FROM sphd_dane.RODZAJE_STUDIOW R JOIN (SELECT Substr(kierunek, 1, 2) AS rodzaj, Count(*) AS studentow FROM sphd_dane.studenci GROUP  BY Substr(kierunek, 1, 2)) L ON R.SYMBOL = L.RODZAJ),
    -- kategorie as (SELECT CASE WHEN SYMBOL = 'N' THEN 'niestacjonarne' else 'stacjonarne' end as KATAGEORIA_STUDIOW, SYMBOL, STUDENTOW FROM (SELECT Substr(kierunek, 1, 1) AS SYMBOL, Count(*) AS studentow FROM sphd_dane.studenci GROUP  BY Substr(kierunek, 1, 1)))
--Select K.KATAGEORIA_STUDIOW AS NAZWA, K.SYMBOL AS SCIEZKA, 'kat.' AS OPIS, K.STUDENTOW FROM sphd_dane.KATEGORIE K
--UNION SELECT CONCAT('- ',R.NAZWA) AS NAZWA, CONCAT (SUBSTR(R.RODZAJ,1,1), CONCAT('-',R.RODZAJ)) AS SCIEZKA, 'rodzaj' AS OPIS, R.STUDENTOW FROM rodzaje R
--UNION  SELECT CONCAT('-- ',KR.NAZWA) AS NAZWA, CONCAT(CONCAT(SUBSTR(KR.SYMBOL,1,1), CONCAT('-',SUBSTR(KR.SYMBOL,1,2))), CONCAT('-',KR.SYMBOL)) AS SCIEZKA, 'kier.' AS OPIS, KR.STUDENTOW FROM kierunki KR ORDER BY SCIEZKA;

--Æwiczenie 2. Analiza demograficzna
--Zadanie 1
--select m.wojewodztwo, count(s.student_id) as STUDENTOW from sphd_dane.STUDENCI s join sphd_dane.MIASTA m on s.miasto_id=m.miasto_id group by m.wojewodztwo order by m.wojewodztwo;
--Zadanie 2
--select m.wojewodztwo, count(s.student_id) as STUDENTOW from sphd_dane.STUDENCI s join sphd_dane.MIASTA m on s.miasto_id=m.miasto_id group by m.wojewodztwo order by  STUDENTOW desc FETCH FIRST 5 ROWS ONLY;
--Zadanie 3
--select m.wojewodztwo, m.nazwa, count(s.student_id) as STUDENTOW from sphd_dane.STUDENCI s join sphd_dane.MIASTA m on s.miasto_id=m.miasto_id where  m.wojewodztwo in (select m.wojewodztwo from sphd_dane.STUDENCI s join sphd_dane.MIASTA m on s.miasto_id=m.miasto_id group by m.wojewodztwo order by  count(s.student_id) desc FETCH FIRST 5 ROWS ONLY) group by m.wojewodztwo, m.nazwa order by m.wojewodztwo;
--Zadanie 4
--select m.wojewodztwo, m.nazwa, count(s.student_id) as MIASTO, (select count(ss.student_id) from sphd_dane.STUDENCI ss left outer join  sphd_dane.MIASTA mm on ss.miasto_id=mm.miasto_id where m.wojewodztwo=mm.wojewodztwo) as WOJEW , (count(s.student_id) / (select count(ss.student_id) from sphd_dane.STUDENCI ss left outer join  sphd_dane.MIASTA mm on ss.miasto_id=mm.miasto_id where m.wojewodztwo=mm.wojewodztwo))*100 as PROCENTOWO
 --from sphd_dane.STUDENCI s join sphd_dane.MIASTA m on s.miasto_id=m.miasto_id where  m.wojewodztwo in (select m.wojewodztwo from sphd_dane.STUDENCI s join sphd_dane.MIASTA m on s.miasto_id=m.miasto_id group by m.wojewodztwo order by  count(s.student_id) desc FETCH FIRST 5 ROWS ONLY) group by m.wojewodztwo, m.nazwa order by m.wojewodztwo;
--Zadanie 5
--select m.wojewodztwo, s.plec, count(s.student_id) as STUDENTOW from sphd_dane.STUDENCI s join sphd_dane.MIASTA m on s.miasto_id=m.miasto_id group by m.wojewodztwo, s.plec order by m.wojewodztwo;
--Zadanie 6
--SELECT WOJEWODZTWO, PLEC, CASE WHEN STUDENC IS NULL THEN 0 ELSE STUDENC END AS STUDENTOW FROM 
--(SELECT WOJEWODZTWO, PLEC, COUNT(*) AS STUDENC FROM sphd_dane.STUDENCI NATURAL JOIN sphd_dane.MIASTA GROUP BY WOJEWODZTWO, PLEC)
--NATURAL RIGHT OUTER JOIN (SELECT WOJEWODZTWO ,PLEC FROM (SELECT WOJEWODZTWO FROM sphd_dane.MIASTA GROUP BY WOJEWODZTWO), 
--(SELECT PLEC FROM sphd_dane.STUDENCI GROUP BY PLEC)) ORDER BY WOJEWODZTWO,PLEC;
--Zadanie 7
--select m.wojewodztwo, (select count(*) from sphd_dane.STUDENCI ss join sphd_dane.MIASTA mm on ss.miasto_id=mm.miasto_id where plec = 'kobieta' and  m.wojewodztwo=mm.wojewodztwo) as KOBIETY,
--(select count(*) from sphd_dane.STUDENCI ss join sphd_dane.MIASTA mm on ss.miasto_id=mm.miasto_id where plec = 'mê¿czyzna' and  m.wojewodztwo=mm.wojewodztwo) as MEZCZYZNI,
--(select count(ss.student_id) from sphd_dane.STUDENCI ss left outer join  sphd_dane.MIASTA mm on ss.miasto_id=mm.miasto_id where m.wojewodztwo=mm.wojewodztwo) as RAZEM
--from sphd_dane.STUDENCI s join sphd_dane.MIASTA m on s.miasto_id=m.miasto_id group by m.wojewodztwo order by m.wojewodztwo;
--Analiza Ocen
--Zadanie 1
--select count(student_id) from sphd_dane.oceny where ocena is not null;
--Zadnie 2
--select rok_akademicki, count(student_id) from sphd_dane.oceny where ocena is not null group by rok_akademicki order by rok_akademicki;
--Zadanie 3
--select rok_akademicki, count(student_id) as Liczba from sphd_dane.oceny where ocena is not null group by rok_akademicki order by Liczba desc FETCH FIRST 1 ROWS ONLY ;
--select rodzaj_semestru, count(student_id) as liczba from sphd_dane.oceny where ocena is not null and rok_akademicki='2006/07' group by  rodzaj_semestru;
--Zadanie 4
--select  case when ocena >= 4.5 then 'oceny wybitne' when ocena <= 3 then 'oceny s³abe' else 'oceny œrednie' end as KATEGORIA,
--count(student_id) as liczba from sphd_dane.oceny where ocena is not null and rok_akademicki='2006/07' and rodzaj_semestru='zimowy' group by (case when ocena >= 4.5 then 'oceny wybitne' when ocena <= 3 then 'oceny s³abe' else 'oceny œrednie' end);
--Zadanie 5
--(select student_id, avg(ocena) from sphd_dane.oceny where ocena is not null and rok_akademicki='2006/07' and rodzaj_semestru='zimowy' group by student_id order by avg(ocena) desc FETCH FIRST 10 ROWS ONLY)
--union all (select student_id, avg(ocena) from sphd_dane.oceny where ocena is not null and rok_akademicki='2006/07' and rodzaj_semestru='zimowy' group by student_id order by avg(ocena) asc FETCH FIRST 10 ROWS ONLY)
--Zadanie 6
--select k.nazwa, k.symbol, avg(o.ocena) as srednia_ocen from sphd_dane.oceny o 
--join sphd_dane.studenci s on o.student_id=s.student_id
--join sphd_dane.KIERUNKI_STUDIOW k on s.kierunek=k.symbol
--where ocena is not null and rok_akademicki='2006/07' and rodzaj_semestru='zimowy' group by k.nazwa, k.symbol order by avg(ocena) desc FETCH FIRST 3 ROWS ONLY;
--Zadanie 7
(select s.kierunek, p.nazwa, avg(ocena) as srednia from sphd_dane.przedmioty p 
join sphd_dane.oceny o on p.przedmiot_id=o.przedmiot_id
join sphd_dane.studenci s on s.student_id=o.student_id
where s.kierunek in(select k.symbol from sphd_dane.oceny o 
join sphd_dane.studenci s on o.student_id=s.student_id
join sphd_dane.KIERUNKI_STUDIOW k on s.kierunek=k.symbol
where ocena is not null and rok_akademicki='2006/07' and rodzaj_semestru='zimowy' group by k.nazwa, k.symbol order by avg(ocena) desc FETCH FIRST 1 ROWS ONLY)
 and o.ocena is not null and rok_akademicki='2006/07' and rodzaj_semestru='zimowy' group by p.nazwa, s.kierunek order by avg(ocena) desc FETCH FIRST 5 ROWS ONLY)
 UNION ALL
 (select s.kierunek, p.nazwa, avg(ocena) as srednia from sphd_dane.przedmioty p 
join sphd_dane.oceny o on p.przedmiot_id=o.przedmiot_id
join sphd_dane.studenci s on s.student_id=o.student_id
where s.kierunek in(select k.symbol from sphd_dane.oceny o 
join sphd_dane.studenci s on o.student_id=s.student_id
join sphd_dane.KIERUNKI_STUDIOW k on s.kierunek=k.symbol
where ocena is not null and rok_akademicki='2006/07' and rodzaj_semestru='zimowy' group by k.nazwa, k.symbol order by avg(ocena) desc OFFSET 1 ROWS FETCH FIRST 1 ROWS ONLY)
 and o.ocena is not null and rok_akademicki='2006/07' and rodzaj_semestru='zimowy' group by p.nazwa, s.kierunek order by avg(ocena) desc FETCH FIRST 5 ROWS ONLY)
 UNION ALL
 (select s.kierunek, p.nazwa, avg(ocena) as srednia from sphd_dane.przedmioty p 
join sphd_dane.oceny o on p.przedmiot_id=o.przedmiot_id
join sphd_dane.studenci s on s.student_id=o.student_id
where s.kierunek in(select k.symbol from sphd_dane.oceny o 
join sphd_dane.studenci s on o.student_id=s.student_id
join sphd_dane.KIERUNKI_STUDIOW k on s.kierunek=k.symbol
where ocena is not null and rok_akademicki='2006/07' and rodzaj_semestru='zimowy' group by k.nazwa, k.symbol order by avg(ocena) desc OFFSET 2 ROWS FETCH FIRST 1 ROWS ONLY)
 and o.ocena is not null and rok_akademicki='2006/07' and rodzaj_semestru='zimowy' group by p.nazwa, s.kierunek order by avg(ocena) desc FETCH FIRST 5 ROWS ONLY)
