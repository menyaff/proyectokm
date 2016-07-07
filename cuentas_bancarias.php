<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Bancos</title>
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
                        banco: { type: "string" },
                        noCuenta: { type: "string" },
                        clabe: { type: "string" },
                        saldo: { type: "string" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        {
                            field: "banco",
                            title: "Banco"
                        },
                        {
                            field: "noCuenta",
                            title: "No. Cuenta"
                        },
                        {
                            field: "clabe",
                            title: "Clabe"
                        },
                        {
                            field: "saldo",
                            title: "Saldo"
                        },
                        templateBotones
                    ];
        modal = "#divModal"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_cuentasBancarias.php";

        $(document).ready(function(){
            $(modal).setModal("banco", 550);
            $(grid).setGrid();
            $("#selBancos").rellenaSelect("<?= $pathWS ?>WS_bancos.php");
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
    <div id="divModal" class="formPopup">
        <form>
            <div class="form-group">
                <input type="hidden" name="id" id="hdnId" value="0"/>
                <input type="text" name="clave" id="iClave" class="form-control form-md" placeholder="Clave">
            </div>
            <div class="form-group">
                <input type="text" name="nombre" id="iNombre" class="form-control form-md" placeholder="Nombre">
            </div>
            <div class="form-group">
                <select name="banco" id="selBancos" class="form-control form-md">
                    <option value="" selected disabled>Bancos...</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" name="noCuenta" id="iNoCuenta" class="form-control form-md" placeholder="Nombre">
            </div>
            <div class="form-group">
                <input type="text" name="clabe" id="iClabe" class="form-control form-md" placeholder="Clabe">
            </div>
            <div class="form-group">
                <input type="number" step="any" name="saldo" id="iSaldo" class="form-control form-md" placeholder="Saldo">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-default">Enviar</button>
                <button type="reset" class="btn btn-default">Limpiar</button>
            </div>
       </form>
    </div>
</body>
</html>