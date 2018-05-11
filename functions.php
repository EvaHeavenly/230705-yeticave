<?php

function format_money($number) {
    $num = ceil($number);

    if ($num > 1000) {
        $num = number_format($num, 0, null, ' ');
    }

    $num .= ' ₽';
    return $num;
}

function include_template($file, $data)
{
    if (!file_exists($file)) {
        return '';
    }

    ob_start();

    extract($data);

    require_once $file;

    $contents = ob_get_contents();
    ob_end_clean();
    return $contents;
}


function remaining_time($endtime) {

    date_default_timezone_set('Europe/Moscow');

    $time_left = $endtime - time();
    $hours = floor($time_left / 3600);
    $minutes = floor(($time_left - $hours * 3600) / 60);

    if ($hours < 10) {
        $hours = '0' . $hours;
    }
    if ($minutes < 10) {
        $minutes = '0' . $minutes;
    }

    return "$hours:$minutes";   
}

