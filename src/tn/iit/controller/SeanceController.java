package tn.iit.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tn.iit.entities.Enseignant;
import tn.iit.entities.Matiere;
import tn.iit.entities.Seance;
import tn.iit.services.EnseignantService;
import tn.iit.services.MatiereService;
import tn.iit.services.SeanceService;

/**
 * Servlet implementation class EnseignantController
 */
@WebServlet("/Sceance")
public class SeanceController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final SeanceService seanceService = new SeanceService();
    private final MatiereService matService = new MatiereService();
    private final EnseignantService ensServ = new EnseignantService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeanceController() {
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

        List<Seance> listSeances = seanceService.getAll();
        List<Enseignant> listEns = ensServ.getAll();
        List<Matiere> listMat = matService.getAll();
        request.setAttribute("listSeances", listSeances);
        request.setAttribute("listEns", listEns);
        request.setAttribute("listMat", listMat);
        RequestDispatcher dispatch = request.getRequestDispatcher("listSeance.jsp");
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

        Seance sc = new Seance();
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            String json = new Gson().toJson("ERROR");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            return;
        }
        if (action.equalsIgnoreCase("add")) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date date = sdf.parse(request.getParameter("date"));
                Date time = new SimpleDateFormat("HH:mm").parse(request.getParameter("heureDebut"));
                time.setHours(time.getHours() + 1);
                sc.setDate(date);
                sc.setHeureDebut(time);
            } catch (ParseException ex) {
                Logger.getLogger(SeanceController.class.getName()).log(Level.SEVERE, null, ex);
            }
            sc.setDuree(Float.parseFloat(request.getParameter("duree")));
            sc.setValide(true);
            sc.setTypeWithInt(Integer.parseInt(request.getParameter("type")));
            Enseignant e = new Enseignant();
            Matiere m = new Matiere();
            e.setId(Integer.parseInt(request.getParameter("enseignant")));
            m.setId(Integer.parseInt(request.getParameter("matiere")));
            sc.setMatiere(m);
            sc.setEnseignant(e);
            seanceService.add(sc);
            response.setContentType("application/json");
            String json = new Gson().toJson(sc);
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else if (action.equalsIgnoreCase("edit")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                int id = Integer.parseInt(request.getParameter("id"));
                sc = seanceService.findById(id);
                String json = new Gson().toJson(sc);
                response.setContentType("application/json");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
        } else if (action.equalsIgnoreCase("update")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                sc.setId(Integer.parseInt(request.getParameter("id")));
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date date = sdf.parse(request.getParameter("date"));
                    Date time = new SimpleDateFormat("HH:mm").parse(request.getParameter("heureDebut"));
                    time.setHours(time.getHours() + 1);
                    sc.setDate(date);
                    sc.setHeureDebut(time);
                } catch (ParseException ex) {
                    Logger.getLogger(SeanceController.class.getName()).log(Level.SEVERE, null, ex);
                }
                sc.setDuree(Float.parseFloat(request.getParameter("duree")));
                sc.setValide(true);
                sc.setTypeWithInt(Integer.parseInt(request.getParameter("type")));
                Enseignant e = new Enseignant();
                Matiere m = new Matiere();
                e.setId(Integer.parseInt(request.getParameter("enseignant")));
                m.setId(Integer.parseInt(request.getParameter("matiere")));
                sc.setMatiere(m);
                sc.setEnseignant(e);
                seanceService.update(sc);
                response.setContentType("application/json");
                String json = new Gson().toJson(sc);
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } else {
                System.out.println("Id Null");
            }
        } else if (action.equalsIgnoreCase("delete")) {
            if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
                int id = Integer.parseInt(request.getParameter("id"));
                seanceService.delete(id);
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
