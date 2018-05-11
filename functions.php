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
