package it.prova.raccoltafilm.web.servlet.film;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.raccoltafilm.model.Film;
import it.prova.raccoltafilm.service.FilmService;
import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.service.RegistaService;

/**
 * Servlet implementation class PrepareUpdateFilmServlet
 */
@WebServlet("/PrepareUpdateFilmServlet")
public class PrepareUpdateFilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idDaModificare = request.getParameter("idFilm");

		if (!NumberUtils.isCreatable(idDaModificare)) {
			request.setAttribute("errorMessage", "Attenzione, si e' verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		
		FilmService filmService = MyServiceFactory.getFilmServiceInstance();
		RegistaService registaService = MyServiceFactory.getRegistaServiceInstance();
		Film result = new Film();
		try {
			result = filmService.caricaSingoloElementoEager(Long.parseLong(idDaModificare));
			request.setAttribute("registi_list_attribute", registaService.listAllElements());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}

		request.setAttribute("insert_film_attr", result);
		request.getRequestDispatcher("/film/update.jsp").forward(request, response);
	}

}
