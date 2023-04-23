<?php
date_default_timezone_set("America/La_Paz");

if ($_SERVER['SERVER_NAME'] == "www.sigroup.com.ve" | $_SERVER['SERVER_NAME'] == "sigroup.com.ve") {
    $user           = "sigroup_root";
    $password       = "valoriza25231";
    $db             = "valoriza2_sigroup";
    $email_error    = true;
    $mostrar_error  = false;
    $debug          = false;
    $sistema        = "/";
    $protocol       = 'https';
} else {
    $user           = "root";
    $password       = "";
    $db             = "administ_sigroup";
    $debug          = true;
    $sistema        = "/";
    $email_error    = false;
    $mostrar_error  = true;
    $protocol       = 'http';
}

define("HOST",      "localhost");
define("USER",      $user);
define("PASSWORD",  $password);
define("DB",        $db);

define("SISTEMA",           $sistema);
define("EMAIL_ERROR",       $email_error);
define("EMAIL_CONTACTO",    "ynfantes@gmail.com");
define("EMAIL_TITULO",      "error");
define("MOSTRAR_ERROR",     $mostrar_error);
define("DEBUG",             $debug);

define("TITULO", "Administradora de Condominios SiGroup");
define("ROOT", $protocol.'://'.$_SERVER['SERVER_NAME'].SISTEMA);
define("URL_SISTEMA", ROOT . "enlinea");
define("URL_INTRANET", ROOT . "intranet");

define("SERVER_ROOT", $_SERVER['DOCUMENT_ROOT'] . SISTEMA);

/*set_include_path(SERVER_ROOT . "/site/");*/
define("TEMPLATE", SERVER_ROOT . "/template/");
define("PROGRAMA_CORREO",SMTP);

define("NOMBRE_APLICACION","Sigroup");
define("ACTUALIZ","data/");
define("ARCHIVO_INMUEBLE","INMUEBLE.txt");
define("ARCHIVO_CUENTAS","CUENTAS.txt");
define("ARCHIVO_FACTURA","FACTURA.txt");
define("ARCHIVO_FACTURA_DETALLE","FACTURA_DETALLE.txt");
define("ARCHIVO_JUNTA_CONDOMINIO","JUNTA_CONDOMINIO.txt");
define("ARCHIVO_PROPIEDADES","PROPIEDADES.txt");
define("ARCHIVO_PROPIETARIOS","PROPIETARIOS.txt");
define("ARCHIVO_EDO_CTA_INM","EDO_CUENTA_INMUEBLE.txt");
define("ARCHIVO_CUENTAS_DE_FONDO","CUENTAS_FONDO.txt");
define("ARCHIVO_MOVIMIENTOS_DE_FONDO","MOVIMIENTO_FONDO.txt");
define("ARCHIVO_ACTUALIZACION","ACTUALIZACION.txt");
define("ARCHIVO_MOVIMIENTO_CAJA","MOVIMIENTO_CAJA.txt");
define("SMTP_SERVER","mail.sigroup.com.ve");                                 
define("PORT",465);
define("USER_MAIL","no-reply@sigroup.com.ve");
define("PASS_MAIL","sigroup5231");
define("MESES_COBRANZA",1000);
define("GRAFICO_FACTURACION",1);
define("GRAFICO_COBRANZA",1);
define("RECIBO_GENERAL",1);
define("MOVIMIENTO_FONDO",1);
define("GRUPOS",0);
define("DEMO",0);
define("EGRESOS",1);
define("CARTELERA",false);