INSERT INTO categories (name) VALUES
    ('Доски и лыжи'),
    ('Крепления'),
    ('Ботинки'),
    ('Одежда'),
    ('Инструменты'),
    ('Разное');

INSERT INTO users (reg_date, email, name, password, avatar_url, contact) VALUES
    (NOW(), 'test1@gmail.com', 'Test 1', 'pwd', 'img/avatar.jpg', ''),
    (NOW(), 'test2@gmail.com', 'Test 2', 'pwd2', 'img/avatar.jpg', ''),
    (NOW(), 'test3@gmail.com', 'Test 3', 'pwd3', 'img/avatar.jpg', '');

INSERT INTO lots (
    name, description, category_id, image, start_price, bet_step, finish_date, created_at
) VALUES
    ('2014 Rossignol District Snowboard', 'Описание', 1, 'img/lot-1.jpg', 10999, 100, '2018-05-31 00:00:00', NOW()),
    ('DC Ply Mens 2016/2017 Snowboard', 'Описание', 1, 'img/lot-2.jpg', 15999, 100, '2018-05-28 00:00:00', NOW()),
    ('Крепления Union Contact Pro 2015 года размер L/XL', 'Описание', 2, 'img/lot-3.jpg', 8000, 100, '2018-06-01 00:00:00', NOW()),
    ('Куртка для сноуборда DC Mutiny Charocal', 'Описание', 4, 'img/lot-5.jpg', 7500, 100, '2018-05-25 00:00:00', NOW()),
    ('Ботинки для сноуборда DC Mutiny Charocal', 'Описание', 3, 'img/lot-6.jpg', 5400, 100, '2018-05-27 00:00:00', NOW());

INSERT INTO bets (lot_id, bet_amount, author_id, created_at) VALUES
    (1, 11099, 1, '2018-05-12 12:53:00'),
    (1, 11199, 2, '2018-05-12 12:58:00'),
    (3, 8100, 2, '2018-05-13 12:53:00'),
    (3, 8200, 1, '2018-05-14 09:33:00');

-- Получаем все категории
SELECT * FROM categories;

-- Получить самые новые, открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену, количество ставок, название категории;
SELECT
    l.name, -- имя лота
    l.start_price,  -- начальная цена лота
    l.image, -- изображение лота
    c.name AS category_name, -- название категории
    (SELECT MAX(b.bet_amount) FROM bets AS b WHERE l.id = b.lot_id) AS max_price, -- максимальная цена за лот
    (SELECT COUNT(1) FROM bets AS b WHERE l.id = b.lot_id GROUP BY b.lot_id) AS bets_count -- количество ставок
FROM
    lots AS l -- выбираем из таблицы lots (псевдоним: l)
LEFT JOIN
    categories AS c 
    ON c.id = l.category_id -- присоединяем к таблице lots таблицу categories, чтобы достать название категории по ее ID
LEFT JOIN
    bets AS b
    ON b.lot_id = l.id -- присоединяем к таблице lots таблицу bets
WHERE
    l.finish_date > NOW() -- выбираем только открытые лоты
GROUP BY
    l.id -- группируем весь результат по ID лота (из-за join'ов и внутренних запросов имеем несколько одинаковых записей, поэтому и группируем их в одну запись)
ORDER BY
    l.created_at DESC; -- сортируем от новых до старых

-- Показать лот по его ID. Получите также название категории, к которой принадлежит лот.
SELECT
    l.id,
    l.name,
    c.name AS category_name
FROM
    lots AS l
JOIN
    categories AS c
    ON l.category_id = c.id -- присоединяем таблицу категорий, чтобы достать название категории по ее ID
WHERE
    l.id = 1;

-- Обновить название лота по его идентификатору.
UPDATE lots SET name = '2014 Rossignol District Snowboard NEW' WHERE id = 1;

-- Получить список самых свежих ставок для лота по его идентификатору.
SELECT * FROM bets WHERE lot_id = 1 ORDER BY created_at DESC;