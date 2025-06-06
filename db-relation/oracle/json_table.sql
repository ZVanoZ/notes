-- Пример разбора JSON при помощи встроенного оператора JSON_TABLE
-- 1. Тип BOOLEAN в Oracle отсутствует. Поэтому преобразуется в интерпретируемое значение Oracle.
-- 2. Тип date в JSON отсутствует.  Поэтому преобразуется из строки поля JSON в тип date Oracle.
WITH params AS (
    SELECT
        '[{"ID":1,"IS_USED":true,"NAME":"Hello", "created_at": "2023-11-22T10:30:00Z"},{"ID":2,"IS_USED":false,"NAME":"World"},{"ID":3,"IS_USED":null,"NAME":"some-value"}]' AS json_text
    FROM
        dual
)
SELECT
    t.item_id,
    t.item_is_used,
    CASE
        WHEN t.item_is_used IS NULL THEN null
        WHEN t.item_is_used = 1 THEN 'true'
        ELSE 'false'
    END AS item_is_used_boolean,
    t.item_name,
    TO_TIMESTAMP_TZ(t.item_created_at, 'YYYY-MM-DD"T"HH24:MI:SS"Z"') AS item_created_at
FROM
    params,
    JSON_TABLE ( params.json_text, '$[*]'
        COLUMNS (
            item_id NUMBER PATH '$.ID',
            item_is_used NUMBER PATH '$.IS_USED',
            item_name VARCHAR2 PATH '$.NAME',
            item_created_at VARCHAR2(255) PATH '$.created_at'
        )
    ) t
;