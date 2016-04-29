<<<<<<< HEAD
<?php
/*
 * Page front inscription
 */
require_once 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	include_once PATH_MODELES.'/modeleCommun.php';
	include_once PATH_MODELES.'/modeleMembre.php';
	include_once PATH_CONTROLEURS.'/controleurInscription.php';
	include_once PATH_VUES.'/vueHeader.php';
}
?>
=======
<?php session_start();
include_once 'function/function.php';
include_once 'function/inscription.class.php';
$bdd = bdd();

if(isset($_POST['pseudo']) AND isset($_POST['email']) AND isset($_POST['mdp'])  AND isset($_POST['mdp2'])){
  
    $inscription = new inscription($_POST['pseudo'],$_POST['email'],$_POST['mdp'],$_POST['mdp2']);
    $verif = $inscription->verif();
    if($verif == "ok"){/*Tout est bon*/
     if($inscription->enregistrement()){
            if($inscription->session()){ /*Tout est mis en session*/
                header('Location: index.php');
            }
        }
        else{ /*Erreur lors de l'enregistrement*/
            echo 'Une erreur est survenue';
        }   
    } else {
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
 <h1 class="id">Inscription</h1>
    
            <div id="Cforum">
                <form method="post" action="inscription.php">
                    <p>
                        <input name="pseudo" type="text" placeholder="Pseudo..." required /><br>
                        <input name="email" type="text" placeholder="Adresse email..." required /><br>
                        <input name="mdp" type="password" placeholder="Mot de passe..." required /><br>
                        <input name="mdp2" type="password" placeholder="Confirmation..." required /><br>
                        <input type="submit" value="S'inscrire!" />
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
