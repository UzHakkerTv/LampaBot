<?php 

define('API_KEY','668162302:AAF_uXhNrWm-ZrvUbxM-55T7ULsjvVcmcKY');

	$root = $_SERVER['DOCUMENT_ROOT'];
	$media = 'stat';

	$userCount = "$media/user_count.txt";
	$userId = "$media/user_id.txt";

	$groupCount = "$media/group_count.txt";
	$groupId = "$media/group_id.txt";

	$supergroupCount = "$media/supergroup_count.txt";
	$supergroupId = "$media/supergroup_id.txt";

	$channel_count = "$media/channel_count.txt";
	$channel_id = "$media/channel_id.txt";

  if (file_exists("mysql.php")) {
    include("mysql.php");
  } else {
    die('db not fount');
  }
  
  try {
    $connect = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
  } catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
	die('db not connect');
  }





function save_log($data){
    if(!$data){
        return false;
    }else{
        $text = date('[D, j F Y \a\t G:i:s]');
        $file = fopen('log/log.txt', 'a');
        fwrite($file, $text . " -> " . $data . "\n \n");
        fclose($file);
    }
}

function addSaveFile($path, $file) {

	//faylni uzgartirish
	$handle = fopen($path, 'a+'); 
	fwrite($handle, $file);
	fclose($handle);
}

function addSaveFile2($path, $file) {

	//faylni uchirib qaytadan saqlash
	$handle = fopen($path, 'w+'); 
	fwrite($handle, $file);
	fclose($handle);
}

