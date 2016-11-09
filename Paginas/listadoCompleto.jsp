<%@ include file="cabeceraJsp.jsp"%>
<!DOCTYPE html>

<html>
  <head>
    <title>Dispositivos</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Importa los iconos de Materialise -->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <!-- Importa el css de Materialise -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
  </head>
  <body>
    <h1>Lista completa de dipositivos</h1>
    <table border="1">
      <thead>
        <tr>
          <th>ID</th>
          <th>Nombre</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <%
          ResultSet listado = s.executeQuery ("SELECT * FROM socio");

          while (listado.next()) {
            out.println("<tr>");
            out.println("<td>" + listado.getString("socioID") + "</td><td>" 
                          + listado.getString("nombre") + "</td>");
            out.println("</tr>");
          }

          conexion.close(); //Cierra la conexion.
        %>
      </tbody>
    </table>
    <%@include file="footer.jsp" %>
  </body>
</html>