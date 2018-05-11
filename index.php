<?php

require_once('functions.php');
require_once('data.php');

$data = [
    'categories_list' => $categories_list,
    'categories' => $categories,
    'title' => $title,
    'is_auth' => $is_auth,
    'user_avatar' => $user_avatar,
    'user_name' => $user_name
];

$data['main'] = include_template('templates/index.php', $data);


$layout = include_template('templates/layout.php', $data);

echo $layout;


