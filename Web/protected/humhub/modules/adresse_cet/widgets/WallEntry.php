<?php

/**
 * @link https://www.humhub.org/
 * @copyright Copyright (c) 2018 HumHub GmbH & Co. KG
 * @license https://www.humhub.com/licences
 */

namespace humhub\modules\adresse_cet\widgets;

use humhub\modules\content\widgets\stream\WallStreamEntryWidget;

/**
 * @inheritdoc
 */
class WallEntry extends WallStreamEntryWidget
{

    /**
     * @inheritdoc
     */
    protected function renderContent()
    {
        return $this->render('wallEntry', [
            'cet_adresse' => $this->model,
            'renderOptions' => $this->renderOptions
        ]);
    }
}
