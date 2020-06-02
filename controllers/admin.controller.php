<?php
require_once 'models/divisiones.model.php';
require_once 'models/jugadores.model.php';
require_once 'models/login.model.php';
require_once 'views/public.view.php';
require_once 'views/admin.view.php';
require_once 'helpers/auth.helper.php';

class AdminController{

    //Variables globales del controlador
    private $modelDivisiones;
    private $modelJugadores;
    private $modelAdmin;
    private $view;
    private $viewPublic;
    
    public function __construct() { //Constructor de la clase
        authHelper::checkLogged();
        $this->modelDivisiones = new DivisionesModel();
        $this->modelJugadores = new JugadoresModel();
        $this->modelAdmin = new AdminModel();
        $this->view = new AdminView();
        $this->viewPublic = new PublicView();
        
    }

    //muestra el formulario para cargar los datos de un nuevo jugador
    //para posteriormente guardarlo en la BBDD
    public function formPlayer() {
        $divisiones = $this->modelDivisiones->getAll(); //para el select del form

        if(empty($divisiones)) {
            $this->DDBBvacia("Aún no hay cargadas divisiones en la Base de Datos");
        } else {
            $this->view->formPlayerAdd($divisiones);
        }
    }

    //guarda un nuevo jugador en la BBDD
    public function addPlayer() {
        if(empty($_POST['dni']) || empty($_POST['name']) || empty($_POST['edad'])|| empty($_POST['fechaNacimiento']) || empty($_POST['numeroCarnet'])
            || empty($_POST['puesto']) || empty($_POST['clubOrigen']) || empty($_POST['telefono']) || empty($_POST['foto']) || empty($_POST['categoria'])) {
                $divisiones = $this->modelDivisiones->getAll(); 
                $this->view->formPlayerAdd($divisiones, "No ingresò todos los datos requeridos");
        } else {
            $jugador = $this->modelJugadores->get($_POST['dni']);
            if(!empty($jugador)) {
                $divisiones = $this->modelDivisiones->getAll(); 
                $this->view->formPlayerAdd($divisiones, "El jugador " . $_POST['name'] . " ya existìa!");
            } else {
                $this->modelJugadores->insert($_POST['dni'], $_POST['name'], $_POST['edad'], $_POST['fechaNacimiento'], $_POST['numeroCarnet'], $_POST['puesto'],
                                              $_POST['clubOrigen'], $_POST['telefono'], $_POST['categoria'], $_POST['foto']);
                $divisiones = $this->modelDivisiones->getAll(); 
                $this->view->formPlayerAdd($divisiones, $_POST['name'] . " fue guardado correctamente!");
            }
        }
    }

    //muestra el formulario para cargar los datos de una nueva División
    //para posteriormente guardarla en la BBDD
    public function formDivision() {
        $this->view->formDivisionAdd();
    }

    //guarda una nueva División en la BBDD
    public function addDivision() {
        if(empty($_POST['numeroCategoria']) || empty($_POST['nombreCategoria']) || empty($_POST['edadLimite'])|| empty($_POST['limiteJugadores']) || empty($_POST['excepciones'])) {
            $this->view->formDivisionAdd("No ingreso todos los datos requerìdos");
        } else {
            $categoria = $this->modelDivisiones->get($_POST['numeroCategoria']);
            if(!empty($categoria)) {
                $this->view->formDivisionAdd("La categoria " . $categoria->nombre_div . " ya existìa!!");
            } else {
                $this->modelDivisiones->insert($_POST['numeroCategoria'], $_POST['nombreCategoria'], $_POST['edadLimite'], $_POST['limiteJugadores'], $_POST['excepciones']);
                $this->view->formDivisionAdd("Divisiòn guardada correctamente");
            }
        }
    }

    //muestra formulario para Editar un jugador
    public function editDataPlayer($dni){
        $jugador = $this->modelJugadores->get($dni); //para precargar los datos al form
        $divisiones = $this->modelDivisiones->getAll(); //para select en form
        $this->view->showFormEditionPlayer($jugador, $divisiones);
    }

