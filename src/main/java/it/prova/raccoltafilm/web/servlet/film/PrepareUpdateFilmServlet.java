package it.prova.raccoltafilm.web.servlet.film;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.raccoltafilm.model.Film;
import it.prova.raccoltafilm.model.Regista;
import it.prova.raccoltafilm.service.FilmService;

/**
 * Servlet implementation class PrepareUpdateFilmServlet
 */
@WebServlet("/PrepareUpdateFilmServlet")
public class PrepareUpdateFilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private FilmService filmService;

	public PrepareUpdateFilmServlet(FilmService filmService) {
		super();
		this.filmService = filmService;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idDaModificare = request.getParameter("idRegista");

		if (!NumberUtils.isCreatable(idDaModificare)) {
			request.setAttribute("errorMessage", "Attenzione, si e' verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}

		Film result = new Film();
		try {
			result = filmService.caricaSingoloElemento(Long.parseLong(idDaModificare));
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}

		request.setAttribute("dettaglioFilmDaModificare", result);
		request.getRequestDispatcher("/film/update.jsp").forward(request, response);
	}

}
