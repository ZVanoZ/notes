<?php
$timeBeg = microtime(true);
chdir(__DIR__);
ini_set('max_execution_time', 60 * 5);


$commands = [
    'pwd',
    'ls -l',
    'bash show-info.sh',
];
$res = [];
foreach ($commands as $command)
 {
    $command .= " 2>&1";
    $out = '';
    exec($command, $out, $status);
    $res[] = [
        'cmd' => $command,
        'output' => $out,
        'status' => $status
    ];
}
$timeEnd = microtime(true);
array_unshift(
    $res, [
    'beg' => $timeBeg,
    'end' => $timeEnd,
    'left-seconds' => $timeEnd - $timeBeg,
    'left-minutes' => ($timeEnd - $timeBeg) / 60,
]
);

echo '<pre>';
print_r($res);
echo '<pre>';