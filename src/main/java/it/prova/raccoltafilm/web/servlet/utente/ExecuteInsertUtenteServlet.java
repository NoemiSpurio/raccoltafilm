package it.prova.raccoltafilm.web.servlet.utente;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.raccoltafilm.model.Utente;
import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.service.RuoloService;
import it.prova.raccoltafilm.service.UtenteService;
import it.prova.raccoltafilm.utility.UtilityForm;

/**
 * Servlet implementation class ExecuteInsertUtenteServlet
 */
@WebServlet("/admin/ExecuteInsertUtenteServlet")
public class ExecuteInsertUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UtenteService utenteService;
	private RuoloService ruoloService;

	public ExecuteInsertUtenteServlet() {
		this.ruoloService = MyServiceFactory.getRuoloServiceInstance();
		this.utenteService = MyServiceFactory.getUtenteServiceInstance();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String usernameParam = request.getParameter("username");
		String passwordParam = request.getParameter("password");
		String confermaPwdParam = request.getParameter("passwordConferma");
		String nomeParam = request.getParameter("nome");
		String cognomeParam = request.getParameter("cognome");
		String[] ruoliParam = request.getParameterValues("ruoli");

		Utente utenteInstance = new Utente(usernameParam, passwordParam, nomeParam, cognomeParam, new Date());
		
		try {
			if (!UtilityForm.validateUtenteBean(utenteInstance) || !passwordParam.equals(confermaPwdParam)) {
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
