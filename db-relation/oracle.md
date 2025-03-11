<hr/>

[Визуализатор схем-выполненя запросов в Oracle](https://ru.stackoverflow.com/questions/773497/Визуализатор-схем-выполненя-запросов-в-oracle)
```sql
-- В результате вернется clob поле содержащее HTML файл, который можно открыть в браузере 
select dbms_sqltune.report_sql_monitor( sql_id => '9ya87b6a04kc3',
                                        type => 'HTML',
                                        report_level => 'ALL + PLAN') as report
from dual;    
```

<hr/>

## Подключиться через SQLPlus к БД на внешнем хосте
```bash
# Логин "ldbtUser", пароль "Password123"
# БД на хосте "172.18.0.1:1521"
# ServiceName "laminasdb_test"
sqlplus ldbtUser/Password123@172.18.0.1:1521/laminasdb_test
```

## Подключиться через SQLPlus к БД на текушем хосте (с правами суперпользователя)
```bash
# Подключиться к локальной БД и выполнить скрипт
qlplus / as sysdba @create-db.sql
```

<hr>

## Пример для извлечения данных из таблицы XML

```SQL
/*
<?xml version="1.0" encoding="UTF-8"?>
<data type="some-file-type" version="1">
    <item name="user_login" value="login-ivan" type1="string"format1=""/>
    <item name="birthday"   value="31.12.1980" type1="date"  format1="d.m.Y"/>
    <item name="salary"     value="123.12"     type1="float" format1="c.f"/>
</data>

*/

WITH dataXml AS (
    SELECT
        xmltype('<?xml version="1.0" encoding="UTF-8"?>

<data type="myFormat1" version="1">
    <item name="user_login" value="ivan1980login" type="string" />
    <item name="birthday"   value="31.12.1980"    type="date"   format="d.m.Y"/>
    <item name="salary"     value="123.12"        type="float"  format="c.f"/>
    <item name="description"                      type="text">
        There a long text ...
    </item>
</data>

'
)
        AS xml
    FROM
        dual
)
SELECT
    t.extract('//item/@name').getStringVal()   as attribute_name,
    t.extract('//item/@value').getStringVal()  as attribute_value,
    t.extract('//item/@type').getStringVal()   as attribute_type,
    t.extract('//item/@format').getStringVal() as attribute_format,
    extractvalue(t.column_value, '/*')         as xml_node_item     -- Извлечь текст из ноды
    --t.column_value.getrootelement()           AS node_Name,       -- Извлечь имя ноды
    --t.*
FROM
    dataXml s,
    TABLE ( xmlsequence(s.xml.extract('data/item')) )t
;

/* Результатт
"ATTRIBUTE_NAME"              "ATTRIBUTE_VALUE"             "ATTRIBUTE_TYPE"              "ATTRIBUTE_FORMAT"            "XML_NODE_ITEM"               
"user_login"                  "ivan1980login"               "string"                      ""                            ""                            
"birthday"                    "31.12.1980"                  "date"                        "d.m.Y"                       ""                            
"salary"                      "123.12"                      "float"                       "c.f"                         ""                            
"description"                 ""                            "text"                        ""                            "
        There a long text ...
    "
*/

    
```


## TODO

```sql
-- Разобраться зачем админ выполняет этот запрос при проблемах с производительностью.
ALTER SYSTEM FLUSH SHARED_POOL;
```