<?php

require_once 'functions.php';
require_once 'data.php';
require_once 'db.php';

$data = [
    'categories' => get_all_categories($con),
    'title' => $title,
    'is_auth' => $is_auth,
    'user_avatar' => $user_avatar,
    'user_name' => $user_name,
    'lots_with_categories' => get_all_lots_with_categories($con)
];

$data['main'] = include_template('templates/index.php', $data);


$layout = include_template('templates/layout.php', $data);

echo $layout;