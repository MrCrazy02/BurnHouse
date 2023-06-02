<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Registrazione</title>
    <link rel="stylesheet" type="text/css" href="./CSS/RegistrazioneStile.css">
</head>
<body>
	
	<div class="container">
		<form action="RegistrationServlet" method="POST">
			<h1>Inserisci i tuoi dati</h1>
			<div class="overlay">
		        	<input type="text" id="nome" name="nome" required placeholder="Nome"><br><br>
		        	<input type="text" id="cognome" name="cognome" required placeholder="Cognome"><br><br>
		        	<input type="email" id="email" name="email" required placeholder="Email">
		        	<input type="password" id="password" name="password" required placeholder="Password">
		        	<input type="date" id="data_nascita" name="data_nascita" required>
					<br>
					<br>
					<button>Registrati</button>
			</div>
		</form>
	</div>


</body>
</html>