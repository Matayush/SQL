-- to jest komentarz
-- Wyswietl dostepne bazy danych
SHOW DATABASES;

-- Przyklad dostepu do danych
SELECT * FROM shop.categories;
-- Ustawienie domyslnej bazy danych
USE shop;


-- -- -- Wyswietlanie danych -- -- --
-- 1. Wszystkie kolumny oraz wiersze
SELECT * FROM suppliers;
SELECT * FROM categories;

-- 2. Wybrane kolumny
SELECT name, id FROM product_details;
SELECT id, payment_date, order_date FROM orders;

-- Ważne
-- Wyświetlenie unikatowych wierszy z SELECTa
-- filtruje w tkai sposob ze pomija wszelkie duplikaty, po jednej unikatowej wersji jaka występuje w bazie danych
SELECT DISTINCT category FROM product_details;
SELECT DISTINCT category, name FROM product_details;

-- 4. Aliasy
SELECT
	ord 		AS 	id_zamowienia,
	prd 		AS 	id_produktu,
	quantity 	AS ilosc,
    cost 		AS koszt_calkowity
 FROM order_details;
 
-- 5. Ograniczenie ilosc wierszy
SELECT * FROM order_details LIMIT 100;

/*
    1. Wyświetlić wszystko z tabeli orders
    2. Wyświetlić imię, nazwisko i język klientów
    3. Wyświetlić name jako nazwa_produktu, period jako okres z tabeli product_details
    4. Wyświetlić tylko 10 zamówień (nie szczegóły)
    5. Wyświetlić supplier jako dostawca, prd_details jako produkt, cost jako koszt z tabeli products
    6. Którzy dostawcy dostarczają nam produkty (musi dostarczać chociaż 1 produkt).
*/

-- 1.
SELECT * FROM orders;
-- 2.
SELECT first_name, last_name, language FROM clients;
-- 3. 
SELECT
	name	AS	nazwa_produktu,
    period 	AS	okres
    FROM product_details;
-- 4. 
SELECT * FROM orders LIMIT 10;
-- 5. 
SELECT
	supplier	AS	dostawca,
    prd_details	AS	produkt,
    cost		AS	koszt
    FROM products;
-- 6. Którzy dostawcy dostarczają nam produkty (musi dostarczać chociaż 1 produkt).

SELECT DISTINCT supplier FROM products;


-- sortowanie danych(nie ma domyslnego sortowania) 	ORDER BY- na koncu polecenia ale przed limitem

SELECT * FROM categories;
SELECT * FROM suppliers;
--  przy tym poleceniu dane sa posortowane ale przypadkiem
SELECT * FROM suppliers ORDER BY id;
-- sortowanie rosnace jest domyslne(alfabetyczne)
SELECT * FROM orders ORDER BY order_date;

-- 2. Sorotwanie, a LIMIT
SELECT name FROM product_details LIMIT 5;
SELECT * FROM suppliers ORDER BY id LIMIT 5;

-- 3. Sortowanie po wielu kolumnach
SELECT * FROM product_details ORDER BY category, name;

-- 4. Odwrocone sortowanie DESC
SELECT * FROM product_details ORDER BY category DESC, name;
SELECT * FROM product_details ORDER BY category DESC, name DESC;

/*
    1. Wyświetlić szczegóły zamówień od najdroższego
    2. 3 najmłodsze zamówienia
    3. Klientów posortowanych po imieniu A-Z, a nazwisku Z-A
*/
-- 1. 
SELECT * FROM order_details ORDER BY cost DESC;
-- 2. 
SELECT * FROM orders ORDER BY order_date DESC LIMIT 3;
-- 3. 
SELECT * FROM clients ORDER BY first_name, last_name DESC;