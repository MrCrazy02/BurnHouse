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
    <div class="sinistra">
    	<div class="foto">
    	    <img src="${pageContext.request.contextPath}/Immagini/profilo.png" height="180px">
    	</div>
    	<div class="dettagli">
		    <h3>Nome: <%= session.getAttribute("nome") %></h3>
		    <h3>Cognome: <%= session.getAttribute("cognome") %></h3>
		    <h3>Email: <%= session.getAttribute("email") %></h3>
		    <h3>Data di nascita: <%= session.getAttribute("dataNascita") %></h3>
		    <h3><a href="InsMetodoPag.jsp" class="info">Inserisci metodo di pagamento</a></h3>
		    <a href="InsIndirizzo.jsp" class="info"><h3>Inserisci indirizzo di spedizione</h3></a>
		    <a href="PagamentoControl?action=show" class="info"><h3>Visualizza Metodi di Pagamento</h3></a>
		    <a href="IndirizziServlet?action=show" class="info"><h3>Visualizza Indirizzi di spedizione</h3></a>
    	</div>
    </div>
    
    
    <div class="destra">
    	<div class="ordini">
    		<a href="">RIEPILOGO ORDINI</a>
    	</div>
	  	<div class="exit-button">
  			<a href="LogoutServlet">ESCI</a>
  		</div>
  	</div>
</div>
  

  
</div>

<br>
	<%@ include file="Footer.jsp" %>
</body>
</html>