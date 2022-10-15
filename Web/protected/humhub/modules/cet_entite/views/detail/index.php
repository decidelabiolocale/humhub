<?php

use yii\helpers\Html;

?>
<div class="container panel">
    <h4 class="panel-heading"><?= $cet_entite->name ?></h4>
    <div class="panel-body">
        <label>Adresse: </label><span><?= ' ' . $cet_entite->street . ' ' . $cet_entite->city . ' ' . $cet_entite->zip ?></span>
        <br>
        <?php if (isset($cet_entite->telFixe)) : ?>
            <label>Téléphone fixe: </label>
            <span>
                <?= $cet_entite->telFixe ?>
            </span>
            <br>
        <?php endif; ?>
        <?php if (isset($cet_entite->telMobile)) : ?>
            <label>Téléphone portable: </label>
            <span>
                <?= $cet_entite->telMobile ?>
            </span>
            <br>
        <?php endif; ?>
        <?php if (isset($cet_entite->email)) : ?>
            <label>Mail : </label>
            <span>
                <?= $cet_entite->email ?>
            </span>
            <br>
        <?php endif; ?>
        <label> Contact : </label>
        <span>
            <?= $cet_entite->contactPrenom . ' ' . $cet_entite->contactNom  ?>
        </span>
        <br>
        <label> Siret : </label>
        <span>
            <?= $cet_entite->siret ?>
        </span>
        <br>
        <?php if ($cet_entite->commentaire && strlen($cet_entite->commentaire) > 1): ?>
        <label> Commentaire : </label>
        <span>
            <?= $cet_entite->commentaire ?>
        </span>
        <?php endif; ?>
        <?= var_dump($cet_entite) ?>
    </div>
</div>
