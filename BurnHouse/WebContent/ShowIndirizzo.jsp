<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.IndirizzoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indirizzi Utente</title>
<link rel="stylesheet" type="text/css" href="./CSS/showindirizzi.css">
</head>
<body>
<%@include file="Header.jsp" %>
<% 
	Collection<?> indirizzi=(Collection<?>)request.getSession().getAttribute("spedizioni"); 
	
	if(indirizzi.isEmpty()||indirizzi.equals(null)){
		RequestDispatcher disp=getServletContext().getRequestDispatcher("/InsIndirizzo.jsp");
		disp.forward(request, response);
	}%>
<div id="indcontainer">


<% Iterator it=indirizzi.iterator();
while(it.hasNext()){ 
IndirizzoBean ind=(IndirizzoBean)it.next();%>
<div class="table">
<div class="tablerow"><%=request.getSession().getAttribute("nome") %> <%=request.getSession().getAttribute("cognome") %></div>
<div class="cellind"><%=ind.GetVia() %></div>
<div class="cellind"><%=ind.GetCap() %></div>
<div class="cellind"><%=ind.GetCitta() %></div>
<div class="cellind"><a href="IndirizziServlet?action=delete&via=<%=ind.GetVia() %>&cap=<%=ind.GetCap() %>&citta=<%=ind.GetCitta()%>" class="indlink">Rimuovi</a>
</div>
</div>
<%} %>

</div>
<footer id="footer">
<%@include file="Footer.jsp"%>
</footer>

</body>

</html>