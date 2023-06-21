<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>


<html>
<head>
    <title>About Us</title>
    
    
    
  <link rel="stylesheet" type="text/css" href="./CSS/Azienda.css">
  
   
</head>
<body>
<jsp:include page="Header.jsp" />




    <div class="title-container">
            <h1 class="title">L'AZIENDA</h1>
            <div class="line"></div>
    </div>
    
    <div id = "abpage-body">

 <section class="abhero">
    
    <div class="abcontainer">
       <div class="abhero-content">
          <h2>La nostra storia</h2>
          <p>
             Tutelare e valorizzare le antiche tradizioni, con il sapiente uso dei frutti della propria terra.
             Con questo spirito, quasi cent’anni fa, la famiglia Rau crea il primo laboratorio artigianale per la preparazione di 
             liquori tipici: è l’inizio di una grande storia, che dura sino ai nostri giorni. 

             Quella dell'azienda dei Fratelli RAU è una storia e una tradizione familiare cominciata nel 1926; da allora tre 
             generazioni si sono succedute alla guida, dando vita a un'azienda moderna che oggi può contare sulle più avanzate 
             tecnologie, pur conservando con orgoglio la passione per la genuinità e uno stretto legame con la propria terra per 
             la preparazione di liquori, vini e dolci tipici sardi.
          </p>
          <button class="abcta-button">Learn More</button>
       </div>
       <div class="abhero-image">
           <img class="abimg" src="${pageContext.request.contextPath}/Immagini/fondatore.jpg" alt="whisky">
       </div>
    </div>
 </section>


 
 
 
  <section class="abhero">
    
    
    <div class="abcontainer">
    
    <div class="abhero-image">
        <img class="abimg" src="${pageContext.request.contextPath}/Immagini/produzione.jpg" alt="whisky">
    </div>
       <div class="abhero-content">
          <h2>La nostra storia</h2>
          <p>
             Tutelare e valorizzare le antiche tradizioni, con il sapiente uso dei frutti della propria terra.
             Con questo spirito, quasi cent’anni fa, la famiglia Rau crea il primo laboratorio artigianale per la preparazione di 
             liquori tipici: è l’inizio di una grande storia, che dura sino ai nostri giorni. 

             Quella dell'azienda dei Fratelli RAU è una storia e una tradizione familiare cominciata nel 1926; da allora tre 
             generazioni si sono succedute alla guida, dando vita a un'azienda moderna che oggi può contare sulle più avanzate 
             tecnologie, pur conservando con orgoglio la passione per la genuinità e uno stretto legame con la propria terra per 
             la preparazione di liquori, vini e dolci tipici sardi.
          </p>
          <button class="abcta-button">Learn More</button>
       </div>
       
    </div>
 </section>
 
 
 <section class="abhero">
    
    
    <div class="abcontainer">
       <div class="abhero-content">
          <h2>La nostra storia</h2>
          <p>
             Tutelare e valorizzare le antiche tradizioni, con il sapiente uso dei frutti della propria terra.
             Con questo spirito, quasi cent’anni fa, la famiglia Rau crea il primo laboratorio artigianale per la preparazione di 
             liquori tipici: è l’inizio di una grande storia, che dura sino ai nostri giorni. 

             Quella dell'azienda dei Fratelli RAU è una storia e una tradizione familiare cominciata nel 1926; da allora tre 
             generazioni si sono succedute alla guida, dando vita a un'azienda moderna che oggi può contare sulle più avanzate 
             tecnologie, pur conservando con orgoglio la passione per la genuinità e uno stretto legame con la propria terra per 
             la preparazione di liquori, vini e dolci tipici sardi.
          </p>
          <button class="abcta-button">Learn More</button>
       </div>
       <div class="abhero-image">
          <img class="abimg" src="${pageContext.request.contextPath}/Immagini/famiglia.jpeg" alt="whisky">
       </div>
    </div>
 </section>
</div>
<jsp:include page="Footer.jsp" />


	
	
</body>
</html>