    //modifica datos de jugador en DDBB
    public function modifyDataPlayer(){
        if(empty($_POST['nombre']) || empty($_POST['edad'])|| 
          empty($_POST['fechaNacimiento']) || empty($_POST['numeroCarnet']) || 
          empty($_POST['puesto']) || empty($_POST['clubOrigen']) || 
          empty($_POST['telefono']) || empty($_POST['foto']) || 
          empty($_POST['categoria'])) {
            $jugador = $this->modelJugadores->get($_POST['dni']);
            $divisiones = $this->modelDivisiones->getAll();
            $this->view->showFormEditionPlayer($jugador, $divisiones, "No se permiten campos vacìos");
        } else {
            $this->modelJugadores->update($_POST['dni'],$_POST['nombre'], $_POST['edad'], 
                                      $_POST['fechaNacimiento'], $_POST['numeroCarnet'], $_POST['puesto'], $_POST['clubOrigen'], 
                                      $_POST['telefono'], $_POST['categoria'],
                                      $_POST['foto']);
            $jugador = $this->modelJugadores->get($_POST['dni']);
            $divisiones = $this->modelDivisiones->getAll();
            $this->view->showFormEditionPlayer($jugador, $divisiones, "Cambios guardados exitosamente");
        }
    }

    //Repregunta si esta seguro en eliminar un jugador de la BBDD
    public function confirmDeletePlayer($dni) {
        $jugador = $this->modelJugadores->get($dni);
        $this->view->formDeletePlayer($jugador);
    }

    //Elimina un jugador. luego se situa en listar_jugadores
    public function removePlayer($dni){
        $this->modelJugadores->delete($dni);
        header ('Location: ' .BASE_URL. 'listar_jugadores');
    }

    //muestra formulario para Editar una Division
    public function editDataDivision($id_division){
        $categoria = $this->modelDivisiones->get($id_division); //para precargar los datos al form
        $this->view->showFormEditionDivision($categoria);
    }

    //Modifica los datos de una determina division
    public function modifyDataDivision(){
        if(empty($_POST['nombre_div']) || empty($_POST['edad_limite'])|| 
           empty($_POST['limite_jugadores_LBF']) || empty($_POST['excepciones'])) {
             $categoria = $this->modelDivisiones->get($_POST['id_division']);
             $this->view->showFormEditionDivision($categoria, "No se permiten campos vacìos");
        } else {
            $this->modelDivisiones->update($_POST['id_division'],$_POST['nombre_div'], 
                                        $_POST['edad_limite'], 
                                        $_POST['limite_jugadores_LBF'], 
                                        $_POST['excepciones']);
            $categoria = $this->modelDivisiones->get($_POST['id_division']);
            $this->view->showFormEditionDivision($categoria, "Cambios realizados exitosamente");
        }
    }

    //Repregunta si esta seguro en eliminar una Division
    public function confirmDeleteDivision($id_div) {
        $division = $this->modelDivisiones->get($id_div);
        $this->view->formDeleteDivision($division);
    }

    //Elimina la division siempre y cuando no tenga jugadores cargados
    public function removeDivision($id_div){
        $jugadores = $this->modelJugadores->getPlayerDivisions($id_div);
        if(empty($jugadores)) {
            $this->modelDivisiones->delete($id_div);
            $divisiones = $this->modelDivisiones->getAll();
            $this->viewPublic->showDivisions($divisiones, "División borrada exitosamente");
        } else {
            $divisiones = $this->modelDivisiones->getAll();
            $this->viewPublic->showDivisions($divisiones, "No se puede eliminar esta división porque tiene jugadores cargados");
        }
    }

    //Le digo a la VISTA que me muestre un mensaje por pantalla
    public function DDBBvacia($msg){
        $this->view->printDDBBvacia($msg);
    }

}
