


<?php

require_once './requete/config.php';
require_once './templates/_navbar.php';

$sql = "SELECT c.label AS console, j.id, j.titre, j.prix, j.image_path
FROM console c
LEFT JOIN game_console gc ON gc.console_id = c.id
LEFT JOIN jeu j ON j.id = gc.jeu_id
GROUP BY c.label, j.id";

$result = $connection->query($sql);

// Tableau pour stocker les données
$jeux_compatibles = [];

if ($result->num_rows > 0) {
    // Parcourez les résultats de la requête et stockez les données dans le tableau
    while ($row = $result->fetch_assoc()) {
        $console = $row["console"];
        $jeu = [
            'id' => $row['id'],
            'titre' => $row['titre'],
            'prix' => $row['prix'],
            'image_path' => $row['image_path'],
        ];
        $jeux_compatibles[$console][] = $jeu;
    }
}
