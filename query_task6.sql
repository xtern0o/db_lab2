--      2012-09-01  ->  2006-09-01
--      Заочная     ->  Очно-заочная

SELECT DISTINCT ON (Н_ЛЮДИ.ИД)
    Н_УЧЕНИКИ.ГРУППА,
    Н_УЧЕНИКИ.ИД,
    Н_ЛЮДИ.ИМЯ,
    Н_ЛЮДИ.ФАМИЛИЯ,
    Н_ЛЮДИ.ОТЧЕСТВО,
    Н_УЧЕНИКИ.П_ПРКОК_ИД AS НОМЕР_ПРИКАЗА,
    Н_УЧЕНИКИ.СОСТОЯНИЕ AS СОСТОЯНИЕ_ПРИКАЗА
FROM Н_УЧЕНИКИ
JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
WHERE Н_УЧЕНИКИ.НАЧАЛО > '2006-09-01'
AND EXISTS (
    SELECT 1 FROM Н_ПЛАНЫ
    INNER JOIN Н_ФОРМЫ_ОБУЧЕНИЯ ON Н_ПЛАНЫ.ФО_ИД = Н_ФОРМЫ_ОБУЧЕНИЯ.ИД
    INNER JOIN Н_НАПРАВЛЕНИЯ_СПЕЦИАЛ ON Н_ПЛАНЫ.НАПС_ИД = Н_НАПРАВЛЕНИЯ_СПЕЦИАЛ.ИД
    INNER JOIN Н_НАПР_СПЕЦ ON Н_НАПРАВЛЕНИЯ_СПЕЦИАЛ.НС_ИД = Н_НАПР_СПЕЦ.ИД
    WHERE Н_ПЛАНЫ.ИД = Н_УЧЕНИКИ.ПЛАН_ИД
    AND Н_ФОРМЫ_ОБУЧЕНИЯ.НАИМЕНОВАНИЕ LIKE '%заочная%'
    AND Н_НАПР_СПЕЦ.КОД_НАПРСПЕЦ = '230101'
);