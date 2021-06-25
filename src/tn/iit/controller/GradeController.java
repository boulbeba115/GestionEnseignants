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
import tn.iit.entities.Grade;
import tn.iit.services.GradeService;

/**
 * Servlet implementation class EnseignantController
 */
@WebServlet("/Grade")
public class GradeController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final GradeService gradeService = new GradeService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeController() {
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

        List<Grade> listGrades = gradeService.getAll();
        request.setAttribute("listGrades", listGrades);
        RequestDispatcher dispatch = request.getRequestDispatcher("listGrades.jsp");
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

        Grade grade = new Grade();
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            String json = new Gson().toJson("ERROR");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            return;
        }
        if (action.equalsIgnoreCase("add")) {
            grade.setLibelle(request.getParameter("libelle"));
            grade.setPrixC(Float.parseFloat(request.getParameter("prixC")));
            grade.setPrixTd(Float.parseFloat(request.getParameter("prixTd")));
            grade.setPrixTp(Float.parseFloat(request.getParameter("prixTp")));
            gradeService.add(grade);
            response.setContentType("application/json");
            String json = new Gson().toJson(grade);
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else if (action.equalsIgnoreCase("edit")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                int id = Integer.parseInt(request.getParameter("id"));
                grade = gradeService.getById(id);
                String json = new Gson().toJson(grade);
                response.setContentType("application/json");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
        } else if (action.equalsIgnoreCase("update")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                grade.setId(Integer.parseInt(request.getParameter("id")));
                grade.setLibelle(request.getParameter("libelle"));
                grade.setPrixC(Float.parseFloat(request.getParameter("prixC")));
                grade.setPrixTd(Float.parseFloat(request.getParameter("prixTd")));
                grade.setPrixTp(Float.parseFloat(request.getParameter("prixTp")));
                gradeService.update(grade);
                String json = new Gson().toJson(grade);
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
                gradeService.remove(id);
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
