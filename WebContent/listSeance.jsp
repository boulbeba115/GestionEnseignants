<%@page import="java.text.SimpleDateFormat"%>
<%@page import="tn.iit.entities.Seance"%>
<%@page import="tn.iit.entities.Matiere"%>
<%@page import="java.util.List"%>
<%@page import="tn.iit.entities.Enseignant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ include file="layout/header.jsp"%>
<div class="container-fluid">
    <h1 style="text-align: center;" >List des Seances</h1>
    <div class="row">
        <div class="col-sm-12">
            <button type="button" class="btn btn-primary addBtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"> <i class ="fa fa-plus"></i> Ajouter Seance</button>
            <table id="table_id" class="display" style="width: 100%;">
                <thead>
                    <tr class="header_table"
                        style="background: #3f3ffffc; color: white;">
                        <th style="text-align: center;">Id</th>
                        <th style="text-align: center;">Matiere</th>
                        <th style="text-align: center;">Date</th>
                        <th style="text-align: center;">Heure de début</th>
                        <th style="text-align: center;">Duré en Heure</th>
                        <th style="text-align: center;">Type</th>
                        <th style="text-align: center;">Validité</th>
                        <th style="text-align: center;">Enseignant</th>
                        <th style="text-align: center;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Seance> listSeances = (List<Seance>) request.getAttribute("listSeances");

                        for (Seance sc : listSeances) { %>
                    <tr>
                        <td style="text-align: center;"><%  out.print(sc.getId());%></td>
                        <td style="text-align: center;"><%  out.print(sc.getMatiere().getLibelle());%></td>
                        <td style="text-align: center;"><%  out.print(sc.getDate());%></td>
                        <td style="text-align: center;"><%  out.print(sc.getHeureDebut().getHours() + " : " + sc.getHeureDebut().getMinutes());%></td>
                        <td style="text-align: center;"><%  out.print(sc.getDuree());%></td>
                        <td style="text-align: center;"><%  out.print(sc.getType());%></td>
                        <td style="text-align: center;"><%  out.print(sc.isValide() ? "valide" : "non Valide");%></td>
                        <td style="text-align: center;"><%  out.print(sc.getEnseignant().getNom() + " " + sc.getEnseignant().getPrenom());%></td>
                        <td style="text-align: center;">
                            <div>
                                <a class="icoBtn icoBtn-edit" data-id="<%  out.print(sc.getId());%>" id="editSc" ><i class="fa fa-pencil-square-o"></i></a>
                                <a class="icoBtn icoBtn-remove" data-id="<%  out.print(sc.getId());%>" id="deleteSc" ><i class="fa fa-trash-o "></i></a>
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
                    <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;font-size: 25px;">Ajouter une Seance</h5>
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
                                        <label for="recipient-name" class="col-form-label">Matiére</label>

                                        <select  class="form-control" id="matiere" name="matiere" >
                                            <option disabled selected > Selectionner la Matiere </option>
                                            <%
                                                List<Matiere> listMat = (List<Matiere>) request.getAttribute("listMat");
                                                for (Matiere matiere : listMat) { %>
                                            <option value="<% out.print(matiere.getId());%>" > <% out.print(matiere.getLibelle());%></option>
                                            <% }%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Selectionner l'enseignant</label>
                                        <select class="form-control" id="enseignant" name="enseignant" >
                                            <option disabled selected > Selectionner l'enseignant </option>
                                            <%
                                                List<Enseignant> listEns = (List<Enseignant>) request.getAttribute("listEns");
                                                for (Enseignant ens : listEns) { %>
                                            <option value="<% out.print(ens.getId());%>" > <% out.print(ens.getNom() + " " + ens.getPrenom());%></option>
                                            <% }%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Date du Seance</label>
                                        <input type="date" min = "0" class="form-control" id="date" name="date" placeholder="dateSceance">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Heure du Début</label>
                                        <input type="time" min = "0" class="form-control" id="heureDebut" name="heureDebut" placeholder="Heure de Début">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Durée</label>
                                        <input type="number" min = "0" class="form-control" id="duree" name="duree" placeholder="Durét">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Selectionner le Type </label>
                                        <select class="form-control" id="type" name="type" >
                                            <option disabled selected > Selectionner le type seance </option>
                                            <option  value="0" > Cour</option>
                                            <option  value="1"> TD</option>
                                            <option  value="2"> TP </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="closebtn" data-dismiss="modal">Fermer</button>
                    <button type="button" class="btn btn-primary" id="addSeance">Ajouter Seance</button>
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
                                        <label for="recipient-name" class="col-form-label">Matiére</label>

                                        <select  class="form-control" id="smatiere" name="matiere" >
                                            <option disabled selected > Modifier la Seance </option>
                                            <% for (Matiere matiere : listMat) { %>
                                            <option value="<% out.print(matiere.getId());%>" > <% out.print(matiere.getLibelle());%></option>
                                            <% }%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Selectionner l'enseignant</label>
                                        <select class="form-control" id="senseignant" name="enseignant" >
                                            <option disabled selected > Selectionner l'enseignant </option>
                                            <% for (Enseignant ens : listEns) { %>
                                            <option value="<% out.print(ens.getId());%>" > <% out.print(ens.getNom() + " " + ens.getPrenom());%></option>
                                            <% }%>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Date du Seance</label>
                                        <input type="date" min = "0" class="form-control" id="sdate" name="date" placeholder="dateSceance">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Heure du Début</label>
                                        <input type="time" min = "0" class="form-control" id="sheureDebut" name="heureDebut" placeholder="Heure de Début">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Durée</label>
                                        <input type="number" min = "0" class="form-control" id="sduree" name="duree" placeholder="Durét">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Selectionner le Type </label>
                                        <select class="form-control" id="stype" name="type" >
                                            <option disabled selected > Selectionner le type seance </option>
                                            <option  value="0" > Cour</option>
                                            <option  value="1"> TD</option>
                                            <option  value="2"> TP </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="closebtn" data-dismiss="modal">Fermer</button>
                    <button type="button" class="btn btn-primary" id="updateSc" >Modifier Matéire</button>
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
        $("#addSeance").click(function () {
            $(".errorSpan").remove();
            let seance = {
                date: $('#date').val(),
                heureDebut: $('#heureDebut').val(),
                duree: $('#duree').val(),
                type: $('#type').val(),
                matiere: $('#matiere').val(),
                enseignant: $('#enseignant').val(),
                action: "add"
            }
            let error = 0;
            if (seance.date.length < 1) {
                $('#date').after('<span class="errorSpan" style="color:red">Le date est vide</span>');
                error++;
            }
            if (seance.heureDebut.length < 1) {
                $('#heureDebut').after('<span class="errorSpan" style="color:red">L`\'heureDebut est vide</span>');
                error++;
            }
            if (seance.duree.length < 1) {
                $('#duree').after('<span class="errorSpan" style="color:red">La duree est vide</span>');
                error++;
                ;
            }
            if (!seance.type) {
                $('#type').after('<span class="errorSpan" style="color:red">Selectionner le type</span>');
                error++;
            }
            if (!seance.enseignant) {
                $('#enseignant').after('<span class="errorSpan" style="color:red">Selectionner l`\'enseignant </span>');
                error++;
            }
            if (!seance.matiere) {
                $('#matiere').after('<span class="errorSpan" style="color:red">Selectionner la matiere </span>');
                error++;
            }
            if (error > 0)
                return;
            $.ajax({
                method: 'POST',
                url: './Sceance',
                data: seance,
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
        $(document).on('click', '#editSc', function () {
            let id = $(this).data('id');
            if (!id)
                return;
            let data = {
                id: id,
                action: "edit"
            };
            localStorage.clear("SeanceId")
            localStorage.setItem("SeanceId", id);
            $.ajax({
                url: './Sceance',
                type: 'POST',
                data: data,
                dataType: 'json'
            }).done(function (response) {
                $('#editModal').modal('show');
                let now = new Date(response.date);
                let day = ("0" + now.getDate()).slice(-2);
                let month = ("0" + (now.getMonth() + 1)).slice(-2);
                let today = now.getFullYear() + "-" + (month) + "-" + (day);
                $('#sdate').val(today);
                let time = response.heureDebut;
                let l = time.split(" ");
                time = l[0].slice(0, 5);
                if (l[1] === "PM") {
                    time = (Number(l[0].slice(0, 2)) + 12) + ":" + l[0].slice(3, 5)
                }
                $('#sheureDebut').val(time);
                $('#sduree').val(response.duree);
                if (response.type === "COUR")
                    $('#stype').val(0);
                else if (response.type === "TD")
                    $('#stype').val(1);
                else
                    (response.type === "TP")
                $('#stype').val(2);
                $('#smatiere').val(response.matiere.id);
                $('#senseignant').val(response.enseignant.id);
            }).fail(function () {});
        });
        /*Update*/
        $(document).on('click', '#updateSc', function () {
            $(".errorSpan").remove();
            let id = localStorage.getItem("SeanceId");
            if (!id)
                return;
            let seance = {
                id: id,
                date: $('#sdate').val(),
                heureDebut: $('#sheureDebut').val(),
                duree: $('#sduree').val(),
                type: $('#stype').val(),
                matiere: $('#smatiere').val(),
                enseignant: $('#senseignant').val(),
                action: "update"
            }
            let error = 0;
            if (seance.date.length < 1) {
                $('#sdate').after('<span class="errorSpan" style="color:red">Le date est vide</span>');
                error++;
            }
            if (seance.heureDebut.length < 1) {
                $('#sheureDebut').after('<span class="errorSpan" style="color:red">L`\'heureDebut est vide</span>');
                error++;
            }
            if (seance.duree.length < 1) {
                $('#sduree').after('<span class="errorSpan" style="color:red">La duree est vide</span>');
                error++;
                ;
            }
            if (!seance.type) {
                $('#stype').after('<span class="errorSpan" style="color:red">Selectionner le type</span>');
                error++;
            }
            if (!seance.enseignant) {
                $('#senseignant').after('<span class="errorSpan" style="color:red">Selectionner l`\'enseignant </span>');
                error++;
            }
            if (!seance.matiere) {
                $('#smatiere').after('<span class="errorSpan" style="color:red">Selectionner la matiere </span>');
                error++;
            }
            if (error > 0)
                return;

            $.ajax({
                url: './Sceance',
                type: 'POST',
                data: seance,
                dataType: 'json'
            }).done(function (response) {
                location.reload();
            }).fail(function () {});
        });
        //DELETE
        $(document).on('click', '#deleteSc', function () {
            console.log("sss")
            let id = $(this).data('id');
            if (!id)
                return;
            let data = {
                id: id,
                action: "delete"
            }
            $.ajax({
                url: './Sceance',
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
