<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Clientes</title>
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
                        nombre: { type: "string" },
                        nombreComercial: { type: "string" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        {
                            field: "nombreComercial",
                            title: "Nombre Comercial"
                        },
                        templateBotones
                    ];
        modal = "#divModal"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_clientes.php";

        $(document).ready(function(){
            $(modal).setModal("cliente", 1100);
            $(grid).setGrid();
            $("#selEstadosContacto, #selEstadosFiscal").rellenaSelect("<?= $pathWS ?>WS_estados.php");

            $("#selEstadosContacto").change(function(){
                var elem = $(this);
                
                var jsonCiudades = '{"selEstados":"'+elem.val()+'"}';
                jsonCiudades = $.parseJSON(jsonCiudades);
                
                $("#selCiudadesContacto").rellenaSelect("<?= $pathWS ?>WS_ciudades.php",jsonCiudades);
            });
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
                <div class="form-group">
                    <input type="hidden" name="id" id="hdnId" value="0"/>
                    <input type="text" name="clave" id="iClave" class="form-control form-sm" placeholder="Clave"/>
                </div>
                <div class="form-group">
                    <input type="text" name="nombre" id="iNombre" class="form-control form-sm" placeholder="Nombre"/>
                </div>
                <div class="form-group">
                    <input type="text" name="montoCredito" id="iMontoCredito" class="form-control form-sm" placeholder="Monto Credito"/>
                </div>
                <fieldset>
                    <legend>Datos de Contacto</legend>
                    <div class="form-group">
                        <input type="text" name="nombreContacto" id="iNombreContacto" class="form-control form-sm" placeholder="Nombre"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="webContacto" id="iWebContacto" class="form-control form-sm" placeholder="Sitio web (http://www.)"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="direccionContacto" id="iDireccionContacto" class="form-control form-sm" placeholder="Dirección"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="coloniaContacto" id="iColoniaContacto" class="form-control form-sm" placeholder="Colonia"/>
                    </div>
                    <div class="form-group">
                        <select name="id_estado" id="selEstadosContacto" class="form-control form-sm">
                            <option value="" selected disabled>Estados...</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select name="ciudadContacto" id="selCiudadesContacto" class="form-control form-sm selDependiente">
                            <option value="" selected disabled>Ciudades...</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" name="codigoPostalContacto" id="iCodigoPostalContacto" class="form-control form-sm" placeholder="Código Postal"/>
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
                    
                </fieldset>
            </div>
            <div class="pull-right">
                <div class="form-group">
                    <input type="text" name="cargo" id="iCargo" class="form-control form-sm" placeholder="Cargo"/>
                </div>
                <div class="form-group">
                    <input type="text" name="nombreComercial" id="iNombreComercial" class="form-control form-sm" placeholder="Nombre Comercial"/>
                </div>
                <div class="form-group">
                    <input type="number" name="diasCredito" id="iDiasCredito" class="form-control form-sm" placeholder="Días de Crédito"/>
                </div>
                <fieldset>
                    <legend>Datos Fiscales</legend>
                    <div class="form-group">
                        <input type="text" name="rfcFiscal" id="iRfcFiscal" class="form-control form-sm" placeholder="RFC"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="razonSocialFiscal" id="iRazonSocialFiscal" class="form-control form-sm" placeholder="Razon Social"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="calleFiscal" id="iCalleFiscal" class="form-control form-sm" placeholder="Calle"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="coloniaFiscal" id="iColoniaFiscal" class="form-control form-sm" placeholder="Colonia"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="paisFiscal" id="iPais" class="form-control form-sm" placeholder="Pa&iacute;s"/>
                    </div>
                    <div class="form-group">
                        <select name="id_estadoFiscal" id="selEstadosFiscal" class="form-control form-sm">
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
                    <div class="form-group">
                        <input type="text" name="numeroInteriorFiscal" id="iNumeroInteriorFiscal" class="form-control form-sm" placeholder="Número Interior"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="numeroExteriorFiscal" id="iNumeroExteriorFiscal" class="form-control form-sm" placeholder="Número Exterior"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="localidadFiscal" id="iLocalidadFiscal" class="form-control form-sm" placeholder="Localidad Físcal"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="municipioFiscal" id="iMunicipioFiscal" class="form-control form-sm" placeholder="Municipio F&iacute;scal"/>
                    </div>
                </fieldset>
            </div>
            <div class="col-md-12 text-center">
                <button type="submit" id="btnAceptar" class="btn btn-default">Aceptar</button>
                &nbsp;
                <button type="reset" class="btn btn-default">Limpiar</button>
            </div>            
        </form>
    </div>
</body>
</html>