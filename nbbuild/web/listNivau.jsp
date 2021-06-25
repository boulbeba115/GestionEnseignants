<%@page import="tn.iit.entities.Niveau"%>
<%@page import="tn.iit.entities.Grade"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ include file="layout/header.jsp"%>
<div class="container-fluid">
    <h1 style="text-align: center;" >List des Niveaux</h1>
    <div class="row">
        <div class="col-sm-12">
            <button type="button" class="btn btn-primary addBtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"> <i class ="fa fa-plus"></i> Ajouter une Grade</button>
            <table id="table_id" class="display" style="width: 100%;">
                <thead>
                    <tr class="header_table"
                        style="background: #3f3ffffc; color: white;">
                        <th style="text-align: center;">Id</th>
                        <th style="text-align: center;">Niveau</th>
                        <th style="text-align: center;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Niveau> listNiveau = (List<Niveau>) request.getAttribute("listNiveau");

                        for (Niveau niveau : listNiveau) { %>
                    <tr>
                        <td style="text-align: center;"><%  out.print(niveau.getId());%></td>
                        <td style="text-align: center;"><%  out.print(niveau.getLibelle());%></td>
                        <td style="text-align: center;">
                            <div>
                                <a class="icoBtn icoBtn-edit" data-id="<%  out.print(niveau.getId());%>" id="editNiv" ><i class="fa fa-pencil-square-o"></i></a>
                                <a class="icoBtn icoBtn-remove" data-id="<%  out.print(niveau.getId());%>" id="deleteNiv" ><i class="fa fa-trash-o "></i></a>
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
                    <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;font-size: 25px;">Ajouter un Niveau</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Niveau</label>
                                    <input type="text" class="form-control" id="libelle" name="libelle" placeholder="Nom Département">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="closebtn" data-dismiss="modal">Fermer</button>
                    <button type="button" class="btn btn-primary" id="addNiv">Ajouter Niveau</button>
                </div>
            </div>
        </div>
    </div>
    <!-- create  Modal Form -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;font-size: 25px;">Modifier un Niveau</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Niveau</label>
                                    <input type="text" class="form-control" id="nlibelle" name="libelle" placeholder="Nom Département">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="closebtn" data-dismiss="modal">Fermer</button>
                    <button type="button" class="btn btn-primary" id="updateNiv">Modifier Niveau</button>
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
        $("#addNiv").click(function () {
            $(".errorSpan").remove();
            let niveau = {
                libelle: $('#libelle').val(),
                action: "add"
            }
            let error = 0;
            if (niveau.libelle.length < 1) {
                $('#libelle').after('<span class="errorSpan" style="color:red">La libelle du niveau est vide</span>');
                error++;
            }
            if (error > 0)
                return;
            $.ajax({
                method: 'POST',
                url: './Nivau',
                data: niveau,
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
        $(document).on('click', '#editNiv', function () {
            let id = $(this).data('id');
            if (!id)
                return;
            let data = {
                id: id,
                action: "edit"
            };
            localStorage.clear("NivId")
            localStorage.setItem("NivId", id);
            $.ajax({
                url: './Nivau',
                type: 'POST',
                data: data,
                dataType: 'json'
            }).done(function (response) {
                $('#editModal').modal('show');
                $('#nlibelle').val(response.libelle);
            }).fail(function () {});
        });
        /*Update*/
        $(document).on('click', '#updateNiv', function () {
            $(".errorSpan").remove();
            let id = localStorage.getItem("NivId");
            if (!id)
                return;
            let niveau = {
                id: id,
                libelle: $('#nlibelle').val(),
                action: "update"
            }
            let error = 0;
            if (niveau.libelle.length < 1) {
                $('#glibelle').after('<span class="errorSpan" style="color:red">La libelle du niveau est vide</span>');
                error++;
            }
            if (error > 0)
                return;
            $.ajax({
                url: './Nivau',
                type: 'POST',
                data: niveau,
                dataType: 'json'
            }).done(function (response) {
                location.reload();
            }).fail(function () {});
        });
        //DELETE
        $(document).on('click', '#deleteGrade', function () {
            let id = $(this).data('id');
            if (!id)
                return;
            let data = {
                id: id,
                action: "delete"
            }
            $.ajax({
                url: './Nivau',
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
