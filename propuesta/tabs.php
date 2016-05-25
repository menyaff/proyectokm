<?php
	require_once "config/front.conf";
?>
<!DOCTYPE html>
<html>
	<head>
		<title>KM &amp; Asociados</title>
		<meta charset="UTF-8" />
		<?php
			librerias::includeJQuery();
			librerias::includeKendo();
		?>
		<script type="text/javascript" languaje="javascript" src="JS/datos.js"></script>
		<script type="text/javascript" languaje="javascript">
			$("document").ready(function(){
				$("#tabstrip").kendoTabStrip({
                    animation:  {
                        open: {
                            effects: "fadeIn"
                        }
                    }
                });
			});
		</script>
		<style type="text/css">
            #tabstrip{
                margin: 30px 40px 0;
                float: left;
            }
            #tabstrip>div{ text-align: center; }
		</style>
	</head>
	<body>
        <div id="tabstrip">
            <ul>
                <li class="k-state-active">
                    Artículos
                </li>
                <li>
                    Áreas
                </li>
                <li>
                    Familias
                </li>
                <li>
                    Subfamilias
                </li>
            </ul>
            <div>
                <img src="ARCHIVOS/grids/articulos.png" width="1250px" />
            </div>
            <div>
                <img src="ARCHIVOS/grids/areas.png" />
            </div>
            <div>
                <img src="ARCHIVOS/grids/familias.png" />
            </div>
            <div>
                <img src="ARCHIVOS/grids/subfamilias.png" />
            </div>
        </div>
	</body>
</html>