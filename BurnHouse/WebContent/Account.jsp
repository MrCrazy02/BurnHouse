<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
	<%@ include file="Header.jsp" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./CSS/AccountStile.css">

</head>
<body>
<br>
<div class="corpo">
  <div class="account-details">
    <h1>DETTAGLI ACCOUNT</h1>
    <br>
    	<div class="foto">
    	    <img src="${pageContext.request.contextPath}/Immagini/profilo.png" height="180px">
    	</div>
    <div class="dettagli">
    <h3>Nome: John Doe</h3>
    <h3>Cognome: John Doe</h3>
    <h3>Email: johndoe@example.com</h3>
    <h3>Data di nascita: johndoe@example.com</h3>
    </div>
	  <div class="exit-button">
  	<a href="LogoutServlet">ESCI</a>
  </div>


  </div>
  

  
</div>

<br>
	<%@ include file="Footer.jsp" %>
</body>
</html>