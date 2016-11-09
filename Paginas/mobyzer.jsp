<%@ include file="cabeceraJsp.jsp"%>
<!DOCTYPE html>

<html>
  <head>
    <title>Mobyzer</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Importa los iconos de Materialise -->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <!-- Importa el css de Materialise -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
    <style>
      .formularioAgregar {
        float: left;
        margin-top: 2em;
        margin-left: 2em;
        width: 80%;
        padding-left: 5px;
      }
      
      .formularioAgregar input[type=text] {
        width: 10em;
        font-weight: bold;
        margin-left: 1em;
        
      }
      
      .formularioAgregar input[type=number] {
        -moz-appearance: textfield; 
        width: 4em;
        text-align: center;
      }
      
      .formularioAgregar select {
        border: none;
        border-bottom: 1px solid grey;
        margin-left: 1em;
        width: 17em;
        display: inline;
      }
      
      .formularioAgregar button {
        margin-left: 10px;
        padding: 3px;
        width: 40px;
        height: 40px;
        border-radius: 50px;
      }
      
      .formularioBusqueda {
        font-weight: bold;
        width: 35%;
      }
      
      .formularioBusqueda input {
        margin-left: 70%;
        width: 25%;
      }
      
      .formularioBusqueda button {
        margin-left: 10px;
        padding: 3px;
        width: 40px;
        height: 40px;
        border-radius: 50px;
      }

      .formularioBusqueda {
        z-index: 4;
        width: 100%;
        background: white;
        position: fixed;
        top: 0;
        right: 0;
      }
      
      main {
        margin-top: 10em;
        margin-left: 2em;
        margin: 10em 2em 2em 2em;
      }
      
    </style>
  </head>
  <body>
    <header>
      <h1 style="text-align: center; margin-top: 1.1em; z-index: 5;">Mobile analyzer</h1>
    </header>
      <div class="formularioBusqueda">
        <form action="busquedaResultado.jsp" method="post">
          <input type="text" name="modelo" required="required" placeholder="Escribe el modelo que quieres buscar...">
          <button class="btn waves-effect waves-light" type="submit" name="action">
            <i class="material-icons">search</i>
          </button>
        </form>
      </div>

      <div class="formularioAgregar">      <!-- Elimina las flechas en los formularios (Mirar CSS)-->
        <form action="agregarResultado.jsp" method="post"> <!-- FORMULARIO PARA AGREGAR -->
          <input type="number" name="id" min="0" max="9999" required="required" placeholder="ID" maxlength="2">
          <input type="text" name="modelo" required="required" placeholder="Modelo" maxlength="30">
          <input type="text" name="marca" placeholder="Marca">
          <select name="idCpu">
            <%
              String consulta1 = "";
              consulta1 = "SELECT idCpu, velocidad, tipo "
                       + "FROM PROCESADOR ";

              ResultSet listaCpu = s.executeQuery (consulta1);

              while (listaCpu.next()) {
                out.print("<option value='" + listaCpu.getString("idCpu") +"'>" 
                                            + listaCpu.getString("velocidad") + " - " + listaCpu.getString("tipo") + "</option>");
              }
            %>
          </select>
          <button class="btn waves-effect waves-light" type="submit" name="action">
            <i class="material-icons">add</i>
          </button>
        </form>
      </div>

    <main>
      <table class="striped"> 
        <thead>
          <tr>
            <th>
              <form action="mobyzer.jsp" method="post">
                <input type='hidden' name='columna' value='idDispositivo'>
                <button class="btn waves-effect waves-light" type="submit" name="action">ID</button>
              </form>
            </th>
            <th>
              <form action="mobyzer.jsp" method="post">
                <input type='hidden' name='columna' value='modelo'>
                <button class="btn waves-effect waves-light" type="submit" name="action">Modelo</button>
              </form>
            </th>
            <th>
              <form action="mobyzer.jsp" method="post">
                <input type='hidden' name='columna' value='marca'>
                <button class="btn waves-effect waves-light" type="submit" name="action">Marca</button>
              </form>
            </th>
            <th>
              <form action="mobyzer.jsp" method="post">
                <input type='hidden' name='columna' value='velocidad'>
                <button class="btn waves-effect waves-light" type="submit" name="action">Velocidad</button>
              </form>
            </th>
            <th>Editar</th>
            <th>Borrar</th>
          </tr>
        </thead>
        <tfoot></tfoot>
        <tbody>
          <%
            String consulta2 = "";
            if (request.getParameter("columna") == null) {
              consulta2 = "SELECT d.idDispositivo, d.modelo, d.marca, p.velocidad "
                       + "FROM DISPOSITIVO d LEFT JOIN PROCESADOR p ON d.idCpu = p.idCpu "
                       + "ORDER BY idDispositivo";

            } else {
              consulta2 = "SELECT d.idDispositivo, d.modelo, d.marca, p.velocidad "
                       + "FROM DISPOSITIVO d LEFT JOIN PROCESADOR p ON d.idCpu = p.idCpu "
                       + "ORDER BY " + request.getParameter("columna");
            }


            ResultSet listado = s.executeQuery (consulta2);

            while (listado.next()) {

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

              out.println("<tr>");
                out.println("<td>" + idDispositivo + "</td>"
                        + "<td>" + modelo + "</td>"
                        + "<td>" + marca + "</td>"
                        + "<td>" + velocidad + "</td>");               
          %>
                <form action="editar.jsp" method="post"> <!-- FORMULARIO PARA EDITAR -->
                    <% out.print("<input type='hidden' name='id' value='" 
                                                    + listado.getString("idDispositivo") + "'>"); %>

                    <td>
                      <button class="btn waves-effect waves-light" type="submit" name="action">
                        <i class="material-icons">mode_edit</i>
                      </button>
                    </td>

                </form>
                <form action="borrar.jsp" method="post"> <!-- FORMULARIO PARA BORRAR -->
                    <% out.print("<input type='hidden' name='id' value='" 
                                                    + listado.getString("idDispositivo") + "'>"); %>

                    <td>
                      <button class="btn waves-effect waves-light" type="submit" name="action">
                        <i class="material-icons">delete</i>
                      </button>
                    </td>
                </form>           
              </tr>

          <%
            }

            conexion.close(); //Cierra la conexion.
          %>

        </tbody>
      </table>
    </main>
    <%@include file="footer.jsp" %>
  </body>
</html>
