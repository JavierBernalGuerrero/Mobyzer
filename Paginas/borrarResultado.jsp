<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabeceraJsp.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mobyzer - Baja</title>
    <script>document.location = "mobyzer.jsp"</script>
  </head>
  <body>
    <%
      s.execute ("DELETE FROM DISPOSITIVO WHERE idDispositivo = " + request.getParameter("id"));
    %>
  </body>
</html>