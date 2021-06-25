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
import tn.iit.entities.Matiere;
import tn.iit.entities.Niveau;
import tn.iit.services.DepartmentService;
import tn.iit.services.MatiereService;
import tn.iit.services.NiveauService;

/**
 * Servlet implementation class EnseignantController
 */
@WebServlet("/Matiere")
public class MatiereController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final MatiereService matService = new MatiereService();
    private final DepartmentService departServe = new DepartmentService();
    private final NiveauService niveauService = new NiveauService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MatiereController() {
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

        List<Matiere> listMatiere = matService.getAll();
        List<Departement> listDepartments = departServe.getAll();
        List<Niveau> lisNiveaux = niveauService.getAll();
        request.setAttribute("listMatiere", listMatiere);
        request.setAttribute("lisNiveaux", lisNiveaux);
        request.setAttribute("listDepartments", listDepartments);
        RequestDispatcher dispatch = request.getRequestDispatcher("listMat.jsp");
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

        Matiere mat = new Matiere();
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            String json = new Gson().toJson("ERROR");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            return;
        }
        if (action.equalsIgnoreCase("add")) {
            mat.setLibelle(request.getParameter("libelle"));
            mat.setChargeCours(Float.parseFloat(request.getParameter("chargeCours")));
            mat.setChargeTd(Float.parseFloat(request.getParameter("chargeTd")));
            mat.setChargeTp(Float.parseFloat(request.getParameter("chargeTp")));
            Departement d = new Departement();
            Niveau n = new Niveau();
            n.setId(Integer.parseInt(request.getParameter("niveau")));
            d.setId(Integer.parseInt(request.getParameter("departement")));
            mat.setDepartment(d);
            mat.setNiveau(n);
            matService.add(mat);
            response.setContentType("application/json");
            String json = new Gson().toJson(mat);
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else if (action.equalsIgnoreCase("edit")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                int id = Integer.parseInt(request.getParameter("id"));
                mat = matService.findById(id);
                String json = new Gson().toJson(mat);
                response.setContentType("application/json");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
        } else if (action.equalsIgnoreCase("update")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                mat.setId(Integer.parseInt(request.getParameter("id")));
                mat.setLibelle(request.getParameter("libelle"));
                mat.setChargeCours(Float.parseFloat(request.getParameter("chargeCours")));
                mat.setChargeTd(Float.parseFloat(request.getParameter("chargeTd")));
                mat.setChargeTp(Float.parseFloat(request.getParameter("chargeTp")));
                Departement d = new Departement();
                Niveau n = new Niveau();
                n.setId(Integer.parseInt(request.getParameter("niveau")));
                d.setId(Integer.parseInt(request.getParameter("departement")));
                mat.setDepartment(d);
                mat.setNiveau(n);
                matService.update(mat);
                String json = new Gson().toJson(mat);
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
                matService.delete(id);
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
