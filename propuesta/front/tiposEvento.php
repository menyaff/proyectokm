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
                            <i class="fa fa-book"></i> Tipos de evento
                        </li>
                    </ol>
                </div>
                <div class="col-lg-12" style="text-align: center; height: 520px; padding-top: 50px;">
                    <img src="img/tiposEvento.png" alt="Tipos de evento" class="img-rounded">
                </div>
            </div>
        </div>
    </div>
</body>
</html>