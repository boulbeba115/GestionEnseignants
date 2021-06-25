<%@page import="tn.iit.entities.Departement"%>
<%@page import="tn.iit.entities.Grade"%>
<%@page import="java.util.List"%>
<%@page import="tn.iit.entities.Enseignant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ include file="layout/header.jsp"%>
<div class="container-fluid">
    <h1 style="text-align: center;" >List des Enseignant</h1>
    <div class="row">
        <div class="col-sm-12">
            <button type="button" class="btn btn-primary addBtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"> <i class ="fa fa-plus"></i> Ajouter Enseignant</button>
            <table id="table_id" class="display" style="width: 100%;">
                <thead>
                    <tr class="header_table"
                        style="background: #3f3ffffc; color: white;">
                        <th style="text-align: center;">Id</th>
                        <th style="text-align: center;">Nom</th>
                        <th style="text-align: center;">Cin</th>
                        <th style="text-align: center;">Email</th>
                        <th style="text-align: center;">Phone</th>
                        <th style="text-align: center;">Adresse</th>
                        <th style="text-align: center;">Grade</th>
                        <th style="text-align: center;">Departement</th>
                        <th style="text-align: center;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Enseignant> listEns = (List<Enseignant>) request.getAttribute("listEns");

                        for (Enseignant ens : listEns) { %>
                    <tr>
                        <td style="text-align: center;"><%  out.print(ens.getId());%></td>
                        <td style="text-align: center;"><%  out.print(ens.getNom() + " " + ens.getPrenom());%></td>
                        <td style="text-align: center;"><%  out.print(ens.getCin());%></td>
                        <td style="text-align: center;"><%  out.print(ens.getEmail());%></td>
                        <td style="text-align: center;"><%  out.print(ens.getPhone());%></td>
                        <td style="text-align: center;"><%  out.print(ens.getAdresse());%></td>
                        <td style="text-align: center;"><%  out.print(ens.getGrade().getLibelle());%></td>
                        <td style="text-align: center;"><%  out.print(ens.getDepartement().getLibelle());%></td>
                        <td style="text-align: center;">
                            <div>
                                <a href="<% out.print("./Enseignant?action=listMat&id=" + ens.getId());%> " class="icoBtn fa fa-eye"></a>
                                <a class="icoBtn icoBtn-edit" data-id="<%  out.print(ens.getId());%>" id="editEns" ><i class="fa fa-pencil-square-o"></i></a>
                                <a class="icoBtn icoBtn-remove" data-id="<%  out.print(ens.getId());%>" id="deleteEns" ><i class="fa fa-trash-o "></i></a>
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
                    <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;font-size: 25px;">Ajouter un Enseignant</h5>
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
                                        <label for="recipient-name" class="col-form-label">Nom</label>
                                        <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Prenom</label>
                                        <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Prenom">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Cin</label>
                                        <input type="text" class="form-control" id="cin" name="cin" placeholder="Cin">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Numéro Téléphone</label>
                                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Numéro Téléphone">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Nom d'utilisateur</label>
                                        <input type="text" class="form-control" id="login" name="login" placeholder="Nom d'utilisateur">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Mot de pass</label>
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Mot de pass">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Adresse</label>
                                        <input type="text" class="form-control" id="adresse" name="adresse" placeholder="Adresse">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Grade</label>

                                        <select  class="form-control" id="grade" name="grade" >
                                            <option disabled selected > Selectionner la grade </option>
                                            <%
                                                List<Grade> listGrade = (List<Grade>) request.getAttribute("listGrade");
                                                for (Grade grade : listGrade) { %>
                                            <option value="<% out.print(grade.getId());%>" > <% out.print(grade.getLibelle());%></option>
                                            <% }%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Département</label>
                                        <select class="form-control" id="departemenet" name="departemenet" >
                                            <option disabled selected > Selectionner la grade </option>
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
                    <button type="button" class="btn btn-primary" id="addArticle">Ajouter Enseignant</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Edit  Modal Form -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;font-size: 25px;">Modifier l'enseignant</h5>
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
                                        <label for="recipient-name" class="col-form-label">Nom</label>
                                        <input type="text" class="form-control" id="enom" name="nom" placeholder="Nom">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Prenom</label>
                                        <input type="text" class="form-control" id="eprenom" name="prenom" placeholder="Prenom">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Cin</label>
                                        <input type="text" class="form-control" id="ecin" name="cin" placeholder="Cin">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Numéro Téléphone</label>
                                        <input type="text" class="form-control" id="ephone" name="phone" placeholder="Numéro Téléphone">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Adresse</label>
                                        <input type="text" class="form-control" id="eadresse" name="adresse" placeholder="Adresse">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Grade</label>

                                        <select  class="form-control" id="egrade" name="grade" >
                                            <option disabled selected > Selectionner la grade </option>
                                            <%
                                                for (Grade grade : listGrade) { %>
                                            <option value="<% out.print(grade.getId());%>" > <% out.print(grade.getLibelle());%></option>
                                            <% }%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Département</label>
                                        <select class="form-control" id="edepartemenet" name="departemenet" >
                                            <option disabled selected > Selectionner la grade </option>
                                            <%
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
                    <button type="button" class="btn btn-primary" id="updateEns">Modifier Enseignant</button>
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
        $("#addArticle").click(function () {
            $(".errorSpan").remove();
            let enseignant = {
                cin: $('#cin').val(),
                prenom: $('#prenom').val(),
                nom: $('#nom').val(),
                adresse: $('#adresse').val(),
                email: $('#email').val(),
                phone: $('#phone').val(),
                login: $('#login').val(),
                password: $('#password').val(),
                grade: $('#grade').val(),
                departement: $('#departemenet').val(),
                action: "add"
            }
            let error = 0;
            if (enseignant.cin.length < 1) {
                $('#cin').after('<span class="errorSpan" style="color:red">Le Cin est vide</span>');
                error++
            }
            if (enseignant.nom.length < 1) {
                $('#nom').after('<span class="errorSpan" style="color:red">Le nom est vide</span>');
                error++
            }
            if (enseignant.prenom.length < 1) {
                $('#prenom').after('<span class="errorSpan" style="color:red">Le prenom est vide</span>');
                error++
            }
            if (enseignant.adresse.length < 1) {
                $('#adresse').after('<span class="errorSpan" style="color:red">L\'adresse est vide</span>');
                error++
            }
            if (enseignant.email.length < 1) {
                $('#email').after('<span class="errorSpan" style="color:red">L\email est vide</span>');
                error++
            }
            if (enseignant.phone.length < 1) {
                $('#phone').after('<span class="errorSpan" style="color:red">Le numéro du téléphone est vide</span>');
                error++
            }
            if (enseignant.phone.length < 1) {
                $('#login').after('<span class="errorSpan" style="color:red">Le nom d\'utilisateur est vide</span>');
                error++
            }
            if (enseignant.password.length < 1) {
                $('#password').after('<span class="errorSpan" style="color:red">La mot de pass est vide</span>');
                error++
            }
            if (!enseignant.grade) {
                $('#grade').after('<span class="errorSpan" style="color:red">Selectionner la grade</span>');
                error++
            }
            if (!enseignant.departement) {
                $('#departemenet').after('<span class="errorSpan" style="color:red">Selectionner le departement</span>');
                error++
            }

            if (error > 0)
                return
            $.ajax({
                method: 'POST',
                url: './Enseignant',
                data: enseignant,
                dataType: 'json',
                success: function (response) {
                    let res = response
                    if (res.status != "error") {
                        location.reload();
                    } else {
                        console.error("can't add article")
                    }
                }
            })
        })
        //show Edit
        $(document).on('click', '#editEns', function () {
            let id = $(this).data('id');
            if (!id)
                return;
            let data = {
                id: id,
                action: "edit"
            };
            localStorage.clear("EnsId")
            localStorage.setItem("EnsId", id);
            $.ajax({
                url: './Enseignant',
                type: 'POST',
                data: data,
                dataType: 'json'
            }).done(function (response) {
                $('#editModal').modal('show');
                $('#ecin').val(response.cin);
                $('#eprenom').val(response.prenom);
                $('#enom').val(response.nom);
                $('#ephone').val(response.phone);
                $('#eadresse').val(response.adresse);
                $('#egrade').val(response.grade.id);
                $('#edepartemenet').val(response.departement.id);
            }).fail(function () {});
        });
        /*Update*/
        $(document).on('click', '#updateEns', function () {
            $(".errorSpan").remove();
            let id = localStorage.getItem("EnsId");
            if (!id)
                return;
            let data = {
                id: id,
                cin: $('#ecin').val(),
                prenom: $('#eprenom').val(),
                nom: $('#enom').val(),
                phone: $('#ephone').val(),
                adresse: $('#eadresse').val(),
                grade: $('#egrade').val(),
                departement: $('#edepartemenet').val(),
                action: "update"
            };
            let error = 0;
            if (data.cin.length < 1) {
                $('#ecin').after('<span class="errorSpan" style="color:red">Le Cin est vide</span>');
                error++;
            }
            if (data.nom.length < 1) {
                $('#enom').after('<span class="errorSpan" style="color:red">Le nom est vide</span>');
                error++;
            }
            if (data.prenom.length < 1) {
                $('#eperenom').after('<span class="errorSpan" style="color:red">Le prenom est vide</span>');
                error++;
            }
            if (data.phone.length < 1) {
                $('#ephone').after('<span class="errorSpan" style="color:red">Le numéro du téléphone est vide</span>');
                error++;
            }
            if (!data.grade) {
                $('#egrade').after('<span class="errorSpan" style="color:red">Selectionner la grade</span>');
                error++;
            }
            if (!data.departement) {
                $('#edepartemenet').after('<span class="errorSpan" style="color:red">Selectionner le departement</span>');
                error++;
            }

            if (error > 0)
                return;
            $.ajax({
                url: './Enseignant',
                type: 'POST',
                data: data,
                dataType: 'json'
            }).done(function (response) {
                location.reload();
            }).fail(function () {});
        });
        //DELETE
        $(document).on('click', '#deleteEns', function () {
            let id = $(this).data('id');
            if (!id)
                return;
            let data = {
                id: id,
                action: "delete"
            }
            $.ajax({
                url: './Enseignant',
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
