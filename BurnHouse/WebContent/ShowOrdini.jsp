<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.Orderbean, model.ProductBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ordini effettuati</title>
<link rel="stylesheet" type="text/css" href="./CSS/Showorder.css">
</head>

<body>
<%@include file="Header.jsp" %>
<% HashMap<?,?> tutto=(HashMap<?,?>)request.getSession().getAttribute("prodorder");
  Collection<?> ordini=(Collection<?>)request.getSession().getAttribute("ordini");
  
  if((ordini==null || ordini.isEmpty())||(tutto==null || tutto.isEmpty())){%>
	  <img src="./Immagini/bottevuota.jpg" alt="immagine non disponibile" id="vuoto">
	  <h1 id="riempi">La tua botte è vuota</h1>
	  <button id="compra"><a href="ProductView.jsp">Riempila</a></button>
  <%}
  
  else{ %>
  
	<div id="riepilogoordini">
	<% Iterator it=ordini.iterator();
		while(it.hasNext()){
		Orderbean order=(Orderbean)it.next();%>
		<div class="headorder"><span class="acq">Acquirente: <%=request.getSession().getAttribute("nome") %>
			<%=request.getSession().getAttribute("cognome") %></span><h3 class="number">Ordine n.<%=order.GetCode() %>
			<br>
			<a href="Fattura.jsp?data=<%=order.GetDate()%>&nome=<%=request.getSession().getAttribute("nome")%>&cognome=<%=request.getSession().getAttribute("cognome")%>&nOrdine=<%=order.GetCode() %>">Fattura</a>
			</h3>
			<span class="date">Data effettuazione:<br><%=order.GetDate() %></span>
		</div>
		<%Collection<ProductBean> prodorder=(Collection<ProductBean>)tutto.get(order.GetCode()); 
			Iterator<ProductBean> i=prodorder.iterator();
			while(i.hasNext()){
				ProductBean prod=i.next();%>
				<div class="ordercont">
				
				
				
					<a href ="Dettagli.jsp?id=<%=prod.getCode()%>" target="_blank" rel="noopener">
						<img src="${pageContext.request.contextPath}/Immagini/<%=prod.getImg()%>" alt="Immagine non disponibile" class="orderimg">
					</a>
					
					<h3 class="about">
						<a href ="Dettagli.jsp?id=<%=prod.getCode()%>" target="_blank" rel="noopener"><%=prod.getName()%></a>
						<br>
						<%=prod.getCapacity() %>cl
					</h3>
					
					<div class="price">
						Prezzo
						<br>
						€<%=String.format("%.2f", prod.getPrice())%> 
					</div>
				</div>
		  <%}%>
		  
		<div class="order-total">
			Totale ordine<br>
			€<%=String.format("%.2f", order.GetPrice()) %>
		
		</div>
		<%}} %>
	</div>
<footer>
<%@include file="Footer.jsp" %>
</footer>
</body>
</html>
