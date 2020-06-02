<?php
require_once 'models/divisiones.model.php';
require_once 'models/jugadores.model.php';
require_once 'views/public.view.php';
require_once 'helpers/auth.helper.php';

class PublicController{

    //Variables globales del controlador
    private $modelDivisiones;
    private $modelJugadores;
    private $view;
    
    public function __construct(){                  //Constructor de la clase
        $this->modelDivisiones = new DivisionesModel();
        $this->modelJugadores = new JugadoresModel();
        $this->view = new PublicView();
    }

    //Muestra la pagina de inicio
    public function home(){
        $this->view->showHome();
    }

    //muestra todos los jugadores que hay cargados en la BBDD
    public function showPlayer() {
        $jugadores = $this->modelJugadores->getAll();               //Pido los jugadores al modelo

        if(empty($jugadores)) {
            $this->DDBBvacia("No hay jugadores en la Base de Datos");
        } else {
            $this->view->showPlayers($jugadores);                       //Actualizo la vista
        }
    }

    //muestra Perfil de un jugador y la lista de jugadores para ver otros perfiles 
    public function viewPlayer($idJugador) {
        $jugadores = $this->modelJugadores->getAll();
        $jugador = $this->modelJugadores->get($idJugador);
        
        if(!empty($jugador)) {
            $this->view->showPlayer($jugador, $jugadores);
        } else {
            $this->DDBBvacia("El jugador no se encuentra en la Base de datos");
        }
    }

    //muestra Perfil de un jugador y una lista de todos los jugadores de la misma división
    public function viewPlayerDivision($idJugador, $division) {
        $jugadoresXdivisiones = $this->modelJugadores->getPlayerDivisions($division);
        $jugador = $this->modelJugadores->get($idJugador);

        if(!empty($jugador)) {
            $this->view->showPlayerDivision($jugador, $jugadoresXdivisiones);
        } else {
            $this->DDBBvacia("El jugador no se encuentra en la Base de Datos");
        }
    }

    //muestra todas las divisiones cargadas en la BBDD
    public function showDivision() {
        $divisiones = $this->modelDivisiones->getAll();             //pido las divisiones al modelo

        if(empty($divisiones)) {
            $this->DDBBvacia("Aún no se ha cargado ninguna División");
        } else {
            $this->view->showDivisions($divisiones);                //actualizo la vista
        }
    }

    //muestra los jugadores de una division especifica
    public function showPlayersByDivision($division){
        $jugadoresXdivisiones = $this->modelJugadores->getPlayerDivisions($division);

        if(empty($jugadoresXdivisiones)) {
            $this->DDBBvacia("No hay Jugadores cargados en esta División");
        } else {
            $this->view->printPlayersByDivision($jugadoresXdivisiones);
        }
    }

    //Le digo a la VISTA que me muestre un ERROR en pantalla
    public function showError($msg){
        $this->view->printError($msg);
    }

    //Le digo a la VISTA que me muestre un MENSAJE en pantalla
    public function DDBBvacia($msg){
        $this->view->printDDBBvacia($msg);
    }

    //muestra los jugadores de un determinado puesto ($puesto)
    public function viewPlayersPosition($puesto){
        $jugadoresXpuesto = $this->modelJugadores->getPlayerPosition($puesto);

        if(empty($jugadoresXpuesto)) {
            $this->DDBBvacia("No hay Jugadores cargados en la Base de Datos en el puesto " .$puesto);
        } else {
            $this->view->printPlayersByPosition($jugadoresXpuesto);
        }
    }

    //muestra el Perfil de un jugador ($idJugador), de un determinado puesto ($puesto)
    //y una lista de jugadores del mismo puesto.
    public function viewPlayerPosition($idJugador, $puesto) {
        $jugadoresXpuesto = $this->modelJugadores->getPlayerPosition($puesto);
        $jugador = $this->modelJugadores->get($idJugador);

        if(!empty($jugador)) {
            $this->view->showPlayerPosition($jugador, $jugadoresXpuesto); 
        } else {
            $this->DDBBvacia("El Jugador no se encuentra en la Base de Datos");
        }
    }
}