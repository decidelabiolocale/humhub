<?php
/**
 * AdresseCet Location Map
 *
 * @package humhub.modules.adresseCetmap
 * @author KeudellCoding
 */

use humhub\libs\Html;
use humhub\widgets\PanelMenu;
use humhub\assets\JqueryKnobAsset;
use humhub\modules\cetcalModule\assets\MapAssetBundle;

JqueryKnobAsset::register($this);
MapAssetBundle::register($this);
?>

<?php if ($showAsPanel) { ?>
    <div class="panel" id="adresseCetmap-map-view-snippet">

        <div class="panel-heading">
            <i class="fa fa-map-marker"></i> <span><strong>AdresseCet</strong> Location Map</span>
            <?= PanelMenu::widget(['id' => 'adresseCetmap-map-view-snippet']); ?>
        </div>

        <div class="panel-body" style="padding:0px;">
<?php } ?>

            <div id="adresseCet-main-map-link" style="height: <?= $height ?>;">
                <div id="adresseCet-main-map" style="height: 100%;"></div>
            </div>

            <script <?= Html::nonce() ?>>
                $(document).ready(function(){
                    var map = L.map('adresseCet-main-map').setView([<?= $mapCenter['latitude'] ?>, <?= $mapCenter['longitude'] ?>], <?= $mapCenter['zoom'] ?>);
                    var markers = L.markerClusterGroup();

                    L.tileLayer('<?= $osmTileServer ?>', {
                        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                    }).addTo(map);

                    var allAdresseCets = <?=json_encode($adresseCet_data);?>;
                    console.log("adresses Cet : ",allAdresseCets);
                    $.each(allAdresseCets, function(i, adresseCet){
                        if (adresseCet.latitude && adresseCet.longitude) {
                            // Latitude et longitude inversé avec les donnée CETCAL
                            var marker = L.marker([adresseCet.longitude, adresseCet.latitude]);
                            marker.bindPopup('<b>'+adresseCet.name+'</b><br>'+adresseCet.type+'<br>');
                            markers.addLayer(marker);
                        }
                    });

                    map.addLayer(markers);
                });
            </script>

            <?php if (!empty($link)) { ?>
                <script <?= Html::nonce() ?>>
                    $(document).ready(function(){
                        $('#adresseCet-main-map-link').click(function(){
                            window.location.href = "<?= $link ?>";
                        });
                    });
                </script>

                <style>
                    #adresseCet-main-map-link {
                        cursor: pointer;
                    }

                    #adresseCet-main-map-link * {
                        pointer-events: none;
                    }
                </style>
            <?php } ?>

<?php if ($showAsPanel) { ?>
        </div>
    </div>
<?php } ?>
