<?php

require_once 'models/db.conection.model.php';

class JugadoresModel{

    private $modelConection;
    private $db;

    public function __construct(){
        //hacemos la conexión con a BBDD
        $this->modelConection = new dbConectionModel();
        $this->db = $this->modelConection->createConexion();
    }

    //Obtengo todos los jugadores
    public function getAll() {
        //Enviamos la consulta
        $sql = "SELECT * FROM jugadores ORDER BY puesto";
        $query = $this->db->prepare($sql);    //Preparo la sentencia sql para hacer la consulta
        $query->execute();        //La ejecuto
        $jugadores = $query->fetchAll(PDO::FETCH_OBJ);    //Obtenemos la lista de jugadores y la guardamos en el arreglo $jugadores
        return $jugadores;
    }

    //Devuelve un jugador
    public function get($idJugador) {
        //Enviamos la consulta
        $sql = "SELECT * FROM jugadores WHERE id_jugador = ?";
        $query = $this->db->prepare($sql);    //Preparo la sentencia sql para hacer la consulta
        $query->execute([$idJugador]);        //La ejecuto
        $jugador = $query->fetch(PDO::FETCH_OBJ);    
        return $jugador;
    }

    //Devuelve los jugadores de una division dada
    public function getPlayerDivisions($idDivision){
        //Enviamos la consulta (Se preapra, se envía o ejecuta y se obtiene la respuesta)
        $sql = "SELECT J.id_jugador, J.nombre, J.imagen, J.puesto, J.id_division
                FROM jugadores J
                INNER JOIN divisiones D ON J.id_division = D.id_division
                WHERE J.id_division = $idDivision
                ORDER BY puesto"; //Consulta que quiero realizar en la Base de Datos
        $query = $this->db->prepare($sql); //Preparo para hacer la consulta
        $query->execute(); //Envío o ejecuto la consulta
        $jugadorXdivision = $query->fetchAll(PDO::FETCH_OBJ); //Obtengo la respuesta a mi consulta. 
        return $jugadorXdivision;
    }

    //ingresa un nuevo jugador a la BBDD
    public function insert($dni, $nombre, $edad, $fechaNacimiento, $numeroCarnet, $puesto, $clubOrigen, $telefono, $foto, $categoria) {
        //enviamos la consulta
        $sql = "INSERT INTO jugadores(id_jugador, nombre, edad, fecha_nac, carnet, puesto, club_origen, telefono, id_division, imagen) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
        $query = $this->db->prepare($sql);  
        $query->execute([$dni, $nombre, $edad, $fechaNacimiento, $numeroCarnet, $puesto, $clubOrigen, $telefono, $foto, $categoria]);        
    }

    //actualiza los datos de un jugador  
    public function update($dni, $nombre, $edad, $fechaNacimiento, $numeroCarnet, $puesto, $clubOrigen, $telefono, $foto, $categoria) {
        //enviamos la consulta
        $sql = "UPDATE jugadores SET nombre = ?, edad = ?, fecha_nac = ?, carnet = ?, puesto = ?, club_origen = ?, telefono = ?, id_division = ?, imagen = ? WHERE id_jugador = $dni";
        $query = $this->db->prepare($sql);  
        $query->execute([$nombre, $edad, $fechaNacimiento, $numeroCarnet, $puesto, $clubOrigen, $telefono, $foto, $categoria]);        
    }

    //Elimina un jugador ($dni) de la base de datos
    public function delete($dni){
       //enviamos la consulta
       $sql = "DELETE FROM jugadores WHERE id_jugador = ?";
       $query = $this->db->prepare($sql);  
       $query->execute([$dni]);        
    }

    //Devuelve los jugadores de un determinado puesto
    public function getPlayerPosition($puesto){
        $sql = "SELECT * FROM jugadores WHERE puesto = ?"; //Consulta que quiero realizar en la Base de Datos
        $query = $this->db->prepare($sql); //Preparo para hacer la consulta
        $query->execute([$puesto]); //Envío o ejecuto la consulta
        $jugadoresXpuesto = $query->fetchAll(PDO::FETCH_OBJ); //Obtengo la respuesta a mi consulta. 
        return $jugadoresXpuesto;
    }
}