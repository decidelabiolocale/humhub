<?php

/**
 * @link https://www.humhub.org/
 * @copyright Copyright (c) 2017 HumHub GmbH & Co. KG
 * @license https://www.humhub.com/licences
 */

namespace humhub\modules\cet_type\widgets;

use humhub\modules\ui\widgets\BaseImage;
use yii\bootstrap\Html;

/**
 * Return type image or acronym
 */
class Image extends BaseImage
{
    /**
     * @var \humhub\modules\type\models\CetType
     */
    public $type;

    /**
     * @var int number of characters used in the acronym
     */
    public $acronymCount = 2;


    /**
     * @inheritdoc
     */
    public function run()
    {

        if (!isset($this->htmlOptions['class'])) {
            $this->htmlOptions['class'] = '';
        }

        if (!isset($this->htmlOptions['style'])) {
            $this->htmlOptions['style'] = '';
        }

        $acronymHtmlOptions = $this->htmlOptions;
        $imageHtmlOptions = $this->htmlOptions;

        $acronymHtmlOptions['class'] .= " space-profile-acronym-" . $this->type->id . " space-acronym";
        $acronymHtmlOptions['style'] .= " " . $this->getDynamicStyles($this->width);
        $acronymHtmlOptions['data-contentcontainer-id'] = $this->type->type . ' ' . $this->type->sous_type;

        $imageHtmlOptions['class'] .= " space-profile-image-" . $this->type->id . " img-rounded profile-user-photo";
        $imageHtmlOptions['style'] .= " width: " . $this->width . "px; height: " . $this->height . "px";
        $imageHtmlOptions['alt'] = Html::encode($this->type->type. ' ' .$this->type->sous_type);

        $imageHtmlOptions['data-contentcontainer-id'] = $this->type->type . ' ' . $this->type->sous_type;

        if ($this->showTooltip) {
            $this->linkOptions['data-toggle'] = 'tooltip';
            $this->linkOptions['data-placement'] = 'top';
            $this->linkOptions['data-html'] = 'true';
            $this->linkOptions['data-original-title'] = ($this->tooltipText) ? $this->tooltipText : Html::encode($this->type->type. ' ' .$this->type->sous_type);
            Html::addCssClass($this->linkOptions, 'tt');
        }

        //TODO ajouter les liens vers les images des types
        $defaultImage = false;

        if (!$defaultImage) {
            $acronymHtmlOptions['class'] .= " hidden";
        } else {
            $imageHtmlOptions['class'] .= " hidden";
        }

        return $this->render('@cet_type/widgets/views/image', [
                    'type' => $this->type,
                    'acronym' => $this->getAcronym(),
                    'link' => $this->link,
                    'linkOptions' => $this->linkOptions,
                    'acronymHtmlOptions' => $acronymHtmlOptions,
                    'imageHtmlOptions' => $imageHtmlOptions
        ]);
    }

    protected function getAcronym()
    {
        $acronym = '';

        $typeName = preg_replace('/[^\p{L}\d\s]+/u', '', $this->type->type . ' ' . $this->type->sous_type) ;

        foreach (explode(' ', $typeName) as $word) {
            if (mb_strlen($word) >= 1) {
                $acronym .= mb_substr($word, 0, 1);
            }
        }

        return mb_substr(mb_strtoupper($acronym), 0, $this->acronymCount);
    }

    protected function getDynamicStyles($elementWidth)
    {

        $fontSize = 44 * $elementWidth / 100;
        $padding = 18 * $elementWidth / 100;
        $borderRadius = 4;

        if ($elementWidth < 140 && $elementWidth > 40) {
            $borderRadius = 3;
        }

        if ($elementWidth < 35) {
            $borderRadius = 2;
        }

        return "font-size: " . $fontSize . "px; padding: " . $padding . "px 0; border-radius: " . $borderRadius . "px;";
    }

}
