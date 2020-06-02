<?php

require_once 'models/db.conection.model.php';

class AdminModel{

    private $modelConection;
    private $db;

    public function __construct(){
        $this->modelConection = new dbConectionModel();
        $this->db = $this->modelConection->createConexion();
    }

    //devuelve el admin si existe en la DDBB o vacio si no existe
    public function getAdmin($username) {
        //Hacemos la consulta
        $sql = "SELECT * FROM administradores WHERE nombre_usuario = ?";
        $query = $this->db->prepare($sql);    //Preparo la sentencia sql para hacer la consulta
        $query->execute([$username]);        //la ejecuto
        $administrador = $query->fetch(PDO::FETCH_OBJ);    
        return $administrador;
    }
}