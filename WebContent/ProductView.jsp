<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	session.setAttribute("products", products);
	ProductBean product = (ProductBean) request.getAttribute("product");
	
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.ProductBean,java.sql.Blob"%>
<%@ page import="java.io.OutputStream" %>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Catalogo BurnHouse</title>
</head>

<body>
	<h1>Prodotti</h1>
	<ul>
		<li><a href="product?sort=codice">Ordina i prodotti per codice</a></li>
		<li><a href="product?sort=nome">Ordina i prodotti per nome</a></li>
		<li><a href="product?sort=prezzo">Ordina i prodotti per prezzo</a></li>
		<li><a href="Insert.jsp" target="_blank">Aggiungi prodotto al catalogo</a><br></li>
	</ul>
	
	<table border="1">
		<tr>
			<th>Codice</th>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Immagine</th>
			<th>Opzioni</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
					
		%>
		<tr>
			<td><%=bean.getCode()%></td>
			<td><%=bean.getName()%></td>
			<td>€ <%=bean.getPrice()%></td>
			<td><img src="${pageContext.request.contextPath}/Images/<%=bean.getImg() %>" width="100%" height="20%"></td>
			
			<td>
				<a href="Dettagli.jsp?id=<%=bean.getCode()%>" target="_blank">Dettagli</a><br>
				<a href="product?action=delete&id=<%=bean.getCode()%>">Elimina</a><br>
				<a href="Modifica.jsp?id=<%=bean.getCode()%>" target="_blank">Modifica</a><br>
			</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		
		<%
			}
		%>
	</table>
	
</body>
</html>