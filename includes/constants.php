<?php
define("mailPHP",0);
define("sendMail",1);
define("SMTP",2);
include_once 'configuracion.php';

include_once 'twig/lib/Twig/Autoloader.php';
include_once SERVER_ROOT . 'includes/extensiones.php';
Twig_Autoloader::register();

$loader = new Twig_Loader_Filesystem(SERVER_ROOT . 'template');
$twig = new Twig_Environment($loader, array(
            'debug' => true,
            //'cache' => SERVER_ROOT . 'cache',
            'cache' => false,
            "auto_reload" => true)
);

$twig->addExtension(new extensiones());
$twig->addExtension(new Twig_Extension_Debug());

//</editor-fold>
//<editor-fold defaultstate="collapsed" desc="autoload">

function __autoload($clase) {
    include_once SERVER_ROOT . "/includes/" . $clase . ".php";
}

spl_autoload_register("__autoload", false);
//</editor-fold>
//<editor-fold defaultstate="collapsed" desc="cerrar sesión">
if (isset($_GET['logout']) && $_GET['logout'] == true) {
    $user_logout = new propietario();
    $user_logout->logout();
}
//</editor-fold>

//$twig->addGlobal("nombre", 'edgar messia');

//https://www.google.com/settings/u/1/security/lesssecureapps
// https://accounts.google.com/DisplayUnlockCaptcha
//https://security.google.com/settings/security/activity?hl=en&pli=1