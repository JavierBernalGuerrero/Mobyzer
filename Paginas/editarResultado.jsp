<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabeceraJsp.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mobyzer - Modificacion</title>
    <script>document.location = "mobyzer.jsp"</script>
  </head>
  <body>
    <%
      request.setCharacterEncoding("UTF-8"); // CODIFICA LAS PETICIONES RECIBIDAS EN UTF-8
      
      String update = "UPDATE DISPOSITIVO SET "
              + "modelo='" + request.getParameter("modelo")
              + "', marca='" + request.getParameter("marca")
              + "', idCpu=" + request.getParameter("idCpu")
              + " WHERE idDispositivo = " + Integer.valueOf(request.getParameter("id"));
      
      s.execute(update);
    %>
  </body>
</html>