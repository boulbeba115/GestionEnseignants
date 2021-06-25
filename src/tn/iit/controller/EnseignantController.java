package tn.iit.controller;

import com.google.gson.Gson;
import java.io.IOException;
import static java.lang.Integer.parseInt;
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
import tn.iit.entities.Grade;
import tn.iit.entities.Matiere;
import tn.iit.services.DepartmentService;
import tn.iit.services.EnseignantService;
import tn.iit.services.GradeService;

/**
 * Servlet implementation class EnseignantController
 */
@WebServlet("/Enseignant")
public class EnseignantController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final EnseignantService ensServ = new EnseignantService();
    private final GradeService gradeServe = new GradeService();
    private final DepartmentService departServe = new DepartmentService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnseignantController() {
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

        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            List<Enseignant> listEns = ensServ.getAll();
            List<Grade> listGrade = gradeServe.getAll();
            List<Departement> listDepartments = departServe.getAll();
            request.setAttribute("listEns", listEns);
            request.setAttribute("listGrade", listGrade);
            request.setAttribute("listDepartments", listDepartments);
            RequestDispatcher dispatch = request.getRequestDispatcher("/listEns.jsp");
            dispatch.forward(request, response);
        } else if (action.equalsIgnoreCase("listMat")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                List<Matiere> listMatiere = ensServ.getEnsMat(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("listMatiere", listMatiere);
                RequestDispatcher dispatch = request.getRequestDispatcher("/ensMatList.jsp");
                dispatch.forward(request, response);
            }
        }
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

        Enseignant ens = new Enseignant();
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            String json = new Gson().toJson("ERROR");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            return;
        }
        if (action.equalsIgnoreCase("add")) {
            ens.setCin(parseInt(request.getParameter("cin")));
            ens.setNom(request.getParameter("nom"));
            ens.setPrenom(request.getParameter("prenom"));
            ens.setEmail(request.getParameter("email"));
            ens.setAdresse(request.getParameter("adresse"));
            ens.setPhone(parseInt(request.getParameter("phone")));
            ens.setLogin(request.getParameter("login"));
            ens.setPassword(request.getParameter("password"));
            Grade g = new Grade();
            Departement d = new Departement();
            d.setId(parseInt(request.getParameter("departement")));
            g.setId(parseInt(request.getParameter("grade")));
            ens.setGrade(g);
            ens.setDepartement(d);
            ensServ.addEnseignant(ens);
            response.setContentType("application/json");
            String json = new Gson().toJson(ens);
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else if (action.equalsIgnoreCase("edit")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                int id = parseInt(request.getParameter("id"));
                ens = ensServ.findById(id);
                String json = new Gson().toJson(ens);
                response.setContentType("application/json");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
        } else if (action.equalsIgnoreCase("update")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                ens = new Enseignant();
                ens.setId(parseInt(request.getParameter("id")));
                ens.setCin(parseInt(request.getParameter("cin")));
                ens.setNom(request.getParameter("nom"));
                ens.setPrenom(request.getParameter("prenom"));
                ens.setEmail(request.getParameter("email"));
                ens.setAdresse(request.getParameter("adresse"));
                ens.setPhone(parseInt(request.getParameter("phone")));
                Grade g = new Grade();
                Departement d = new Departement();
                d.setId(parseInt(request.getParameter("departement")));
                g.setId(parseInt(request.getParameter("grade")));
                ens.setGrade(g);
                ens.setDepartement(d);
                ens = ensServ.updateEnseignant(ens);
                String json = new Gson().toJson(ens);
                response.setContentType("application/json");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
        } else if (action.equalsIgnoreCase("delete")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                int id = parseInt(request.getParameter("id"));
                ensServ.deleteEnseignant(id);
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
