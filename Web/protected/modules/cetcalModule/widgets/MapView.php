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
use humhub\modules\cet_entite\models\CetEntite;

class MapView extends Widget
{

    public $cetEntites = [];
    /**
     * Height of the Widget (css Values)
     *
     * @var string
     */
    public $height = "50em";

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
        if(count($this->cetEntites) > 0){
            $formatedAdresseCets = [];
            foreach($this->cetEntites as $cetEntite){
                $formatedAdresseCets[] = [
                    'name' => $cetEntite->name,
                    'type' => (count($cetEntite->fkTypes) > 1 ? "producteur" : $cetEntite->fkTypes[0]->type),
                    'street' => $cetEntite->street,
                    'zip' => $cetEntite->zip,
                    'city' => $cetEntite->city,
                    'country' => $cetEntite->country,
                    'state' => $cetEntite->state,
                    'latitude' => floatval($cetEntite->latitude),
                    'longitude' => floatval($cetEntite->longitude),
                    'pk' => $cetEntite->pk,
                    'id' => $cetEntite->id
                ];
            }
            return $formatedAdresseCets;
        }
        $formatedAdresseCets = [];
        foreach (CetEntite::findAll(['isActive' => 1]) as $adresseCet) {
            $formatedAdresseCets[] = [
                'name' => $adresseCet->name,
                'type' => (count($adresseCet->fkTypes) > 1 ? "producteur" : $adresseCet->fkTypes[0]->type),
                'street' => $adresseCet->street,
                'zip' => $adresseCet->zip,
                'city' => $adresseCet->city,
                'country' => $adresseCet->country,
                'state' => $adresseCet->state,
                'latitude' => floatval($adresseCet->latitude),
                'longitude' => floatval($adresseCet->longitude),
                'pk' => $adresseCet->pk,
                'id' => $adresseCet->id
            ];
        }
        return $formatedAdresseCets;

    }

    private function getCoordinates(CetEntite $adresseCet)
    {
        $coordinates = [];
        if ($adresseCet->latitude !== null && $adresseCet->longitude !== null) {
            $coordinates = [
                'latitude' => $adresseCet->latitude,
                'longitude' => $adresseCet->longitude
            ];
        }
        return $coordinates;


    }
}
