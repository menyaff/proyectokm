<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Usuarios</title>
    <?php
        metatags();

        librerias::JQuery();
        librerias::Kendo();
        librerias::notify();
        librerias::FontAwesome();
        librerias::Bootstrap();
        librerias::numeral();
    ?>
    <style>
        #divEstadoDeCuenta span.titulo{
            font-weight: bold;
            font-size: 1.3em;
            margin-left: 10px;
        }
    </style>
    <script>
        templateID = "";
        templateBotones = "";
    </script>
    <script src="<?= $pathJS ?>forms.js"></script>
    <script src="<?= $pathJS ?>grids.js"></script>
    <script>
        jsonFields = {
                        nombre: { type: "string" },
                        saldo: { type: "string" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        {
                            field: "empleado",
                            title: "Empleado"
                        },
                        {
                            field: "rol",
                            title: "Rol"
                        },
                        templateBotones
                    ];
        modal = "#divModal"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_usuarios.php";

        $(document).ready(function(){
            $(modal).setModal("usuario", 450);
            $(grid).setGrid();
            $("#selEmpleados").rellenaSelect("<?= $pathWS ?>WS_empleados.php");
            $("#selRoles").rellenaSelect("<?= $pathWS ?>WS_roles.php");
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
            <div class="form-group">
                <input type="hidden" name="id" id="hdnId" value="0"/>
                <input type="text" name="nombre" id="iNombre" class="form-control form-sm" placeholder="Nombre">
            </div>
            <div class="form-group">
                <select name="id_empleado" id="selEmpleados" class="form-control form-sm">
                    <option value="" selected disabled>Empleados...</option>
                </select>
            </div>
            <div class="form-group">
                <select name="id_rol" id="selRoles" class="form-control form-sm">
                    <option value="" selected disabled>Roles...</option>
                </select>
            </div>
            <div class="text-center">
                <input type="submit" class="btn btn-default" value="Enviar" />
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>
        </form>
    </div>
</body>
</html>