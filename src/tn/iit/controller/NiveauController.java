package tn.iit.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tn.iit.entities.Niveau;
import tn.iit.services.NiveauService;

/**
 * Servlet implementation class EnseignantController
 */
@WebServlet("/Nivau")
public class NiveauController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final NiveauService niveauService = new NiveauService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public NiveauController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String isconnected = (String) session.getAttribute("login");
        if (isconnected == null || isconnected.isEmpty()) {
            RequestDispatcher dispatch = request.getRequestDispatcher("login.jsp");
            dispatch.forward(request, response);
            return;
        }

        List<Niveau> listNiveau = niveauService.getAll();
        request.setAttribute("listNiveau", listNiveau);
        RequestDispatcher dispatch = request.getRequestDispatcher("listNivau.jsp");
        dispatch.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String isconnected = (String) session.getAttribute("login");
        if (isconnected == null || isconnected.isEmpty()) {
            RequestDispatcher dispatch = request.getRequestDispatcher("login.jsp");
            dispatch.forward(request, response);
            return;
        }

        Niveau niveau = new Niveau();
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            String json = new Gson().toJson("ERROR");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            return;
        }
        if (action.equalsIgnoreCase("add")) {
            niveau.setLibelle(request.getParameter("libelle"));
            niveauService.add(niveau);
            response.setContentType("application/json");
            String json = new Gson().toJson(niveau);
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else if (action.equalsIgnoreCase("edit")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                int id = Integer.parseInt(request.getParameter("id"));
                niveau = niveauService.findById(id);
                String json = new Gson().toJson(niveau);
                response.setContentType("application/json");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
        } else if (action.equalsIgnoreCase("update")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                niveau.setId(Integer.parseInt(request.getParameter("id")));
                niveau.setLibelle(request.getParameter("libelle"));
                niveauService.update(niveau);
                String json = new Gson().toJson(niveau);
                response.setContentType("application/json");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } else {
                System.out.println("Id Null");
            }
        } else if (action.equalsIgnoreCase("delete")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                int id = Integer.parseInt(request.getParameter("id"));
                niveauService.remove(id);
                String json = new Gson().toJson("Deleted");
                response.setContentType("application/json");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
        } else {
            String json = new Gson().toJson("Not Found");
            response.setContentType("application/json");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(404);
            response.getWriter().write(json);

        }
    }

}
