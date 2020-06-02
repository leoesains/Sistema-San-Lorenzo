<!DOCTYPE html>
    <html lang="en">
        <head>
            <base href="{BASE_URL}">
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>San Lorenzo de Rauch</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
            <link rel="stylesheet" href="css/styles.css">
        </head>
        <body>
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar navbar-dark bg-dark">
                <img class="imagenNav"src="images/Escudo transparente.png">
                <a class="navbar-brand" href="#"><b>SAN LORENZO DE RAUCH</b></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="home">HOME<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                JUGADORES
                            </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="ver_arqueros">ARQUEROS</a>
                            <a class="dropdown-item" href="ver_defensores">DEFENSORES</a>
                            <a class="dropdown-item" href="ver_volantes">VOLANTES</a>
                            <a class="dropdown-item" href="ver_delanteros">DELANTEROS</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="listar_jugadores">TODOS</a>
                        </div>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="listar_divisiones">DIVISIONES</a>
                        </li>
                    </ul>
                </div>
                
                <div class="login-container">
                    <form class="form_log" action="loguearse" method="POST">
                        <input type="text" placeholder="Username" name="username">
                        <input type="password" placeholder="Password" name="psw">
                        <button type="submit">Login</button>

                        {if {$error}}
                            <div class="alert alert-danger contenedor-alert-usuario">
                                {$error}
                            </div>
                        {/if}

                    </form>
                
                

            </nav>
       