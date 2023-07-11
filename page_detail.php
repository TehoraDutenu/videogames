<?php require_once './templates/_header.php'; ?>
<?php require_once './templates/_navbar.php'; ?>
<?php require_once './requete/config.php'; ?>
<?php require_once './templates/_game.php'; ?>
<?php require_once './requete/get_details.php'; ?>



<?php
if (isset($_GET['id'])) {
    $game_id = $_GET['id'];
    get_details($game_id);
} else {
    echo "Aucun identifiant de jeu spécifié.";
}
?>

<?php require_once './templates/_footer.php'; ?>