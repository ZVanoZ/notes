<?php
echo '<br>dir: ' . __DIR__;
echo '<br>file: ' . __FILE__;

$res = [];
$res['getenv'] = getenv();

$commands = [
    'pwd',
    'ls -l',
    'id',
    'env',
    'set',
    'php -v',
    'php -m',
];

foreach ($commands as $command) {
    $command .= " 2>&1";
    $out = '';
    exec($command, $out, $status);
    $res[] = [
        'cmd' => $command,
        'output' => $out,
        'status' => $status
    ];
}
echo "\n<hr/><br>-- exec(...) --\n<br>";
echo '<pre>';
print_r($res);
echo '<pre>';