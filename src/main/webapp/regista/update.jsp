<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="it" class="h-100">
<head>
	<meta charset="ISO-8859-1">
	<title>Form di modifica</title>
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
		
		
							<form method="post" action="ExecuteUpdateRegistaServlet" class="row g-3" novalidate="novalidate">
							
								<div class="col-md-6">
									<label for="nome" class="form-label">Nome <span class="text-danger">*</span></label>
									<input type="text" name="nome" id="nome" class="form-control" placeholder="Inserire il nome"  
										value="${dettaglioRegistaDaModificare.nome}" required>
								</div>
								
								<div class="col-md-6">
									<label for="cognome" class="form-label">Cognome <span class="text-danger">*</span></label>
									<input type="text" name="cognome" id="cognome" class="form-control" placeholder="Inserire il cognome"  
										value="${dettaglioRegistaDaModificare.cognome}" required>
								</div>
							
								<div class="col-md-6">
									<label for="nickName" class="form-label">Prezzo <span class="text-danger">*</span></label>
									<input type="text" class="form-control" name="nickName" id="nickName" placeholder="Inserire nickname" 
									value="${dettaglioRegistaDaModificare.nickName}" required>
								</div>
								
								<div class="col-md-3">
									<label for="dataDiNascita" class="form-label">Data<span class="text-danger">*</span></label>
									<fmt:formatDate pattern="yyyy-MM-dd" value="${dettaglioRegistaDaModificare.dataDiNascita}" var="dataParsed"/>
									<input class="form-control"  name="dataDiNascita" id="dataDiNascita" type="date" placeholder="dd/MM/yy" title="formato : gg/mm/aaaa" 
										value="${dataParsed}" required/>
								</div>
								
								<div class="col-md-3">
									<label for="sesso" class="form-label">Sesso <span class="text-danger">*</span></label>
								    <select class="form-select" id="sesso" name="sesso" required>
								    	<option value="" selected> - Selezionare - </option>
								      	<option value="MASCHIO" ${dettaglioRegistaDaModificare.sesso == 'MASCHIO'?'selected':''} >M</option>
								      	<option value="FEMMINA" ${dettaglioRegistaDaModificare.sesso == 'FEMMINA'?'selected':''} >F</option>
								    </select>
								</div>
								
								<input type="hidden" name="idRegista" value="${dettaglioRegistaDaModificare.id}">
								
								
							<div class="col-12">
								<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>
								
								<a href="ListRegistaServlet" class='btn btn-outline-secondary' style='width:80px'>
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