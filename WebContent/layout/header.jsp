<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Gestion Enseignants </title>
        <!-- css import -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'>
        <link rel='stylesheet' href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- script import -->
        <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/style.css">

    </head>

    <body>
        <!-- partial:index.partial.html -->
        <div id="viewport">
            <!-- Sidebar -->
            <div id="sidebar">
                <header>
                    <a href="#">Gestion des Enseignant</a>
                </header>
                <ul class="nav">
                    <li>
                        <a href="./Enseignant">
                            <i class="fa fa-users"></i> Gestion des enseignants
                        </a>
                    </li>
                    <li>
                        <a href="./Matiere">
                            <i class="zmdi zmdi-view-dashboard"></i> Gestion des Matiéres
                        </a>
                    </li>
                    <li>
                        <a href="./Sceance">
                            <i class="fa fa-calendar-o"></i> Gestion des Scéances
                        </a>
                    </li>
                    <li>
                        <a href="./Departement">
                            <i class="fa fa-building-o"></i> Gestion des Departements
                        </a>
                    </li>
                    <li>
                        <a href="./Grade">
                            <i class="fa fa-id-badge"></i> Gestion des Grades
                        </a>
                    </li>
                    <li>
                        <a href="./Nivau">
                            <i class="fa fa-id-badge"></i> Gestion des Niveau
                        </a>
                    </li>
                </ul>
            </div>
            <!-- Content -->
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#"><i class="zmdi zmdi-notifications text-danger"></i>
                                </a>
                            </li>
                            <li><a href="#"><% out.print(session.getAttribute("login"));%></a></li>
                            <li><a href="./Login?action=logout">Logout</a></li>
                        </ul>
                    </div>
                </nav>