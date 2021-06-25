<%@page import="tn.iit.entities.Niveau"%>
<%@page import="tn.iit.entities.Matiere"%>
<%@page import="tn.iit.entities.Departement"%>
<%@page import="java.util.List"%>
<%@page import="tn.iit.entities.Enseignant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ include file="layout/header.jsp"%>
<div class="container-fluid">
    <h1 style="text-align: center;" >List des Matières de l'enseignant</h1>
    <div class="row">
        <div class="col-sm-12">
            <button type="button" class="btn btn-primary addBtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"> <i class ="fa fa-plus"></i> Ajouter Matières</button>
            <table id="table_id" class="display" style="width: 100%;">
                <thead>
                    <tr class="header_table"
                        style="background: #3f3ffffc; color: white;">
                        <th style="text-align: center;">Id</th>
                        <th style="text-align: center;">Matiere</th>
                        <th style="text-align: center;">Niveau</th>
                        <th style="text-align: center;">ChargeCours</th>
                        <th style="text-align: center;">ChargeTd</th>
                        <th style="text-align: center;">ChargeTp</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Matiere> listMat = (List<Matiere>) request.getAttribute("listMatiere");

                        for (Matiere matiere : listMat) { %>
                    <tr>
                        <td style="text-align: center;"><%  out.print(matiere.getId());%></td>
                        <td style="text-align: center;"><%  out.print(matiere.getLibelle());%></td>
                        <td style="text-align: center;"><%  out.print(matiere.getNiveau().getLibelle());%></td>
                        <td style="text-align: center;"><%  out.print(matiere.getChargeCours());%></td>
                        <td style="text-align: center;"><%  out.print(matiere.getChargeTd());%></td>
                        <td style="text-align: center;"><%  out.print(matiere.getChargeTp());%></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </div>

</div>
<script>
    $(function () {
        $("#table_id").DataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.10.25/i18n/French.json"
            },
            "paging": true,
            "lengthChange": false,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
            "columnDefs": [{
                    "className": "dt-c",
                    "targets": "_all"
                }]
        })

    });
</script>
<%@ include file="layout/footer.jsp"%>
