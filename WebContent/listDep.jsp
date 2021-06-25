<%@page import="tn.iit.entities.Niveau"%>
<%@page import="tn.iit.entities.Matiere"%>
<%@page import="tn.iit.entities.Departement"%>
<%@page import="java.util.List"%>
<%@page import="tn.iit.entities.Enseignant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ include file="layout/header.jsp"%>
<div class="container-fluid">
    <h1 style="text-align: center;" >List des Départements</h1>
    <div class="row">
        <div class="col-sm-12">
            <button type="button" class="btn btn-primary addBtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"> <i class ="fa fa-plus"></i> Ajouter Matières</button>
            <table id="table_id" class="display" style="width: 100%;">
                <thead>
                    <tr class="header_table"
                        style="background: #3f3ffffc; color: white;">
                        <th style="text-align: center;">Id</th>
                        <th style="text-align: center;">Nom Departement</th>
                        <th style="text-align: center;">Enseignant Responsable</th>
                        <th style="text-align: center;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Departement> listDepartments = (List<Departement>) request.getAttribute("listDepartments");

                        for (Departement dep : listDepartments) { %>
                    <tr>
                        <td style="text-align: center;"><%  out.print(dep.getId());%></td>
                        <td style="text-align: center;"><%  out.print(dep.getLibelle());%></td>
                        <td style="text-align: center;"><%  out.print(dep.getEnsResponsable().getNom() + " " + dep.getEnsResponsable().getPrenom());%></td>
                        <td style="text-align: center;">
                            <div>
                                <a class="icoBtn icoBtn-edit" data-id="<%  out.print(dep.getId());%>" id="editDep" ><i class="fa fa-pencil-square-o"></i></a>
                                <a class="icoBtn icoBtn-remove" data-id="<%  out.print(dep.getId());%>" id="deleteDep" ><i class="fa fa-trash-o "></i></a>
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
                    <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;font-size: 25px;">Ajouter un Département</h5>
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
                                        <label for="recipient-name" class="col-form-label">Nom Département</label>
                                        <input type="text" class="form-control" id="libelle" name="libelle" placeholder="Nom Département">
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Enseignant Respensable</label>

                                        <select  class="form-control" id="ensResponsable" name="ensResponsable" >
                                            <option disabled selected > Selectionner l'enseignant Respensable </option>
                                            <%
                                                List<Enseignant> listEns = (List<Enseignant>) request.getAttribute("listEns");
                                                for (Enseignant ens : listEns) { %>
                                            <option value="<% out.print(ens.getId());%>" > <% out.print(ens.getNom() + " " + ens.getPrenom());%></option>
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
                    <button type="button" class="btn btn-primary" id="addMatiere">Ajouter Département</button>
                </div>
            </div>
        </div>
    </div>
    <!-- create  Modal Form -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;font-size: 25px;">Modifier un Département</h5>
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
                                        <label for="recipient-name" class="col-form-label">Nom Département</label>
                                        <input type="text" class="form-control" id="dlibelle" name="libelle" placeholder="Nom Département">
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Enseignant Respensable</label>

                                        <select  class="form-control" id="densResponsable" name="ensResponsable" >
                                            <option disabled selected > Selectionner l'enseignant Respensable </option>
                                            <%
                                                for (Enseignant ens : listEns) { %>
                                            <option value="<% out.print(ens.getId());%>" > <% out.print(ens.getNom() + " " + ens.getPrenom());%></option>
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
                    <button type="button" class="btn btn-primary" id="updateDep">Modifier Département</button>
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
            let departement = {
                libelle: $('#libelle').val(),
                ensResponsable: $('#ensResponsable').val(),
                action: "add"
            }
            let error = 0;
            if (departement.libelle.length < 1) {
                $('#libelle').after('<span class="errorSpan" style="color:red">Le Nom du département est vide</span>');
                error++;
            }
            if (!departement.ensResponsable) {
                $('#ensResponsable').after('<span class="errorSpan" style="color:red">Sélectionner le departement</span>');
                error++;
            }
            if (error > 0)
                return;
            $.ajax({
                method: 'POST',
                url: './Departement',
                data: departement,
                dataType: 'json',
                success: function (response) {
                    let res = response;
                    if (res.status !== "error") {
                        location.reload();
                    } else {
                        console.error("can't add Department");
                    }
                }
            });
        });
        //show Edit
        $(document).on('click', '#editDep', function () {
            let id = $(this).data('id');
            if (!id)
                return;
            let data = {
                id: id,
                action: "edit"
            };
            localStorage.clear("DepId")
            localStorage.setItem("DepId", id);
            $.ajax({
                url: './Departement',
                type: 'POST',
                data: data,
                dataType: 'json'
            }).done(function (response) {
                $('#editModal').modal('show');
                $('#dlibelle').val(response.libelle);
                $('#densResponsable').val(response.ensResponsable.id);
            }).fail(function () {});
        });
        /*Update*/
        $(document).on('click', '#updateDep', function () {
            $(".errorSpan").remove();
            let id = localStorage.getItem("DepId");
            if (!id)
                return;
            let departement = {
                id: id,
                libelle: $('#dlibelle').val(),
                ensResponsable: $('#densResponsable').val(),
                action: "update"
            }
            let error = 0;
            if (departement.libelle.length < 1) {
                $('#libelle').after('<span class="errorSpan" style="color:red">Le Nom du département est vide</span>');
                error++;
            }
            if (!departement.ensResponsable) {
                $('#ensResponsable').after('<span class="errorSpan" style="color:red">Sélectionner le departement</span>');
                error++;
            }
            if (error > 0)
                return;
            $.ajax({
                url: './Departement',
                type: 'POST',
                data: departement,
                dataType: 'json'
            }).done(function (response) {
                location.reload();
            }).fail(function () {});
        });
        //DELETE
        $(document).on('click', '#deleteDep', function () {
            let id = $(this).data('id');
            if (!id)
                return;
            let data = {
                id: id,
                action: "delete"
            }
            $.ajax({
                url: './Departement',
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
