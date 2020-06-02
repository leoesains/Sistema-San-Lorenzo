<?php

require_once 'models/db.conection.model.php';

class DivisionesModel{

    private $modelConection;
    private $db;

    public function __construct(){
        //hacemos la conexión con a BBDD
        $this->modelConection = new dbConectionModel();
        $this->db = $this->modelConection->createConexion();
    }

    //Obtengo todas las divisiones
    public function getAll() {
        
        //Hacemos la consulta
        $sql = "SELECT * FROM divisiones";
        $query = $this->db->prepare($sql);    //Preparo la sentencia sql para hacer la consulta
        $query->execute();        //la ejecuto
        $divisiones = $query->fetchAll(PDO::FETCH_OBJ);    //Guardo todas las divisiones en $divisiones (arreglo)
        return $divisiones;
    }

    //obtengo una division pasada por parametro
    public function get($idDivision) {
        
        //Enviamos la consulta
        $sql = "SELECT * FROM divisiones WHERE id_division = ?";
        $query = $this->db->prepare($sql);    //Preparo la sentencia sql para hacer la consulta
        $query->execute([$idDivision]);        //La ejecuto
        $division = $query->fetch(PDO::FETCH_OBJ);    
        return $division;
    }

    //ingresa una nueva division a la BBDD
    function insert($numeroDivision, $nombreDivision, $edadLimite, $limiteJugadores, $excepciones) {
        
        //enviamos la consulta
        $sql = "INSERT INTO divisiones(id_division, nombre_div, edad_limite, limite_jugadores_LBF, excepciones) VALUES (?, ?, ?, ?, ?)";
        $query = $this->db->prepare($sql);  
        $query->execute([$numeroDivision, $nombreDivision, $edadLimite, $limiteJugadores, $excepciones]);        
    }

    public function update($id_div, $nombre, $edad_lim, $lim_jug_LBF, $excepciones) {
        
        //enviamos la consulta
        $sql = "UPDATE divisiones SET nombre_div = ?, edad_limite = ?, limite_jugadores_LBF = ?, excepciones = ? WHERE id_division = $id_div";
        $query = $this->db->prepare($sql);  
        $query->execute([$nombre, $edad_lim, $lim_jug_LBF, $excepciones]);        
    }

    public function delete($id_div){
        
        //enviamos la consulta
        $sql = "DELETE FROM divisiones WHERE id_division = ?";
        $query = $this->db->prepare($sql);  
        $query->execute([$id_div]);        
    }
}