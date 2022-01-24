<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2021-08-18 09:04:27 --> Query error: Table 'sma_db.sma_sessions' doesn't exist - Invalid query: SELECT `data`
FROM `sma_sessions`
WHERE `id` = '6ds8l87jfgjnhud1uc3g33ig0jffafd4'
ERROR - 2021-08-18 09:04:27 --> Query error: Table 'sma_db.sma_settings' doesn't exist - Invalid query: SELECT *
FROM `sma_settings`
ERROR - 2021-08-18 09:04:27 --> Severity: error --> Exception: Call to a member function num_rows() on bool C:\wamp64\www\sma\app\models\Site.php 305
ERROR - 2021-08-18 09:04:27 --> Query error: Table 'sma_db.sma_sessions' doesn't exist - Invalid query: INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('6ds8l87jfgjnhud1uc3g33ig0jffafd4', '::1', 1629273867, '__ci_last_regenerate|i:1629273867;')
ERROR - 2021-08-18 09:04:27 --> Severity: Warning --> session_write_close(): Failed to write session data using user defined save handler. (session.save_path: c:/wamp64/tmp) Unknown 0
