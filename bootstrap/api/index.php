<?php

require 'Slim/Slim.php';

$app = new Slim();

$app->get('/orchids', 'getOrchids');
$app->get('/orchids/:id',	'getOrchid');
$app->get('/orchids/search/:query', 'findByName');
$app->post('/orchids', 'addOrchid');
$app->put('/orchids/:id', 'updateOrchid');
$app->delete('/orchids/:id',	'deleteOrchid');

$app->run();

function getOrchids() {
	$sql = "select * FROM wine ORDER BY genus";
	try {
		$db = getConnection();
		$stmt = $db->query($sql);  
		$orchids = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		// echo '{"wine": ' . json_encode($wines) . '}';
		echo json_encode($orchids);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}'; 
	}
}

function getOrchid($id) {
	$sql = "SELECT * FROM wine WHERE id=:id";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);  
		$stmt->bindParam("id", $id);
		$stmt->execute();
		$orchid = $stmt->fetchObject();  
		$db = null;
		echo json_encode($orchid); 
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}'; 
	}
}

function addOrchid() {
	error_log('addOrchid\n', 3, '/var/tmp/php.log');
	$request = Slim::getInstance()->request();
	$orchid = json_decode($request->getBody());
	$sql = "INSERT INTO wine (genus,species, awards, color, sizeofplant, purchaseprice, purchasedate, fragrance, description, picture) VALUES (:genus, :species, :awards, :color, :sizeofplant, :purchaseprice, :purchasedate, :fragrance, :description, :picture)";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);  
		$stmt->bindParam("genus", $orchid->genus);
		$stmt->bindParam("species", $orchid->species);
		$stmt->bindParam("awards", $orchid->awards);
		$stmt->bindParam("color", $orchid->color);
		$stmt->bindParam("sizeofplant", $orchid->sizeofplant);
		$stmt->bindParam("purchaseprice", $orchid->purchaseprice);
		$stmt->bindParam("purchasedate", $orchid->purchasedate);
		$stmt->bindParam("fragrance", $orchid->fragrance);
		$stmt->bindParam("description", $orchid->description);
		$stmt->bindParam("picture", $orchid->picture);
		$stmt->execute();
		$orchid->id = $db->lastInsertId();
		$db = null;
		echo json_encode($orchid); 
	} catch(PDOException $e) {
		error_log($e->getMessage(), 3, '/var/tmp/php.log');
		echo '{"error":{"text":'. $e->getMessage() .'}}'; 
	}
}

function updateOrchid($id) {
	$request = Slim::getInstance()->request();
	$body = $request->getBody();
	$orchid = json_decode($body);
	$sql = "UPDATE wine SET genus=:genus,species=:species, awards=:awards, color=:color, sizeofplant=:sizeofplant,  purchaseprice=:purchaseprice,  purchasedate=:purchasedate, fragrance=:fragrance, description=:description, picture=:picture WHERE id=:id";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);  
		$stmt->bindParam("genus", $orchid->genus);
		$stmt->bindParam("species", $orchid->species);
		$stmt->bindParam("awards", $orchid->awards);
		$stmt->bindParam("color", $orchid->color);
		$stmt->bindParam("sizeofplant", $orchid->sizeofplant);
		$stmt->bindParam("purchaseprice", $orchid->purchaseprice);
		$stmt->bindParam("purchasedate", $orchid->purchasedate);
		$stmt->bindParam("sizeofplant", $orchid->sizeofplant);
		$stmt->bindParam("fragrance", $orchid->fragrance);
		$stmt->bindParam("description", $orchid->description);
		$stmt->bindParam("picture", $orchid->picture);
		$stmt->bindParam("id", $id);
		$stmt->execute();
		$db = null;
		echo json_encode($orchid); 
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}'; 
	}
}

function deleteOrchid($id) {
	$sql = "DELETE FROM wine WHERE id=:id";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);  
		$stmt->bindParam("id", $id);
		$stmt->execute();
		$db = null;
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}'; 
	}
}

function findByName($query) {
	$sql = "SELECT * FROM wine WHERE UPPER(genus) LIKE :query ORDER BY genus";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$query = "%".$query."%";  
		$stmt->bindParam("query", $query);
		$stmt->execute();
		$orchids = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		echo json_encode($orchids);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}'; 
	}
}

function getConnection() {
	$dbhost="localhost";
	$dbuser="am1media_root";
	$dbpass="root";
	$dbname="am1media_orchidbase";
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	return $dbh;
}


// function getConnection() {
// 	$dbhost="localhost";
// 	$dbuser="root";
// 	$dbpass="root";
// 	$dbname="cellar";
// 	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
// 	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
// 	return $dbh;
// }


?>