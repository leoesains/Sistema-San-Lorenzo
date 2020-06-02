<?php
    
    class dbConectionModel {

        //Crea la conexión a la DDBB
        public function createConexion() {
            $host = 'localhost';
            $userName = "root";
            $password = '';
            $dataBase = 'db_san_lorenzo_rauch';
            try {
                $pdo = new PDO("mysql:host=$host;dbname=$dataBase;charset=utf8", $userName, $password);
            } catch (Exception  $e){
                var_dump($e);
            }
            return $pdo;
        }
    }
    