<?php
require_once 'class-send-hook.php';
$json = file_get_contents('php://input');
$sendHook = new SendHook('refund');
$httpcode = $sendHook->send($json);
if ($httpcode == 200) {
    header("HTTP/1.1 200 OK");
    exit();
} else {
    header("HTTP/1.1 400 Bad Request");
    exit();
}
