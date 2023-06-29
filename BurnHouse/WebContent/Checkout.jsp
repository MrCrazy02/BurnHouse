<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<link rel="stylesheet" type="text/css" href="./CSS/CheckoutStile.css">
<script src="./script/jquery-3.5.1.js"></script>
<script src="./script/check.js">
</script>
</head>
<body>
<%@include file="Header.jsp" %>
<h1 id="check">Checkout In corso</h1>
<div id="Checkout">

<div id="Cart">
<h2 class="riepilogo">Riepilogo Carrello</h2>
<% Carrello cart=(Carrello)request.getSession().getAttribute("cart");
for(CartProduct c: cart.GetCart()){
%>
<div class="Cart-Items">
				<div class="image-box">
				<img src="${pageContext.request.contextPath}/Immagini/<%=c.GetImage()%>" alt="<%=c.GetNome() %>" class="cart-img">

				</div>
				<div class="about">
				<h2 class="title"><%=c.GetNome()%></h2>
				<br><h3 class="subtitle"><%=c.getCapacity()%>cl</h3>
				</div>
				<div class="counter">
				<h2>Quantità</h2>
				<div class="count"><%=c.GetQuantita()%></div>
				
				</div>
				<div class="prices">
				<h2>Prezzo</h2> 
				<div class="amount" >€<%=String.format("%.2f", c.GetPrezzo()*c.GetQuantita()) %></div>
				</div>
				
			</div>
			<%} %>
			<hr class="Cart-Line"> 
 				<div class="checkout">
 				<div class="total">
 				<div>
 				<div class="Subtotal">Totale articoli</div>
 				<div class="items">IVA inclusa</div>
 				</div>
 				<div class="total-amount">€<%=String.format("%.2f", cart.TotalAmount()+(cart.TotalAmount()*22)/100) %></div>
 				</div>
 				</div>
</div>


<form action="CheckoutServlet" method="POST" id="checkmate">
<input type="hidden" name="action" value="insert">

<div class="indirizzi">
<h2 class="riepilogo">Scegli l'indirizzo</h2>
<% IndirizzoDAO richiesta=new IndirizzoDAO();
	Collection<?> spedizione=richiesta.DoRetrieveByUser((String)request.getSession().getAttribute("email"));
	if(spedizione==null || spedizione.isEmpty()){%>
	<button><a href="InsIndirizzo.jsp">Inserisci indirizzo di spedizione</a></button>
	<%}else{ 
	Iterator it=spedizione.iterator();
	while(it.hasNext()){
	IndirizzoBean ind=(IndirizzoBean)it.next();%>
	<div class="indirizzo" onclick="checkedind('<%=ind.GetVia()%>')">
	<input type="radio" name="via" value="<%=ind.GetVia() %>" required class="ind"><label for="via" id="rue"><%=ind.GetVia() %><br><%=ind.GetCitta() %></label>
	</div>
	<%}} %>

</div>


<div class="Metodi">
<h2 class="riepilogo">Scegli il metodo di pagamento</h2>
<% PagamentoDAO richiesto=new PagamentoDAO(); 
	Collection<Pagamento> metodi=richiesto.DoRetrieveByUser((String)request.getSession().getAttribute("email"));
	if(metodi==null || metodi.isEmpty()){%>
<button><a href="InsMetodoPag">Inserisci metodo di pagamento</a></button>
<%}else{
	Iterator i=metodi.iterator();
	while(i.hasNext()){
	Pagamento carta=(Pagamento)i.next();%>
	<div class="metodo" onclick="checkedind('<%=carta.GetNum()%>')">
	<input type="radio" name="carta" value="<%=carta.GetNum() %>" required class="pag"><label for="carta"><%=carta.GetNum() %><br><%=carta.GetTitolare() %></label>

	</div>
<%}} %>
</div>
<input type="submit" value="Concludi" id="concludi">
</form>
</div>
<%@include file="Footer.jsp" %>
</body>
</html>