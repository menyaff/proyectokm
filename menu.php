<nav class='navbar navbar-inverse navbar-fixed-top' role='navigation'>
    <div class='navbar-header'>
        <button type='button' class='navbar-toggle' data-toggle='collapse' data-target='.navbar-ex1-collapse'>
            <span class='sr-only'>Toggle navigation</span>
            <span class='icon-bar'></span>
            <span class='icon-bar'></span>
            <span class='icon-bar'></span>
        </button>
    </div>
    <ul class='nav navbar-right top-nav'>
        <li class='dropdown'>
            <a href='#' class='dropdown-toggle' data-toggle='dropdown'><i class='fa fa-user red-usr'></i>&nbsp;Karla Martínez<b class='caret'></b></a>
            <ul class='dropdown-menu'>
                <li><a href='#'><span class='fa fa-fw fa-power-off'></span> Salir</a></li>
            </ul>
        </li>
    </ul>
    <div class='collapse navbar-collapse navbar-ex1-collapse'>
        <ul class='nav navbar-nav side-nav'>
            <a href='index.php'><img src='IMG/logo.jpg' width='100%' alt='KM &amp; asociados'/></a>
            <li><a href='index.php'><span class='fa fa-fw fa-home red'></span> Inicio</a></li>
            <li><a href='modulos/form.php'><span class='fa fa-fw fa-shopping-cart'></span> Cotización</a></li>
            <li><a href='modulos/eventos.php'><span class='fa fa-fw fa-calendar'></span> Eventos</a></li>
            <li><a href='javascript:;' data-toggle='collapse' data-target='#sub-menu-transacciones'><span class='fa fa-fw fa-money'></span> Transacciones<span class='fa fa-fw fa-caret-down'></span></a>
                    <ul id='sub-menu-transacciones' class='collapse'>
                        <li><a href='modulos/tran_compras.php'>Compras</a></li>
                        <li><a href='modulos/tran_gastos.php'>Gastos</a></li>
                    </ul>
            </li>
            <li><a href='modulos/bancos.php'><span class='fa fa-fw fa-university'></span> Bancos</a></li>
            <li><a href='javascript:;' data-toggle='collapse' data-target='#sub-menu-catalagos'><span class='fa fa-fw fa-book'></span> Catálagos<span class='fa fa-fw fa-caret-down'></span></a>
                    <ul id='sub-menu-catalagos' class='collapse'>
                        <li><a href='modulos/clientes.php'>Clientes</a></li>
                        <li><a href='modulos/empleados.php'>Empleados</a></li>
                        <li><a href='modulos/usuarios.php'>Usuarios</a></li>
                        <li><a href='modulos/servicios.php'>Servicios</a></li>
                        <li><a href='modulos/lugares.php'>Lugares</a></li>
                    </ul>
            </li>
        </ul>
    </div>
</nav>