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
        <!-- Barra Lateral -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php">KM & asociados</a>
            </div>
            <!-- Menu Superior Derecha -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>&nbsp;Karla Martínez<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><span class="fa fa-fw fa-power-off"></span> Salir</a></li>
                    </ul>
                </li>
            </ul>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li><a href="index.php"><span class="fa fa-fw fa-home"></span> Inicio</a></li>
                    <li class="active"><a href="form.php"><span class="fa fa-fw fa-shopping-cart red"></span> Cotización</a></li>
                    <li><a href="#"><span class="fa fa-fw fa-calendar"></span> Eventos</a></li>
                    <li><a href="javascript:;" data-toggle="collapse" data-target="#sub-menu-transacciones"><span class="fa fa-fw fa-money"></span> Transacciones<span class="fa fa-fw fa-caret-down"></span></a>
                            <ul id="sub-menu-transacciones" class="collapse">
                                <li><a href="#">Compras</a></li>
                                <li><a href="#">Gastos</a></li>
                            </ul>
                    </li>
                    <li><a href="#"><span class="fa fa-fw fa-university"></span> Bancos</a></li>
                    <li><a href="javascript:;" data-toggle="collapse" data-target="#sub-menu-catalagos"><span class="fa fa-fw fa-book"></span> Catálagos<span class="fa fa-fw fa-caret-down"></span></a>
                        <ul id="sub-menu-catalagos" class="collapse">
                            <li><a href="clientes.php">Clientes</a></li>
                            <li><a href="empleados.php">Empleados</a></li>
                            <li><a href="usuarios.php">Usuarios</a></li>
                            <li><a href="servicios.php">Servicios</a></li>
                            <li><a href="lugares.php">Lugares</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        
        <!-- Contenido -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.php"><span class="fa fa-fw fa-home"></span> Inicio</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-shopping-cart"></i> Cotización
                        </li>
                    </ol>
                </div> 
                <div class="row">
                    <div class="col-lg-6">

                        <form role="form">

                            <div class="form-group">
                                <label>Text Input</label>
                                <input class="form-control">
                                <p class="help-block">Example block-level help text here.</p>
                            </div>

                            <div class="form-group">
                                <label>Text Input con Placeholder</label>
                                <input class="form-control" placeholder="Enter text">
                            </div>

                            <div class="form-group">
                                <label>Archivo</label>
                                <input type="file">
                            </div>

                            <div class="form-group">
                                <label>Text area</label>
                                <textarea class="form-control" rows="3"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Checkboxes</label>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Opción 1
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Opción 2
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Opción 3
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Inline Checkboxes</label><br>
                                <label class="checkbox-inline">
                                    <input type="checkbox">1
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">2
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">3
                                </label>
                            </div>
                            <br>
                            <div class="form-group">
                                <label>Radio Buttons</label>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>Opción 1
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Opción 2
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">Opción 3
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Inline Radio Buttons</label><br>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" checked>1
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">2
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">3
                                </label>
                            </div>

                            <div class="form-group">
                                <label>Selects</label>
                                <select class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-default">Enviar</button>
                            <button type="reset" class="btn btn-default">Limpiar</button>

                        </form>

                    </div>
                    <div class="col-lg-6">
                        <h1>Validaciones</h1>

                        <form role="form">
                            <div class="form-group has-success">
                                <label class="control-label" for="inputSuccess">Input Aprobado</label>
                                <input type="text" class="form-control" id="inputSuccess">
                            </div>
                            <div class="form-group has-warning">
                                <label class="control-label" for="inputWarning">Input Precaución</label>
                                <input type="text" class="form-control" id="inputWarning">
                            </div>
                            <div class="form-group has-error">
                                <label class="control-label" for="inputError">Input Error</label>
                                <input type="text" class="form-control" id="inputError">
                            </div>
                        </form>
                        <br>
                        <h1>Input Groups</h1>
                        <form role="form">
                            <div class="form-group input-group">
                                <span class="input-group-addon">@</span>
                                <input type="text" class="form-control" placeholder="Usuario">
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon"><span class="fa fa-usd"></span></span>
                                <input type="text" class="form-control" placeholder="100">
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon">$</span>
                                <input type="text" class="form-control" placeholder="100">
                                <span class="input-group-addon">.00</span>
                            </div>
                            <div class="form-group input-group">
                                <input class="form-control" type="text">
                                <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-search"></i></button></span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>