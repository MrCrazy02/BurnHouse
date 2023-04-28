<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*, model.ProductBean, java.sql.Blob" %>


<%
	// Recupera l'id del prodotto dalla richiesta
	int productId = Integer.parseInt(request.getParameter("id"));

	// Recupera la lista dei prodotti dalla sessione
	Collection<?> products = (Collection<?>) session.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}

	
	
	
	// Cerca il prodotto corrispondente alla lista dei prodotti
	
	Iterator<?> it = products.iterator();
	while (it.hasNext()) {
		ProductBean bean = (ProductBean) it.next();
		if(bean.getCode()==productId){
			%>


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Dettagli prodotto</title>
</head>
<body>
	<h1>Dettagli prodotto</h1>
	<table border="1">
		<tr>
			<th>Codice</th>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Descrizione</th>
			<th>Gradazione</th>
			<th>Tipo</th>
			<th>Immagine</th>
		</tr>
		<tr>
			<td><%=bean.getCode()%></td>
			<td><%=bean.getName()%></td>
			<td>€ <%=bean.getPrice()%></td>
			<td><%=bean.getDescription()%></td>
			<td><%=bean.getDegree()%> °</td>
			<td><%=bean.getType()%></td>
			
			<td><img src="${pageContext.request.contextPath}/Images/<%=bean.getImg() %>" width="100%" height="20%"></td>
		</tr>
		
	</table>
	<br>
	<a href="./product">Torna alla lista dei prodotti</a>
</body>
</html>
<% 
	}
}
%>