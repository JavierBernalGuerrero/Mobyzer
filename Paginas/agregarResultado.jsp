<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabeceraJsp.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mobyzer - Alta</title>
    
  </head>
  <body>
    <%
      request.setCharacterEncoding("UTF-8"); // CODIFICA LAS PETICIONES RECIBIDAS EN UTF-8
      
      String confirmaCodigo = "SELECT idDispositivo "
                            + "FROM DISPOSITIVO "
                            + "WHERE idDispositivo = " + request.getParameter("id") + "";

      ResultSet resultadoCodigo = s.executeQuery (confirmaCodigo);
      
      if (resultadoCodigo.next()) {
        out.print("<script>document.location = \"mobyzerError.jsp\"</script>");
        
      } else {
        
        String confirmaNombre = "SELECT modelo "
                              + "FROM DISPOSITIVO "
                              + "WHERE modelo LIKE '" + request.getParameter("modelo") + "'";

        ResultSet resultadoNombre = s.executeQuery (confirmaNombre);
      
        if (resultadoNombre.next()) { //COMPRUEBA SI EL NOMBRE YA EXISTE
          out.print("<script>document.location = \"mobyzerError.jsp\"</script>");

        } else {
          String insert = "INSERT DISPOSITIVO (idDispositivo, modelo, marca, idCpu) VALUES ("
                  + Integer.valueOf(request.getParameter("id"))
                  + ", '" + request.getParameter("modelo")
                  + "', '" + request.getParameter("marca") 
                  + "', " + Integer.valueOf(request.getParameter("idCpu")) + ")";

          s.execute(insert);
          out.print("<script>document.location = \"mobyzer.jsp\"</script>");
          
        }
      }
    %>
  </body>
</html>