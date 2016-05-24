<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobyzer",
                                                      "root", "root");
  Statement s = conexion.createStatement();
%>