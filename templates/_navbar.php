<div class="d-flex flex-column">

    <?php require_once './requete/by_console.php' ?>


    <div class="logo-container">
        <a href="../index.php"><img src="../images/logo.png" alt="logo" class="logo"></a>
    </div>

    <div class="navbar-container">
        <ul class="nav nav-tabs navbar-primary">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="../index.php">Tous les jeux</a>
            </li>
            <li class="nav-item dropdown tab-rad">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="../games_by_console.php" role="button" aria-expanded="false">Par console</a>
                <ul class="dropdown-menu">
                    <?php
                    global $jeux_compatibles;
                    // Parcourez le tableau des jeux compatibles pour générer les liens dans le menu déroulant
                    foreach ($jeux_compatibles as $console => $nombre_jeux_compatibles) {
                        $consoleLink = '../games_by_console.php?console=' . urlencode($console);
                        echo '<li><a class="dropdown-item" href="' . $consoleLink . '">' . $console . ' (' . count($nombre_jeux_compatibles) . ')</a></li>';
                    }
                    ?>
                </ul>
            </li>
        </ul>
    </div>
</div>