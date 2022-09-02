<?php
use humhub\modules\cet_type\Module;


return [
    'id' => 'cet_type',
    'class' => Module::class,
    'isCoreModule' => true,
    'modules' => [
        'manage' => [
            'class' => 'humhub\modules\cet_type\modules\manage\Module'
        ],
    ]
];
