<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>PDF</title>
	<script src="complementos/jquery-1.12.4/jquery-1.12.4.min.js"></script>
	<script src="complementos/jsPDF/jspdf.min.js"></script>
	<script src="complementos/jsPDF/jspdf.plugin.from_html.js"></script>
	<script src="complementos/jsPDF/jspdf.plugin.split_text_to_size.js"></script>
	<script src="complementos/jsPDF/jspdf.plugin.standard_fonts_metrics.js"></script>
</head>
<body>
	<div id="noimprimir">
		Este div no se imprimirá
	</div>
	<br><br><br><br>
	<div id="imprimirpdf" style="overflow: hidden;">
		El contenido de este div sera un PDF
		<ul>
			<li><a href="#">articulo 1</a></li>
			<li><a href="#">articulo 2</a></li>
			<li><a href="#">articulo 3</a></li>
		</ul>
		<ol type="a">
			<li><a href="#">articulo ordenado 4</a>
				<ol type="a">
					<li>subarticulo ordenado 1</li>
					<li>subarticulo ordenado 2</li>
					<li>subarticulo ordenado 3</li>
				</ol>
			</li>
			<li><a href="#">articulo ordenado 4</a></li>
			<li><a href="#">articulo ordenado 4</a></li>
		</ol>
		<h1>Header 1</h1>
		<h2>Header 2</h2>
		<h3>Header 3</h3>
		<p>Parrafo</p>
	</div>
	<button onclick="printPDF();">Clic</button>
	<script>
		function printPDF() {
			var doc = new jsPDF();          
			var elementHandler = {
			  '#noimprimir': function (element, renderer) {
			    return true;
			  }
			};
			var source = window.document.getElementsByTagName("body")[0];
			doc.fromHTML(
			    source,
			    15,
			    15,
			    {
			      'width': 180,'elementHandlers': elementHandler
			    });

			doc.output("dataurlnewwindow");
		}
	</script>
</body>

</html>