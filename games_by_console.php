<?php require_once './templates/_header.php'; ?>
<?php require_once './templates/_navbar.php'; ?>
<?php require_once './requete/config.php'; ?>
<?php require_once './requete/by_console.php'; ?>
<?php require_once './templates/_game.php'; ?>



<?php
if (isset($_GET['console'])) {
    $console = $_GET['console'];


    if (isset($jeux_compatibles[$console])) {
        $jeux = $jeux_compatibles[$console];
        $nombre_jeux_compatibles = count($jeux);

        echo '<div class="mt-3 mb-3"><p>' . 'Jeu(x) disponible(s) pour  ' . $console . '</p></div>';

        echo '<div class="d-flex flex-wrap">';

        // parcourir les jeux compatibles avec la console choisie
        foreach ($jeux as $game) {
            render_game($game);
        }
        echo '</div>';
    } else { ?>

        <p>Aucun jeu pour cette console</p>

    <?php
    }
} else { ?>
    <p>Aucune console spécifiée</p>

<?php
}
?>






<?php require_once './templates/_footer.php'; ?>