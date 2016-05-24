<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabeceraJsp.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mobyzer - Busqueda</title>
    
  </head>
  <body>
    <%
      String consulta = "SELECT * FROM USUARIO WHERE usuario LIKE '" +
              request.getParameter("usuario") + "'";
      
      ResultSet listado = s.executeQuery (consulta);
      
      while (listado.next()) {
        if (request.getParameter("usuario").equals(listado.getString("usuario"))
                && request.getParameter("contrasena").equals(listado.getString("contraseña"))) {
          out.print("<script>document.location = \"mobyzer.jsp\"</script>");
        }
      }
      
      out.print("<script>document.location = \"loginFallido.jsp\"</script>");
        
      conexion.close(); //Cierra la conexion.
    %>
  </body>
</html>
