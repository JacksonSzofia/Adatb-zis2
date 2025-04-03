/*1. Készítsünk nézetet VSZOBA néven, amely megjeleníti a szobák adatai mellett a megfelelő szálláshely nevét, helyét és a csillagok számát is!

Az oszlopoknak nem szükséges külön nevet adni!
Teszteljük is a nézetet, pl: SELECT * FROM VSZOBA*/

create or alter VIEW vszoba as 
SELECT sz.*, 
		szh.SZALLAS_NEV,
        szh.HELY,
        szh.CSILLAGOK_SZAMA
from Szallashely szh join szoba sz on szh.SZALLAS_ID = sz.SZALLAS_FK

select * from vszoba --teszt

/*2 Készítsen tárolt eljárást SPUgyfelFoglalasok, amely a paraméterként megkapott ügyfél azonosítóhoz tartozó foglalások adatait listázza!
Teszteljük a tárolt eljárás működését, pl: EXEC SPUgyfelFoglalasok 'laszlo2'*/

create or alter procedure SPUgyfelFoglalasok
--paraméterek
@ugyfelazon nvarchar(40)
AS
BEGIN
--sql kód
select *
from Foglalas
where ugyfel_fk = @ugyfelazon
End
EXEC SPUgyfelFoglalasok 'laszlo2'

/*3. Készítsen skalár értékű függvényt UDFFerohely néven, amely visszaadja, hogy a paraméterként megkapott foglalás azonosítóhoz hány férőhelyes szoba tartozik!
a. Teszteljük a függvény működését!*/

CREATE or ALTER function UDFFerohely
(
  --parameterek 
  @fazon int
)
returns int--visszadaott érték tipusa
as 
BEGIN
DECLARE @ferohely int

SELECT @ferohely = sz.FEROHELY
from foglalas f join szoba sz on f.szoba_fk = sz.SZOBA_ID
where f.FOGLALAS_PK = @fazon

return @ferohely--visszaadott érték

end 
select dbo.UDFFerohely(650) --sémanév, alapértelmezetten dbo 

/*4. Készítsünk tárolt eljárást SPRangsor néven, amely rangsorolja a szálláshelyeket a foglalások száma alapján (a legtöbb foglalás legyen a rangsorban az első). A listában a szállás azonosítója, neve és a rangsor szerinti helyezés jelenjen meg - holtverseny esetén ugrással (ne sűrűn)! 
a. Teszteljük a tárolt eljárást, pl: EXEC SPRangsor*/

/*
5. Készítsünk nézetet VFoglalasreszletek néven, amely a következő adatokat jeleníti meg: foglalás azonosítója, az ügyfél neve, a szálláshely neve és helye, a foglalás kezdete és vége, és a szoba száma. 

a. Az oszlopokat nevezzük el értelemszerűen! 
b. Teszteljük a nézet működését, pl: SELECT * FROM VFoglalasreszletek
*/

/*
6.
Készítsen tábla értékű függvényt NEPTUNKÓD_UDFFoglalasnelkuliek néven, amely azon ügyfelek adatait listázza, akik még nem foglaltak egyszer sem az adott évben adott hónapjában! A függvény paraméterként kapja meg a foglalás évét és hónapját! (Itt is a METTOL dátummal dolgozzunk) 
a. Teszteljük is a függvény működését, pl: SELECT * FROM dbo.UJAENB_UDFFoglalasnelkuliek(2016, 10)
*/


