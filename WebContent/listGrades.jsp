<%@page import="tn.iit.entities.Grade"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ include file="layout/header.jsp"%>
<div class="container-fluid">
    <h1 style="text-align: center;" >List des Grades</h1>
    <div class="row">
        <div class="col-sm-12">
            <button type="button" class="btn btn-primary addBtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"> <i class ="fa fa-plus"></i> Ajouter une Grade</button>
            <table id="table_id" class="display" style="width: 100%;">
                <thead>
                    <tr class="header_table"
                        style="background: #3f3ffffc; color: white;">
                        <th style="text-align: center;">Id</th>
                        <th style="text-align: center;">Grade</th>
                        <th style="text-align: center;">Prix heure Cour</th>
                        <th style="text-align: center;">Prix heure TD</th>
                        <th style="text-align: center;">Prix heure TP</th>
                        <th style="text-align: center;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Grade> listGrades = (List<Grade>) request.getAttribute("listGrades");

                        for (Grade grade : listGrades) { %>
                    <tr>
                        <td style="text-align: center;"><%  out.print(grade.getId());%></td>
                        <td style="text-align: center;"><%  out.print(grade.getLibelle());%></td>
                        <td style="text-align: center;"><%  out.print(grade.getPrixC());%></td>
                        <td style="text-align: center;"><%  out.print(grade.getPrixTd());%></td>
                        <td style="text-align: center;"><%  out.print(grade.getPrixTp());%></td>
                        <td style="text-align: center;">
                            <div>
                                <a class="icoBtn icoBtn-edit" data-id="<%  out.print(grade.getId());%>" id="editGrade" ><i class="fa fa-pencil-square-o"></i></a>
                                <a class="icoBtn icoBtn-remove" data-id="<%  out.print(grade.getId());%>" id="deleteGrade" ><i class="fa fa-trash-o "></i></a>
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
                    <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;font-size: 25px;">Ajouter une Grade</h5>
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
                                        <label for="recipient-name" class="col-form-label">Nom Grade</label>
                                        <input type="text" class="form-control" id="libelle" name="libelle" placeholder="Nom Département">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Prix Heure Cour</label>
                                        <input type="number" min="0" class="form-control" id="prixC" name="prixC" placeholder="Prix Heure Cour">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Prix Heure TD</label>
                                        <input type="number" min="0" class="form-control" id="prixTd" name="prixTd" placeholder="Prix Heure TD">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Prix Heure Cour</label>
                                        <input type="number" min="0" class="form-control" id="prixTp" name="prixTp" placeholder="Prix Heure Cour">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="closebtn" data-dismiss="modal">Fermer</button>
                    <button type="button" class="btn btn-primary" id="addGrade">Ajouter Grade</button>
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
                                        <label for="recipient-name" class="col-form-label">Nom Grade</label>
                                        <input type="text" class="form-control" id="glibelle" name="libelle" placeholder="Nom Département">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Prix Heure Cour</label>
                                        <input type="number" min="0" class="form-control" id="gprixC" name="prixC" placeholder="Prix Heure Cour">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Prix Heure TD</label>
                                        <input type="number" min="0" class="form-control" id="gprixTd" name="prixTd" placeholder="Prix Heure TD">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Prix Heure Cour</label>
                                        <input type="number" min="0" class="form-control" id="gprixTp" name="prixTp" placeholder="Prix Heure Cour">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="closebtn" data-dismiss="modal">Fermer</button>
                    <button type="button" class="btn btn-primary" id="updateGrade">Modifier Grade</button>
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
        $("#addGrade").click(function () {
            $(".errorSpan").remove();
            let grade = {
                libelle: $('#libelle').val(),
                prixC: $('#prixC').val(),
                prixTd: $('#prixTd').val(),
                prixTp: $('#prixTp').val(),
                action: "add"
            }
            let error = 0;
            if (grade.libelle.length < 1) {
                $('#libelle').after('<span class="errorSpan" style="color:red">Le nom du grade est vide</span>');
                error++;
            }
            if (grade.prixC.length < 1) {
                $('#prixC').after('<span class="errorSpan" style="color:red">Le Prix du Cour est vide</span>');
                error++;
            }
            if (grade.prixTd.length < 1) {
                $('#prixTd').after('<span class="errorSpan" style="color:red">Le Prix du TD est vide</span>');
                error++;
            }
            if (grade.prixTp.length < 1) {
                $('#prixTp').after('<span class="errorSpan" style="color:red">Le Prix du TP est vide</span>');
                error++;
            }
            if (error > 0)
                return;

            $.ajax({
                method: 'POST',
                url: './Grade',
                data: grade,
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
        $(document).on('click', '#editGrade', function () {
            let id = $(this).data('id');
            if (!id)
                return;
            let data = {
                id: id,
                action: "edit"
            };
            localStorage.clear("GradeId")
            localStorage.setItem("GradeId", id);
            $.ajax({
                url: './Grade',
                type: 'POST',
                data: data,
                dataType: 'json'
            }).done(function (response) {
                $('#editModal').modal('show');
                $('#glibelle').val(response.libelle);
                $('#gprixC').val(response.prixC);
                $('#gprixTd').val(response.prixTd);
                $('#gprixTp').val(response.prixTp);
            }).fail(function () {});
        });
        /*Update*/
        $(document).on('click', '#updateGrade', function () {
            $(".errorSpan").remove();
            let id = localStorage.getItem("GradeId");
            if (!id)
                return;
            let grade = {
                id: id,
                libelle: $('#glibelle').val(),
                prixC: $('#gprixC').val(),
                prixTd: $('#gprixTd').val(),
                prixTp: $('#gprixTp').val(),
                action: "update"
            }
            let error = 0;
            if (grade.libelle.length < 1) {
                $('#glibelle').after('<span class="errorSpan" style="color:red">La libelle est vide</span>');
                error++;
            }
            if (grade.prixC.length < 1) {
                $('#gprixC').after('<span class="errorSpan" style="color:red">Le Prix du Cour est vide</span>');
                error++;
            }
            if (grade.prixTd.length < 1) {
                $('#gprixTd').after('<span class="errorSpan" style="color:red">Le Prix du TD est vide</span>');
                error++;
            }
            if (grade.prixTp.length < 1) {
                $('#gprixTp').after('<span class="errorSpan" style="color:red">Le Prix du TP est vide</span>');
                error++;
            }
            if (error > 0)
                return;
            $.ajax({
                url: './Grade',
                type: 'POST',
                data: grade,
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
                url: './Grade',
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
