<?php

function format_money($number) {
    
    $num = ceil($number);

    if ($num > 1000) {
        $num = number_format($num, 0, null, ' ');
    }

    $num .= ' ₽';
    return $num;
}

function include_template($file, $data) {
    
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

    $time_back = $endtime - time();
    $hours = floor($time_back / 3600);
    $minutes = floor(($time_back - $hours * 3600) / 60);

    if ($hours < 10) {
        $hours = '0' . $hours;
    }
    if ($minutes < 10) {
        $minutes = '0' . $minutes;
    }

    return "$hours:$minutes";   
}

function get_all_categories($con) {
    $query = mysqli_query($con, "SELECT id, name FROM categories");
    return mysqli_fetch_all($query, MYSQLI_ASSOC);
}
function get_all_lots($con) {
    $query = mysqli_query($con, "SELECT id, name, image FROM lots");
    return mysqli_fetch_all($query, MYSQLI_ASSOC);
}
function get_all_lots_with_categories($con) {
    $query = mysqli_query($con, "SELECT l.id, l.name, l.image, l.start_price, c.name category_name FROM lots l INNER JOIN categories c ON l.category_id = c.id");
    return mysqli_fetch_all($query, MYSQLI_ASSOC);
}
