<!-- header.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Boolean ad = (Boolean)session.getAttribute("adminFilter"); 
	Boolean us = (Boolean)session.getAttribute("userFilter");	
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Burn House</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"/>

    <link rel="stylesheet" type="text/css" href="./CSS/Header.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
  </head> 

  <body>
      <div class= "linea">
      <h2>Consegna in Italia in 1 - 3 giorni lavorativi | gratuita oltre i 49,90€ </h2>
      </div>

      <header>
        <div id="zonaleft">
        <a href="Home.jsp">

          <img id="headerLogo"src="Immagini/logop.png" alt="Burn House header logo image">
        </a>
        </div>
  
        <div id="zonacenter">
          <form action="#" method="get">
            <input id="search-box-input" type="search" name="search" maxlength="255" placeholder="Cosa stai cercando ?" autocomplete="off">
          </form>
          <div>
          </div>
        
        </div>
  
        <div id="zonaright">
           <div class="header-icons">
        <%if((ad==null || ad==false) && (us==null || us==false)){ %>
           <a href="Access.jsp" class="icon-link">
          <i class="fas fa-user"></i>
             <span>Accedi</span>
          </a>
          <%}else{ %>
          <a href="Account.jsp" class="icon-link">
            <i class="fas fa-user"></i>
            <span>Account</span>
         </a>
          <%} %>
          <a href="Carrello.jsp" class="icon-link">
            <i class="fas fa-shopping-cart"></i>
            <span>Carrello</span>
         </a>
          </div>
        </div>
      </header>

    <nav class="menu">
  <ul class="menu__list">
    <li class="menu__item"><a href="Azienda.jsp" class="menu__link">Azienda</a></li>
    <li class="menu__item"><a href="Cantine.jsp" class="menu__link">Cantine</a></li>
    <li class="menu__item"><a href="ProductView.jsp" class="menu__link">Catalogo</a></li>
    <li class="menu__item"><a href="Vini.jsp" class="menu__link">Vini</a></li>
    <li class="menu__item"><a href="Distillati.jsp" class="menu__link">Distillati</a></li>
    <li class="menu__item"><a href="Liquori.jsp" class="menu__link">Liquori</a></li>
    <li class="menu__item"><a href="Contatti.jsp" class="menu__link">Contatti</a></li>
  </ul>
</nav>

    
    
    
  </body>
</html>



            



            



            




            


