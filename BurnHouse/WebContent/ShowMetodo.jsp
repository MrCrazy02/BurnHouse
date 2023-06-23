<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.Pagamento"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pagamenti</title>
<link rel="stylesheet" type="text/css" href="./CSS/showindirizzi.css">
</head>
<body>
<%@include file="Header.jsp" %>
<% 
	Collection<?> metodi=(Collection<?>)request.getSession().getAttribute("metodi"); 
	
	if(metodi.isEmpty()||metodi.equals(null)){
		RequestDispatcher disp=getServletContext().getRequestDispatcher("/InsMetodoPag.jsp");
		disp.forward(request, response);
	}%>
<div id="indcontainer">


<% Iterator it=metodi.iterator();
while(it.hasNext()){ 
Pagamento ind=(Pagamento)it.next();%>
<div class="table">
<div class="tablerow"><%=request.getSession().getAttribute("nome") %> <%=request.getSession().getAttribute("cognome") %></div>
<div class="cellind">Numero carta: <%=ind.GetNum() %></div>
<div class="cellind">Titolare Conto: <%=ind.GetTitolare() %></div>
<div class="cellind">Scadenza carta: <%=ind.GetScadenza() %></div>
<div class="cellind"><a href="PagamentoControl?action=delete&num_carta=<%=ind.GetNum() %>" class="indlink">Rimuovi</a>
</div>
</div>
<%} %>

</div>
<footer id="footer">
<%@include file="Footer.jsp"%>
</footer>

</body>

</html>