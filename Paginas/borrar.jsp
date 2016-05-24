<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabeceraJsp.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mobyzer - Borrado</title>
    <!-- Importa los iconos de Materialise -->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <!-- Importa el css de Materialise -->
    <link type="text/css" rel="stylesheet" href="../css/materialize.min.css" media="screen,projection"/>
    <style>
      button {
        margin-right: 1em;
        width: 10%;
      }
      
      td button:first-child {
        margin-left: 40%;
      }
      
      #confirmacion i {
        margin-left: 37%;
      }
      
      input[type=number] {
        -moz-appearance: textfield;
      }
    </style>
  </head>
  <body>
    <h1 style="text-align: center;">Mobile analyzer</h1>
    
    <%
      ResultSet listado = s.executeQuery ("SELECT * "
                                        + "FROM DISPOSITIVO d LEFT JOIN PROCESADOR p ON d.idCpu = p.idCpu "
                                        + "WHERE idDispositivo =" + request.getParameter("id"));
    %>
    <div>
      <form action="borrarResultado.jsp" method="post"> <!-- FORMULARIO PARA BORRAR -->
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Modelo</th>
              <th>Marca</th>
              <th>Velocidad</th>
            </tr>
          </thead>
          <tfoot></tfoot>
          <tbody>
            <tr>
              <td>
                
              <%
                listado.first();
                  String idDispositivo = listado.getString("idDispositivo");
                  if (listado.getString("idDispositivo") == null) {
                    idDispositivo = "";

                  }

                  String modelo = listado.getString("modelo");
                  if (listado.getString("modelo") == null) {
                    modelo = "";

                  }

                  String marca = listado.getString("marca");
                  if (listado.getString("marca") == null) {
                    marca = "";

                  }

                  String velocidad = listado.getString("velocidad");
                  if (listado.getString("velocidad") == null) {
                    velocidad = "";

                  }
                  
                  // El primer valor es invisible, lo vamos a utilizar para pasar el valor.
                  out.print("<input type='hidden' name='id' value='" 
                                                        + idDispositivo + "'>");
                  out.print("<input type='number' readonly='readonly'value='"
                                                        + idDispositivo + "'></td>"); 
                  out.print("<td><input type='text' readonly='readonly' name='modelo' value='" 
                                                        + modelo + "'></td>");
                  out.print("<td><input type='text' readonly='readonly' name='marca' value='" 
                                                        + marca + "'></td>");
                  out.print("<td><input type='text' readonly='readonly' name='velocidad' value='" 
                                                        + velocidad + "'>");

                conexion.close();
              %>
              </td>
            </tr>
            <tr>
              <td id="confirmacion" colspan="4">
                <i>¿Estas seguro de que quieres borrar el dispositivo?</i>
              </td>
            </tr>
            <tr>
              <td colspan="4" style="text-align: center;">
                <button class="btn waves-effect waves-light red" formaction="mobyzer.jsp" style="float: left;">
                  <i class="material-icons">thumb_down</i>
                </button>
                <button class="btn waves-effect waves-light" type="submit" name="action" style="float: left;">
                  <i class="material-icons">thumb_up</i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  </body>
</html>
