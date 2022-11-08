package it.prova.raccoltafilm.web.servlet.regista;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.raccoltafilm.exceptions.ElementNotFoundException;
import it.prova.raccoltafilm.exceptions.RegistaConFilmAssociatiException;
import it.prova.raccoltafilm.model.Film;
import it.prova.raccoltafilm.model.Regista;
import it.prova.raccoltafilm.service.FilmService;
import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.service.RegistaService;

/**
 * Servlet implementation class ExecuteDeleteRegistaServlet
 */
@WebServlet("/ExecuteDeleteRegistaServlet")
public class ExecuteDeleteRegistaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private FilmService filmService;
	private RegistaService registaService;

	public ExecuteDeleteRegistaServlet() {
		this.filmService = MyServiceFactory.getFilmServiceInstance();
		this.registaService = MyServiceFactory.getRegistaServiceInstance();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idRegistaParam = request.getParameter("idRegista");

		if (!NumberUtils.isCreatable(idRegistaParam)) {
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("home").forward(request, response);
			return;
		}

		try {
			Regista registaParam = registaService.caricaSingoloElemento(Long.parseLong(idRegistaParam));
			Film example = new Film(registaParam);

			List<Film> filmDelRegistaDaEliminare = filmService.findByExample(example);

			if (filmDelRegistaDaEliminare.size() != 0) {
				throw new RegistaConFilmAssociatiException("Il regista " + registaParam.getNome() + " "
						+ registaParam.getCognome() + " non puo' essere eliminato perche' ha dei film associati.");
			}

			registaService.rimuovi(Long.parseLong(idRegistaParam));
		} catch (ElementNotFoundException e) {
			request.getRequestDispatcher("ExecuteListRegistaServlet?operationResult=NOT_FOUND").forward(request,
					response);
			return;
		} catch (RegistaConFilmAssociatiException e) {
			request.setAttribute("errorMessage",
					"Attenzione impossibile eliminare un regista se prima non si eliminano i suoi film.");
			request.getRequestDispatcher("home").forward(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("home").forward(request, response);
			return;
		}

		response.sendRedirect("ExecuteListRegistaServlet?operationResult=SUCCESS");
	}

}
