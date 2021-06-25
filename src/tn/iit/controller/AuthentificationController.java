package tn.iit.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tn.iit.services.NiveauService;

/**
 * Servlet implementation class EnseignantController
 */
@WebServlet("/Login")
public class AuthentificationController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final NiveauService niveauService = new NiveauService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthentificationController() {
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
        String action = request.getParameter("action");
        if (action != null && !action.isEmpty()) {
            if (action.equalsIgnoreCase("logout")) {
                session.removeAttribute("login");
                RequestDispatcher dispatch = request.getRequestDispatcher("login.jsp");
                dispatch.forward(request, response);
                return ;
            }
        }
        if (isconnected != null && !isconnected.isEmpty()) {
            RequestDispatcher dispatch = request.getRequestDispatcher("index.jsp");
            dispatch.forward(request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String isconnected = (String) session.getAttribute("login");
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        if (login.equals("admin") && password.equals("admin")) {
            session.setAttribute("login", "Administrateur");
            RequestDispatcher dispatch = request.getRequestDispatcher("index.jsp");
            dispatch.forward(request, response);
        } else {
            request.setAttribute("errorMsg", "Vérifier le login ou la mot de pass");
            RequestDispatcher dispatch = request.getRequestDispatcher("login.jsp");
            dispatch.forward(request, response);
        }

    }

}
