<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="it" class="h-100">
<head>
	<meta charset="ISO-8859-1">
	<title>Aggiorna film</title>
	<jsp:include page="../header.jsp" />
</head>
<body class="d-flex flex-column h-100">
<jsp:include page="../navbar.jsp"></jsp:include>
	<main class="flex-shrink-0">
			  <div class="container">
			  
			  		<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none':'' }" role="alert">
					  ${errorMessage}
					  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
					</div>
					<div class="alert alert-danger alert-dismissible fade show d-none" role="alert">
					  Operazione fallita!
					  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
					</div>
					<div class="alert alert-info alert-dismissible fade show d-none" role="alert">
					  Aggiungere d-none nelle class per non far apparire
					   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
					</div>
			  
			  <div class='card'>
				    <div class='card-header'>
				        <h5>Modifica i campi da aggiornare</h5> 
				    </div>
				    <div class='card-body'>
		
							<h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>
		
		
							<form method="post" action="ExecuteUpdateFilmServlet" class="row g-3" novalidate="novalidate">
							
								<div class="col-md-6">
									<label for="titolo" class="form-label">Titolo <span class="text-danger">*</span></label>
									<input type="text" name="titolo" id="titolo" class="form-control" placeholder="Inserire il titolo" value="${insert_film_attr.titolo }">
								</div>
								
								<div class="col-md-6">
									<label for="genere" class="form-label">Genere <span class="text-danger">*</span></label>
									<input type="text" name="genere" id="genere" class="form-control" placeholder="Inserire il genere" value="${insert_film_attr.genere }">
								</div>
							
								<fmt:formatDate pattern='yyyy-MM-dd' var="parsedDate" type='date' value='${insert_film_attr.dataPubblicazione}' />
								<div class="col-md-6">
									<label for="dataPubblicazione" class="form-label">Data di Pubblicazione <span class="text-danger">*</span></label>
	                        		<input class="form-control" id="dataPubblicazione" type="date" placeholder="dd/MM/yy" 
	                        				title="formato : gg/mm/aaaa"  name="dataPubblicazione" value="${parsedDate}" >
								</div>
								
								<div class="col-md-6">
									<label for="minutiDurata" class="form-label">Durata (minuti) <span class="text-danger">*</span></label>
									<input type="number" class="form-control" name="minutiDurata" id="minutiDurata" placeholder="Inserire la durata" value="${insert_film_attr.minutiDurata }">
								</div>
								
								
								<div class="col-md-6">
									<label for="regista.id">Regista <span class="text-danger">*</span></label>
								    <select class="form-select" id="regista.id" name="regista.id">
								    	<option value="" selected> -- Selezionare una voce -- </option>
								      	<c:forEach items="${registi_list_attribute }" var="registaItem">
								      		<option value="${registaItem.id}" ${insert_film_attr.regista.id == registaItem.id?'selected':''} >${registaItem.nome } ${registaItem.cognome }</option>
								      	</c:forEach>
								    </select>
								</div>
								
								<input type="hidden" name="idFilm" value="${insert_film_attr.id}">
								
								
							<div class="col-12">
								<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>
								
								<a href="ListFilmServlet" class='btn btn-outline-secondary' style='width:80px'>
					            <i class='fa fa-chevron-left'></i> Back
					        	</a>
							</div>
		
						</form>
  		   
				    </div>
				</div>		 
			  </div>
			  
			</main>
			
			<jsp:include page="../footer.jsp" />
</body>
</html>