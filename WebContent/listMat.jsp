<%@page import="tn.iit.entities.Niveau"%>
<%@page import="tn.iit.entities.Matiere"%>
<%@page import="tn.iit.entities.Departement"%>
<%@page import="tn.iit.entities.Grade"%>
<%@page import="java.util.List"%>
<%@page import="tn.iit.entities.Enseignant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ include file="layout/header.jsp"%>
<div class="container-fluid">
    <h1 style="text-align: center;" >List des Matières</h1>
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
                        <th style="text-align: center;">Dpartment</th>
                        <th style="text-align: center;">ChargeCours</th>
                        <th style="text-align: center;">ChargeTd</th>
                        <th style="text-align: center;">ChargeTp</th>
                        <th style="text-align: center;">Action</th>
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
                        <td style="text-align: center;"><%  out.print(matiere.getDepartment().getLibelle());%></td>
                        <td style="text-align: center;"><%  out.print(matiere.getChargeCours());%></td>
                        <td style="text-align: center;"><%  out.print(matiere.getChargeTd());%></td>
                        <td style="text-align: center;"><%  out.print(matiere.getChargeTp());%></td>
                        <td style="text-align: center;">
                            <div>
                                <a class="icoBtn icoBtn-edit" data-id="<%  out.print(matiere.getId());%>" id="editMat" ><i class="fa fa-pencil-square-o"></i></a>
                                <a class="icoBtn icoBtn-remove" data-id="<%  out.print(matiere.getId());%>" id="deleteMat" ><i class="fa fa-trash-o "></i></a>
                            </div>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </div>
    <!-- create  Modal Form -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;font-size: 25px;">Ajouter une Matiére</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Matiere</label>
                                        <input type="text" class="form-control" id="libelle" name="libelle" placeholder="libelle">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Charge du Cour</label>
                                        <input type="number" min = "0" class="form-control" id="chargeCours" name="chargeCours" placeholder="Charge du Cour">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Charge du Td</label>
                                        <input type="number" min = "0" class="form-control" id="chargeTd" name="chargeTd" placeholder="Charge du TD">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Charge du TP</label>
                                        <input type="number" min = "0" class="form-control" id="chargeTp" name="chargeTp" placeholder="Charge du TP">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Niveau</label>

                                        <select  class="form-control" id="niveau" name="niveau" >
                                            <option disabled selected > Selectionner le niveau </option>
                                            <%
                                                List<Niveau> lisNiveaux = (List<Niveau>) request.getAttribute("lisNiveaux");
                                                for (Niveau niveau : lisNiveaux) { %>
                                            <option value="<% out.print(niveau.getId());%>" > <% out.print(niveau.getLibelle());%></option>
                                            <% }%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Département</label>
                                        <select class="form-control" id="departement" name="departement" >
                                            <option disabled selected > Selectionner le departement </option>
                                            <%
                                                List<Departement> listDepartments = (List<Departement>) request.getAttribute("listDepartments");
                                                for (Departement dept : listDepartments) { %>
                                            <option value="<% out.print(dept.getId());%>" > <% out.print(dept.getLibelle());%></option>
                                            <% }%>

                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="closebtn" data-dismiss="modal">Fermer</button>
                    <button type="button" class="btn btn-primary" id="addMatiere">Ajouter Matières</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Edit  Modal Form -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;font-size: 25px;">Modifier la Matiére</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Matiere</label>
                                        <input type="text" class="form-control" id="mlibelle" name="mlibelle" placeholder="libelle">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Charge du Cour</label>
                                        <input type="number" min = "0" class="form-control" id="mchargeCours" name="mchargeCours" placeholder="Charge du Cour">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Charge du Td</label>
                                        <input type="number" min = "0" class="form-control" id="mchargeTd" name="mchargeTd" placeholder="Charge du TD">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Charge du TP</label>
                                        <input type="number" min = "0" class="form-control" id="mchargeTp" name="mchargeTp" placeholder="Charge du TP">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Niveau</label>

                                        <select  class="form-control" id="mniveau" name="mniveau" >
                                            <option disabled selected > Selectionner le niveau </option>
                                            <% for (Niveau niveau : lisNiveaux) { %>
                                            <option value="<% out.print(niveau.getId());%>" > <% out.print(niveau.getLibelle());%></option>
                                            <% }%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Département</label>
                                        <select class="form-control" id="mdepartement" name="mdepartement" >
                                            <option disabled selected > Selectionner la grade </option>
                                            <% for (Departement dept : listDepartments) { %>
                                            <option value="<% out.print(dept.getId());%>" > <% out.print(dept.getLibelle());%></option>
                                            <% }%>

                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="closebtn" data-dismiss="modal">Fermer</button>
                    <button type="button" class="btn btn-primary" id="updateMat" >Modifier Matéire</button>
                </div>
            </div>
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
<script>
    $(document).ready(function () {
        /*ADD*/
        $("#addMatiere").click(function () {
            $(".errorSpan").remove();
            let matiere = {
                libelle: $('#libelle').val(),
                chargeCours: $('#chargeCours').val(),
                chargeTd: $('#chargeTd').val(),
                chargeTp: $('#chargeTp').val(),
                departement: $('#departement').val(),
                niveau: $('#niveau').val(),
                action: "add"
            }
            let error = 0;
            if (matiere.libelle.length < 1) {
                $('#libelle').after('<span class="errorSpan" style="color:red">La libelle est vide</span>');
                error++;
            }
            if (matiere.chargeCours.length < 1) {
                $('#chargeCours').after('<span class="errorSpan" style="color:red">La charge horaire du cours est vide</span>');
                error++;
            }
            if (matiere.chargeTp.length < 1) {
                $('#chargeTp').after('<span class="errorSpan" style="color:red">La charge horaire du Tp est vide</span>');
                error++;
                ;
            }
            if (matiere.chargeTd.length < 1) {
                $('#chargeTd').after('<span class="errorSpan" style="color:red">La charge horaire du Td est vide</span>');
                error++;
            }
            if (!matiere.niveau) {
                $('#niveau').after('<span class="errorSpan" style="color:red">Selectionner le niveau </span>');
                error++;
            }
            if (!matiere.departement) {
                $('#departement').after('<span class="errorSpan" style="color:red">Selectionner le departement</span>');
                error++;
            }

            if (error > 0)
                return;
            $.ajax({
                method: 'POST',
                url: './Matiere',
                data: matiere,
                dataType: 'json',
                success: function (response) {
                    let res = response;
                    if (res.status !== "error") {
                        location.reload();
                    } else {
                        console.error("can't add Sceance");
                    }
                }
            });
        });
        //show Edit
        $(document).on('click', '#editMat', function () {
            let id = $(this).data('id');
            if (!id)
                return;
            let data = {
                id: id,
                action: "edit"
            };
            localStorage.clear("MatId")
            localStorage.setItem("MatId", id);
            $.ajax({
                url: './Matiere',
                type: 'POST',
                data: data,
                dataType: 'json'
            }).done(function (response) {
                $('#editModal').modal('show');
                $('#mlibelle').val(response.libelle);
                $('#mchargeCours').val(response.chargeCours);
                $('#mchargeTd').val(response.chargeTd);
                $('#mchargeTp').val(response.chargeTp);
                $('#mdepartement').val(response.department.id);
                $('#mniveau').val(response.Niveau.id);
            }).fail(function () {});
        });
        /*Update*/
        $(document).on('click', '#updateMat', function () {
            $(".errorSpan").remove();
            let id = localStorage.getItem("MatId");
            if (!id)
                return;
            let matiere = {
                id: id,
                libelle: $('#mlibelle').val(),
                chargeCours: $('#mchargeCours').val(),
                chargeTd: $('#mchargeTd').val(),
                chargeTp: $('#mchargeTp').val(),
                departement: $('#mdepartement').val(),
                niveau: $('#mniveau').val(),
                action: "update"
            };
            let error = 0;
            if (matiere.libelle.length < 1) {
                $('#mlibelle').after('<span class="errorSpan" style="color:red">La libelle est vide</span>');
                error++;
            }
            if (matiere.chargeCours.length < 1) {
                $('#mchargeCours').after('<span class="errorSpan" style="color:red">La charge horaire du cours est vide</span>');
                error++;
            }
            if (matiere.chargeTp.length < 1) {
                $('#mchargeTp').after('<span class="errorSpan" style="color:red">La charge horaire du Tp est vide</span>');
                error++;
                ;
            }
            if (matiere.chargeTd.length < 1) {
                $('#mchargeTd').after('<span class="errorSpan" style="color:red">La charge horaire du Td est vide</span>');
                error++;
            }
            if (!matiere.niveau) {
                $('#mniveau').after('<span class="errorSpan" style="color:red">Selectionner le niveau </span>');
                error++;
            }
            if (!matiere.departement) {
                $('#mdepartement').after('<span class="errorSpan" style="color:red">Selectionner le departement</span>');
                error++;
            }

            if (error > 0)
                return;
            $.ajax({
                url: './Matiere',
                type: 'POST',
                data: matiere,
                dataType: 'json'
            }).done(function (response) {
                location.reload();
            }).fail(function () {});
        });
        //DELETE
        $(document).on('click', '#deleteMat', function () {
            let id = $(this).data('id');
            if (!id)
                return;
            let data = {
                id: id,
                action: "delete"
            }
            $.ajax({
                url: './Matiere',
                type: 'POST',
                data: data,
                dataType: 'json'
            }).done(function (response) {
                location.reload();
            }).fail(function () {});
        })
        //close Modal Clear
        $("#closebtn").click(function () {
            $(".errorSpan").remove();
        })
    });

</script>
<%@ include file="layout/footer.jsp"%>
