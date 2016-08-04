<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Configuraci&oacute;n</title>
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
        modal = "#divModal"; 

        $(document).ready(function(){
            $(modal).setModal("Roles", 550);

            $("#divSecciones").kendoTabStrip({
                animation: {
                    open: {
                        effects: "fadeIn"
                    },
                    close: {
                        effects: "fadeOut"
                    }
                },
                select: function(e){
                    switch($(e.item).attr("pestania")){
                        case "usuarios":
                            WS =  "<?= $pathWS ?>WS_usuarios.php";

                            jsonFields = {
                                id: { type: "number" },
                                nombre: { type: "string" }
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

                            $("div[pestania='usuarios']").html("<div id=\"divUsuarios\"></div>");

                            gridUsuarios = "#divUsuarios";
                            $(gridUsuarios).setGrid();
                            break;
                        case "roles":
                            WS =  "<?= $pathWS ?>WS_roles.php";

                            jsonFields = {
                                id: { type: "number" },
                                nombre: { type: "string" }
                            };
                            jsonColumns = [
                                            templateID,
                                            {
                                                field: "nombre",
                                                title: "Nombre"
                                            },
                                            templateBotones
                                        ];

                            $("div[pestania='roles']").html("<div id=\"divRoles\"></div>");
                            gridRoles = "#divRoles";

                            $(gridRoles).setGrid();
                            break;
                        case "permisos":
                            break;
                    }
                }
            });
        });
    </script>
</head>
<body>
    <div id="wrapper">
        <?php menuPrincipal(); ?>
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <?php breadcrumb(); ?>
                </div>
                <div id="divSecciones">
                    <ul>
                        <li pestania="usuarios">Usuarios</li>
                        <li pestania="roles">Roles</li>
                        <li pestania="permisos">Permisos</li>
                    </ul>
                    <div pestania="usuarios"></div>
                    <div pestania="roles"></div>
                    <div pestania="permisos"></div>
                </div>
            </div>
        </div>
    </div>
    <div id="divModalRoles" class="formPopup">
        <form method="post">
            <div class="form-group">
                <input type="hidden" name="id" id="hdnId" value="0"/>
                <input type="text" name="nombre" id="iNombre" class="form-control form-md" placeholder="Nombre">
            </div>
            <div class="text-center">
                <input type="submit" class="btn btn-default" value="Enviar" />
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>
        </form>
    </div>
</body>
</html>