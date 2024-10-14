#

## Протоколы и обёртки 

https://www.php.net/manual/ru/wrappers.php

* "php://"

https://www.php.net/manual/ru/wrappers.php.php
```text
php://input
php://output
php://fd
php://memory
php://temp
php://filter
```

'php://output' - пример отправки тела ответа
```php
file_put_contents('php://output', 'Этот текст будет отправлен как ответ');
```

'php://output' - Пример использования для отправки документа XLS без временных файлов 
```php
$document = new PHPExcel();
$writer = PHPExcel_IOFactory::createWriter($document, 'Excel2007');
header('content-type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', true); 
header('content-disposition: attachment; filename="demo-report.xlsx"'); 
// Отправка XLS, который сгенерирован библиотекой PHPExcel
$writer->save('php://output');  
```