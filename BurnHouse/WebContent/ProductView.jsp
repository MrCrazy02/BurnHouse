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
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.ProductBean"%>


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Catalogo BurnHouse</title>
	
	<link rel="stylesheet" type="text/css" href="Stile.css">
	
</head>

<body>
	<h1>Prodotti</h1>
	<ul>
		<li><a href="product?sort=codice">Ordina i prodotti per codice</a></li>
		<li><a href="product?sort=nome">Ordina i prodotti per nome</a></li>
		<li><a href="product?sort=prezzo">Ordina i prodotti per prezzo</a></li>
		<li><a href="Insert.jsp" target="_blank">Aggiungi prodotto al catalogo</a><br></li>
	</ul>
	
	
	
	

		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
					
		%>
		  
<div class="card">
	<div class="img-container">
		<a href="Dettagli.jsp?id=<%=bean.getCode()%>" target="_blank">
  		<img src="${pageContext.request.contextPath}/Images/<%=bean.getImg() %>" alt="<%=bean.getName() %>" style="width:100%"></a>
 			<div class="btn-container">
  				 <a href="CartController?action=addCart&id=<%=bean.getCode()%>"><button class="btn" >Aggiungi al carrello</button></a>
  			</div>
  	</div>
  <hr> <!-- Aggiungi una linea orizzontale come divisore -->
  	<div class="product-info"> <!-- crea un div per il nome e il prezzo del prodotto -->
    	<h4><%=bean.getName() %></h4>
   		<div><p class="price">€<%=String.format("%.2f", bean.getPrice()) %></p></div>  
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
	
</body>
</html>