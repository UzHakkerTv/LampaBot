
<?php 

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
  die('db not fount'); }
  
try {
  $connect = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
 } catch (PDOException $e) {
   print "Error!: " . $e->getMessage() . "<br/>";
die('db not connect');
}

function getUserInfo($uid) {
global $connect;

	$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
	$statement->bindParam(':login', $uid, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else 
	{
	  return "Ваш ID: $row[uid]   
	  Подписались: $row[joinn]   
	  Всего рефералов: $row[ref]  
	  Доход с подписок: $row[money_join]   
	  Доход от рефералов: $row[money_ref]   
	  Ваш баланс: $row[money]   
	  Вывели: $row[outmoney]   ";
	}
}

function getUserMoney($uid) {
global $connect;

	$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
	$statement->bindParam(':login', $uid, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else 
	{
	  return "На вашем балансе: $row[money]   
	  Доход от подписок: $row[money_join]   
	  Доход от рефералов: $row[money_ref]   
	  Уже вывели: $row[outmoney]   ";
	}
}

function getUserRef($uid) {
global $connect;

	$statement = $connect->prepare('SELECT * FROM user WHERE uid=:login');
	$statement->bindParam(':login', $uid, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else 
	{
	  return "Ваши рефералы: $row[ref]   

	  Отправьте вашу рефералную ссылку друзям и вы будете получать вознаграждение по 0.30 рублей за каждого приглашенному вами другу.

	  Ваша рефералная ссылка: $row[referal]  ";
	}
}

function getStat() {
global $connect;
$uid = '1';

	$statement = $connect->prepare('SELECT * FROM bot WHERE id=:login');
	$statement->bindParam(':login', $uid, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetch(PDO::FETCH_ASSOC);
	if(!$row){
	  return false;
	} else 
	{
	  return "Всего участников: $row[user]   
	  Всего каналов: $row[channel]   
	  Баланс в боте: $row[money]  
	  Общий заработок: $row[inmoney]   
	  Выплачено денег: $row[outmoney]   ";
	}
}

function getUserCount() {
global $userCount;
	 return file_get_contents($userCount);
}

function getMyChannel($chat_id) {
	global $connect;
	$mychannel = 'base/'.$chat_id.'_mychannel.txt';
	unlink($mychannel);

	$statement = $connect->prepare('SELECT * FROM channel WHERE join_id=:login');
	$statement->bindParam(':login', $chat_id, PDO::PARAM_STR);
	$statement->execute();
	$row = $statement->fetchAll();
	if(!$row){
	  return "У вас нет каналов";
	} else 
	{
		$count = count($row);

		for ($i=0; $i<$count; $i++){

		    $regex = "~([0-9]+)~";
		    $inreg = preg_split($regex, $row[$i][1], -1, PREG_SPLIT_DELIM_CAPTURE);
		    $ChannelID = $inreg[1];
		    $ChLogin = $row[$i][2];

			$text = '@'.$ChLogin.' ';
			echo "<br/><br/>";

			//faylni uchirib qaytadan saqlash
			$handle = fopen($mychannel, 'a+'); 
			fwrite($handle, $text);
			fclose($handle);
		}
		$file = file_get_contents($mychannel);
	  return  'У вас '.$count. ' каналов. 
	  Ваши каналы: '.$file;
	}
}

function getMyZakaz($chat_id) {
	global $connect;
	$mychannel = 'base/'.$chat_id.'_myzakaz.txt';
	unlink($mychannel);

	$statement = $connect->prepare("SELECT id, uid, login, regcount, count FROM `channel` WHERE demo='0' && count > '0' && join_id = $chat_id ");
	$statement->execute();
	$row = $statement->fetchAll();
	if(!$row){
	  return "У вас нет заказов";
	} else 
	{
		$count = count($row);

		for ($i=0; $i<$count; $i++){

			$count2 = $row[$i][2];

		    $ChLogin = $row[$i][2];
		    $regcount2 = $row[$i][3];
		    $count2 = $row[$i][4];
		    $qoldiq = $regcount2 - $count2;

			$text = 'На канал: @'.$ChLogin.' От
			 ' .$regcount2.' ти выполнено ' .$qoldiq.'.


			 ';
			echo "<br/><br/>";
			//$text = print_r($row);
			//faylni uchirib qaytadan saqlash
			$handle = fopen($mychannel, 'a+'); 
			fwrite($handle, $text);
			fclose($handle);
		}
		$file = file_get_contents($mychannel);
	  return  'У вас есть '.$count. ' заказов. 
	  '.$file;
	}
}

function getJoinChannel($chat_id) {
	global $connect;
	$joined = file_get_contents('base/'.$chat_id.'_joined.txt');

	$statement = $connect->prepare("SELECT id, uid, login, title FROM `channel` WHERE demo='0' && count > '0' ");
	$statement->execute();
	$row = $statement->fetchAll();
	if(!$row){
		return false;;
	} else 
	{
		$count = count($row);

		for ($i=0; $i<$count; $i++){

		    $regex = "~([0-9]+)~";
		    $inreg = preg_split($regex, $row[$i][1], -1, PREG_SPLIT_DELIM_CAPTURE);
		    $ChannelID = $inreg[1];
		    $ChLogin = $row[$i][2];

			$joined = file_get_contents('base/'.$chat_id.'_joined.txt');

			if (strpos($joined, $ChannelID) !== false)
			{  } else 
			{ 
				return $ChLogin.'#'.$ChannelID;
				break;
			}
		}
	}
}

?>
