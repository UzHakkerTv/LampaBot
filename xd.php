<?php

include 'Telegram.php';

  if (file_exists("mysql.php")) {
    include("mysql.php");
  } else {
    die('db not fount');
  }
$telegram = new Telegram($bot_token);
if (!isset($_POST['submit'])){
   
    echo 'XABAR YUBORISH \n\n
    <form action="" method="post">
    Введите:<br />
<textarea name="text"></textarea><br />
<input type="submit" name="submit" value="Yuborish" />
</form>';
} else {
$text=trim($_POST['text']);
if (strlen($text)<2 or strlen($text)>10000) $err['text']='xato xabar';
if (!isset($err)){
$idss=file_get_contents("stat/user_id.txt");
    $inreg=explode("\n",$idss);
                foreach($inreg as $id){
                    $content = array('chat_id' => $id, 'text' => $text, 'parse_mode' => 'markdown');
                    $telegram->sendMessage($content); 

                }


    echo 'Yuborildi';
        
}
}

?>
