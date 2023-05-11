<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="Header.jsp" %>
<%@ page import="java.util.*, model.Carrello,model.CartProduct" %>
	<head>
		<meta charset="UTF-8">
		<title>Carrello</title>
		<link rel="stylesheet" type="text/css" href="CarrelloStile.css">	
	</head>
	<body>
		<%Carrello cart=(Carrello)request.getSession().getAttribute("cart"); %>
		<hr>
		<%if(cart==null || cart.GetCart().size()==0) {%>
		<div class="empty-cart">
  <img id="emptyCartImage" src="${pageContext.request.contextPath}/Immagini/emptycart.jpg" alt="immagine non disponibile">
  <p>Attualmente il carrello è vuoto</p><br>
  <div class="button-container">
    <a href="ProductView.jsp" class="button">Aggiungi qualcosa</a>
  </div>
</div>		
		<%}else{ %>
		<br>
		<table border=1>
			<tr>
				<th>Nome</th>
				<th>Prezzo</th>
				<th>Quantita</th>
			</tr>
			<% int i=0;
			while(i<cart.GetCart().size()){
				CartProduct order=cart.GetCart().get(i);%>
			<tr>
				<td><a href ="Dettagli.jsp?id=<%=order.GetCode()%>" target="_blank"><%=order.GetNome()%></a></td>
				<td>€<%=String.format("%.2f", order.GetPrezzo()) %></td>
				<td><%=order.GetQuantita()%>
				<a href="CartController?action=Increment&index=<%=i%>"class="button">+</a>
				<a href="CartController?action=Decrement&index=<%=i%>"class="button">-</a></td>
				<%i++; %>	
			</tr>
			<%} %>
		</table>
		<%}%>
		<footer class="footer">
		<jsp:include page="Footer.jsp" />
		</footer>
		
	</body>
</html>