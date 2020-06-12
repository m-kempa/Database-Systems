--Zadanie 1
--alter table PROJEKTY ADD CONSTRAINT PK_PROJEKTY PRIMARY KEY(ID_PROJEKTU);
--alter table PROJEKTY ADD CONSTRAINT UK_PROJEKTY UNIQUE(OPIS_PROJEKTU)  ;
--ALTER TABLE PROJEKTY MODIFY OPIS_PROJEKTU NOT NULL;
--alter table PROJEKTY add check(data_zakonczenia>data_rozpoczecia);
--alter table PROJEKTY modify fundusz check(fundusz>0 or fundusz=null);
--select p.CONSTRAINT_NAME,p.CONSTRAINT_TYPE,p.SEARCH_CONDITION,z.COLUMN_NAME from USER_CONSTRAINTS p join USER_CONS_COLUMNS z on p.CONSTRAINT_NAME=z.CONSTRAINT_NAME where p.TABLE_NAME='PROJEKTY' ORDER BY p.CONSTRAINT_NAME;

--Zadanie 2
--insert into PROJEKTY(OPIS_PROJEKTU,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,FUNDUSZ)
--select 'Indeksy bitmapowe',to_date('2015-04-12','YYYY-MM-DD'),to_date('2016-09-30','YYYY-MM-DD'),40000 FROM DUAL;
--nie mozna wykonac polecenia
--[23000][1] ORA-00001: unique constraint (INF141202.UK_PROJEKTY) violated
--opis projektu nie jest unikalny

--Zadanie 3
--create table PRZYDZIALY(
--ID_PROJEKTU number(4) constraint FK_PRZYDZIALY_01 references PROJEKTY(ID_PROJEKTU),
--NR_PRACOWNIKA NUMBER(6) constraint FK_PRZYDZIALY_02 references PRACOWNICY(ID_PRAC),
--OD date default current_date,
--DO date , constraint CHK_PRZYDZIALY_DATY check(DO>OD),
--STAWKA number(7,2) constraint CHK_PRZYDZIALY_STAWKA check(stawka>0),
--ROLA VARCHAR2(20) constraint CHK_PRZYDZIALY_ROLA check(rola in ('KIERUJ¥CY', 'ANALITYK', 'PROGRAMISTA')),
--CONSTRAINT PK_PRZYDZIALY PRIMARY KEY (ID_PROJEKTU,NR_PRACOWNIKA));

--Zadanie 4
--insert into PRZYDZIALY(ID_PROJEKTU,NR_PRACOWNIKA,OD,DO,STAWKA,ROLA)
--select (SELECT ID_PROJEKTU FROM PROJEKTY WHERE OPIS_PROJEKTU='Indeksy bitmapowe'),170,to_date('1999-04-10','YYYY-MM-DD'),to_date('1999-05-10','YYYY-MM-DD'),1000,'KIERUJ¥CY' FROM DUAL
--union all
--select (SELECT ID_PROJEKTU FROM PROJEKTY WHERE OPIS_PROJEKTU='Indeksy bitmapowe'),140,to_date('2000-12-01','YYYY-MM-DD'),NULL ,1500,'ANALITYK' FROM DUAL
--union all
--SELECT (SELECT ID_PROJEKTU FROM PROJEKTY WHERE OPIS_PROJEKTU='Sieci krêgos³upowe'),140,to_date('2015-09-14','YYYY-MM-DD'),null,2500,'KIERUJ¥CY' FROM DUAL;
--select * from PRZYDZIALY;

--Zadanie 5
--alter table PRZYDZIALY add godziny number(4) not null;
--[42000][1758] ORA-01758: table must be empty to add mandatory (NOT NULL) column
--Nie mo¿na dodaæ rekordu który nie mo¿e byæ pusty do niepustej tabeli

--Zadanie 6
--alter table PRZYDZIALY  add godziny number(4);
--update PRZYDZIALY set godziny = 10;
--alter table PRZYDZIALY modify godziny not null;

--Zadanie 7
--alter table PROJEKTY disable CONSTRAINT UK_PROJEKTY;
--select constraint_name,status from USER_CONSTRAINTS where TABLE_NAME='PROJEKTY'and CONSTRAINT_NAME='UK_PROJEKTY' ;

--Zadanie 8
--insert into PROJEKTY(OPIS_PROJEKTU,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,FUNDUSZ)
--select 'Indeksy bitmapowe',to_date('2015-04-12','YYYY-MM-DD'),to_date('2016-09-30','YYYY-MM-DD'),40000 FROM DUAL;
--select * from projekty;

--Zadanie 9
--alter table PROJEKTY enable CONSTRAINT UK_PROJEKTY;
--znalezniono duplikaty co zak³uca uikalnoœæ

--Zadanie 10
--update PROJEKTY set(OPIS_PROJEKTU)='Inne indeksy' where id_projektu=(select ID_PROJEKTU from (select * from projekty order by rownum desc) fetch first 1 rows only);
--alter table PROJEKTY enable CONSTRAINT UK_PROJEKTY;

--Zadanie 11
--alter table PROJEKTY modify OPIS_PROJEKTU varchar2(10);
--nie udalo sie dokonac zmiany, gdzyz niektore znajdujace sie tam opisy sa za dlugie na 10 znakow

--Zadanie 12
--delete from projekty where OPIS_PROJEKTU='Sieci krêgos³upowe';
--Nie mo¿na usn¹æ rekordu rodzica gdy s¹ rekordy dzieci

--Zadanie 13
--alter table PRZYDZIALY drop constraint FK_PRZYDZIALY_01;
--alter table PRZYDZIALY modify id_projektu CONSTRAINT FK_PRZYDZIALY_01 references PROJEKTY(ID_PROJEKTU) ON DELETE CASCADE;
--delete from projekty where OPIS_PROJEKTU='Sieci krêgos³upowe';
--select * from PROJEKTY;
--select * from PRZYDZIALY;

--Zadanie 14
--drop table PROJEKTY cascade constraints;
--select constraint_name,constraint_type as c, search_condition from USER_CONSTRAINTS where TABLE_NAME='PRZYDZIALY' order by CONSTRAINT_NAME;

--Zadanie 15
--drop table PRZYDZIALY;
--drop table PROJEKTY_KOPIA;
--select table_name from USER_TABLES order by TABLE_NAME;