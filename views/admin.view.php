<?php

require_once 'libs/Smarty.class.php';
require_once 'helpers/auth.helper.php';


class AdminView{

    private $smarty;
    
    public function __construct(){
        $this->smarty = new Smarty();
        $nameAdmin = authHelper::nameLogged();
        $this->smarty->assign('nameAdmin', $nameAdmin);
    }

    /*
    //Da la bienvenida al Usuario Administrador
    public function welcome($nombreUsuario) {
        $this->smarty->display('templates/welcome.tpl');
    }*/

    //Muestra un formulario para agregar un jugador
    public function formPlayerAdd($divisiones, $error = null) {
        $this->smarty->assign('listaDivisiones', $divisiones);
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/formPlayerAdd.tpl');
    }

    //Muestra un formulario para agregar una division
    public function formDivisionAdd($error = null) {
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/formDivisionAdd.tpl');
    }

    //Muestra un formulario para editar un jugador con los datos precargados 
    public function showFormEditionPlayer($jug, $divisiones, $error = null){
        $this->smarty->assign('jugador', $jug);
        $this->smarty->assign('listaDivisiones', $divisiones);
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/showFormEditionPlayer.tpl');
    }

    //Muestra un formulario para editar una division con los datos precargados
    public function showFormEditionDivision($div, $error = null){
        $this->smarty->assign('division', $div);
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/showFormEditionDivision.tpl');
    }

    //Muestra un mensaje para saber si esta seguro en eliminar un jugador
    public function formDeletePlayer($jugador) {
        $this->smarty->assign('jugador', $jugador);
        $this->smarty->display('templates/formPlayerDelete.tpl');
    }

    //Muestra un mensaje para saber si esta seguro en eliminar una division
    public function formDeleteDivision($division) {
        $this->smarty->assign('division', $division);
        $this->smarty->display('templates/formDivisionDelete.tpl');
    }
}