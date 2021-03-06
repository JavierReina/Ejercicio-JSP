<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <title>Análisis de Juegos - Francisco Javier Reina Benítez</title>
  </head>

  <body>
		<div class="container">
			<br><br>			
      <div class="panel panel-primary">
        <div class="panel-heading text-center"><h2>Análisis de Juegos</h2></div>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/analisis","root", "root");
          Statement s = conexion.createStatement();

          ResultSet listado = s.executeQuery ("SELECT * FROM juegos");
        %>

        <table class="table table-striped">
            <tr><th>Código</th><th>Nombre</th><th>Salida</th><th>Nota</th><th>Desarrolladora</th><th>Distribuidora</th></tr>
        <form method="get" action="grabaJuego.jsp">
          <tr><td><input type="text" name="codigo" size="4"></td>
              <td><input type="text" name="nombre" size="15"></td>
              <td><input type="date" name="fchSalida" size="15"></td>
              <td><input type="number" name="nota" size="5"></td>
              <td><input type="text" name="desarrolladora" size="15"></td>
              <td><input type="text" name="distribuidora" size="15"></td>
              <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>           
        </form>
        <%
          while (listado.next()) {
            out.println("<tr><td>");
            out.println(listado.getString("codigo") + "</td>");
            out.println("<td>" + listado.getString("nombre") + "</td>");
            out.println("<td>" + listado.getString("fchSalida") + "</td>");
            out.println("<td>" + listado.getString("nota") + "</td>");
            out.println("<td>" + listado.getString("desarrolladora") + "</td>");
            out.println("<td>" + listado.getString("distribuidora") + "</td>");
        %>
        <td>
        <form method="get" action="modificaJuego.jsp">
					<input type="hidden" name="codigo" value="<%=listado.getString("codigo") %>">
          <input type="hidden" name="nombre" value="<%=listado.getString("nombre") %>">
          <input type="hidden" name="fchSalida" value="<%=listado.getString("fchSalida") %>">
          <input type="hidden" name="nota" value="<%=listado.getString("nota") %>">
          <input type="hidden" name="desarrolladora" value="<%=listado.getString("desarrolladora") %>">
          <input type="hidden" name="distribuidora" value="<%=listado.getString("distribuidora") %>">
					<button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
				</form>
				</td>
				<td>
        <form method="get" action="borraJuego.jsp">
          <input type="hidden" name="codigo" value="<%=listado.getString("codigo") %>"/>
          <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
        </form>
        </td></tr>
        <%
          } // while   

          conexion.close();
        %>

        </table>
      </div>
      <div class="text-center">&copy; Francisco Javier Reina Benítez</div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>