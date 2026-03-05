<?php
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);

require_once('C:\inetpub\wwwroot\examdb/php-excel-reader/excel_reader2.php');
require_once('SpreadsheetReader.php');

$Reader = new SpreadsheetReader('test.xls');
  echo "<pre>\n";
	foreach ($Reader as $Row)
	{
		print_r($Row);
	}
  echo "</pre>\n";
?>

</body>
</html>
