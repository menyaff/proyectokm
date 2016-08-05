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
        modalDetalles = "#divModalDetalles";
        modal = "#divModal"; 
        grid = "#divGrid";  
        titulo = "proveedores";

        WS =  "<?= $pathWS ?>WS_proveedores.php";

        $(document).ready(function(){
            $(modalDetalles).setModal(titulo, 600);
            $(modal).setModal(titulo, 1050);
            $(grid).setGrid();

            $("#selEstadosFiscal").rellenaSelect("<?= $pathWS ?>WS_estados.php");
            $("#selEstadosFiscal").change(function(){
                var elem = $(this);
                
                var jsonCiudades = '{"selEstados":"'+elem.val()+'"}';
                jsonCiudades = $.parseJSON(jsonCiudades);

                $("#selCiudadesFiscal").rellenaSelect("<?= $pathWS ?>WS_ciudades.php",jsonCiudades);
            });
        });
    </script>
</head>
<body>
    <div id="wrapper">
        <?php menuPrincipal(); ?>
        <!-- Contenido -->
        <div id="page-wrapper">
            <div class="container-fluid">
            <!-- mapa ubicación -->
                <div class="row">
                    <?php breadcrumb(); ?>
                </div>
            <!-- /mapa ubicación -->
                <div id="divGrid"></div>
            </div>
        </div>
    </div>
    <div id="divModal" class="formPopup text-center">
        <form method="post" style="overflow: hidden; padding: 20px 60px">
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
                        <input type="text" name="webContacto" id="iWebContacto" class="form-control form-sm" placeholder="Sitio web (http://www.)"/>
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
                        <select name="id_estado" id="selEstadosFiscal" class="form-control form-sm">
                            <option value="" selected disabled>Estados...</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select name="ciudadFiscal" id="selCiudadesFiscal" class="form-control form-sm selDependiente">
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
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>            
        </form>
    </div>
    <div id="divModalDetalles" class="formPopup">
        <table class="table table-responsive">
            <tr>
                <th class="thead">Clave</th>
                <td name="clave"></td>
            </tr>
            <tr>
                <th class="thead">Nombre</th>
                <td name="nombre"></td>
            </tr>
            <tr>
                <th class="text-center" colspan="2">Detalles Contacto</th>
            </tr>
            <tr>
                <th class="thead">Nombre 1</th>
                <td name="nombreContacto"></td>
            </tr>
            <tr>
                <th class="thead">Nombre 2</th>
                <td name="nombre2Contacto"></td>
            </tr>
            <tr>
                <th class="thead">Empresa</th>
                <td name="nombreEmpresaContacto"></td>
            </tr>
            <tr>
                <th class="thead">Teléfono</th>
                <td name="telefonoContacto"></td>
            </tr>
            <tr>
                <th class="thead">Celular</th>
                <td name="celularContacto"></td>
            </tr>
            <tr>
                <th class="thead">Correo</th>
                <td name="emailContacto"></td>
            </tr>
            <tr>
                <th class="thead">Web</th>
                <td name="webContacto"></td>
            </tr>
            <tr>
                <th class="text-center" colspan="2">Detalles Fiscales</th>
            </tr>
            <tr>
                <th class="thead">RFC</th>
                <td name="rfcFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Nombre Comercial</th>
                <td name="nombreComercialFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Calle</th>
                <td name="calleFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Colonia</th>
                <td name="coloniaFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Ciudad</th>
                <td name="ciudadFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Estado</th>
                <td name="estadoFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Código Postal</th>
                <td name="codigoPostalFiscal"></td>
            </tr>
        </table>
    </div>
</body>
</html>