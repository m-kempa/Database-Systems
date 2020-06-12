--Zadanie 1
--CREATE TABLE PROJEKTY(ID_PROJEKTU NUMBER(4) GENERATED ALWAYS AS IDENTITY,
--OPIS_PROJEKTU NVARCHAR2(20),
--DATA_ROZPOCZECIA DATE DEFAULT CURRENT_DATE,
--DATA_ZAKONCZENIA DATE,
--FUNDUSZ NUMBER(7,2));
			   
--Zadanie 2
--insert into PROJEKTY(OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
--SELECT 'Indeksy bitmapowe',to_date('1999-04-02','YYYY-MM-DD'),to_date('2001-08-31','YYYY-MM-DD'),25000 from dual
--insert into PROJEKTY(OPIS_PROJEKTU, FUNDUSZ)
--SELECT 'Sieci kr�gos�upowe',19000 from dual
--Zadanie 3
--select * from PROJEKTY;
--Zadanie 4
--insert into PROJEKTY( OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
--SELECT 'Indeksy drzewiaste',to_date('2013-12-24','YYYY-MM-DD'),to_date('2014-01-01','YYYY-MM-DD'),1200 from dual;
--Zadanie 5
--update PROJEKTY set(ID_PROJEKTU)= 10 where OPIS_PROJEKTU = 'Indeksy drzewiaste';
--NIe mo�na zmienia� identyfikatora
--Zadanie 6
--CREATE TABLE PROJEKTY_KOPIA as (select * from PROJEKTY);
--select * from PROJEKTY_KOPIA order by ID_PROJEKTU;
--Zadanie 7
--insert into PROJEKTY_KOPIA(ID_PROJEKTU, OPIS_PROJEKTU, DATA_ZAKONCZENIA, FUNDUSZ)
--SELECT 10, 'Sieci lokalne',to_date(CURRENT_DATE + 1,'YYYY-MM-DD'),24500 from dual;
--select * from PROJEKTY_KOPIA order by ID_PROJEKTU;
--SELECT TABLE_NAME,COLUMN_NAME, IDENTITY_COLUMN FROM user_tab_columns WHERE table_name = 'PROJEKTY_KOPIA' or table_name = 'PROJEKTY'  ORDER BY column_name;
--Jest tak poniewa� tabela PROJEKTY ma  ID_PROJEKTU jako IDENTITY_COLUMN a skopiowanie tabeli do PROJEKTY_KOPIA spowodowa�o odznaczenie kolumny ID_PROJEKTU jako identyfikatora

--Zadanie 8 
--delete from PROJEKTY where OPIS_PROJEKTU='Indeksy drzewiaste';
--select * from PROJEKTY_KOPIA
--Rekord nie zosta� usuni�ty z tabeli PROJEKTY_KOPIA gdy� poprzez polecenie  create table PROJEKTY_KOPIA... zosta� stworzyony odzielna niezale�na tabela kt�ra po skopiowaniu nie ma �adnych trwa�ych powi�za�

--Zadanie 9
--select TABLE_NAME from user_tables;