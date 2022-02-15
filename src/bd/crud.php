<?php
include_once 'conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$_POST = json_decode(file_get_contents("php://input"), true);

$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$usuario = (isset($_POST['usuario'])) ? $_POST['usuario'] : '';
$correo = (isset($_POST['correo'])) ? $_POST['correo'] : '';
$contrasenya = (isset($_POST['contrasenya'])) ? $_POST['contrasenya'] : '';
$nombreNinyo = (isset($_POST['nombreNinyo'])) ? $_POST['nombreNinyo'] : '';
$edadNiNyo = (isset($_POST['edadNiNyo'])) ? $_POST['edadNiNyo'] : '';

switch($opcion){
    case 1:
        $consulta = "INSERT INTO jugador (usuario, correo, contrasenya, nombreNinyo, edadNinyo) VALUES('$usuario', '$correo', '$contrasenya', '$nombreNinyo', '$edadNinyo') ";	
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                
        break;
    case 2:
        $consulta = "UPDATE moviles SET marca='$marca', modelo='$modelo', stock='$stock' WHERE id='$id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;        
    case 3:
        $consulta = "DELETE FROM moviles WHERE id='$id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                           
        break;         
    case 4:
        $consulta = "SELECT * FROM jugador";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
}

header ("Content-type: application/json; charset=utf-8");
print json_encode($data, JSON_UNESCAPED_UNICODE);
$conexion = NULL;

?>