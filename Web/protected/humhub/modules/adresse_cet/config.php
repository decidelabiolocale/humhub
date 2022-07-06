<?php
use humhub\modules\search\engine\Search;
use humhub\modules\adresse_cet\Module;
use humhub\modules\adresse_cet\Events;

return [
    'id' => 'adresse_cet',
    'class' => Module::class,
    'isCoreModule' => true,
    'modules' => [
        'manage' => [
            'class' => 'humhub\modules\adresse_cet\modules\manage\Module'
        ],
    ],
    'events' => [[Search::class, Search::EVENT_ON_REBUILD, [Events::class, 'onSearchRebuild']],],
];
