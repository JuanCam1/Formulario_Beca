<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  sentencias de import necesarias para jdbc-->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
	
// recojo los datos del formulario 

	String fname = request.getParameter("fname");
	String fapellido = request.getParameter("fapellido");
	String fecha = request.getParameter("fecha");
	
	String sexo = null;
	sexo = request.getParameter("sex");
	String ciudadania = request.getParameter("ciud");
	String email = request.getParameter("email");
	String direccion1 = request.getParameter("direc");
	String direccion2 = request.getParameter("direc2");
	String ciudad = request.getParameter("ciudad");
	String region = request.getParameter("region");
	String postal = request.getParameter("postal");

	String pais = request.getParameter("paises");
	String estado = request.getParameter("estado");
	String textareaf = request.getParameter("facul");
	String car1 = request.getParameter("car1");
	String car2 = request.getParameter("car2");

	String turno = null;
	turno=request.getParameter("turno");
	String campus = request.getParameter("campus");
	String textareal = request.getParameter("lista");
	String archivo1=request.getParameter("archivo1");
	String archivo2=request.getParameter("archivo2");
	String textareac = request.getParameter("contac");

	Connection conexion = null;
	Statement sentencia = null;
	
	int filas=0;
	try {

		Class.forName("com.mysql.jdbc.Driver");

	conexion = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/formularioBeca", "root",
				"");

		sentencia = conexion.createStatement();

		String consultaSQL = "insert into beca (fname,lname,fecha,sexo,ciudadania,email,direccion1,direccion2,ciudad,region,postal,pais,estado,textareaf,car1,car2,turno,campus,textareal,archivo1,archivo2,textareac) values ";
		consultaSQL += "('" + fname + "','" + lname + "','" + fecha + "','" + sexo + "','" + ciudadania + "','" + email + "','" + direccion1 +"','" + direccion2 +"','" + ciudad +"','" + region +"','" + postal +"','" + pais +
		"','" + estado +"','" + textareaf +"','" + car1 +"','" + car2 +"','" + turno +"','" + campus +"','" + textareal +"','" + archivo1 +"','" + archivo2 +"','" + textareac + "')";

		 filas = sentencia.executeUpdate(consultaSQL);
		 
		 response.sendRedirect("MostrarLibros.jsp");

	} catch (ClassNotFoundException e) {

		System.out.println("Error en la carga del driver"
				+ e.getMessage());

	} catch (SQLException e) {

		System.out.println("Error accediendo a la base de datos"
				+ e.getMessage());

	} finally {

		if (sentencia != null) {

			try {sentencia.close();} 
			catch (SQLException e) 
			{System.out.println("Error cerrando la sentencia" +
					e.getMessage());}
			
		}
		if (conexion != null) {

			try {conexion.close();}
			catch (SQLException e) 
			{System.out.println("Error cerrando la conexion" +
					e.getMessage());}
		}
	}
%>
