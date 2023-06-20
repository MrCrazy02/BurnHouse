<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*, model.ProductBean" %>
<% 
	Boolean isAdmin = (Boolean) session.getAttribute("adminFilter");
	Boolean isUser = (Boolean) session.getAttribute("userFilter");
	boolean isLoggedUser = isUser != null && isUser.booleanValue();
	boolean isLoggedAdmin = isAdmin != null && isAdmin.booleanValue();
%>

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
<%@ include file="Header.jsp" %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><%=bean.getName()%></title>
	<link rel="stylesheet" type="text/css" href="./CSS/DettagliStile.css">
</head>
<body>
	
  <main class="container">
 
  <!-- Left Column / Headphones Image -->
  <div class="left-column">
    <img src="${pageContext.request.contextPath}/Immagini/<%=bean.getImg() %>" alt="<%=bean.getName() %>" style="width:100%">
  </div>
 
 
  <!-- Right Column -->
  <div class="right-column">
 
    <!-- Product Description -->
    <div class="product-description">
      <span><%=bean.getType()%></span>
      <span><%=bean.getDegree()%>% vol. alcol</span>
      <span>Capienza: <%=bean.getCapacity()%> cl</span>
      <h1><%=bean.getName()%></h1>
      <p><%=bean.getDescription()%></p>
   </div>
 


 
    <!-- Product Pricing -->
    <div class="product-price">
      <span><%=String.format("%.2f", bean.getPrice()) %>€</span>
   
      	<a href="CartController?action=addCart&id=<%=bean.getCode()%>" class="cart-btn">Aggiungi al carrello</a>

    </div>
  </div>
</main>
	
	      <% 
	}
}
%>


 <!-- prova -->
 <!-- TESTIMONIALS -->
	<!-- linea 3 -->
<!-- Testimonial -->
<div class="title-container">
            <h1 class="title">RECENSIONI</h1>
            <div class="line"></div>
          </div>
<div class = "comment-session">
   <div class= "post-comment">
      <div class= "list">
         <div class="user">
          <div class="user-image"><img src="${pageContext.request.contextPath}/Immagini/banner_distillati.jpg" alt="image"></div>
          <div class="user-meta">
             <div class="name">Gianluca</div>
             <div class="day">10 days ago</div>
          </div>
      </div>
      <div class="comment-post">hello commenti poveri</div>
   </div>  
   
   <div class= "list">
         <div class="user">
          <div class="user-image"><img src="${pageContext.request.contextPath}/Immagini/banner_distillati.jpg" alt="image"></div>
          <div class="user-meta">
             <div class="name">Gianluca</div>
             <div class="day">10 days ago</div>
          </div>
      </div>
      <div class="comment-post">hello commenti poveri</div>
   </div>  
   
   <div class= "list">
         <div class="user">
          <div class="user-image"><img src="${pageContext.request.contextPath}/Immagini/banner_distillati.jpg" alt="image"></div>
          <div class="user-meta">
             <div class="name">Gianluca</div>
             <div class="day">10 days ago</div>
          </div>
      </div>
      <div class="comment-post">hello commenti poveri</div>
   </div>  
</div>
 
 
  <div class="comment-box">
     <div class="user">
        <div class="image"><img src="${pageContext.request.contextPath}/Immagini/vini.jpg" alt="image"></div>
        <div class ="name">Gianluca</div>
     </div>
     <form action="" method="post">
        <textarea name="comment" placeholder="Your Massege"></textarea>
        <button class="comment-submit">Comment</button>
     </form>
</div>
</div>


</body>
		<jsp:include page="Footer.jsp" />
</html>
	