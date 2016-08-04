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
        modalDetalles = "#divModalDetalles";
        modal = "#divModal"; 
        grid = "#divGrid";  
        titulo = "empleado";

        WS = "<?= $pathWS ?>WS_empleados.php";

        $(document).ready(function(){
            $(modalDetalles).setModal(titulo, 700);
            $(modal).setModal(titulo, 550);
            $(grid).setGrid();
            $("#selPuestos").rellenaSelect("<?= $pathWS ?>WS_puestos.php");
            $("#selEstados").rellenaSelect("<?= $pathWS ?>WS_estados.php");
            $("#selEstados").change(function(){
                var elem = $(this);
              
                var jsonCiudades = '{"selEstados":"'+elem.val()+'"}';
                jsonCiudades = $.parseJSON(jsonCiudades);

                $("#selCiudades").rellenaSelect("<?= $pathWS ?>WS_ciudades.php",jsonCiudades);
            });

            $(".btnFormDetalles").click(function(event){
                camposDias = "td[name='lunes'], td[name='martes'], td[name='miercoles'], td[name='jueves'], td[name='viernes'], td[name='sabado']";
                camposVal = $(camposDias).html();
                if(camposVal = 1){
                    $(camposDias).html('Y');
                } else if(camposVal = 0){
                    $(camposDias).html('N');
                }
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
    <div id="divModal" class="formPopup">
        <form method="post">
            <div style="overflow: hidden; padding: 20px 60px">
                <div class="pull-left">
                    <div class="form-group">
                        <input type="hidden" name="id" id="hdnId" value="0"/>
                        <input type="text" name="clave" id="iClave" class="form-control form-sm" placeholder="Clave">
                    </div>
                    <div class="form-group">
                        <input type="text" name="nombre" id="iNombre" class="form-control form-sm" placeholder="Nombre">
                    </div>
                    <div class="form-group">
                        <select name="id_puesto" id="selPuestos" class="form-control form-sm">
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
                        <select name="id_estado" id="selEstados" class="form-control form-sm">
                            <option value="" selected disabled>Estados...</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select name="id_ciudad" id="selCiudades" class="form-control form-sm selDependiente">
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
                    <input type="submit" class="btn btn-default" value="Enviar" />
                    <input type="reset" class="btn btn-default" value="Limpiar" />
                </div> 
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
                <th class="thead">Puesto</th>
                <td name="puesto"></td>
            </tr>
            <tr>
                <th class="thead">Domicilio</th>
                <td name="domicilio"></td>
            </tr>
            <tr>
                <th class="thead">Colonia</th>
                <td name="colonia"></td>
            </tr>
            <tr>
                <th class="thead">Ciudad</th>
                <td name="ciudad"></td>
            </tr>
            <tr>
                <th class="thead">Estado</th>
                <td name="estado"></td>
            </tr>
            <tr>
                <th class="thead">Código Postal</th>
                <td name="codigoPostal"></td>
            </tr>
            <tr>
                <th class="thead">Teléfono</th>
                <td name="telefono"></td>
            </tr>
            <tr>
                <th class="thead">Celular</th>
                <td name="celular"></td>
            </tr>
            <tr>
                <th class="thead">Correo</th>
                <td name="email"></td>
            </tr>
            <tr>
                <th class="thead">Lunes</th>
                <td name="lunes"></td>
            </tr>
            <tr>
                <th class="thead">Martes</th>
                <td name="martes"></td>
            </tr>
            <tr>
                <th class="thead">Miércoles</th>
                <td name="miercoles"></td>
            </tr>
            <tr>
                <th class="thead">Jueves</th>
                <td name="jueves"></td>
            </tr>
            <tr>
                <th class="thead">Viernes</th>
                <td name="viernes"></td>
            </tr>
            <tr>
                <th class="thead">Sábado</th>
                <td name="sabado"></td>
            </tr>
        </table>
    </div>
</body>
</html>