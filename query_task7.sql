-- Вывести список студентов, имеющих одинаковые имена, но не совпадающие ид.

WITH repeat_names AS (
    SELECT Н_ЛЮДИ.ИМЯ AS name FROM Н_УЧЕНИКИ
    INNER JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
    GROUP BY name
    HAVING COUNT(DISTINCT Н_ЛЮДИ.ИД) > 1
)
SELECT DISTINCT Н_ЛЮДИ.ИД, Н_ЛЮДИ.ИМЯ, Н_ЛЮДИ.ФАМИЛИЯ, Н_ЛЮДИ.ОТЧЕСТВО AS name FROM Н_УЧЕНИКИ
INNER JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
WHERE Н_ЛЮДИ.ИМЯ IN (SELECT name FROM repeat_names) AND Н_ЛЮДИ.ИМЯ <> '.'
ORDER BY Н_ЛЮДИ.ИМЯ ASC;
