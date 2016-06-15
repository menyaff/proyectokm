<!DOCTYPE html>
<html lang="en">
<head>
    <?php include 'head.php ' ?>
    <title>Registro de usuario</title>
</head>
<body>
    <div class="form">
        <div class="logo"><img src="img/logo.jpg"/></div>
        <form class="login-form" method="POST" action="<?= $_SERVER['PHP_SELF'] ?>">
            <input type="text" placeholder="usuario" name="user" maxlength="50" minlength="5" required/>
            <input type="password" placeholder="contraseña" name="pass" maxlength="20" minlength="8" required/>
            <button type="submit" name="login">Iniciar Sesión</button>
            <!-- <p class="message">No tienes cuenta? <a href="#">Crear una!</a></p> -->
        </form>
    </div>
</body>
</html>