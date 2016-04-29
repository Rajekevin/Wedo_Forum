<<<<<<< HEAD
<?php
/*
 * Page front deconnexion
 * 
 */

require_once 'config.php';
if(empty($_SESSION['idMembre'])) 
{
	header('Location: ./');
}
else{
	session_destroy();
	header('Location: ./index.php?deconnexion=1');
}
=======
<?php session_start();
session_unset();
session_destroy();
header('Location: connexion.php');
>>>>>>> 03f1d229d589f2ffe5da2d315b811772af8d5d32
