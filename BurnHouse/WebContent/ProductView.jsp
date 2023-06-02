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
	
	
	Boolean isAdmin = (Boolean)session.getAttribute("adminFilter");
	Boolean isUser = (Boolean) session.getAttribute("userFilter");
	boolean isLoggedUser = isUser != null && isUser.booleanValue();
	boolean isLoggedAdmin = isAdmin != null && isAdmin.booleanValue();
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.ProductBean"%>
<%@ page import="java.io.OutputStream" %>
<%@ include file="Header.jsp" %>
<hr>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Catalogo BurnHouse</title>
	<%if(isAdmin!=null && isAdmin!=false){ %>
	<link rel="stylesheet" type="text/css" href="./CSS/CatalogoStileAdmin.css">	
	<% } else {%>
	<link rel="stylesheet" type="text/css" href="./CSS/CatalogoStileUser.css">
	<% } %>
</head>

<body>
	<ul>
		<li><a href="product?sort=codice">Ordina i prodotti per codice</a></li>
		<li><a href="product?sort=nome">Ordina i prodotti per nome</a></li>
		<li><a href="product?sort=prezzo">Ordina i prodotti per prezzo</a></li>
		<%if(isAdmin!=null && isAdmin!=false){ %>
		<li><a href="Insert.jsp" target="_blank" rel="noopener">Aggiungi prodotto al catalogo</a><br></li>
		<%} %>  
	</ul>
	
		<form method="post" action="product">
				<input type="hidden" name="action" value="filter">
			 	<label for="minGradazione">Gradazione minima:</label>
			  	<input type="text" name="minGradazione" pattern="[0-9]+" required>
			  	<label for="maxGradazione">Gradazione massima:</label>
			  	<input type="text" name="maxGradazione" pattern="[0-9]+" required>
			  	<button type="submit">Filtra</button>	  	
		</form>
		
		

		<%
		
		
		if(request.getAttribute("filteredProducts") != null){
			Collection<?> filteredProducts = (Collection<?>) request.getAttribute("filteredProducts");
			session.setAttribute("filteredProducts", filteredProducts);
			response.sendRedirect("Filtro.jsp");
		}
		
	
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
					
		%>
		  
<div class="card-container">
	<div class="card">
			<div class="imgBox">
				<a href="Dettagli.jsp?id=<%=bean.getCode()%>" target="_blank" rel="noopener">
			    <img src="${pageContext.request.contextPath}/Immagini/<%=bean.getImg()%>" alt="<%=bean.getName() %>" class="product">
			    </a>
			</div>	
		<div class="contentBox">
			   <h3><%=bean.getName() %></h3>
			   <h2 class="price"><%=String.format("%.2f", bean.getPrice()) %> €</h2>
			  
			   <a href="CartController?action=addCart&id=<%=bean.getCode()%>" class="buy">Aggiungi al carrello</a>
			 
	  	</div>
	  		<div class="buttons">
			     	<%if(isAdmin!=null && isAdmin!=false){ %>
				  	<a href="product?action=delete&id=<%=bean.getCode()%>">Elimina</a><br>
				  	<a href="Modifica.jsp?id=<%=bean.getCode()%>" target="_blank" rel="noopener">Modifica</a><br>
				  	<%} %>  
			</div>

	</div>
</div>



  	

		
		<%
				}
			} 
			else{
				 %>
				 
				<h1>Catalogo momentaneamente non disponibile</h1> 
				
				 <%
			}
		%>
	<jsp:include page="Footer.jsp" />
</body>
</html>