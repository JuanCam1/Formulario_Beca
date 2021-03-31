<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/mostrar.css">
<title>Lista de Libros</title>
</head>
<body>
<% 
Connection conexion=null;
Statement  sentencia=null;
ResultSet rs=null;
try  {
	
	
		Class.forName("com.mysql.jdbc.Driver");

	conexion = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/formularioBeca", "root",
				"");
	 sentencia= conexion.createStatement();

	 String consultaSQL=  "select fname,fapellido,fecha,sexo,ciudadania,email,direccion1,direccion2,ciudad,region,postal,pais,estado,textareaf,car1,car2,turno,campus,textareal,fileOutput,fileOutput2,textareac from beca";

	 rs=sentencia.executeQuery(consultaSQL);
	 
	 while(rs.next()) { %>
		
		<table class="default">
			<tr>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Fecha</th>
				<th>Sexo</th>
				<th>ciudadania</th>
				<th>Email</th>
				<th>Direccion1</th>
				<th>Direccion2</th>
				<th>Ciudad</th>
				<th>Región</th>
				<th>Postal</th>
				<th>Pais</th>
				<th>Estado</th>
				<th>Facultad</th>
				<th>Carrera1</th>
				<th>carrera2</th>
				<th>Turno</th>
				<th>Campus</th>
				<th>Lista</th>
				<th>Archivo1</th>
				<th>Archivo2</th>
				<th>Contacto</th>
			</tr>
		  
			<tr>
				<td><%=rs.getString("fname")%></td>
				<td><%=rs.getString("fapellido")%></td>
				<td><%=rs.getString("fecha")%></td>
				<td><%=rs.getString("sexo")%></td>
				<td><%=rs.getString("ciudadania")%></td>
				<td><%=rs.getString("email")%></td>
				<td><%=rs.getString("direccion1")%></td>
				<td><%=rs.getString("direccion2")%></td>
				<td><%=rs.getString("ciudad")%></td>
				<td><%=rs.getString("region")%></td>
				<td><%=rs.getString("postal")%></td>
				<td><%=rs.getString("pais")%></td>
				<td><%=rs.getString("estado")%></td>
				<td><%=rs.getString("textareaf")%></td>
				<td><%=rs.getString("car1")%></td>
				<td><%=rs.getString("car2")%></td>
				<td><%=rs.getString("turno")%></td>
				<td><%=rs.getString("campus")%></td>
				<td><%=rs.getString("textareal")%></td>
				<td><%=rs.getString("fileOutput")%></td>
				<td><%=rs.getString("fileOutput2")%></td>
				<td><%=rs.getString("textareac")%></td>
		  	</tr>
		</table>
		<br>
	<% }

}catch (ClassNotFoundException e) {
	
	System.out.println("Error en la carga del driver" 
						+ e.getMessage());
	
}catch (SQLException e) {
	
	System.out.println("Error accediendo a la base de datos" 
						+ e.getMessage());
	
}
 finally {
	

	if (rs != null) {

		try {rs.close();} catch (SQLException e)
		{System.out.println("Error cerrando el resultset" + e.getMessage());}
		
	}
	
	if (sentencia != null) {

		try {sentencia.close();} catch (SQLException e) 
		{System.out.println("Error cerrando la sentencia" + e.getMessage());}
		
	}
	if (conexion != null) {

		try {conexion.close();} catch (SQLException e) 
		{System.out.println("Error cerrando la conexion" + e.getMessage());}
	}
 }
%>
<a href="FormularioBeca.html">Insertar Libro</a>
</body>
</html>