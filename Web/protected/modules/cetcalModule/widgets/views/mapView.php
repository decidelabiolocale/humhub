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
<script src="http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js"></script>
<script src='assets/leaflet.fullscreen-master/Control.Fullscreen.js'></script>
<script src='assets/leaflet.fullscreen-master/Control.Fullscreen.css'></script>
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
            $(document).ready(function() {
                accessToken = "<?= $apikey ?>";
                console.log(accessToken);
                var map = L.map('adresseCet-main-map', {
                    fullscreenControl: true,
                    fullscreenControlOptions: { // optional
                        title: "Show me the fullscreen !",
                        titleCancel: "Exit fullscreen mode"
                    }
                }).setView([<?= $mapCenter['latitude'] ?>, <?= $mapCenter['longitude'] ?>], <?= $mapCenter['zoom'] ?>);
                console.log("Control :" + L.Control);
                var markers = L.markerClusterGroup();
                const icons_array = []; {
                    var cetIconAlgues = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/algues.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Algues'
                    });
                    icons_array.push({
                        icon: cetIconAlgues,
                        desc: 'Algues'
                    });

                    var cetIconApiculteur = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/apiculteur.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Apiculteur'
                    });
                    icons_array.push({
                        icon: cetIconApiculteur,
                        desc: 'Apiculteur'
                    });

                    var cetIconBoulangerPatissier = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/boulanger_patissier.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Boulanger Patissier'
                    });
                    icons_array.push({
                        icon: cetIconBoulangerPatissier,
                        desc: 'Boulanger Patissier'
                    });

                    var cetIconBrasseur = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/brasseur.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Brasseur'
                    });
                    icons_array.push({
                        icon: cetIconBrasseur,
                        desc: 'Brasseur'
                    });

                    var cetIconChampignons = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/champignons.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Champignons'
                    });
                    icons_array.push({
                        icon: cetIconChampignons,
                        desc: 'Champignons'
                    });

                    var cetIconCircuitCourt = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/circuit_court.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Circuit Court'
                    });
                    icons_array.push({
                        icon: cetIconCircuitCourt,
                        desc: 'Circuit Court'
                    });

                    var cetIconConserveConfiture = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/conserves_confitures.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Conserves Confiture'
                    });
                    icons_array.push({
                        icon: cetIconConserveConfiture,
                        desc: 'Conserves Confiture'
                    });

                    var cetIconCoop = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/coop.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Coop'
                    });
                    icons_array.push({
                        icon: cetIconCoop,
                        desc: 'Coop'
                    });

                    var cetIconFromage = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/fromages.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Fromages'
                    });
                    icons_array.push({
                        icon: cetIconFromage,
                        desc: 'Fromages'
                    });

                    var cetIconFruits = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/fruits.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Fruits'
                    });
                    icons_array.push({
                        icon: cetIconFruits,
                        desc: 'Fruits'
                    });

                    var cetIconGlacesSorbets = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/glaces_sorbets.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Glaces Sorbets'
                    });
                    icons_array.push({
                        icon: cetIconGlacesSorbets,
                        desc: 'Glaces Sorbets'
                    });

                    var cetIconGrandesCulturesCereales = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/grandescultures_cereales.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Grandes Cultures Céréales'
                    });
                    icons_array.push({
                        icon: cetIconGrandesCulturesCereales,
                        desc: 'Grandes Cultures Céréales'
                    });

                    var cetIconHorticulteur = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/horticulteur.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Horticulteur'
                    });
                    icons_array.push({
                        icon: cetIconHorticulteur,
                        desc: 'Horticulteur'
                    });

                    var cetIconLaitier = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/laitier.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Laitier'
                    });
                    icons_array.push({
                        icon: cetIconLaitier,
                        desc: 'Laitier'
                    });

                    var cetIconLegumes = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/legumes.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Légumes'
                    });
                    icons_array.push({
                        icon: cetIconLegumes,
                        desc: 'Légumes'
                    });

                    var cetIconOeufs = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/oeufs.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Oeufs'
                    });
                    icons_array.push({
                        icon: cetIconOeufs,
                        desc: 'Oeufs'
                    });

                    var cetIconPecheurCoquillages = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/pecheur_coquillages.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Pécheur Coquillages'
                    });
                    icons_array.push({
                        icon: cetIconPecheurCoquillages,
                        desc: 'Pécheur Coquillages'
                    });

                    var cetIconPlantes = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/plantes.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Plantes'
                    });
                    icons_array.push({
                        icon: cetIconPlantes,
                        desc: 'Plantes'
                    });

                    var cetIconProducteur = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/producteur.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Producteur'
                    });
                    icons_array.push({
                        icon: cetIconProducteur,
                        desc: 'Producteur'
                    });

                    var cetIconSemencierGraines = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/semencier_graines.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Semencier Graines'
                    });
                    icons_array.push({
                        icon: cetIconSemencierGraines,
                        desc: 'Semencier Graines'
                    });

                    var cetIconViande = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/viande.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Viande'
                    });
                    icons_array.push({
                        icon: cetIconViande,
                        desc: 'Viande'
                    });

                    var cetIconViticulteur = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/viticulteur.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Viticulteur'
                    });
                    icons_array.push({
                        icon: cetIconViticulteur,
                        desc: 'Viticulteur'
                    });

                    var cetIciIcon = L.icon({
                        iconUrl: 'res/content/icons/ici.png',
                        iconSize: [90, 90]
                    });

                    var cetAnnuaireMarcheIcon = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/marche.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Marché'
                    });
                    icons_array.push({
                        icon: cetAnnuaireMarcheIcon,
                        desc: 'Marché référencé dans l\'annuaire cetcal.'
                    });

                    var amapIcon = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/amap.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'AMAP'
                    });
                    icons_array.push({
                        icon: amapIcon,
                        desc: 'AMAP référencé dans l\'annuaire cetcal.'
                    });

                    var cetAnnuaireIcon_magasinBio = L.icon({
                        iconUrl: 'assets/images/pictos_site_CAL/magasin.gif',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Magasin BIO'
                    });
                    icons_array.push({
                        icon: cetAnnuaireIcon_magasinBio,
                        desc: 'Magasin, boutique ou épicerie BIO (produits certifiés AB).'
                    });

                    var associationsIcon = L.icon({
                        iconUrl: 'res/content/icons/bonpour1tour/withbg/assodist.png',
                        iconSize: [50, 50],
                        popupAnchor: [0, -20],
                        type: 'Associations liées à la BIO Locale'
                    });
                    icons_array.push({
                        icon: associationsIcon,
                        desc: 'Associations liée à la BIO Locale (distribution possible)'
                    });
                }
                L.tileLayer('<?= $osmTileServer ?>', {
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                }).addTo(map);
                var icon_carto = undefined;
                var allAdresseCets = <?= json_encode($adresseCet_data); ?>;
                //TODO: Ajouter l'icone correspondant
                $.each(allAdresseCets, function(i, adresseCet) {
                    if (adresseCet.latitude && adresseCet.longitude) {
                        switch (adresseCet.type) {
                            case "producteur d'algues":
                                icon_carto = cetIconAlgues;
                                break;
                            case "apiculteur":
                                icon_carto = cetIconApiculteur;
                                break;
                            case "boulanger / pâtissier":
                                icon_carto = cetIconBoulangerPatissier;
                                break;
                            case "brasseur":
                                icon_carto = cetIconBrasseur;
                                break;
                            case "producteur de champignons":
                                icon_carto = cetIconChampignons;
                                break;
                            case "circuit_court":
                                icon_carto = cetIconCircuitCourt;
                                break;
                            case "producteur de confitures / conserves":
                                icon_carto = cetIconConserveConfiture;
                                break;
                            case "coop":
                                icon_carto = cetIconCoop;
                                break;
                            case "producteur de fromages":
                                icon_carto = cetIconFromage;
                                break;
                            case "producteur de fruits":
                                icon_carto = cetIconFruits;
                                break;
                            case "producteur de glaces / sorbets":
                                icon_carto = setIconGlacesSorbets;
                                break;
                            case "producteur grandes cultures/ céréales":
                                icon_carto = cetIconGrandesCulturesCereales;
                                break;
                            case "horticulteur":
                                icon_carto = cetIconHorticulteur;
                                break;
                            case "Éleveur / laitier / viande":
                                icon_carto = cetIconLaitier;
                                break;
                            case "producteur de légumes":
                                icon_carto = cetIconLegumes;
                                break;
                            case "oeufs plein air":
                                icon_carto = cetIconOeufs;
                                break;
                            case "pecheur_coquillages":
                                icon_carto = cetIconPecheurCoquillages;
                                break;
                            case "producteur de plantes aromatiques et/ou médicinales":
                                icon_carto = cetIconPlantes;
                                break;
                            case "semencier graines reproductibles":
                                icon_carto = cetIconSemencierGraines;
                                break;
                            case "viande":
                                icon_carto = cetIconViande;
                                break;
                            case "viticulteur":
                                icon_carto = cetIconViticulteur;
                                break;
                            case "marche":
                                icon_carto = cetAnnuaireMarcheIcon;
                                break;
                            case "amap":
                                icon_carto = amapIcon;
                                break;
                            case "mbio":
                                icon_carto = cetAnnuaireIcon_magasinBio;
                                break;
                            default:
                                icon_carto = cetIconProducteur;
                        }

                        var marker = L.marker([adresseCet.latitude, adresseCet.longitude], {
                            icon: icon_carto
                        });
                        marker.bindPopup('<b>' + adresseCet.name + '</b><br>' + adresseCet.type + '<br>' + '<a href="http://localhost:8081/index.php?r=cet_entite%2Fdetail&id=' + adresseCet.id + '"> détail </a>');
                        markers.addLayer(marker);
                    }
                });

                map.addLayer(markers);

                //TODO cercle autour des communes sélectionnés
                var communesLatLng = <?= json_encode($communesLatLng) ?>;
                var distance = <?= json_encode($distance) ?>;
                if (communesLatLng.length > 0) {
                    $.each(communesLatLng, function(i, commune) {
                        L.circle([commune.latitude, commune.longitude], distance * 1000, {
                            'fillOpacity': 0,
                            'color': 'red',
                        }).addTo(map);
                    })
                }
            });
        </script>

        <?php if (!empty($link)) { ?>
            <script <?= Html::nonce() ?>>
                $(document).ready(function() {
                    $('#adresseCet-main-map-link').click(function() {
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
