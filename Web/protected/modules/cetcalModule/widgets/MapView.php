<?php
/**
 * AdresseCet Location Map
 *
 * @package humhub.modules.adresseCetmap
 * @author KeudellCoding
 */

namespace humhub\modules\cetcalModule\widgets;

use Yii;
use yii\helpers\Url;
use humhub\components\Widget;
use humhub\modules\cetcalModule\models\admin\EditForm;
//use humhub\modules\adresse_cet\models\AdresseCet;

class MapView extends Widget
{

    /**
     * Height of the Widget (css Values)
     *
     * @var string
     */
    public $height = "20em";

    /**
     * Show map as panel
     *
     * @var bool
     */
    public $showAsPanel = false;

    /**
     * Link that is navigated to when the map is clicked.
     *
     * @var string
     */
    public $link = null;

    public function run()
    {
        $settings = Yii::$app->getModule('cetcalModule')->settings;

        return $this->render(
            'mapView',
        [
            'height' => $this->height,
            'adresseCet_data' => $this->getAllAdresseCets(),
            'link' => $this->link,
            'showAsPanel' => $this->showAsPanel,
            'osmTileServer' => $settings->get('osm_tile_server', EditForm::DEFAULT_TILE_SERVER),
            'mapCenter' => [
                'latitude' => $settings->get('osm_map_center_latitude', 51.0951),
                'longitude' => $settings->get('osm_map_center_longitude', 10.2714),
                'zoom' => $settings->get('osm_map_center_zoom', 5)
            ]
        ]
        );
    }

    private function getAllAdresseCets()
    {
/*
        $formatedAdresseCets = [];
        foreach (AdresseCet::findAll(['isActive' => 1]) as $adresseCet) {

            $formatedAdresseCets[] = [
                'name' => $adresseCet->name,
                'type' => $adresseCet->type,
                'street' => $adresseCet->street,
                'zip' => $adresseCet->zip,
                'city' => $adresseCet->city,
                'country' => $adresseCet->country,
                'state' => $adresseCet->state,
                'latitude' => floatval($adresseCet->latitude),
                'longitude' => floatval($adresseCet->longitude),
                'pk' => $adresseCet->pk,
            ];
        }
        return $formatedAdresseCets;*/
        return [];
    }

    private function getCoordinates(/*AdresseCet $adresseCet*/)
    {/*
        $coordinates = [];
        if ($adresseCet->latitude !== null && $adresseCet->longitude !== null) {
            $coordinates = [
                'latitude' => $adresseCet->latitude,
                'longitude' => $adresseCet->longitude
            ];
        }
        return $coordinates;

*/
    }
}
