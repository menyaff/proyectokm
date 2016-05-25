<!DOCTYPE html!>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">
    <title>Sistema Contable</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <?php include 'menu.php'; ?>
        <!-- Contenido -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.php"><span class="fa fa-fw fa-home"></span> Inicio</a>
                        </li>
                        <li>
                            <a href="javascript:;" data-toggle="collapse" data-target="#sub-menu-catalagos"><span class="fa fa-fw fa-book"></span> Catálogos</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-briefcase"></i> Artículos
                        </li>
                    </ol>
                </div>
                <div class="col-lg-12" style="text-align: center; height:520px;">
                    <img src="img/articulos.png" alt="servicios" width="90%" usemap="#Map" class="img-rounded" border="0">
                    <map name="Map">
                      <area shape="rect" coords="76,7,127,34" href="areas.php" />
                      <area shape="rect" coords="127,7,192,34" href="familias.php" />
                      <area shape="rect" coords="191,7,269,34" href="subfamilias.php" />
                    </map>
              </div>
            </div>
        </div>
    </div>
</body>
</html>