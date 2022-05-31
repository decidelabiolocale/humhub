<?php

namespace humhub\modules\search\interfaces;

interface SearchableMap extends Searchable
{
    public function getResultByDistance($distance, $resultTab);
}

?>
