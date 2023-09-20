# Upgrade

Tested using:

```
PHP 8.2.10 (cli) (built: Sep  2 2023 06:59:22) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.2.10, Copyright (c) Zend Technologies
    with Zend OPcache v8.2.10, Copyright (c), by Zend Technologies
    with Xdebug v3.2.1, Copyright (c) 2002-2023, by Derick Rethans
```

use specifically postgres to recheck php-activerecord using php8.2.


updated the phpunit to the latest version at this time of writing.

# make sure to run and install the postgres database to local

### postgres package 12
```
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
sudo apt update
sudo apt -y install postgresql-12 postgresql-client-12
```

### localhost connections
```
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/12/main/postgresql.conf
```

### identify users via "md5", rather than "ident", allowing us to make postgres users separate from system users. "md5" lets us simply use a password
```
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/12/main/pg_hba.conf
```

### create test database and credentials
```
sudo -u postgres psql -c "CREATE ROLE test LOGIN PASSWORD 'test' SUPERUSER;"
sudo -u postgres psql -c "CREATE DATABASE test encoding 'UTF-8'"
sudo service postgresql restart
```

# Testunits ran

```
PHPUnit 10.3.5 by Sebastian Bergmann and contributors.
Runtime:       PHP 8.2.10
```

```
In order to run these unit tests, you need to install the required packages using Composer:
$ composer install

After that you can run the tests by invoking the local PHPUnit

To run all test simply use:
$ vendor/bin/phpunit

Or run a single test file by specifying its path:

$ vendor/bin/phpunit test/InflectorTest.php
```

Add tags to check deprecations information:

*** Tested

- query logs can be found in test/log/query.log (everytime a new test if conducted, this file is refreshed)

```
php vendor/bin/phpunit test/case/Crud/ActiveRecordFindTest.php
php vendor/bin/phpunit test/case/Crud/ActiveRecordTest.php
php vendor/bin/phpunit test/case/Crud/ActiveRecordWriteTest.php

php vendor/bin/phpunit test/case/Db/CallBackTest.php
php vendor/bin/phpunit test/case/Db/ColumnTest.php
php vendor/bin/phpunit test/case/Db/ConfigTest.php
php vendor/bin/phpunit test/case/Db/ConnectionManagerTest.php
php vendor/bin/phpunit test/case/Db/ConnectionTest.php
php vendor/bin/phpunit test/case/Db/PgsqlAdapterTest.php


php vendor/bin/phpunit test/case/Formats/DateFormatTest.php
php vendor/bin/phpunit test/case/Formats/DateTimeTest.php
php vendor/bin/phpunit test/case/Formats/ExpressionsTest.php

php vendor/bin/phpunit test/case/Models/HasManyThroughTest.php
php vendor/bin/phpunit test/case/Models/InflectorTest.php
php vendor/bin/phpunit test/case/Models/ModelCallbackTest.php
php vendor/bin/phpunit test/case/Models/RelationshipTest.php
php vendor/bin/phpunit test/case/Models/SerializationTest.php
php vendor/bin/phpunit test/case/Models/SQLBuilderTest.php

php vendor/bin/phpunit test/case/Utils/UtilsTest.php
php vendor/bin/phpunit test/case/Utils/ValidatesFormatOfTest.php
php vendor/bin/phpunit test/case/Utils/ValidatesInclusionAndExclusionOfTest.php
php vendor/bin/phpunit test/case/Utils/ValidatesLengthOfTest.php
php vendor/bin/phpunit test/case/Utils/ValidatesPresenceOfTest.php
php vendor/bin/phpunit test/case/Utils/ValidationsTest.php
```

or test the cases altogether (php vendor/bin/phpunit --help)

```
$ php vendor/bin/phpunit
(Cache Tests will be skipped, Memcache not found.)
PHPUnit 10.3.5 by Sebastian Bergmann and contributors.

Runtime:       PHP 8.2.10

...............................................................  63 / 662 (  9%)
............................................................... 126 / 662 ( 19%)
..............................................S.....S.......... 189 / 662 ( 28%)
............................................................... 252 / 662 ( 38%)
............................................................... 315 / 662 ( 47%)
............................................................... 378 / 662 ( 57%)
......................................................S........ 441 / 662 ( 66%)
........................S.....S................................ 504 / 662 ( 76%)
............................................................... 567 / 662 ( 85%)
............................................................... 630 / 662 ( 95%)
................................                                662 / 662 (100%)

Time: 00:27.107, Memory: 22.00 MB

OK, but some tests were skipped!
Tests: 662, Assertions: 1283, Skipped: 5.

```

*** Ignored Test

```
php vendor/bin/phpunit test/case/Cache/ActiveRecordCacheTest.ph_
php vendor/bin/phpunit test/case/Cache/CacheModelTest.ph_
php vendor/bin/phpunit test/case/Cache/CacheTest.ph_
php vendor/bin/phpunit test/case/Driver/MysqlAdapterTest.ph_
php vendor/bin/phpunit test/case/Driver/OciAdapterTest.ph_
php vendor/bin/phpunit test/case/Driver/SqliteAdapterTest.ph_
```
