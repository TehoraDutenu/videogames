<?php


function get_details()
{
    global $connection, $game_id;

    // création de la requête
    $query_details = "SELECT
    jeu.id AS jeu_id,
    jeu.titre AS titre,
    jeu.image_path AS jeu_img,
    jeu.description AS jeu_descr,
    jeu.date_sortie AS date_sortie,
    jeu.age_id AS age_id,
    GROUP_CONCAT(console.label SEPARATOR ' ') AS cons_label,
    restriction.label AS age_label,
    restriction.image_path AS age_img,
    note.note_media AS note_media,
    note.note_utilisateur AS note_user
FROM jeu
    INNER JOIN restriction_age AS restriction ON jeu.age_id = restriction.id
    INNER JOIN game_console ON jeu.id = game_console.jeu_id
    INNER JOIN console ON game_console.console_id = console.id
    INNER JOIN note ON jeu.note_id = note.id
WHERE jeu.id = $game_id
GROUP BY jeu.id";


    // exécution de la requête
    if ($result = mysqli_query($connection, $query_details)) {
        if (mysqli_num_rows($result) > 0) {
            while ($game_details = mysqli_fetch_assoc($result)) {
                render_game_details($game_details);
            }
        }
    }
}
