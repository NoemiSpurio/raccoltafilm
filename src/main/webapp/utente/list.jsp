<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="it" class="h-100">
<head>
	<meta charset="ISO-8859-1">
	<title>Pagina dei risultati</title>
	<jsp:include page="../header.jsp" />
</head>
<body class="d-flex flex-column h-100">
	<jsp:include page="../navbar.jsp"></jsp:include>
	 
		<main class="flex-shrink-0">
		  <div class="container">
		  
		  		<div class='card'>
				    <div class='card-header'>
				        <h5>Lista dei risultati</h5> 
				    </div>
				    <div class='card-body'>	
				    	<a class="btn btn-primary " href="${pageContext.request.contextPath}/admin/PrepareInsertUtenteServlet">Aggiungi utente</a>			    
				        <div class='table-responsive'>
				            <table class='table table-striped ' >
				                <thead>
				                    <tr>
			                         	<th>Nome</th>
				                        <th>Cognome</th>
				                        <th>Username</th>
				                        <th>Data di creazione</th>
				                        <th>Azioni</th>
				                    </tr>
				                </thead>
				                <tbody>
				                	<c:forEach items="${utenti_list_attribute}" var="utenteItem">
										<tr>
											<td>${utenteItem.nome}</td>
											<td>${utenteItem.cognome}</td>
											<td>${utenteItem.username}</td>
											<td><fmt:formatDate type = "date" value = "${utenteItem.dateCreated}" /></td>
											<td>
												<a class="btn  btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/admin/ExecuteShowUtenteServlet?idUtente=${utenteItem.id }">Visualizza</a>
											</td>
										</tr>
									</c:forEach>
				                </tbody>
				            </table>
				        </div>
				        <div class='card-footer'>
					        <a href="utente/search.jsp" class='btn btn-outline-secondary' style='width:80px'>
					            <i class='fa fa-chevron-left'></i> Back
					        </a>
					    </div>
			    </div>
			</div>
		  </div>
		</main>
		<jsp:include page="../footer.jsp" />
</body>
</html>