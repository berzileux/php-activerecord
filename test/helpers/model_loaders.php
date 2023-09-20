<?php

foreach(glob(__DIR__ . '/../models/*.php') as $file) {
    require_once $file;
}

foreach(glob(__DIR__ . '/../models/NamespaceTest/*.php') as $file) {
    require_once $file;
}

foreach(glob(__DIR__ . '/../models/NamespaceTest/SubNamespaceTest/*.php') as $file) {
    require_once $file;
}