<?php
require_once './templates/_header.php';
require_once './templates/_navbar.php';
require_once './templates/_game.php';
require_once './requete/get_all_games.php';
require_once './requete/by_console.php';
require_once './requete/config.php';
?>


<div class="d-flex flex-wrap">

    <?php get_all_games(); ?>

</div>

<?php require_once './templates/_footer.php'; ?>