<!-- header.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%Boolean ad = (Boolean)session.getAttribute("adminFilter"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Burn House</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="Header.css">
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
        <%if(ad==null){ %>
           <a href="Access.jsp" class="icon-link">
          <i class="fas fa-user"></i>
             <span>Accedi</span>
          </a>
          <%}else{ %>
          <a href="LogoutServlet" class="icon-link">
            <i class="">fas fa-sign-out-alt</i>
            <span>Logout</span>
         </a>
          <%} %>
          <a href="Carrello.jsp" class="icon-link">
            <i class="fas fa-shopping-cart"></i>
            <span>Carrello</span>
         </a>
          </div>
        </div>
      </header>

    <nav>
      <ul>  
        <li><a href="Azienda.jsp">Azienda</a></li>
        <li><a href="Cantine.jsp">Cantine</a></li>
        <li><a href="ProductView.jsp">Catalogo</a></li>
        <li><a href="Vini.jsp">Vini</a></li>
        <li><a href="Distillati.jsp">Distillati</a></li>
        <li><a href="Liquori.jsp">Liquori</a></li>
        <li><a href="Contatti.jsp">Contatti</a></li>
      </ul>
    </nav>
    
    
    
      
        
      
    </div>
    
    
  </body>
</html>



            



            



            


