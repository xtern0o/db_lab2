-- нет заочных студентов
-- нет > 2012-09-01
SELECT 
    Н_ФОРМЫ_ОБУЧЕНИЯ.НАИМЕНОВАНИЕ,
    COUNT(*)
FROM Н_УЧЕНИКИ
JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
JOIN Н_ПЛАНЫ ON Н_УЧЕНИКИ.ПЛАН_ИД = Н_ПЛАНЫ.ИД
JOIN Н_ФОРМЫ_ОБУЧЕНИЯ ON Н_ПЛАНЫ.ФО_ИД = Н_ФОРМЫ_ОБУЧЕНИЯ.ИД
WHERE Н_УЧЕНИКИ.НАЧАЛО > '2006-09-01'
GROUP BY Н_ФОРМЫ_ОБУЧЕНИЯ.НАИМЕНОВАНИЕ;
