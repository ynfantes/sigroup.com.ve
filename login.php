<?php

include_once 'includes/constants.php';

//echo $twig->render('mantenimiento.html.twig');
//die();

$result = array();
$password = '';
$cedula = '';
$propietario = new propietario(); 
if (isset($_POST['cedula']) && isset($_POST['password'])) {
    $cedula = $_POST['cedula'];
    $password = $_POST['password'];
    $result = $propietario->login($cedula,$password, 0);
    echo json_encode($result);
    die();
} else {
    if (isset($_POST['email'])) {
        $result = $propietario->recuperarContraSena($_POST['email']);
    }
}
echo $twig->render('index.html.twig', array("mensaje" => $result,"cedula"=>$cedula,"password"=>$password));