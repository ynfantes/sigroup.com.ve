<?php
include_once '../includes/constants.php';
include_once '../includes/mailto.php';
$message="Contacto ".TITULO."\n";
$message.=$_POST["email"]."\n";
$message.=$_POST["nombre"]."\n";
$message.=$_POST["mensaje"];
$message = stripcslashes(nl2br(htmlentities($message)));

$subject = "Contacto ".TITULO;
$email = "sigroupvzla@gmail.com";
//$email = USER_MAIL;

if ($_POST["email"]!='' && $_POST["nombre"]!='' && $_POST["mensaje"]!='') {
    
    $mail = new mailto(SMTP);
    $result = $mail->enviar_email($subject, $message,"", $email,$_POST['nombre']);
    
    if ($result=="") {
        $result['suceed'] = true;
        $result['mensaje'] = "Mensaje enviado con éxito!\r\nLo estaremos contactando a la brevedad. Gracias por contactarnos.";
    } else {
        $result['suceed'] = false;
        $result['mensaje'] = "¡Ups! Ocurrió un error al tratar de enviar el mensaje</strong>
        Inténtelo nuevamente. Gracias por contactarnos.";    
    }
    echo json_encode($result);
}