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
import tn.iit.entities.Departement;
import tn.iit.entities.Enseignant;
import tn.iit.services.DepartmentService;
import tn.iit.services.EnseignantService;

/**
 * Servlet implementation class EnseignantController
 */
@WebServlet("/Departement")
public class DepartementController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final DepartmentService depService = new DepartmentService();
    private final EnseignantService ensService = new EnseignantService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepartementController() {
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
            return ;
        }
        List<Departement> listDepartments = depService.getAll();
        List<Enseignant> listEns = ensService.getAll();
        request.setAttribute("listDepartments", listDepartments);
        request.setAttribute("listEns", listEns);
        RequestDispatcher dispatch = request.getRequestDispatcher("listDep.jsp");
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
        }
        
        Departement dep = new Departement();
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            String json = new Gson().toJson("ERROR");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            return;
        }
        if (action.equalsIgnoreCase("add")) {
            dep.setLibelle(request.getParameter("libelle"));
            Enseignant ens = new Enseignant();
            ens.setId(Integer.parseInt(request.getParameter("ensResponsable")));
            dep.setEnsResponsable(ens);
            depService.add(dep);
            response.setContentType("application/json");
            String json = new Gson().toJson(dep);
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else if (action.equalsIgnoreCase("edit")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                int id = Integer.parseInt(request.getParameter("id"));
                dep = depService.findById(id);
                String json = new Gson().toJson(dep);
                response.setContentType("application/json");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
        } else if (action.equalsIgnoreCase("update")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                dep.setId(Integer.parseInt(request.getParameter("id")));
                dep.setLibelle(request.getParameter("libelle"));
                Enseignant ens = new Enseignant();
                ens.setId(Integer.parseInt(request.getParameter("ensResponsable")));
                dep.setEnsResponsable(ens);
                depService.update(dep);
                String json = new Gson().toJson(dep);
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
                depService.remove(id);
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
