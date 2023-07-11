<?php

function render_game($game)
{
    $number = $game['prix'];
    $prix_virgule = $number / 100;
    $prix_format = number_format($prix_virgule, 2, ',', ' '); ?>

    <div class="card-container">
        <div class="row">
            <div class="col-md-4 mt-3">
                <div class="card d-flex flex-column">
                    <img id="game-image" src="../games-pegi/games/<?php echo $game['image_path'] ?>" alt="Image de <?php echo $game['titre'] ?> ">

                    <h5 id="game-titre"> <?php echo $game['titre'] ?> </h5>

                    <?php
                    if ($number == 0) { ?>
                        <p id="prix"> <?php echo 'GRATUIT' ?> </p>
                    <?php
                    } else { ?>
                        <p id="prix"> <?php echo $prix_format ?>€</p>
                    <?php
                    } ?>

                    <a class="voir-details" href="../page_detail.php?id=<?php echo $game['id'] ?>">
                        <button href="../detail_game.php" type="button" class="btn btn-primary">Voir détails</button>
                    </a>
                </div>
            </div>
        </div>
    </div><?php

        }
            ?>


<?php
function render_game_details($game_details)
{
    $date = $game_details['date_sortie'];
    $timestamp = strtotime($date);
    $date_fr = date("d/m/Y", $timestamp); ?>

    <div class="card mb-3" style="width: 900px;">
        <div class="row g-0">
            <div class="col-md-4 img-div">
                <img src="../games-pegi/games/<?php echo $game_details['jeu_img'] ?>" class="img-fluid rounded-start" alt="Couverture de <?php echo $game_details['titre'] ?>">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="details-titre card-title"> <?php echo $game_details['titre'] ?></h5>

                    <?php
                    $consoles = explode(", ", $game_details['cons_label']);
                    foreach ($consoles as $console) {
                    ?>
                        <span class="badge rounded-pill text-bg-primary"> <?php echo $console ?> </span>
                    <?php
                    }
                    ?>

                    <p class="details-description card-text"> <?php echo $game_details['jeu_descr'] ?> </p>
                    <p class="card-text"><small class="text-body-secondary"> Date de sortie : <small class="date-fr"><?php echo $date_fr ?></small> </small></p>
                    <div class="pegi-cont d-flex flex-row">
                        <img class="img-pegi" src="../games-pegi/pegi/<?php echo $game_details['age_img'] ?>" alt="Logo restriction d'âge <?php echo $game_details['age_label'] ?>">
                        <p class="age-plus">age : <?php echo $game_details['age_label'] ?>+ </p>
                    </div>
                    <div class="d-flex flex-row">
                        <p class="notes"><i class="bi bi-star-fill"></i> Avis presse :<small class="detail-note"> <?php echo $game_details['note_media'] ?></small>/20</p>
                        <p class="notes"><i class="bi bi-star-fill"></i> Avis utilisateur :<small class="detail-note"> <?php echo $game_details['note_user'] ?></small>/20</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <?php
        }
