<?php

class SendHook
{
    private $url = 'https://panda-auto.com.ua';
    private $typeHook;

    public function __construct($typeHook)
    {
        $this->typeHook = $typeHook;

        switch ($typeHook) {
            case 'stock-entities':
                $this->url .= '/api/moy-sklad/synchronize/stock-entities';
                break;
            case 'order':
                $this->url .= '/api/moy-sklad/synchronize/order';
                break;
            case 'user':
                $this->url .= '/api/moy-sklad/synchronize/user';
                break;
            case 'receiving':
                $this->url .= '/api/moy-sklad/synchronize/receiving';
                break;
            case 'refund':
                $this->url .= '/api/moy-sklad/synchronize/refund';
                break;
        }
    }

    public function send($json)
    {
        $ch = curl_init($this->url);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        if (!$httpcode == 200) {
            file_put_contents('custom-log-hooks-error.txt', '-------' . date('Y-m-d H:i:s') . '-------' . $this->typeHook . '-------' . PHP_EOL . $json . PHP_EOL, FILE_APPEND);
        }
        return $httpcode;
    }
}