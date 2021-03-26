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
	String fecha= request.getParameter("fecha");




	String email = request.getParameter("email");
	
	String opcion1=null;
	if (request.getParameter("opcion1")!=null);{
	opcion1=request.getParameter("opcion1");
		}
	String opcion2=null;
	if (request.getParameter("opcion2")!=null);{
	opcion2=request.getParameter("opcion2");
		}
	Connection conexion = null;
	Statement sentencia = null;
	
	int filas=0;
	try {

		Class.forName("com.mysql.jdbc.Driver");

	conexion = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/prueba2", "root",
				"");

		sentencia = conexion.createStatement();

		String consultaSQL = "insert into for1 (fname,lname,gender,email,opcion1,opcion2) values ";
		consultaSQL += "('" + fname + "','" + lname + "','" + gender + "','" + email + "','" + opcion1 + "','" + opcion2 + "')";

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
