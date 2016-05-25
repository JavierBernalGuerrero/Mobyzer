<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabeceraJsp.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mobyzer - Editado</title>
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
      
      .celda {
        padding-top: 0;
      }
      
      select {
        border: none;
        padding-top: 0;
        border-bottom: 1px solid grey;
        display: inline;
      }
    </style>
  </head>
  <body>
    <h1 style="text-align: center;">Mobile analyzer</h1>
    
    <%
      ResultSet confirmacion = s.executeQuery ("SELECT * "
                                        + "FROM DISPOSITIVO d LEFT JOIN PROCESADOR p ON d.idCpu = p.idCpu "
                                        + "WHERE d.modelo LIKE '%" + request.getParameter("modelo") + "%'");
      
      if (!confirmacion.next()) {
        out.print("<script>document.location = \"mobyzerError.jsp\"</script>");
      } else {
        ResultSet listado = s.executeQuery ("SELECT * "
                                          + "FROM DISPOSITIVO d LEFT JOIN PROCESADOR p ON d.idCpu = p.idCpu "
                                          + "WHERE d.modelo LIKE '%" + request.getParameter("modelo") + "%'"); 
      
        %>
        <div>
          <form action="editarResultado.jsp" method="post"> <!-- FORMULARIO PARA EDITAR -->
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

                      out.print("<input type='hidden' name='id' value='"
                                                          + idDispositivo + "'>");
                      out.print("<input type='text' disabled='disabled' value='" 
                                                          + idDispositivo + "'></td>");
                      out.print("<td><input type='text' required='required' name='modelo' value='" 
                                                          + modelo + "'></td>");
                      out.print("<td><input type='text' name='marca' value='" 
                                                          + marca + "'></td>");

                      out.print("<td class='celda'><select name='idCpu'>");
                        String consulta1 = "";
                        consulta1 = "SELECT idCpu, velocidad "
                                  + "FROM PROCESADOR ";

                        ResultSet listaCpu = s.executeQuery (consulta1);

                        out.print("<option selected='selected' disabled='disabled'>" + velocidad + "</option>");

                        while (listaCpu.next()) {
                          out.print("<option value='" + listaCpu.getString("idCpu") +"'>" 
                                                      + listaCpu.getString("velocidad") + "</option>");
                        }
                      out.print("</select></td>");

                    conexion.close();
      }        
                  %>
              </td>
            </tr>
            <tr>
              <td colspan="4">
                <button class="btn waves-effect waves-light red" formaction="mobyzer.jsp" type="submit" name="action">
                  <i class="material-icons">not_interested</i>
                </button>
                <button class="btn waves-effect waves-light" type="submit" name="action">
                  <i class="material-icons">done</i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  </body>
</html>

