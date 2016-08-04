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
        modalDetalles = "#divModalDetalles";
        modal = "#divModal"; 
        grid = "#divGrid";  
        titulo = "cliente";

        WS =  "<?= $pathWS ?>WS_clientes.php";

        $(document).ready(function(){
            $(modalDetalles).setModal(titulo, 700);
            $(modal).setModal(titulo, 550);
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
<style>
    .thead{border-right: 1px solid #CCC !important; width: 30%;}
</style>
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
                <th class="thead">Articulo</th>
                <td name="nombre"></td>
            </tr>
            <tr>
                <th class="thead">Nombre Comercial</th>
                <td name="nombreComercial"></td>
            </tr>
            <tr>
                <th class="thead">Cargo</th>
                <td name="cargo"></td>
            </tr>
            <tr>
                <th class="thead">Crédito</th>
                <td name="montoCredito"></td>
            </tr>
            <tr>
                <th class="thead">Días Crédito</th>
                <td name="diasCredito"></td>
            </tr>
            <tr>
                <th class="thead">Tipo Contacto</th>
                <td name="tipoContacto"></td>
            </tr>
            <tr>
                <th class="thead">Contacto</th>
                <td name="nombreContacto"></td>
            </tr>
            <tr>
                <th class="thead">Contacto Web</th>
                <td name="webContacto"></td>
            </tr>
            <tr>
                <th class="thead">Direccion Contacto</th>
                <td name="direccionContacto"></td>
            </tr>
            <tr>
                <th class="thead">Colonia Contacto</th>
                <td name="coloniaContacto"></td>
            </tr>
            <tr>
                <th class="thead">Ciudad Contacto</th>
                <td name="ciudadContacto"></td>
            </tr>
            <tr>
                <th class="thead">Estado Contacto</th>
                <td name="estadoContacto"></td>
            </tr>
            <tr>
                <th class="thead">Código Postal Contacto</th>
                <td name="codigoPostalContacto"></td>
            </tr>
            <tr>
                <th class="thead">Telefono Contacto</th>
                <td name="telefonoContacto"></td>
            </tr>
            <tr>
                <th class="thead">Celular Contacto</th>
                <td name="celularContacto"></td>
            </tr>
            <tr>
                <th class="thead">Email Contacto</th>
                <td name="emailContacto"></td>
            </tr>
            <tr>
                <th class="thead">RFC Físcal</th>
                <td name="rfcFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Razon Social Físcal</th>
                <td name="razonSocialFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Calle Físcal</th>
                <td name="calleFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Colonia Físcal</th>
                <td name="coloniaFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Estado Físcal</th>
                <td name="estadoFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Ciudad Físcal</th>
                <td name="ciudadFiscal"></td>
            </tr>
            <tr>
                <th class="thead">País Físcal</th>
                <td name="paisFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Código Postal Físcal</th>
                <td name="codigoPostalFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Número Interior Físcal</th>
                <td name="numeroInteriorFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Número Exterior Físcal</th>
                <td name="numeroExteriorFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Localidad Físcal</th>
                <td name="localidadFiscal"></td>
            </tr>
            <tr>
                <th class="thead">Municipio Físcal</th>
                <td name="municipioFiscal"></td>
            </tr>
        </table>
    </div>
</body>
</html>    