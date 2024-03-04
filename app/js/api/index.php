<?php

require_once 'class-send-hook.php';

if ($_SERVER['REMOTE_ADDR'] == '5.58.45.18') {
    $json = file_get_contents('php://input');
//    $json = '{"auditContext":{"meta":{"type":"audit","href":"https://api.moysklad.ru/api/remap/1.2/audit/cdc8b0f6-99ba-11ee-0a80-017d001269f3"},"uid":"moysklad@chinacars","moment":"2023-12-13 16:23:29"},"events":[{"meta":{"type":"demand","href":"https://api.moysklad.ru/api/remap/1.2/entity/demand/b47c3d0a-99ba-11ee-0a80-02cf0022fa9a"},"action":"UPDATE","accountId":"04301f39-ba65-11e4-90a2-8ecb00007bfb"}]}';
    $sendHook = new SendHook('demand');
    $httpcode = $sendHook->send($json);
    if ($httpcode == 200) {
        header("HTTP/1.1 200 OK");
        exit();
    } else {
        file_put_contents('custom-log-hooks-error.txt', '-------' . date('Y-m-d H:i:s') . '-------' . $this->url . '-------' . PHP_EOL . $json . PHP_EOL, FILE_APPEND);
        header("HTTP/1.1 400 Bad Request");
        exit();
    }

}
$json = file_get_contents('php://input');
file_put_contents('custom-log-hooks.txt', '-------' . date('Y-m-d H:i:s') . '-------' . '1' . '-------' . PHP_EOL . $json . PHP_EOL, FILE_APPEND);
