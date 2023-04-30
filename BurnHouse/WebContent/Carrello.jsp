<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import="java.util.ArrayList, model.Carrello,model.CartProduct" %>
<head>
<meta charset="UTF-8">
<title>Carrello</title>
</head>
<body>
<%Carrello cart=(Carrello)request.getSession().getAttribute("cart"); %>
<center><h1>Carrello Utente</h1></center>
<br>
<table border=1>
<tr>
<th>Nome</th>
<th>Prezzo</th>
<th>Quantita</th>
</tr>
<% int i=0;
while(!cart.GetCart().isEmpty()){
	CartProduct order=cart.GetCart().get(i);%>
<tr>
<td><%=order.GetNome() %></td>
<td><%=order.GetPrezzo()%></td>
<td><%=order.GetQuantita()%><a href="/CartController?action=Increment&index=<%=i%>">+</a>
<br><a href="/CartController?action=Decrement&index=<%=i%>">-</td>	
</tr>
<%} %>
</table>

</body>
</html>