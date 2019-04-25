<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestion des Clients</title>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
		<script>
		function GetListeClients(){
			$("#listClients tbody").empty();
		    $.ajax({ 
		        type: 'GET', 
		        url: 'http://localhost:8080/informationClient/clients', 
		        dataType : 'json',
		        success: function (data) { 

		        	$(function() {
		        	    $.each(data, function(i, item) {
		        	        var $tr = $('<tr>').append(
		        	        	$('<th id="idClient">').text(item.idClient),
		        	            $('<td id="nomClient">').text(item.nom),
		        	            $('<td id="prenomClient">').text(item.prenom),
		        	            $('<td id="emailClient">').text(item.email),
		        	            $('<td id="telephoneClient">').text(item.telephone),
		        	            $('<td id="conseillerClient">').text(item.conseiller!=null?item.conseiller.nom+" "+item.conseiller.prenom:null),
		        	            $('<td hidden id="conseillerClientid">').text(item.conseiller!=null?item.conseiller.idConseiller:null),
		        	            $('<td id="addresseClient">').text(item.adresse),
		        	            $('<td>').html( $('<button id="btnClientUpdate" type="button" class="btn btn-success">').text("Modifier")),
		        	            $('<td>').html( $('<button id="btnClientDelete" type="button" class="btn btn-danger">').text("supprimer"))
		        	        ).appendTo('#listClients');
		        	    });
		        	});
		        }
		    });
		}
		
		function ClearForm(){
			 $("#addClientidClient").val("");
			 $("#addClientNom").val("");
			 $("#addClientPrenom").val("");
			 $("#addClientEmail").val("");
			 $("#addClientTelephone").val("");
			 $("#addClientConseiller").val(-1);
			 $("#addClientAddresse").val("");
		}
		function ResetFormToAdd(){
			 ClearForm();
			 $("#btnClientCancel").attr("hidden",true);
			 $("#btnClientUpdateFin").attr("hidden",true);
			 $("#btnClientAdd").attr("hidden",false);			
		}
	$(document).ready(function () {
		GetListeClients();
		
		 $.ajax({ 
		        type: 'GET', 
		        url: 'http://localhost:8080/informationClient/conseillers', 
		        dataType : 'json',
		        success: function (data) { 

		        	$(function() {
		        	    $.each(data, function(i, item) {
		        	        $("#addClientConseiller").append(new Option(item.nom+" "+item.prenom, item.idConseiller));
		        	    });
		        	});
		        }
		    });
		 
		 $("#btnClientAdd").click(function() {
			 var conseiller = new Object();
			 var client = new Object();
			 conseiller.idConseiller= $("#addClientConseiller").val();
			 client.nom =  $("#addClientNom").val();
			 client.prenom = $("#addClientPrenom").val();
			 client.email = $("#addClientEmail").val();
			 client.telephone = $("#addClientTelephone").val();
			 client.conseiller = conseiller;
			 client.adresse = $("#addClientAddresse").val();
			 var jsonClient = JSON.stringify(client);
			 console.log(jsonClient)
			 
			 $.ajax({ 
			        type: 'POST', 
			        url: 'http://localhost:8080/informationClient/client', 
			        dataType : 'json',
			        contentType: 'application/json',
			        data : jsonClient,
			        success: function (result) { 
			        	GetListeClients();
			        	ResetFormToAdd();	
			        }
			    });
		 });
		 
		 $("#btnClientCancel").click(function() {
			 ResetFormToAdd();			
		 });
		 
		 $("#btnClientUpdateFin").click(function() {
			 var conseiller = new Object();
			 var client = new Object();
			 conseiller.idConseiller= $("#addClientConseiller").val();
			 
			 client.idClient =  $("#addClientidClient").val();
			 client.nom =  $("#addClientNom").val();
			 client.prenom = $("#addClientPrenom").val();
			 client.email = $("#addClientEmail").val();
			 client.telephone = $("#addClientTelephone").val();
			 client.conseiller = conseiller;
			 client.adresse = $("#addClientAddresse").val();
			 var jsonClient = JSON.stringify(client);
			 console.log(jsonClient)
			 
			 $.ajax({ 
			        type: 'PUT', 
			        url: 'http://localhost:8080/informationClient/client', 
			        dataType : 'json',
			        contentType: 'application/json',
			        data : jsonClient,
			        success: function (result) { 
			        	GetListeClients();
						ResetFormToAdd();	
			        }
			    });		
		 });
		 
		 $(document).on('click','#btnClientUpdate', function(){
			 
			 $("#addClientidClient").val($(this).parent().parent().find("#idClient").text());
			 $("#addClientNom").val($(this).parent().parent().find("#nomClient").text());
			 $("#addClientPrenom").val($(this).parent().parent().find("#prenomClient").text());
			 $("#addClientEmail").val($(this).parent().parent().find("#emailClient").text());
			 $("#addClientTelephone").val($(this).parent().parent().find("#telephoneClient").text());
			 $("#addClientConseiller").val($(this).parent().parent().find("#conseillerClientid").text());	
			 $("#addClientAddresse").val($(this).parent().parent().find("#addresseClient").text());	
			 
			 $("#btnClientCancel").attr("hidden",false);
			 $("#btnClientUpdateFin").attr("hidden",false);
			 $("#btnClientAdd").attr("hidden",true);
			
		 });
		 
		 $(document).on('click','#btnClientDelete', function(){
			 var idClient=$(this).parent().parent().find("#idClient").text();
			 console.log(idClient);
			 
			 $.ajax({ 
		        type: 'DELETE', 
		        url: 'http://localhost:8080/informationClient/client/'+idClient, 
		        dataType : 'json',
		        success: function (result) { 
		        	GetListeClients();
		        }
		   	 });
		});
		 
	});
	</script>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
    <h1>Liste des Clients</h1>
      <div class="container">
		  <div class="row">
		    <div class="col-sm">
		      <table class="table" id="listClients">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Nom</th>
				      <th scope="col">Prenom</th>
				      <th scope="col">Email</th>
				      <th scope="col">Telephone</th>
				      <th scope="col">Conseiller</th>
				      <th scope="col">addresse</th>
				      <th scope="col">Modifier</th>
				      <th scope="col">Supprimer</th>
				    </tr>
				  </thead>
				  <tbody>
				  </tbody>
				</table>
		    </div>
		  </div>
		</div>
    </div>
    <div class="col-sm-4">
    	<h1>Ajouter un Client</h1>
		<form>
		  <div hidden class="form-group">
		    <input type="text" class="form-control" id="addClientidClient">
		  </div>
		  <div class="form-group">
		    <label for="addClientNom">Nom</label>
		    <input type="text" class="form-control" id="addClientNom" placeholder="Nom">
		  </div>
		  <div class="form-group">
		    <label for="addClientPrenom">Prenom</label>
		    <input type="text" class="form-control" id="addClientPrenom"  placeholder="Prenom">
		  </div>
		  <div class="form-group">
		    <label for="addClientEmail">Email</label>
		    <input type="text" class="form-control" id="addClientEmail" placeholder="Email">
		  </div>
		  <div class="form-group">
		    <label for="addClientTelephone">Telephone</label>
		    <input type="text" class="form-control" id="addClientTelephone" placeholder="Telephone">
		  </div>
		  <div class="form-group">
		    <label for="addClientConseiller">Conseiller</label>
		    <select id="addClientConseiller" class="form-control">
			</select>
		  </div>
		   <div class="form-group">
		    <label for="addClientAddresse">addresse</label>
		    <input type="text" class="form-control" id="addClientAddresse" placeholder="Affectation">
		  </div>
		  <button type="button" id="btnClientAdd" class="btn btn-primary">Ajouter</button>
		  <button hidden type="button" id="btnClientUpdateFin" class="btn btn-success">Modifier</button>
		  <button hidden type="button" id="btnClientCancel" class="btn btn-primary">Annuler</button>
		</form>
    </div>
  </div>
</div>
</body>
</html>