<?php

function get_all_games()
{
    global $connection;

    // création de la requête
    $query_all = "SELECT id, titre, prix, image_path FROM jeu";

    // exécution de la requête
    if ($result = mysqli_query($connection, $query_all)) {
        // résultats
        if (mysqli_num_rows($result) > 0) {
            // on parcours les résultats
            while ($game = mysqli_fetch_assoc($result)) {
                // le rendu HTML d'un jeu
                render_game($game);
            }
        }
    } else { ?>
        <div class="alert alert-warning" role="alert">
            Pas de jeu trouvé
        </div>
<?php
    }
}
