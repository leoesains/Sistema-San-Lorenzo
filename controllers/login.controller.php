<?php

require_once 'models/login.model.php';
require_once 'views/public.view.php';
require_once 'views/admin.view.php';

class LoginController{

    //Variables globales del controlador
    private $modelLogin;
    private $view;
    private $viewPublic;
    
    public function __construct() { //Constructor de la clase
        $this->modelLogin = new AdminModel();
        $this->view = new AdminView();
        $this->viewPublic = new PublicView();


    }

    //Controla que el usuario ingresado sea correcto e Inicia Sesión
    public function loginAdmin(){
        if(empty($_POST['username']) || empty($_POST['psw'])) {   
            $this->viewPublic->showHome("Debe ingresar Usuario y Contraseña", session_status() === PHP_SESSION_ACTIVE);
        } else {
            $username = $_POST['username'];
            $password = $_POST['psw'];
            $user = $this->modelLogin->getAdmin($username);
            if($user) {
                if(password_verify($password, $user->contraseña)) {
                    if(session_status() != PHP_SESSION_ACTIVE){
                        session_start();         //Abro la sesion                  
                    }         
                    $_SESSION['IS_LOGGED'] = true;
                    $_SESSION['NOMBRE_USUARIO'] = $user->nombre;  //Guardo el nombre del usuario
                    //$this->view->welcome($user->nombre); 
                    header('Location: ' .BASE_URL. 'loguearse');
                } else {
                    $this->viewPublic->showHome("Contraseña incorrecta", session_status() === PHP_SESSION_ACTIVE);
                }
            } else {
                $this->viewPublic->showHome("El Usuario ingresado no existe", session_status() === PHP_SESSION_ACTIVE);
            }
        }
    }

    //destruye la sesión que se encuentra abierta y redirecciona al home
    public function logout() {
        session_start();
        session_destroy();
        header('Location: ' .BASE_URL. 'home');
    }
}

