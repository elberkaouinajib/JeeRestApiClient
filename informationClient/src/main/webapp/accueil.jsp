<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Accueil</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
	</head>
	<body>
		<div class="container">
			<h1 class="display-4" style="text-align: center">Accueil</h1>
			<br/>
				<div class="card-deck" align="center">
					<div class="container">
					  <div class="row">
					    <div class="col-sm">
					      <a href="ClientView" style="color: #000;">
						<div class="card bg-light mb-6" ">
						  <div class="card-header">Client</div>
						  <div class="card-body">
						    <h5 class="card-title">Gestion d'Administration des Clients</h5>
						  </div>
						</div>
					</a>
					    </div>
					    <div class="col-sm">
					      <a href="ConseillerView">
						<div class="card text-white bg-dark mb-6" ">
						  <div class="card-header">Conseiller</div>
						  <div class="card-body">
						    <h5 class="card-title">Gestion d'Administration des Conseillers</h5>
						  </div>
						</div>
					</a>
					    </div>
					  </div>
					</div>
					
				</div>
		</div>
	</body>
</html>