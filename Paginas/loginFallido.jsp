<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabeceraJsp.jsp" %>

<html>
  <head>
    <title>Mobyzer</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Importa los iconos de Materialise -->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <!-- Importa el css de Materialise -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
    <style>
      h4 {
        text-align: center;
      }
      
      form {
        font-weight: bold;
        font-size: 2em;
      }
      
      body div form div#usuario div {
        margin-left: 25%;
        width: 50%;
      }
      
      button {
        margin-left: 43%;
      }
    </style>
  </head>
  <body>
    <h4>LOGIN</h4>
    <div class="row">
      <form class="col s12" action="login.jsp" method="post">
        <div id="usuario" class="row">
          <div class="input-field col s6">
            <i class="material-icons prefix">account_circle</i>
            <input placeholder="Usuario" type="text" class="validate" name="usuario" required="required">
          </div>
          <div class="input-field col s6">
            <i class="material-icons prefix">vpn_key</i>
            <input placeholder="Contraseña" type="password" class="validate" name="contrasena" required="required">
          </div>
        </div>
        <button class="btn waves-effect waves-light" type="submit" name="action">Entrar</button>
      </form>
    </div>
    <h4 style="font-size: 20px; color: red;">
      Error durante la autentificación. Por favor vuelva a intentarlo.
    </h4>
  </body>
</html>