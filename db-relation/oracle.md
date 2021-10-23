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
