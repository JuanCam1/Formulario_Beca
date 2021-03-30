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

	 String consultaSQL=  "select fname,lname,fecha,sexo,ciudadania,email,direccion1,direccion2,ciudad,region,postal,pais,estado,
	 textareaf,car1,car2,turno,campus,textareal,archivo1,archivo2,textareac from beca";

	 rs=sentencia.executeQuery(consultaSQL);
	 
	 while(rs.next()) { %>
	 
		<%=rs.getString("fname")%>
		<%=rs.getString("lname")%>
		<%=rs.getString("fecha")%>
		<%=rs.getString("sexo")%>
		<%=rs.getString("ciudadania")%>
		<%=rs.getString("email")%>
		<%=rs.getString("direccion1")%>
		<%=rs.getString("direccion2")%>
		<%=rs.getString("ciudad")%>
		<%=rs.getString("region")%>
		<%=rs.getString("postal")%>
		<%=rs.getString("pais")%>
		<%=rs.getString("estado")%>
		<%=rs.getString("textareaf")%>
		<%=rs.getString("car1")%>
		<%=rs.getString("car2")%>
		<%=rs.getString("turno")%>
		<%=rs.getString("campus")%>
		<%=rs.getString("textareal")%>
		<%=rs.getString("archivo1")%>
		<%=rs.getString("archivo2")%>
		<%=rs.getString("textareac")%>

		<br/>
	 
	 
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