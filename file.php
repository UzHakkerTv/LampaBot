<?php 

include 'Telegram.php';

  if (file_exists("mysql.php")) {
    include("mysql.php");
  } else {
    die('db not fount');
  }
 
$telegram = new Telegram($bot_token);
$result = $telegram->getData();


    if (isset($_GET['text'])) {

	$text = $_GET['text'];

                $option2 = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
                $keyb2 = $telegram->buildKeyBoard($option2, $onetime = false);

                $idss=file_get_contents("stat/user_id.txt");
                
          
                $inreg=explode("\n",$idss);
               

                foreach($inreg as $id){

                    $content = ['chat_id' => $id, 'reply_markup' => $keyb2, 'text' => $text, 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content); 

                }

            
}

?>
