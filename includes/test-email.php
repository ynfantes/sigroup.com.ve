<?php
include 'constants.php';
include 'mailto.php';
// se envia el email de confirmación
$mail = new mailto(SMTP);

$propietario = "edgar";
$forma_pago = 'DEPOSITO';

$r = $mail->enviar_email("Pago de Condomínio", "Este es un mensaje de prueba<br>por favor no responder<br>****NO RESPONDER****", "", "ynfantes@gmail.com");

if ($r=="") {
    echo "mensaje enviado con exito";
} else {
    echo "fallo durante el envio";
}
