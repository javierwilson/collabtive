<?php
error_reporting(0);
require("./init.php");

// 0.5.5
pg_query("ALTER TABLE roles ADD chat TEXT AFTER timetracker");
pg_query("ALTER TABLE user CHANGE company company VARCHAR( 256 )");

//0.6
pg_query("ALTER TABLE projectfolders ADD parent INT(10) unsigned NOT NULL default '0' AFTER ID");
pg_query("ALTER TABLE projectfolders ADD visible text NOT NULL AFTER description");
pg_query("ALTER TABLE files ADD visible text NOT NULL");
pg_query("ALTER TABLE files ADD user INT(10) NOT NULL default '0' AFTER milestone");
pg_query("ALTER TABLE user CHANGE zip zip VARCHAR( 10 )"); // overlooked with 0.5

//0.6.3
pg_query("ALTER TABLE files DROP seenby");

// version independent
// clear templates cache
$handle = opendir($template->compile_dir);
while (false !== ($file = readdir($handle)))
{
    if ($file != "." and $file != "..")
    {
        unlink(CL_ROOT . "/" . $template->compile_dir . "/" . $file);
    }
}
// optimize tables
$opt1 = pg_query("OPTIMIZE TABLE files");
$opt2 = pg_query("OPTIMIZE TABLE files_attached");
$opt3 = pg_query("OPTIMIZE TABLE log");
$opt4 = pg_query("OPTIMIZE TABLE messages");
$opt5 = pg_query("OPTIMIZE TABLE milestones");
$opt6 = pg_query("OPTIMIZE TABLE milestones_assigned");
$opt7 = pg_query("OPTIMIZE TABLE projekte");
$opt8 = pg_query("OPTIMIZE TABLE projekte_assigned");
$opt9 = pg_query("OPTIMIZE TABLE timetracker");
$opt10 = pg_query("OPTIMIZE TABLE projectfolders");
$opt11 = pg_query("OPTIMIZE TABLE ŗoles");
$opt12 = pg_query("OPTIMIZE TABLE roles_assigned");

$template->display("update.tpl");
?>
