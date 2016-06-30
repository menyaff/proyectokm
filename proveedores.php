<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Proveedores</title>
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
                        nombre: { type: "string" },
                        nombreComercialFiscal: { type: "string" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        {
                            field: "nombreComercialFiscal",
                            title: "Nombre Comercial"
                        },
                        templateBotones
                    ];
        modal = "#divModal"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_proveedores.php";

        $(document).ready(function(){
            $(modal).setModal("proveedor", 1100);
            $(grid).setGrid();
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
                        <li class="active"> Proveedores</li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->
                <div id="divGrid"></div>
            </div>
        </div>
    </div>
    <div id="divModal" class="formPopup text-center clearfix" style="padding: 20px 60px">
        <form style="overflow: hidden;">
            <div class="pull-left">
                <fieldset>
                    <legend>Datos Fiscales</legend>
                    <div class="form-group">
                        <input type="hidden" name="id" id="hdnId" value="0"/>
                        <input type="text" name="clave" id="iClave" class="form-control form-sm" placeholder="Clave"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="nombre" id="iNombre" class="form-control form-sm" placeholder="Nombre"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="nombreContacto" id="iNombreContacto" class="form-control form-sm" placeholder="Contacto"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="nombre2Contacto" id="iNombre2Contacto" class="form-control form-sm" placeholder="Contacto 2"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="nombreEmpresaContacto" id="iNombreEmpresaContacto" class="form-control form-sm" placeholder="Empresa"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="telefonoContacto" id="iTelefonoContacto" class="form-control form-sm" placeholder="Telefono"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="celularContacto" id="iCelularContacto" class="form-control form-sm" placeholder="Celular"/>
                    </div>
                    <div class="form-group">
                        <input type="email" name="emailContacto" id="iEmailContacto" class="form-control form-sm" placeholder="Correo"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="webContacto" id="iWebContacto" class="form-control form-sm" placeholder="http://www..."/>
                    </div>
                </fieldset>
            </div>
            <div class="pull-right">
                <fieldset>
                    <legend>Datos Fiscales</legend>
                    <div class="form-group">
                        <input type="text" name="rfcFiscal" id="iRfcFiscal" class="form-control form-sm" placeholder="RFC"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="nombreComercialFiscal" id="iNombreComercialFiscal" class="form-control form-sm" placeholder="Nombre"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="calleFiscal" id="iCalleFiscal" class="form-control form-sm" placeholder="Calle"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="coloniaFiscal" id="iColoniaFiscal" class="form-control form-sm" placeholder="Colonia"/>
                    </div>
                    <div class="form-group">
                        <select name="id_estado" id="selEstadoFiscal" class="form-control form-sm">
                            <option value="" selected disabled>Estados...</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select name="ciudadFiscal" id="selCiudadFiscal" class="form-control form-sm">
                            <option value="" selected disabled>Ciudades...</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" name="codigoPostalFiscal" id="iCodigoPostalFiscal" class="form-control form-sm" placeholder="Código Postal"/>
                    </div>
                </fieldset>
            </div>
            <div class="col-md-12 text-center">
                <input type="submit" id="btnAceptar" class="btn btn-default" value="Aceptar" />
                &nbsp;
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>            
        </form>
    </div>
</body>
</html>