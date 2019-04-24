<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Conseiller</title>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
		<script>
		function GetListeConseillers(){
			$("#listConseillers tbody").empty();
		    $.ajax({ 
		        type: 'GET', 
		        url: 'http://localhost:8080/informationClient/conseillers', 
		        dataType : 'json',
		        success: function (data) { 

		        	$(function() {
		        	    $.each(data, function(i, item) {
		        	        var $tr = $('<tr>').append(
		        	        	$('<th id="idConseiller">').text(item.idConseiller),
		        	            $('<td id="nomConseiller">').text(item.nom),
		        	            $('<td id="prenomConseiller">').text(item.prenom),
		        	            $('<td id="emailConseiller">').text(item.email),
		        	            $('<td id="telephoneConseiller">').text(item.telephone),
		        	            $('<td id="lieuAffectationConseiller">').text(item.lieuAffectation),
		        	            $('<td>').html( $('<button id="btnConseillerUpdate" type="button" class="btn btn-success">').text("Modifier")),
		        	            $('<td>').html( $('<button id="btnConseillerDelete" type="button" class="btn btn-danger">').text("supprimer"))
		        	        ).appendTo('#listConseillers');
		        	    });
		        	});
		        }
		    });
		}
		
		function ClearForm(){
			 $("#addConseilleridConseiller").val("");
			 $("#addConseillerNom").val("");
			 $("#addConseillerPrenom").val("");
			 $("#addConseillerEmail").val("");
			 $("#addConseillerTelephone").val("");
			 $("#addConseillerAffectation").val("");			
		}
		function ResetFormToAdd(){
			 ClearForm();
			 $("#btnConseillerCancel").attr("hidden",true);
			 $("#btnConseillerUpdateFin").attr("hidden",true);
			 $("#btnConseillerAdd").attr("hidden",false);			
		}
	$(document).ready(function () {
		 GetListeConseillers();
		 
		 $("#btnConseillerAdd").click(function() {
			 var conseiller = new Object();
			 conseiller.nom =  $("#addConseillerNom").val();
			 conseiller.prenom = $("#addConseillerPrenom").val();
			 conseiller.email = $("#addConseillerEmail").val();
			 conseiller.telephone = $("#addConseillerTelephone").val();
			 conseiller.lieuAffectation = $("#addConseillerAffectation").val();
			 var jsonConseiller = JSON.stringify(conseiller);
			 console.log(jsonConseiller)
			 
			 $.ajax({ 
			        type: 'POST', 
			        url: 'http://localhost:8080/informationClient/conseiller', 
			        dataType : 'json',
			        contentType: 'application/json',
			        data : jsonConseiller,
			        success: function (result) { 
			        	GetListeConseillers();
			        }
			    });
		 });
		 
		 $("#btnConseillerCancel").click(function() {
			 ResetFormToAdd();			
		 });
		 
		 $("#btnConseillerUpdateFin").click(function() {
			 var conseiller = new Object();
			 conseiller.idConseiller =  $("#addConseilleridConseiller").val();
			 conseiller.nom =  $("#addConseillerNom").val();
			 conseiller.prenom = $("#addConseillerPrenom").val();
			 conseiller.email = $("#addConseillerEmail").val();
			 conseiller.telephone = $("#addConseillerTelephone").val();
			 conseiller.lieuAffectation = $("#addConseillerAffectation").val();
			 var jsonConseiller = JSON.stringify(conseiller);
			 console.log(jsonConseiller)
			 
			 $.ajax({ 
			        type: 'PUT', 
			        url: 'http://localhost:8080/informationClient/conseiller', 
			        dataType : 'json',
			        contentType: 'application/json',
			        data : jsonConseiller,
			        success: function (result) { 
			        	GetListeConseillers();
						ResetFormToAdd();	
			        }
			    });		
		 });
		 
		 $(document).on('click','#btnConseillerUpdate', function(){
			 $("#addConseilleridConseiller").val($(this).parent().parent().find("#idConseiller").text());
			 $("#addConseillerNom").val($(this).parent().parent().find("#nomConseiller").text());
			 $("#addConseillerPrenom").val($(this).parent().parent().find("#prenomConseiller").text());
			 $("#addConseillerEmail").val($(this).parent().parent().find("#emailConseiller").text());
			 $("#addConseillerTelephone").val($(this).parent().parent().find("#telephoneConseiller").text());
			 $("#addConseillerAffectation").val($(this).parent().parent().find("#lieuAffectationConseiller").text());	
			 
			 $("#btnConseillerCancel").attr("hidden",false);
			 $("#btnConseillerUpdateFin").attr("hidden",false);
			 $("#btnConseillerAdd").attr("hidden",true);
			
		 });
		 
		 $(document).on('click','#btnConseillerDelete', function(){
			 var idConseiller=$(this).parent().parent().find("#idConseiller").text();
			 console.log(idConseiller);
			 
			 $.ajax({ 
		        type: 'DELETE', 
		        url: 'http://localhost:8080/informationClient/conseiller/'+idConseiller, 
		        dataType : 'json',
		        success: function (result) { 
		        	GetListeConseillers();
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
    <h1>Liste des Conseillers</h1>
      <div class="container">
		  <div class="row">
		    <div class="col-sm">
		      <table class="table" id="listConseillers">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Nom</th>
				      <th scope="col">Prenom</th>
				      <th scope="col">Email</th>
				      <th scope="col">Telephone</th>
				      <th scope="col">Affectation</th>
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
    	<h1>Ajouter un conseiller</h1>
		<form>
		  <div hidden class="form-group">
		    <input type="text" class="form-control" id="addConseilleridConseiller">
		  </div>
		  <div class="form-group">
		    <label for="addConseillerNom">Nom</label>
		    <input type="text" class="form-control" id="addConseillerNom" placeholder="Nom">
		  </div>
		  <div class="form-group">
		    <label for="addConseillerPrenom">Prenom</label>
		    <input type="text" class="form-control" id="addConseillerPrenom"  placeholder="Prenom">
		  </div>
		  <div class="form-group">
		    <label for="addConseillerEmail">Email</label>
		    <input type="text" class="form-control" id="addConseillerEmail" placeholder="Email">
		  </div>
		  <div class="form-group">
		    <label for="addConseillerTelephone">Telephone</label>
		    <input type="text" class="form-control" id="addConseillerTelephone" placeholder="Telephone">
		  </div>
		   <div class="form-group">
		    <label for="addConseillerAffectation">Affectation</label>
		    <input type="text" class="form-control" id="addConseillerAffectation" placeholder="Affectation">
		  </div>
		  <button type="button" id="btnConseillerAdd" class="btn btn-primary">Ajouter</button>
		  <button hidden type="button" id="btnConseillerUpdateFin" class="btn btn-success">Modifier</button>
		  <button hidden type="button" id="btnConseillerCancel" class="btn btn-primary">Annuler</button>
		</form>
    </div>
  </div>
</div>
</body>
</html>