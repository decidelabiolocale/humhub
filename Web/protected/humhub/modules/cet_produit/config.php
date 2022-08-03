<?php
use humhub\modules\search\engine\Search;
use humhub\modules\cet_produit\Module;
use humhub\modules\cet_produit\Events;

return [
    'id' => 'cet_produit',
    'class' => Module::class,
    'isCoreModule' => true,
    'modules' => [
        'manage' => [
            'class' => 'humhub\modules\cet_produit\modules\manage\Module'
        ],
    ],
    'events' => [[Search::class, Search::EVENT_ON_REBUILD, [Events::class, 'onSearchRebuild']],],
];
