<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Empleados</title>
    <?php
        metatags();

        librerias::JQuery();
        librerias::Kendo();
        librerias::notify();
        librerias::FontAwesome();
        librerias::Bootstrap();
    ?>
    <script>
        templateID = "";
        templateBotones = "";
    </script>
    <script src="<?= $pathJS ?>forms.js"></script>
    <script src="<?= $pathJS ?>grids.js"></script>
    <script>
        jsonFields = {
                        id: { type: "number" },
                        clave: { type: "string" },
                        nombre: { type: "string" },
                        puesto: { type: "string" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "clave",
                            title: "Clave"
                        },
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        {
                            field: "puesto",
                            title: "Puesto"
                        },
                        templateBotones
                    ];
        modal = "#divModal"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_empleados.php";

        $(document).ready(function(){
            $(modal).setModal("empleado", 1100);
            $(grid).setGrid();
            $("#selPuestos").rellenaSelect("<?= $pathWS ?>WS_puestos.php");
            $("#selEstadoFiscal").rellenaSelect("<?= $pathWS ?>WS_estados.php");
            $("#selEstadoFiscal").change(function(){
                var elem = $(this);
                //alert(elem.val());
                var jsonCiudades = '{"selEstadoFiscal":"'+elem.val()+'"}';
                jsonCiudades = $.parseJSON(jsonCiudades);
                $("#selCiudadFiscal").rellenaSelect("<?= $pathWS ?>WS_ciudades.php",jsonCiudades);
            });
        });
    </script>
</head>
<body>
    <div id="wrapper">
        <?php menuLateral(); ?>
        <!-- Contenido -->
        <div id="page-wrapper">
            <div class="container-fluid">
            <!-- mapa ubicación -->
                <div class="row">
                    <ol class="breadcrumb">
                        <li><a href="index.php"><span class="fa fa-fw fa-home"></span> Inicio</a></li>
                        <li class="active">Empleados</li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->
                <div id="divGrid"></div>
            </div>
        </div>
    </div>
    <div id="divModal" class="formPopup">
        <form style="overflow: hidden; padding: 20px 60px">
            <div class="pull-left">
                <div class="form-group">
                    <input type="hidden" name="id" id="hdnId" value="0"/>
                    <input type="text" name="clave" id="iClave" class="form-control form-sm" placeholder="Clave">
                </div>
                <div class="form-group">
                    <input type="text" name="nombre" id="iNombre" class="form-control form-sm" placeholder="Nombre">
                </div>
                <div class="form-group">
                    <select name="puesto" id="selPuestos" class="form-control form-sm">
                        <option value="" selected disabled>Puestos...</option>
                    </select>
                </div>
                <div class="form-group">
                    <input type="email" name="email" id="iEmail" class="form-control form-sm" placeholder="Correo"/>
                </div>
                <div class="form-group">
                    <input type="text" name="domicilio" id="iDomicilio" class="form-control form-sm" placeholder="Domicilio"/>
                </div>
                <div class="form-group">
                    <input type="text" name="colonia" id="iColonia" class="form-control form-sm" placeholder="Colonia"/>
                </div>
            </div>
            <div class="pull-right">
                <div class="form-group">
                    <select name="id_estado" id="selEstadoFiscal" class="form-control form-sm">
                        <option value="" selected disabled>Estados...</option>
                    </select>
                </div>
                <div class="form-group">
                    <select name="ciudad" id="selCiudades" class="form-control form-sm">
                        <option value="" selected disabled>Ciudades...</option>
                    </select>
                </div>
                <div class="form-group">
                    <input type="text" name="telefono" id="iTelefono" class="form-control form-sm" placeholder="Teléfono"/>
                </div>
                <div class="form-group">
                    <input type="text" name="celular" id="iCelular" class="form-control form-sm" placeholder="Celular"/>
                </div>
                <div class="form-group">
                    <input type="text" name="codigoPostal" id="iCodigoPostal" class="form-control form-sm" placeholder="Código Postal"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div class="col-md-12">
                        <label>Días que puede laborar</label>
                    </div>
                    <div class="col-md-5">
                            <div class="checkbox">
                                <label><input type="checkbox" name="lunes" id="chLunes" value="1">Lunes</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="martes" id="chMartes" value="2">Martes</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="miercoles" id="chMiercoles" value="3">Miércoles</label>
                            </div>
                    </div>
                    <div class="col-md-5">
                            <div class="checkbox">
                                <label><input type="checkbox" name="jueves" id="chJueves" value="4">Jueves</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="viernes" id="chViernes" value="5">Viernes</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="sabado" id="chSabado" value="6">Sábado</label>
                            </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 text-center">
                <input type="submit" id="btnAceptar" class="btn btn-default" value="Aceptar" />
                &nbsp;
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>  
        </form>
    </div>
    </div>
</body>
</html>