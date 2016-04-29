<<<<<<< HEAD
<?php 
/*
 * Page front connexion
 */
require_once 'config.php';
include_once PATH_MODELES.'/modeleCommun.php';
include_once PATH_MODELES.'/modeleMembre.php';
include_once PATH_CONTROLEURS.'/controleurConnexion.php';
=======
<?php session_start();
include_once 'function/function.php';
include_once 'function/connexion.class.php';
$bdd = bdd();
if(isset($_POST['pseudo']) AND isset($_POST['mdp'])){
    
    $connexion = new connexion($_POST['pseudo'],$_POST['mdp']);
    $verif = $connexion->verif();
    if($verif =="ok"){
      if($connexion->session()){
          header('Location: index.php');
      }
    }
    else {
        $erreur = $verif; 
    } 
}


?>
<!DOCTYPE html>
<head>
    <meta charset='utf-8' />
    <title>WEDO FORUM</title>
    
    <meta name="author" content="Rajekevin"> 
    <link rel="stylesheet" type="text/css" href="css/general.css" />
    <link rel="shortcut icon" href="images/favicon.ico" />
    <link href='http://fonts.googleapis.com/css?family=Karla' rel='stylesheet' type='text/css'>
<head>
<body>
 <h1>Connexion</h1>
    
            <div id="Cforum">
                <form method="post" action="connexion.php">
                    <p>
                        <input name="pseudo" type="text" placeholder="Pseudo..." required /><br>
                        <input name="mdp" type="password" placeholder="Mot de passe..." required /><br>
                        <input type="submit" value="Connexion !" />
                        <?php 
                        if(isset($erreur)){
                            echo $erreur;
                        }
                        ?>
                    </p>
                </form> 
                
            </div>
</body>
</html>
>>>>>>> 03f1d229d589f2ffe5da2d315b811772af8d5d32
