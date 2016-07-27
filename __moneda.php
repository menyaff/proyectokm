<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Moneda</title>
	<script src="../complementos/numeral-js-1.5.3/min/numeral.min.js"></script>
</head>
<body>
	<script>
		var string = numeral(<?= $_GET["dato"] ?>).format('$0,0.00');
		alert(string);
	</script>
</body>
</html>