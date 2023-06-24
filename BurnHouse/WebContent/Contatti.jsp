<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Burn House</title>
      <link rel="stylesheet" type="text/css" href="./CSS/Contatti.css">
   </head>

   <body>
   <jsp:include page = "Header.jsp"/>

   <div id="titolo-container">
            <h1 id="titolo">CONTATTI</h1>
            <div id="linea"></div>
    </div>
    
    <div id = "prova-body">
    
 
   
   
   
   <div class="google-maps">
   <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.263688953738!2d14.685748276465294!3d40.756224734906276!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bc73de72ba9f1%3A0x149a6903fe2a0f02!2sVia%20Crocevia%2C%2019%2C%2084086%20Roccapiemonte%20SA!5e0!3m2!1sit!2sit!4v1687627585137!5m2!1sit!2sit" width="400" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
   </div>
   
   
    <div class="contact-info">
    <span class="contact-name">Email: </span> info@example.com
  </div>

  <div class="contact-info">
    
    <span class="contact-name">Telefono: </span> +1 234 567 890
  </div>

  <div class="contact-info">
    <span class="contact-name">Indirizzo: </span> Via del Corso, 12345, Città
  </div>
   
</div>
   

   <jsp:include page = "Footer.jsp"/>
   </body>
</html>