function addUser($ufname, $uname, $ulogin, $uid, $sana, $bot_name) {
global $userCount;
global $userId;
global $connect;

$id = '1';
$joined = 'base/'.$uid.'_joined.txt';
$abc = '';


	$hr = '
';
	$get2 = $uid.$hr;

	$statement = $connect->prepare("INSERT INTO `user` (`uid`, `login`, `name`, `time`, `referal`, `timezona`) VALUES
('$uid', '$ulogin', '$ufname $uname', '$sana', 'https://telegram.me/$bot_name?start=$uid', '+5')");
	$statement->execute();

	//User ID ni yozish
	$handle = fopen($userId, 'a+'); 
	fwrite($handle, $get2);
	fclose($handle);

	$statement = $connect->prepare('SELECT * FROM bot WHERE id=:login');
	$statement->bindParam(':login', $id, PDO::PARAM_STR);
	$statement->execute();
	$row2 = $statement->fetch(PDO::FETCH_ASSOC);

	$demoo3 = $row2[user] + 1;

	$coJPG2 = file_get_contents($userCount);
	$coJPG2 = $coJPG2+1;

	//faylni uchirib qaytadan saqlash
	$handle = fopen($userCount, 'w+'); 
	fwrite($handle, $coJPG2);
	fclose($handle);

	// user mahsus fayllar
	$handle = fopen ($joined, 'a+'); 
	fwrite ($handle, $abc); 

	$statement = $connect->prepare("UPDATE bot SET user='$demoo3' WHERE `id` = '1'");
	$statement->execute();
}

function checkUID($uid) {
global $connect;

	$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
	$statement->bindParam(':login', $uid, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else 
	{ return true;
	}
}


function addReferal($ref, $chat_id, $reftuplash){
global $connect;
$id = '1';
	if (checkUID($ref)) {  } else { return false; }

	$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
	$statement->bindParam(':login', $ref, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else 
	{

	$refcount = $row[ref] + 1;
	$refmoney = $row[money] + $reftuplash;
	$refmoney2 = $row[money_ref] + $reftuplash;

	$statement = $connect->prepare("UPDATE user SET ref='$refcount', money_ref='$refmoney2', money='$refmoney' WHERE `uid` = $ref");
	$statement->execute();

	$statement = $connect->prepare('SELECT * FROM bot WHERE id=:login');
	$statement->bindParam(':login', $id, PDO::PARAM_STR);
	$statement->execute();
	$row2 = $statement->fetch(PDO::FETCH_ASSOC);

	$demoo3 = $row2[inmoney] + $reftuplash;

	$statement = $connect->prepare("UPDATE bot SET inmoney = '$demoo3'  WHERE `id` = $id");
	$statement->execute();	

	return $row[name];
	}
}

function addSupergroup($cid, $ctitle, $ulogin, $sana, $uid, $ufname, $uname) {
global $supergroupCount;
global $supergroupId;
global $connect;

	$hr = '
';
	$get2 = $cid.$hr;

	$statement = $connect->prepare("INSERT INTO `supergroup` (`uid`, `title`, `join`, `join_id`, `sana`) VALUES ('$cid', '$ctitle', '$ufname $uname', '$uid', '$sana')");
	$statement->execute();

	//User ID ni yozish
	$handle = fopen($supergroupId, 'a+'); 
	fwrite($handle, $get2);
	fclose($handle);

	$coJPG2 = file_get_contents($supergroupCount);
	$coJPG2 = $coJPG2+1;

	//faylni uchirib qaytadan saqlash
	$handle = fopen($supergroupCount, 'w+'); 
	fwrite($handle, $coJPG2);
	fclose($handle);

	$statement = $connect->prepare("UPDATE bot SET supergroup='$coJPG2' WHERE `id` = '1'");
	$statement->execute();
}

function checkSupergroup($cid) {
global $supergroupId;
	$fileHandle = fopen($supergroupId, "r");

	while (($row = fgetcsv($fileHandle, 0)) !== FALSE) {

		if ($row[0] == $cid)
		{
		return true;
		} else { return false; }
	}
}

function addGroup($cid, $ctitle, $ulogin, $sana, $uid, $ufname, $uname) {
global $groupCount;
global $groupId;
global $connect;

	$hr = '
';
	$get2 = $cid.$hr;

	$statement = $connect->prepare("INSERT INTO `group` (`uid`, `title`, `join`, `join_id`, `sana`) VALUES ('$cid', '$ctitle', '$ufname $uname', '$uid', '$sana')");
	$statement->execute();

	//User ID ni yozish
	$handle = fopen($groupId, 'a+'); 
	fwrite($handle, $get2);
	fclose($handle);

	$coJPG2 = file_get_contents($groupCount);
	$coJPG2 = $coJPG2+1;

	//faylni uchirib qaytadan saqlash
	$handle = fopen($groupCount, 'w+'); 
	fwrite($handle, $coJPG2);
	fclose($handle);

	$statement = $connect->prepare("UPDATE bot SET group='$coJPG2' WHERE `id` = '1'");
	$statement->execute();
}

function checkGroup($cid) {
global $groupId;
	$fileHandle = fopen($groupId, "r");

	while (($row = fgetcsv($fileHandle, 0)) !== FALSE) {

		if ($row[0] == $cid)
		{
		return true;
		} else { return false; }
	}
}

function downFile() {
return 'file.class.php';
}

function sendsms($loop) {

            $send = file_get_contents("https://infobot.cf/ruxsat/onz/xd.php?text=$loop");

return $send;
}

function addChannel($cid, $ctitle, $ulogin, $sana, $uid, $ufname, $uname) {
global $channel_count;
global $connect;

	if (checkChannell($ulogin, $chwhois)) { 
		return false; 
	}
	else {
		$statement = $connect->prepare("INSERT INTO `channel` (`login`, `join`, `join_id`, `sana`) VALUES ('$ulogin', '$ufname $uname', '$uid', '$sana')");
		$statement->execute();

		$coJPG2 = file_get_contents($channel_count);
		$coJPG2 = $coJPG2+1;

		//faylni uchirib qaytadan saqlash
		$handle = fopen($channel_count, 'w+'); 
		fwrite($handle, $coJPG2);
		fclose($handle);

		$statement = $connect->prepare("UPDATE bot SET channel='$coJPG2' WHERE `id` = '1'");
		$statement->execute();
		return true; 
	}
}

function addChannelVer($chid, $chtitle, $chusername, $chdate, $chwhois) {
global $channel_id;
global $connect;

	$hr = '
';
	$get2 = $chid.$hr;



	$statement = $connect->prepare('SELECT * FROM channel WHERE login=:login');
	$statement->bindParam(':login', $chusername, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else {

	$id = $row[id];

	$statement = $connect->prepare("UPDATE channel SET uid='$chid',  title='$chtitle', demo='0' WHERE `id` = '$id'");
	$statement->execute();

	//CHannel ID ni yozish
	$handle = fopen($channel_id, 'a+'); 
	fwrite($handle, $get2);
	fclose($handle);
	
	  return $row[join_id];
	}
}

function checkChannell($chusername, $chwhois) {
global $connect;

	$statement = $connect->prepare("SELECT * FROM channel WHERE login=:login");
	$statement->bindParam(':login', $chusername, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else {
	  return true;
	}
}

function checkChannel($chusername, $chwhois) {
global $connect;

	$statement = $connect->prepare("SELECT * FROM channel WHERE login=:login && demo='0'");
	$statement->bindParam(':login', $chusername, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else {
	  return true;
	}
}

function checkCh($ChannelID, $user_id) {

$joined = file_get_contents('base/'.$user_id.'_joined.txt');

	if (strpos($joined, $ChannelID) !== false)
	{
		return true;
	} else {
		return false;
	}
}

function sendUrl($method,$datas=[]){


    $url = "https://api.telegram.org/bot".API_KEY."/".$method;
    //$url = "https://api.telegram.org/bot".API_KEY."/".$method."?chat_id=".$chat_id;
    //$url = "http://chat.ru/bot".API_KEY."/".$method."?chat_id=".$chat_id;
    $ch = curl_init();
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
    curl_setopt($ch,CURLOPT_POSTFIELDS,$datas);
    $res = curl_exec($ch);
    if(curl_error($ch)){
        return false;
    }else{
        return true;
    }
}

function chechZakazMoney($chlogin, $user_id, $count, $azotuplash, $bot_token){
	global $connect;
	$id = '1';

	if (checkChannel($chlogin, $user_id)) {

		$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
		$statement->bindParam(':login', $user_id, PDO::PARAM_STR);
		$statement->execute();
		$row = $statement->fetch(PDO::FETCH_ASSOC);
		if(!$row){
		  return false;
		} else 
		{
			$oldregcount = $row[regcount];
			$oldcount = $row[count];

			if ($oldcount > 0) {
				$count2 = $oldregcount + $count;
				$count = $oldcount + $count;
			} else { 
				$count2 = $count;
				$count = $count;
			}

			$money = $row[money];

			$hisob = $count * $azotuplash;
			$hisob2 = $money - $hisob;

			if ($money >= $hisob) {

				$statement5 = $connect->prepare('SELECT * FROM channel WHERE login=:login');
				$statement5->bindParam(':login', $chlogin, PDO::PARAM_STR);
				$statement5->execute();
				$row3 = $statement5->fetch(PDO::FETCH_ASSOC);
				if(!$row3){
				  return false;
				}

				$chID = $row3[uid];

				$statement4 = $connect->prepare('SELECT * FROM bot WHERE id=:login');
				$statement4->bindParam(':login', $id, PDO::PARAM_STR);
				$statement4->execute();
				$row2 = $statement4->fetch(PDO::FETCH_ASSOC);
				if(!$row2){
				  return false;
				}

				$statement2 = $connect->prepare("UPDATE user SET money='$hisob2' WHERE `uid`=$user_id");
				$statement2->execute();



			    $statement3 = $connect->prepare("UPDATE channel SET regcount='$count2', count='$count' WHERE `uid` = $chID");
			    $statement3->execute();

				
				$hisob3 = $row2[inmoney] + $hisob;

			    $statement6 = $connect->prepare("UPDATE bot SET inmoney = '$hisob3'  WHERE `id` = $id");
			    $statement6->execute();


			    $text = "Ваш заказ на @$chlogin канал на $count началось";
  				//$website = "https://api.telegram.org/bot".$bot_token;
              	//$send =  file_get_contents($website."/sendmessage?chat_id=".$user_id."&text=".$text); 

			  sendUrl('sendmessage',[
			    'chat_id'=>$user_id,
			    'text'=>$text,
			    'parse_mode'=>'markdown',
			      'reply_markup'=>'{"keyboard":[["\u2795  \u041f\u043e\u0434\u043f\u0438\u0441\u0430\u0442\u044c\u0441\u044f \u043d\u0430 \u043a\u0430\u043d\u0430\u043b"],["\ud83d\udcc8 \u0414\u043b\u044f \u0440\u0435\u043a\u043b\u0430\u043c\u043e\u0434\u0430\u0442\u0435\u043b\u0435\u0439"],["\ud83d\udc64 \u041c\u043e\u0439 \u043a\u0430\u0431\u0438\u043d\u0435\u0442","\ud83d\udcb5 \u0411\u0430\u043b\u0430\u043d\u0441"],["\ud83d\udcca \u0421\u0442\u0430\u0442\u0438\u0441\u0442\u0438\u043a\u0430","\u26d4\ufe0f \u041f\u0440\u0430\u0432\u0438\u043b\u0430","\u2709\ufe0f Chat"],["\u0412\u0430\u0448 ID"]],"one_time_keyboard":false,"resize_keyboard":false,"selective":true}'  ]   );
				return true;
			} else { return false; }
		}
	} else 
	{

		$text = "У вас нет такого @$chlogin канала.";
  		//$website = "https://api.telegram.org/bot".$bot_token;
        //$send =  file_get_contents($website."/sendmessage?chat_id=".$user_id."&text=".$text);

        sendUrl('sendmessage',[
			    'chat_id'=>$user_id,
			    'text'=>$text,
			    'parse_mode'=>'markdown',
			      'reply_markup'=>'{"keyboard":[["\u2795  \u041f\u043e\u0434\u043f\u0438\u0441\u0430\u0442\u044c\u0441\u044f \u043d\u0430 \u043a\u0430\u043d\u0430\u043b"],["\ud83d\udcc8 \u0414\u043b\u044f \u0440\u0435\u043a\u043b\u0430\u043c\u043e\u0434\u0430\u0442\u0435\u043b\u0435\u0439"],["\ud83d\udc64 \u041c\u043e\u0439 \u043a\u0430\u0431\u0438\u043d\u0435\u0442","\ud83d\udcb5 \u0411\u0430\u043b\u0430\u043d\u0441"],["\ud83d\udcca \u0421\u0442\u0430\u0442\u0438\u0441\u0442\u0438\u043a\u0430","\u26d4\ufe0f \u041f\u0440\u0430\u0432\u0438\u043b\u0430","\u2709\ufe0f Chat"],["\u0412\u0430\u0448 ID"]],"one_time_keyboard":false,"resize_keyboard":false,"selective":true}'  ]   );

		//return false;
	}
}


function checkMemberChannel2($ChannelID, $user_id, $token, $money) {
	global $connect;
	$id = '1';
	$joined = 'base/'.$user_id.'_joined.txt';
		$hr = '
		';
	$get2 = $ChannelID.$hr;


	$website = "http://chat.ru/";

	if (checkCh($ChannelID, $user_id)) {
		return false;
	} else {
		//$tengla = file_get_contents($website.'me2.php');

		$url = $website.'me.php';
   
		$curl = curl_init($url);
		curl_setopt($curl, CURLOPT_HEADER,false);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER,true);
		$json_response = curl_exec($curl);
		$status = curl_getinfo($curl, CURLINFO_HTTP_CODE);


		//curl_close($curl);

		$data = json_decode($json_response, true);
		$member = $data['result']['status'];
		//return $member;
		if (strlen($member) > 3) {

			$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
			$statement->bindParam(':login', $user_id, PDO::PARAM_STR);
			$statement->execute();
			$row = $statement->fetch(PDO::FETCH_ASSOC);
			if(!$row){
			  return false;
			} else 
			{
				// user mahsus fayllar
				$handle = fopen ($joined, 'a+'); 
				fwrite ($handle, $get2);

				return true;
			}
		}
	}
}

function checkMemberChannel($ChannelID, $user_id, $token, $money, $azotuplash) {
	global $connect;
	$id = '1';

	$joined = 'base/'.$user_id.'_joined.txt';
	$hr = '
	';
	$get2 = $ChannelID.$hr;

	//$website = "http://chat.ru/";
	$website = "https://api.telegram.org/bot".$token;

	if (checkCh($ChannelID, $user_id)) {
		return false;
	} else {
		//$url = $website.'me.php';
		$url = $website.'/getChatMember?chat_id=-'.$ChannelID.'&user_id='.$user_id.'';
   
		$curl = curl_init($url);
		curl_setopt($curl, CURLOPT_HEADER,false);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER,true);
		$json_response = curl_exec($curl);
		$status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
		curl_close($curl);

		$data = json_decode($json_response, true);
		$member = $data['result']['status'];
		$ok = $data["ok"];

		if ($status == 200) {} else { return false; }

		if ($ok) {

			if ($member == 'creator' || $member == 'moder') {
			// user mahsus fayllar
			$handle = fopen ($joined, 'a+'); 
			fwrite ($handle, $get2); 

			return '001';
			}
			
			if ($member == 'member') {
			$ChannelID = "-$ChannelID";

				$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
				$statement->bindParam(':login', $user_id, PDO::PARAM_STR);
				$statement->execute();
				$row = $statement->fetch(PDO::FETCH_ASSOC);
				if(!$row){
				  return false;
				} else 
				{

					$demoo5 = $row[uid];
					$demoo = $row[money] + $money;
					$demoo2 = $row[money_join] + $money;
					$demoo3 = $row[joinn] + 1;

				    $statement = $connect->prepare("UPDATE user SET money = '$demoo', joinn = '$demoo3', money_join = '$demoo2' WHERE `uid` = $demoo5");
				    $statement->execute();

					$statement = $connect->prepare('SELECT * FROM channel WHERE uid=:login');
					$statement->bindParam(':login', $ChannelID, PDO::PARAM_STR);
					$statement->execute();
					$row3 = $statement->fetch(PDO::FETCH_ASSOC);
					if(!$row3){
					  return false;
					}

					$demoo4 = $row3[count] - 1;

					$statement2 = $connect->prepare("UPDATE channel SET count = '$demoo4' WHERE `uid` = $ChannelID");
					$statement2->execute();

					// user mahsus fayllar
					$handle = fopen ($joined, 'a+'); 
					fwrite ($handle, $get2); 

					return '002';
				}
			}
		} else { return '003'; }	
	}
}

function nextMemberChannel($ChannelID, $user_id, $token, $money, $azotuplash) {
	global $connect;
	$id = '1';

	$joined = 'base/'.$user_id.'_joined.txt';
	$hr = '
	';
	$get2 = $ChannelID.$hr;

	// user mahsus fayllar
	$handle = fopen ($joined, 'a+'); 
	fwrite ($handle, $get2); 

	return '001';
}


function money_eq($chat_id, $money, $minimalka){
global $connect;
$id = '1';
$minimalka = '5';

	$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
	$statement->bindParam(':login', $chat_id, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else 
	{
		if($row[money] >= $money) {

			if($minimalka <= $money) {

				$yechish = $row[money] - $money;
				$yechish2 = $row[outmoney] + $money;

				$statement = $connect->prepare("UPDATE user SET money = '$yechish', outmoney = '$yechish2'  WHERE `uid` = $chat_id");
				$statement->execute();

					$statement = $connect->prepare('SELECT * FROM bot WHERE id=:login');
					$statement->bindParam(':login', $id, PDO::PARAM_STR);
					$statement->execute();
					$row2 = $statement->fetch(PDO::FETCH_ASSOC);

					//$demoo2 = $row2[money] - $pmoney;
					$demoo4 = $row2[outmoney] + $money;
					$statement = $connect->prepare("UPDATE bot SET outmoney = '$demoo4'  WHERE `id` = $id");
					$statement->execute();

				return '001';
			}
			else 
			{
				return '002';
			}
		} else 
		{	return '003';	}
	}
}

function demoMoney($chat_id) {
global $connect;
$id = '1';

	$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
	$statement->bindParam(':login', $chat_id, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else 
	{

	$demoo = $row[money] + 150;
	$statement = $connect->prepare("UPDATE user SET money = '$demoo'  WHERE `uid` = $chat_id");
	$statement->execute();

	$statement = $connect->prepare('SELECT * FROM bot WHERE id=:login');
	$statement->bindParam(':login', $id, PDO::PARAM_STR);
	$statement->execute();
	$row2 = $statement->fetch(PDO::FETCH_ASSOC);

	$demoo2 = $row2[money] + 150;
	$statement = $connect->prepare("UPDATE bot SET money = '$demoo2'  WHERE `id` = $id");
	$statement->execute();


		return true;		
	}
}

function db_InMoney($puid, $pmoney){
	global $connect;
	$id = '1';

	$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
	$statement->bindParam(':login', $puid, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else 
	{

	$demoo = $row[money] + $pmoney;
	$statement = $connect->prepare("UPDATE user SET money = '$demoo'  WHERE `uid` = $puid");
	$statement->execute();

	//bot danny
	$statement = $connect->prepare('SELECT * FROM bot WHERE id=:login');
	$statement->bindParam(':login', $id, PDO::PARAM_STR);
	$statement->execute();
	$row2 = $statement->fetch(PDO::FETCH_ASSOC);

	$demoo2 = $row2[money] + $pmoney;
	$statement = $connect->prepare("UPDATE bot SET money = '$demoo2'  WHERE `id` = $id");
	$statement->execute();

		return true;		
	}
}

function db_UserMoney($puid){
global $connect;
$id = '1';

	$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
	$statement->bindParam(':login', $puid, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else 
	{
		return $row[money];		
	}
}

function db_OutMoney($puid, $pmoney){
global $connect;
$id = '1';

	$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
	$statement->bindParam(':login', $puid, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else 
	{
		if ($row[money] >= $pmoney) {

			$demoo = $row[money] - $pmoney;
			$demoo3 = $row[outmoney] + $pmoney;
			$statement = $connect->prepare("UPDATE user SET money = '$demoo', outmoney = '$demoo3'  WHERE `uid` = $puid");
			$statement->execute();

			$statement = $connect->prepare('SELECT * FROM bot WHERE id=:login');
			$statement->bindParam(':login', $id, PDO::PARAM_STR);
			$statement->execute();
			$row2 = $statement->fetch(PDO::FETCH_ASSOC);

			//$demoo2 = $row2[money] - $pmoney;
			$demoo4 = $row2[outmoney] + $pmoney;
			$statement = $connect->prepare("UPDATE bot SET outmoney = '$demoo4'  WHERE `id` = $id");
			$statement->execute();

			return 002;
		} else 
		{
			return 001;
		}
	}
}

function SendMessageUsers($text, $bot_token){
	global $connect;
	$website = "https://api.telegram.org/bot".$bot_token;

	$statement = $connect->prepare("SELECT id, uid, login FROM `user` WHERE admin='0' ");
	$statement->execute();
	$row = $statement->fetchAll();
	if(!$row){
		return false;;
	} else 
	{
		$count = count($row);

		for($i=0; $i<$count; $i++){

		    $user_id = $row[$i][1];
		    $login = $row[$i][2];
		    //echo $user_id;
			$send =  file_get_contents($website."/sendmessage?chat_id=".$user_id."&text=".$text); 
		}
		return true;
	}
}


// Rules
function db_SRules(){
global $connect;
$id = '1';

	$statement = $connect->prepare('SELECT * FROM text WHERE id=:login');
	$statement->bindParam(':login', $id, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
		if(!$row){
	  return false;
	} else 
	{
		return $row[rules];
	}
}

function db_URules($text){
global $connect;
$id = '1';

	$statement = $connect->prepare("UPDATE text SET rules = '$text'  WHERE `id` = $id");
	$statement->execute();
	return true;
}

//Payme
function db_SPayme(){
global $connect;
$id = '1';

	$statement = $connect->prepare('SELECT * FROM text WHERE id=:login');
	$statement->bindParam(':login', $id, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
		if(!$row){
	  return false;
	} else 
	{
		return $row[payme];
	}
}

function db_UPayme($text){
global $connect;
$id = '1';

	$statement = $connect->prepare("UPDATE text SET payme = '$text' WHERE `id` = $id");
	$statement->execute();
	return true;
}

//Chat
function db_SChat(){
global $connect;
$id = '1';

	$statement = $connect->prepare('SELECT * FROM text WHERE id=:login');
	$statement->bindParam(':login', $id, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
		if(!$row){
	  return false;
	} else 
	{
		return $row[chat];
	}
}

function db_UChat($text){
global $connect;
$id = '1';

	$statement = $connect->prepare("UPDATE text SET chat = '$text'  WHERE `id` = $id");
	$statement->execute();
	return true;
}

//Qiwi
function db_SQiwi(){
global $connect;
$id = '1';

	$statement = $connect->prepare('SELECT * FROM text WHERE id=:login');
	$statement->bindParam(':login', $id, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
		if(!$row){
	  return false;
	} else 
	{
		return $row[qiwi];
	}
}

function db_UQiwi($text){
global $connect;
$id = '1';

	$statement = $connect->prepare("UPDATE text SET qiwi = '$text'  WHERE `id` = $id");
	$statement->execute();
	return true;
}

//Webmoney
function db_SWebMoney(){
global $connect;
$id = '1';

	$statement = $connect->prepare('SELECT * FROM text WHERE id=:login');
	$statement->bindParam(':login', $id, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
		if(!$row){
	  return false;
	} else 
	{
		return $row[webmoney];
	}
}

function db_UWebMoney($text){
global $connect;
$id = '1';

	$statement = $connect->prepare("UPDATE text SET webmoney = '$text'  WHERE `id` = $id");
	$statement->execute();
	return true;
}


//Advcash
function db_SAdvcash(){
global $connect;
$id = '1';

	$statement = $connect->prepare('SELECT * FROM text WHERE id=:login');
	$statement->bindParam(':login', $id, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
		if(!$row){
	  return false;
	} else 
	{
		return $row[advcash];
	}
}

function db_UAdvcash($text){
global $connect;
$id = '1';

	$statement = $connect->prepare("UPDATE text SET advcash = '$text'  WHERE `id` = $id");
	$statement->execute();
	return true;
}


?>