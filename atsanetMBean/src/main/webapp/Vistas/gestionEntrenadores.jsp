<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session ="true"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    if (session.getAttribute("nombre1") == null) {
        response.sendRedirect("../inicioSesion.jsp");
        return;
    }
    String nombre1 = (String) session.getAttribute("nombre1");
    String apellido1 = (String) session.getAttribute("apellido1");
%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Entrenadores, Postulantes y Horarios</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            margin: 0;
            padding: 0;
            background: #f4f6fb;
            color: #263a5e;
            font-family: 'Roboto', sans-serif;
            box-sizing: border-box;
        }

        /* Barra de navegación */
        .navbar {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            box-shadow: 0 4px 20px rgba(25, 118, 210, 0.10);
            transition: box-shadow 0.3s, background 0.3s;
        }

        .navbar.scrolled {
            box-shadow: 0 8px 32px rgba(25, 118, 210, 0.18);
            background: linear-gradient(90deg, #1976d2 80%, #63a4ff 100%);
        }

        .navbar-nav .nav-link {
            position: relative;
            transition: color 0.2s;
            color: white !important;
            font-weight: bold;
        }

        .navbar-nav .nav-link::after {
            content: "";
            display: block;
            width: 0;
            height: 3px;
            background: #ffe082;
            border-radius: 2px;
            transition: width 0.3s;
            position: absolute;
            left: 0;
            bottom: 0;
        }

        .navbar-nav .nav-link:hover::after,
        .navbar-nav .nav-link.active::after {
            width: 100%;
        }

        .navbar-nav .nav-link:hover,
        .navbar-nav .nav-link.active {
            color: #ffe082 !important;
        }

        /* No específico para dropdown-toggle ya que es solo un nav-link */
        .navbar-nav .dropdown-toggle::after {
            display: none !important;
        }

        .btn-outline-light {
            border-color: white;
            color: white;
        }

        .btn-outline-light:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        /* Contenido principal */
        main {
            padding-top: 20px;
            padding-bottom: 40px;
            min-height: calc(100vh - 180px);
        }

        h2 {
            font-size: 2rem;
            font-weight: bold;
            color: #1976d2;
            margin-bottom: 30px;
            text-align: center;
        }

        h3 {
            font-size: 1.5rem;
            font-weight: bold;
            color: #1976d2;
            margin-top: 40px;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Tarjetas de postulantes (mantenidas para futuras implementaciones) */
        .entrenador-card {
            background: #fff;
            padding: 25px;
            margin: 15px;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(25, 118, 210, 0.10);
            transition: transform 0.3s, box-shadow 0.3s;
            border: none;
        }

        .entrenador-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(25, 118, 210, 0.15);
        }

        .entrenador-card h5 {
            color: #1976d2;
            font-size: 1.2rem;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .entrenador-card h6 {
            color: #4a6fa5;
            font-size: 0.9rem;
            margin-bottom: 15px;
        }

        .btn-custom {
            margin-top: 10px;
            width: 100%;
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            border: none;
            padding: 10px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-custom:hover {
            background: linear-gradient(90deg, #1565c0 0%, #4d8ef7 100%);
            transform: translateY(-2px);
        }

        /* Formulario de búsqueda */
        .form-wrapper {
            max-width: 600px;
            margin: 0 auto;
            padding: 30px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(25, 118, 210, 0.10);
        }

        .form-group label {
            color: #1976d2;
            font-weight: 500;
            margin-bottom: 8px;
        }

        .form-control {
            border: 1px solid #e0e9ff;
            border-radius: 8px;
            padding: 10px 15px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .form-control:focus {
            border-color: #1976d2;
            box-shadow: 0 0 0 0.25rem rgba(25, 118, 210, 0.25);
        }

        .btn-submit {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            border: none;
            padding: 10px 20px;
            font-weight: 500;
            width: 100%;
            margin-top: 15px;
            transition: all 0.3s;
        }

        .btn-submit:hover {
            background: linear-gradient(90deg, #1565c0 0%, #4d8ef7 100%);
            transform: translateY(-2px);
        }

        /* Botones de alternar */
        .toggle-buttons {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
            gap: 15px;
            flex-wrap: wrap;
        }

        .toggle-btn {
            padding: 10px 25px;
            font-size: 16px;
            font-weight: 500;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .toggle-btn.active {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            color: white;
            box-shadow: 0 4px 12px rgba(25, 118, 210, 0.20);
        }

        .toggle-btn:not(.active) {
            background: #e0e9ff;
            color: #1976d2;
        }

        .toggle-btn:not(.active):hover {
            background: #d0dffc;
        }

        /* Contenedores de vistas */
        .view-container {
            display: none;
            animation: fadeIn 0.5s ease;
        }

        .view-container.active {
            display: block;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Pie de página */
        #piePagina {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            color: white;
            padding: 20px;
            text-align: center;
            box-shadow: 0 -4px 20px rgba(25, 118, 210, 0.10);
        }

        /* Modal de información */
        .swal2-popup {
            border-radius: 12px !important;
        }


        /* Estilos para las tablas */
        .data-table {
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(25, 118, 210, 0.10);
            overflow: hidden;
            table-layout: fixed;
        }

        /* Ancho de columnas específicas para la tabla de postulantes */
        .data-table th.nombres-col {
            width: 180px;
        }
        .data-table th.rol-col {
            width: 180px;
        }
        .data-table th.activo-col {
            width: 80px;
            text-align: center;
        }
        .data-table th.acciones-col {
            width: 100px !important;
            min-width: 80px !important;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-align: center;
        }

        .data-table td.activo-col {
            text-align: center;
        }
        .data-table td.activo-col .form-check {
            display: flex;
            justify-content: center;
            margin-bottom: 0;
        }
        
        .data-table td.rol-col {
            padding: 6px 4px;
        }
        .data-table td.rol-col .form-select {
            font-size: 0.9rem;
            padding: 0.25rem 0.5rem;
        }
        
        .data-table td.acciones-col {
            width: 100px !important;
            min-width: 80px !important;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            padding: 2px 2px !important;
            text-align: center;
            vertical-align: middle;
        }

        .data-table .btn-info-table {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .data-table .btn-info-table:hover {
            background: linear-gradient(90deg, #1565c0 0%, #4d8ef7 100%);
            transform: translateY(-1px);
        }

        .data-table th,
        .data-table td {
            padding: 8px 12px;
            text-align: left;
            border-bottom: 1px solid #e0e9ff;
        }

        .data-table th {
            background-color: #1976d2;
            color: white;
            font-weight: 600;
        }

        .data-table tbody tr:hover {
            background-color: #f0f6ff;
        }

        /* Custom styles for SweetAlert content */
        .swal2-html-content .info-section-title {
            font-size: 1.1rem;
            font-weight: bold;
            color: #1976d2;
            margin-top: 15px;
            margin-bottom: 10px;
            border-bottom: 2px solid #e0e9ff;
            padding-bottom: 5px;
        }

        .swal2-html-content .button-container {
            margin-top: 20px;
            display: flex;
            justify-content: space-around;
            gap: 10px;
        }

        /* Styles for Jornadas table */
        .btn-action {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
            margin: 2px;
        }

        .btn-action.edit {
            background: linear-gradient(90deg, #ffc107 0%, #ffcd38 100%);
        }

        .btn-action.delete {
            background: linear-gradient(90deg, #dc3545 0%, #e0606d 100%);
        }

        .btn-action:hover {
            transform: translateY(-1px);
        }

        .btn-action.edit:hover {
            background: linear-gradient(90deg, #e0a800 0%, #e6b940 100%);
        }

        .btn-action.delete:hover {
            background: linear-gradient(90deg, #c82333 0%, #d34e5b 100%);
        }


        /* Botón general de Crear Jornada */
        .btn-create-jornada {
            background: linear-gradient(90deg, #28a745 0%, #46c760 100%);
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
            margin-top: 20px;
            display: inline-block;
        }

        .btn-create-jornada:hover {
            background: linear-gradient(90deg, #218838 0%, #3bb852 100%);
            transform: translateY(-2px);
        }
        
        /* Estilos para el modal */
        .modal-content {
            border-radius: 15px;
            border: none;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        .modal-header {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            padding: 15px 20px;
        }
        .modal-title {
            font-weight: bold;
        }
        
        .modal-header.bg-primary .modal-title {
            color: white;
        }
        .modal-body {
            padding: 20px;
        }
        .modal-footer {
            border-top: 2px solid #dee2e6;
            padding: 15px 20px;
        }

        /* Estilos para el modal y formulario compacto */
        .compact-form label {
            font-weight: 500;
            color: #455a64;
        }
        
        .compact-form .form-control-sm, 
        .compact-form .form-select-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
            border-radius: 0.2rem;
            border-color: #d0d7de;
        }
        
        .compact-form .form-control-sm:focus, 
        .compact-form .form-select-sm:focus {
            border-color: #1976d2;
            box-shadow: 0 0 0 0.2rem rgba(25, 118, 210, 0.25);
        }
        
        .compact-form input[readonly] {
            background-color: #f8f9fa;
            cursor: not-allowed;
        }
        
        .compact-form .form-control {
            background-color: #f8f9fa;
            cursor: default;
        }
        
        .modal-header.bg-primary {
            background: linear-gradient(90deg, #1976d2 0%, #2196f3 100%);
        }
        
        /* Estilos para validaciones Bootstrap en el modal */
        .compact-form .invalid-feedback {
            font-size: 0.75rem;
            margin-top: 0.2rem;
        }
        
        .compact-form .form-control.is-invalid,
        .compact-form .form-select.is-invalid {
            border-color: #dc3545;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath d='m5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right calc(0.375em + 0.1875rem) center;
            background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
        }
        
        .compact-form .form-control.is-valid,
        .compact-form .form-select.is-valid {
            border-color: #198754;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%23198754' d='m2.3 6.73.4.42c.2.15.4.11.7-.07L8.6 2.36c.3-.19.3-.52 0-.71-.3-.19-.77-.19-1.07 0l-3.59 2.94L2.69 3.24c-.3-.19-.77-.19-1.07 0-.3.19-.3.52 0 .71z'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right calc(0.375em + 0.1875rem) center;
            background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a href="/atsaNet/InicioUsuario">
                <img src="/atsaNet/img/logo_club.png" style="width: 200px">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu"
                aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarMenu">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="mostrarVista('postulantes')">
                            Entrenadores
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="/* Link to Alumnos page */">
                            Alumnos
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="mostrarVista('horarios')">
                            Entrenamientos y Objetivos
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="/* Link to Sesion Entrenamiento page */">
                            Sesión de Entrenamiento
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="/* Link to Reportes page */">
                            Reportes
                        </a>
                    </li>
                </ul>
                <div class="d-flex align-items-center">
                    <div class="text-end me-3">
                        <span class="fw-bold text-white"><%= nombre1 %> <%= apellido1 %></span><br>
                        <span class="text-white-50" style="font-size: 0.9em;">Administrador</span>
                    </div>
                    <img src="/atsaNet/img/fotoPerfil.jpg" class="rounded-5 border border-3 border-light" style="width: 55px; height: 55px; object-fit: cover;">
                    <button class="btn btn-outline-light ms-3" onclick="cerrarSesion()">Cerrar Sesión</button>
                </div>
            </div>
        </div>
    </nav>

    <main class="container py-4">
        <div class="toggle-buttons">
            <button id="btnPostulantes" class="toggle-btn active"
                onclick="mostrarVista('postulantes')">Consultar Postulantes</button>
            <button id="btnEntrenadores" class="toggle-btn"
                onclick="mostrarVista('entrenadores')">Consultar Entrenadores</button>
            <button id="btnHorarios" class="toggle-btn" onclick="mostrarVista('horarios')">Gestionar Horarios</button>
        </div>

        <div id="postulantes-view" class="view-container active">
                <h2>Gestión de Candidatos a Entrenadores</h2>


                <c:choose>
                  <c:when test="${empty postulantes}">
                    <div class="alert alert-warning text-center">No hay postulantes para mostrar.</div>
                  </c:when>
                  <c:otherwise>
                    <div class="table-responsive">
                        <table class="table table-hover data-table">
                            <thead>
                                <tr>
                                    <th class="nombres-col">Nombres</th>
                                    <th class="acciones-col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody id="postulantesTableBody">
                            <c:forEach var="p" items="${postulantes}">
                                <tr>
                                    <td>
                                        ${p.nom1_persona} ${p.nom2_persona} ${p.ape1_persona} ${p.ape2_persona}
                                    </td>
                                    <td class="acciones-col">
<button type="button" class="btn btn-info-table btn-ver-mas"
    data-bs-toggle="modal" data-bs-target="#modalPostulante"
    data-id="${p.id}"
    data-tipoid="${p.tipo_Id}"
    data-idpersona="${p.id_persona}"
    data-nom1="${p.nom1_persona}"
    data-nom2="${p.nom2_persona}"
    data-ape1="${p.ape1_persona}"
    data-ape2="${p.ape2_persona}"
    data-fechanac="${p.fecha_nacimiento != null ? p.fecha_nacimiento.time : ''}"
    data-edad="${p.edad_persona}"
    data-direc="${p.direc_persona}"
    data-tel="${p.tel_persona}"
    data-email="${p.email_persona}"
    data-genero="${p.fk_genero}"
    data-eps="${p.fk_eps}"
    data-rh="${p.fk_rh}">
    Ver más
</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                  </c:otherwise>
                </c:choose>


                <!-- Modal para ver detalles del postulante -->
                <div class="modal fade" id="modalPostulante" tabindex="-1" aria-labelledby="modalPostulanteLabel" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered modal-md">
                    <div class="modal-content">
                      <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="modalPostulanteLabel">Datos del Postulante</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                      </div>
                      <div class="modal-body" id="modalPostulanteBody">
                        <!-- Aquí se mostrarán los datos del postulante -->
                      </div>
                      <div class="modal-footer bg-light">
                        <button type="button" class="btn btn-sm btn-success" id="btnAceptarPostulante">Aceptar</button>
                        <button type="button" class="btn btn-sm btn-danger" id="btnRechazarPostulante">Rechazar</button>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- Script para cargar datos en el modal -->
                <script>
                document.addEventListener('DOMContentLoaded', function() {
                    // Capturar evento para cargar datos en el modal antes de mostrarlo
                    var modalPostulante = document.getElementById('modalPostulante');
                    // Variable para almacenar el ID de persona seleccionado
                    var selectedPersonaId = null;
                    
                    modalPostulante.addEventListener('show.bs.modal', function(event) {
                        // Obtener el botón que disparó el modal
                        var button = event.relatedTarget;
                        // Guardar el ID de la persona seleccionada
                        selectedPersonaId = button.getAttribute('data-id');
                        
                        // Extraer datos de atributos
                        var tipoId = button.getAttribute('data-tipoid') || '-';
                        var idPersona = button.getAttribute('data-idpersona') || '-';
                        var nom1 = button.getAttribute('data-nom1') || '-';
                        var nom2 = button.getAttribute('data-nom2') || '-';
                        var ape1 = button.getAttribute('data-ape1') || '-';
                        var ape2 = button.getAttribute('data-ape2') || '-';
                        var fechaNacData = button.getAttribute('data-fechanac');
                        var fechaNac = '-';
                        var edad = button.getAttribute('data-edad') || '-';
                        
                        if (fechaNacData && fechaNacData !== '' && !isNaN(fechaNacData)) {
                            try {
                                var fecha = new Date(parseInt(fechaNacData));
                                fechaNac = fecha.toISOString().split('T')[0];
                            } catch (e) {
                                console.error('Error al convertir fecha:', e);
                            }
                        }
                        
                        var direc = button.getAttribute('data-direc') || '-';
                        var tel = button.getAttribute('data-tel') || '-';
                        var email = button.getAttribute('data-email') || '-';
                        var generoValue = button.getAttribute('data-genero') || '-';
                        var generoTexto = '-';
                        var epsValue = button.getAttribute('data-eps') || '-';
                        var epsTexto = '-';
                        var rhValue = button.getAttribute('data-rh') || '-';
                        var rhTexto = '-';
                        
                        // Convertir código de género a texto
                        if (generoValue === '1') {
                            generoTexto = 'Masculino';
                        } else if (generoValue === '2') {
                            generoTexto = 'Femenino';
                        } else {
                            generoTexto = generoValue; // Mantener el valor original si no es 1 o 2
                        }
                        
                        // Convertir código de EPS a texto
                        switch (epsValue) {
                            case '1':
                                epsTexto = 'Sanitas';
                                break;
                            case '2':
                                epsTexto = 'Sura';
                                break;
                            case '3':
                                epsTexto = 'Compensar';
                                break;
                            case '4':
                                epsTexto = 'Salud Total';
                                break;
                            case '5':
                                epsTexto = 'Famisanar';
                                break;
                            case '6':
                                epsTexto = 'Capital Salud';
                                break;
                            case '7':
                                epsTexto = 'Aliansalud';
                                break;
                            case '8':
                                epsTexto = 'Salud Bolivar';
                                break;
                            default:
                                epsTexto = epsValue;
                                break;
                        }
                        
                        // Convertir código de RH a texto
                        switch (rhValue) {
                            case '1':
                                rhTexto = 'A+';
                                break;
                            case '2':
                                rhTexto = 'A-';
                                break;
                            case '3':
                                rhTexto = 'B+';
                                break;
                            case '4':
                                rhTexto = 'B-';
                                break;
                            case '5':
                                rhTexto = 'AB+';
                                break;
                            case '6':
                                rhTexto = 'AB-';
                                break;
                            case '7':
                                rhTexto = 'O+';
                                break;
                            case '8':
                                rhTexto = 'O-';
                                break;
                            default:
                                rhTexto = rhValue;
                                break;
                        }
                        
                        // Generar contenido HTML más compacto y con estilos similares al modal de Editar Entrenador
                        var html = '<div class="compact-form">';
                        
                        // Primera fila: Tipo ID y Número ID
                        html += '<div class="row g-3 mb-2">';
                        html += '<div class="col-md-5"><label class="form-label small mb-1 fw-bold">Tipo ID:</label>';
                        html += '<div class="form-control form-control-sm">' + tipoId + '</div></div>';
                        html += '<div class="col-md-7"><label class="form-label small mb-1 fw-bold">Número ID:</label>';
                        html += '<div class="form-control form-control-sm">' + idPersona + '</div></div>';
                        html += '</div>';
                        
                        // Segunda fila: Nombres y Apellidos
                        html += '<div class="row g-3 mb-2">';
                        html += '<div class="col-6"><label class="form-label small mb-1 fw-bold">Nombres:</label>';
                        html += '<div class="form-control form-control-sm">' + nom1 + ' ' + nom2 + '</div></div>';
                        html += '<div class="col-6"><label class="form-label small mb-1 fw-bold">Apellidos:</label>';
                        html += '<div class="form-control form-control-sm">' + ape1 + ' ' + ape2 + '</div></div>';
                        html += '</div>';
                        
                        // Tercera fila: Fecha Nacimiento, Edad y Género
                        html += '<div class="row g-3 mb-2">';
                        html += '<div class="col-5"><label class="form-label small mb-1 fw-bold">Fecha Nacimiento:</label>';
                        html += '<div class="form-control form-control-sm">' + fechaNac + '</div></div>';
                        html += '<div class="col-3"><label class="form-label small mb-1 fw-bold">Edad:</label>';
                        html += '<div class="form-control form-control-sm">' + (edad !== '-' ? edad + ' años' : '-') + '</div></div>';
                        html += '<div class="col-4"><label class="form-label small mb-1 fw-bold">Género:</label>';
                        html += '<div class="form-control form-control-sm">' + generoTexto + '</div></div>';
                        html += '</div>';
                        
                        // Cuarta fila: Dirección
                        html += '<div class="row g-3 mb-2">';
                        html += '<div class="col-12"><label class="form-label small mb-1 fw-bold">Dirección:</label>';
                        html += '<div class="form-control form-control-sm">' + direc + '</div></div>';
                        html += '</div>';
                        
                        // Quinta fila: Teléfono y Email
                        html += '<div class="row g-3 mb-2">';
                        html += '<div class="col-5"><label class="form-label small mb-1 fw-bold">Teléfono:</label>';
                        html += '<div class="form-control form-control-sm">' + tel + '</div></div>';
                        html += '<div class="col-7"><label class="form-label small mb-1 fw-bold">Email:</label>';
                        html += '<div class="form-control form-control-sm">' + email + '</div></div>';
                        html += '</div>';
                        
                        // Sexta fila: EPS y RH
                        html += '<div class="row g-3 mb-2">';
                        html += '<div class="col-6"><label class="form-label small mb-1 fw-bold">EPS:</label>';
                        html += '<div class="form-control form-control-sm">' + epsTexto + '</div></div>';
                        html += '<div class="col-6"><label class="form-label small mb-1 fw-bold">RH:</label>';
                        html += '<div class="form-control form-control-sm">' + rhTexto + '</div></div>';
                        html += '</div>';
                        
                        html += '</div>'; // Cierre de compact-form
                        
                        // Insertar el HTML en el cuerpo del modal
                        document.getElementById('modalPostulanteBody').innerHTML = html;
                        
                        console.log('Datos cargados en el modal:', {
                            tipoId, idPersona, nom1, nom2, ape1, ape2,
                            fechaNac, edad, direc, tel, email, generoTexto, epsTexto, rhTexto
                        });
                    });
                    
                    // Eventos para botones del modal
                    document.getElementById('btnAceptarPostulante').addEventListener('click', function() {
                        if (selectedPersonaId) {
                            // Cerrar el modal antes de mostrar el mensaje de procesando
                            var modal = bootstrap.Modal.getInstance(modalPostulante);
                            modal.hide();
                            
                            // Mostrar mensaje de procesando
                            Swal.fire({
                                title: 'Procesando',
                                text: 'Aceptando postulante...',
                                icon: 'info',
                                allowOutsideClick: false,
                                showConfirmButton: false,
                                willOpen: () => {
                                    Swal.showLoading();
                                }
                            });
                            
                            // Enviar solicitud para aceptar postulante
                            fetch('ListarPostulantesServlet', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/x-www-form-urlencoded',
                                },
                                body: 'action=aceptarPostulante&fk_persona=' + selectedPersonaId
                            })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success) {
                                    Swal.fire({
                                        title: '¡Éxito!',
                                        text: 'El postulante ha sido aceptado correctamente',
                                        icon: 'success',
                                        confirmButtonColor: '#1976d2',
                                        confirmButtonText: 'Aceptar'
                                    }).then(() => {
                                        // Recargar la página para actualizar la lista
                                        window.location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        title: 'Error',
                                        text: 'No se pudo aceptar al postulante',
                                        icon: 'error',
                                        confirmButtonColor: '#1976d2',
                                        confirmButtonText: 'Cerrar'
                                    });
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                Swal.fire({
                                    title: 'Error',
                                    text: 'Ha ocurrido un error al procesar la solicitud',
                                    icon: 'error',
                                    confirmButtonColor: '#1976d2',
                                    confirmButtonText: 'Cerrar'
                                });
                            });
                        } else {
                            var modal = bootstrap.Modal.getInstance(modalPostulante);
                            modal.hide();
                        }
                    });
                    
                    document.getElementById('btnRechazarPostulante').addEventListener('click', function() {
                        if (selectedPersonaId) {
                            // Confirmación antes de rechazar al postulante
                            Swal.fire({
                                title: '¿Está seguro?',
                                text: 'Va a rechazar la solicitud del postulante.',
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#dc3545',
                                cancelButtonColor: '#6c757d',
                                confirmButtonText: 'Sí, rechazar',
                                cancelButtonText: 'Cancelar'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    // Cerrar el modal
                                    var modal = bootstrap.Modal.getInstance(modalPostulante);
                                    modal.hide();
                                    
                                    // Mostrar mensaje de procesando
                                    Swal.fire({
                                        title: 'Procesando',
                                        text: 'Rechazando postulante...',
                                        icon: 'info',
                                        allowOutsideClick: false,
                                        showConfirmButton: false,
                                        willOpen: () => {
                                            Swal.showLoading();
                                        }
                                    });
                                    
                                    // Enviar solicitud para rechazar postulante
                                    fetch('ListarPostulantesServlet', {
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/x-www-form-urlencoded',
                                        },
                                        body: 'action=rechazarPostulante&fk_persona=' + selectedPersonaId
                                    })
                                    .then(response => response.json())
                                    .then(data => {
                                        if (data.success) {
                                            Swal.fire({
                                                title: 'Postulante rechazado',
                                                text: 'El postulante ha sido rechazado correctamente',
                                                icon: 'success',
                                                confirmButtonColor: '#1976d2',
                                                confirmButtonText: 'Aceptar'
                                            }).then(() => {
                                                // Recargar la página para actualizar la lista
                                                window.location.reload();
                                            });
                                        } else {
                                            Swal.fire({
                                                title: 'Error',
                                                text: 'No se pudo rechazar al postulante',
                                                icon: 'error',
                                                confirmButtonColor: '#1976d2',
                                                confirmButtonText: 'Cerrar'
                                            });
                                        }
                                    })
                                    .catch(error => {
                                        console.error('Error:', error);
                                        Swal.fire({
                                            title: 'Error',
                                            text: 'Ha ocurrido un error al procesar la solicitud',
                                            icon: 'error',
                                            confirmButtonColor: '#1976d2',
                                            confirmButtonText: 'Cerrar'
                                        });
                                    });
                                }
                            });
                        } else {
                            var modal = bootstrap.Modal.getInstance(modalPostulante);
                            modal.hide();
                        }
                    });
                });
                </script>
            </div>

            <div id="entrenadores-view" class="view-container">
                <h2>Consultar Entrenadores</h2>

                <div class="table-responsive">
                    <table class="table table-hover data-table">
                        <thead>
                            <tr>
                                <th class="nombres-col">Nombres</th>
                                <th class="rol-col">Rol</th>
                                <th class="activo-col">Activo</th>
                                <th class="acciones-col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="entrenadoresTableBody">
                            <c:choose>
                                <c:when test="${empty entrenadores}">
                                    <tr>
                                        <td colspan="4" class="text-center">No hay entrenadores para mostrar</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="e" items="${entrenadores}">
                                        <tr>
                                            <td>${e.nom1_persona} ${e.nom2_persona} ${e.ape1_persona} ${e.ape2_persona}</td>
                                            <td class="rol-col">
                                                <select class="form-select form-select-sm cambiar-rol" aria-label="Seleccionar rol" data-id="${e.id}">
                                                    <option value="1" ${e.fk_tipo_personal == 1 ? 'selected' : ''}>Administrador</option>
                                                    <option value="2" ${e.fk_tipo_personal == 2 ? 'selected' : ''}>Entrenador</option>
                                                </select>
                                            </td>
                                            <td class="activo-col">
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input cambiar-estado" type="checkbox" role="switch" 
                                                           id="switch${e.id}" ${e.persona_activa ? 'checked' : ''} data-id="${e.id}">
                                                </div>
                                            </td>
                                            <td class="acciones-col">
                                                <button type="button" class="btn btn-info-table btn-editar"
                                                    data-bs-toggle="modal" data-bs-target="#modalEntrenador"
                                                    data-id="${e.id}"
                                                    data-tipoid="${e.tipo_Id}"
                                                    data-idpersona="${e.id_persona}"
                                                    data-nom1="${e.nom1_persona}"
                                                    data-nom2="${e.nom2_persona}"
                                                    data-ape1="${e.ape1_persona}"
                                                    data-ape2="${e.ape2_persona}"
                                                    data-fechanac="${e.fecha_nacimiento != null ? e.fecha_nacimiento.time : ''}"
                                                    data-edad="${e.edad_persona}"
                                                    data-direc="${e.direc_persona}"
                                                    data-tel="${e.tel_persona}"
                                                    data-email="${e.email_persona}"
                                                    data-genero="${e.fk_genero}"
                                                    data-eps="${e.fk_eps}"
                                                    data-rh="${e.fk_rh}"
                                                    data-rol="${e.fk_tipo_personal}"
                                                    data-activo="${e.persona_activa}">
                                                    Editar
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
                
                <!-- Modal para editar entrenador -->
                <div class="modal fade" id="modalEntrenador" tabindex="-1" aria-labelledby="modalEntrenadorLabel" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered modal-md">
                    <div class="modal-content">
                      <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="modalEntrenadorLabel">Editar Entrenador</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                      </div>
                      <div class="modal-body">
                        <form id="formEditarEntrenador" class="compact-form needs-validation" novalidate>
                            <div class="row g-3 mb-2">
                                <div class="col-md-5">
                                    <label for="tipoId" class="form-label small mb-1">Tipo ID</label>
                                    <select class="form-select form-select-sm" id="tipoId" name="tipoId" required>
                                        <option value="">Elige...</option>
                                        <option value="RC">RC</option>
                                        <option value="TI">TI</option>
                                        <option value="CC">CC</option>
                                        <option value="CE">CE</option>
                                        <option value="PA">PA</option>
                                    </select>
                                    <div class="invalid-feedback">
                                        Por favor selecciona un tipo de identificación.
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <label for="idPersona" class="form-label small mb-1">Número ID</label>
                                    <input type="number" class="form-control form-control-sm" id="idPersona" name="idPersona" 
                                           required min="10000000" max="2147483647" 
                                           title="Debe ser un número válido (8 a 10 dígitos, máximo 2147483647)." 
                                           pattern="\d{8,10}">
                                    <div class="invalid-feedback">
                                        Ingresa un número válido (8 a 10 dígitos, máximo 2147483647).
                                    </div>
                                </div>
                            </div>
                            <div class="row g-3 mb-2">
                                <div class="col-6">
                                    <label for="nom1" class="form-label small mb-1">Primer Nombre</label>
                                    <input type="text" class="form-control form-control-sm" id="nom1" name="nom1" 
                                           required pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ\s'-]{3,20}" maxlength="20"
                                           title="Debe tener entre 3 y 20 caracteres.">
                                    <div class="invalid-feedback">
                                        Ingresa un nombre válido (3 a 20 caracteres, solo letras y caracteres especiales permitidos).
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="nom2" class="form-label small mb-1">Segundo Nombre</label>
                                    <input type="text" class="form-control form-control-sm" id="nom2" name="nom2" 
                                           pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ\s'-]{0,20}" maxlength="20"
                                           title="Opcional. Hasta 20 caracteres.">
                                    <div class="invalid-feedback">
                                        Ingresa un nombre válido (opcional, hasta 20 caracteres, solo letras y caracteres especiales permitidos).
                                    </div>
                                </div>
                            </div>
                            <div class="row g-3 mb-2">
                                <div class="col-6">
                                    <label for="ape1" class="form-label small mb-1">Primer Apellido</label>
                                    <input type="text" class="form-control form-control-sm" id="ape1" name="ape1" 
                                           required pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ\s'-]{3,20}" maxlength="20"
                                           title="Debe tener entre 3 y 20 caracteres.">
                                    <div class="invalid-feedback">
                                        Ingresa un apellido válido (3 a 20 caracteres, solo letras y caracteres especiales permitidos).
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="ape2" class="form-label small mb-1">Segundo Apellido</label>
                                    <input type="text" class="form-control form-control-sm" id="ape2" name="ape2" 
                                           pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ\s'-]{0,20}" maxlength="20"
                                           title="Opcional. Hasta 20 caracteres.">
                                    <div class="invalid-feedback">
                                        Ingresa un apellido válido (opcional, hasta 20 caracteres, solo letras y caracteres especiales permitidos).
                                    </div>
                                </div>
                            </div>
                            <div class="row g-3 mb-2">
                                <div class="col-5">
                                    <label for="fechaNac" class="form-label small mb-1">Fecha de Nacimiento</label>
                                    <input type="date" class="form-control form-control-sm" id="fechaNac" name="fechaNac" 
                                           required min="1950-01-01" max="2005-12-31"
                                           title="Selecciona tu fecha de nacimiento">
                                    <div class="invalid-feedback">
                                        Selecciona una fecha válida.
                                    </div>
                                </div>
                                <div class="col-3">
                                    <label for="edad" class="form-label small mb-1">Edad</label>
                                    <input type="text" class="form-control form-control-sm" id="edad" name="edad" readonly>
                                </div>
                                <div class="col-4">
                                    <label for="genero" class="form-label small mb-1">Género</label>
                                    <select class="form-select form-select-sm" id="genero" name="genero" required>
                                        <option value="">Elige...</option>
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>
                                    </select>
                                    <div class="invalid-feedback">
                                        Por favor selecciona un género.
                                    </div>
                                </div>
                            </div>
                            <div class="row g-3 mb-2">
                                <div class="col-12">
                                    <label for="direccion" class="form-label small mb-1">Dirección</label>
                                    <input type="text" class="form-control form-control-sm" id="direccion" name="direccion" 
                                           required maxlength="100"
                                           title="Debe ser una dirección válida con letras, números, espacios y algunos caracteres especiales (#, ., -).">
                                    <div class="invalid-feedback">
                                        Ingresa una dirección válida.
                                    </div>
                                </div>
                            </div>
                            <div class="row g-3 mb-2">
                                <div class="col-5">
                                    <label for="telefono" class="form-label small mb-1">Teléfono</label>
                                    <input type="tel" class="form-control form-control-sm" id="telefono" name="telefono" 
                                           required pattern="^\d{10}$"
                                           title="Debe contener 10 dígitos.">
                                    <div class="invalid-feedback">
                                        Ingresa un número de celular válido (10 dígitos).
                                    </div>
                                </div>
                                <div class="col-7">
                                    <label for="email" class="form-label small mb-1">Email</label>
                                    <input type="email" class="form-control form-control-sm" id="email" name="email" 
                                           required maxlength="100"
                                           title="Ingresa un correo electrónico válido.">
                                    <div class="invalid-feedback">
                                        Ingresa un correo electrónico válido.
                                    </div>
                                </div>
                            </div>
                            <div class="row g-3 mb-2">
                                <div class="col-6">
                                    <label for="eps" class="form-label small mb-1">EPS</label>
                                    <select class="form-select form-select-sm" id="eps" name="eps" required>
                                        <option value="">Elige...</option>
                                        <option value="1">Sanitas</option>
                                        <option value="2">Sura</option>
                                        <option value="3">Compensar</option>
                                        <option value="4">Salud Total</option>
                                        <option value="5">Famisanar</option>
                                        <option value="6">Capital Salud</option>
                                        <option value="7">Aliansalud</option>
                                        <option value="8">Salud Bolivar</option>
                                    </select>
                                    <div class="invalid-feedback">
                                        Por favor selecciona una EPS.
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="rh" class="form-label small mb-1">RH</label>
                                    <select class="form-select form-select-sm" id="rh" name="rh" required>
                                        <option value="">Elige...</option>
                                        <option value="1">A+</option>
                                        <option value="2">A-</option>
                                        <option value="3">B+</option>
                                        <option value="4">B-</option>
                                        <option value="5">AB+</option>
                                        <option value="6">AB-</option>
                                        <option value="7">O+</option>
                                        <option value="8">O-</option>
                                    </select>
                                    <div class="invalid-feedback">
                                        Por favor selecciona un tipo de sangre.
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" id="idEntrenador" name="id">
                            <input type="hidden" id="rol" name="rol">
                            <input type="hidden" id="activoSwitch" name="activo" value="true">
                        </form>
                      </div>
                      <div class="modal-footer bg-light">
                        <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-sm btn-primary" id="btnGuardarCambios">Guardar Cambios</button>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- Script para manejar el modal de edición de entrenador -->
                <script>
                document.addEventListener('DOMContentLoaded', function() {
                    // Capturar evento para cargar datos en el modal antes de mostrarlo
                    var modalEntrenador = document.getElementById('modalEntrenador');
                    var formEditarEntrenador = document.getElementById('formEditarEntrenador');
                    var btnGuardarCambios = document.getElementById('btnGuardarCambios');
                    
                    // Variable para almacenar el ID de entrenador seleccionado
                    var selectedEntrenadorId = null;
                    
                    // Cargar datos en el modal de edición
                    modalEntrenador.addEventListener('show.bs.modal', function(event) {
                        // Limpiar validaciones anteriores
                        formEditarEntrenador.classList.remove('was-validated');
                        
                        // Obtener el botón que disparó el modal
                        var button = event.relatedTarget;
                        
                        // Guardar el ID del entrenador seleccionado
                        selectedEntrenadorId = button.getAttribute('data-id');
                        
                        // Extraer datos de atributos
                        document.getElementById('tipoId').value = button.getAttribute('data-tipoid') || '';
                        document.getElementById('idPersona').value = button.getAttribute('data-idpersona') || '';
                        document.getElementById('nom1').value = button.getAttribute('data-nom1') || '';
                        document.getElementById('nom2').value = button.getAttribute('data-nom2') || '';
                        document.getElementById('ape1').value = button.getAttribute('data-ape1') || '';
                        document.getElementById('ape2').value = button.getAttribute('data-ape2') || '';
                        
                        var fechaNacData = button.getAttribute('data-fechanac');
                        if (fechaNacData && fechaNacData !== '' && !isNaN(fechaNacData)) {
                            try {
                                var fecha = new Date(parseInt(fechaNacData));
                                document.getElementById('fechaNac').value = fecha.toISOString().split('T')[0];
                            } catch (e) {
                                console.error('Error al convertir fecha:', e);
                            }
                        } else {
                            document.getElementById('fechaNac').value = '';
                        }
                        
                        document.getElementById('edad').value = button.getAttribute('data-edad') || '';
                        document.getElementById('direccion').value = button.getAttribute('data-direc') || '';
                        document.getElementById('telefono').value = button.getAttribute('data-tel') || '';
                        document.getElementById('email').value = button.getAttribute('data-email') || '';
                        document.getElementById('genero').value = button.getAttribute('data-genero') || '1';
                        document.getElementById('eps').value = button.getAttribute('data-eps') || '1';
                        document.getElementById('rh').value = button.getAttribute('data-rh') || '1';
                        
                        // Campos ocultos
                        document.getElementById('idEntrenador').value = selectedEntrenadorId;
                        document.getElementById('rol').value = button.getAttribute('data-rol') || '2';
                        document.getElementById('activoSwitch').value = button.getAttribute('data-activo') || 'true';
                    });
                    
                    // Manejar guardar cambios
                    btnGuardarCambios.addEventListener('click', function() {
                        if (selectedEntrenadorId) {
                            // Validar el formulario antes de enviar
                            if (!formEditarEntrenador.checkValidity()) {
                                formEditarEntrenador.classList.add('was-validated');
                                
                                // Mostrar mensaje de error de validación
                                Swal.fire({
                                    title: 'Datos incompletos',
                                    text: 'Por favor completa todos los campos requeridos correctamente.',
                                    icon: 'warning',
                                    confirmButtonColor: '#1976d2',
                                    confirmButtonText: 'Entendido'
                                });
                                return;
                            }
                            
                            // Cerrar el modal
                            var modal = bootstrap.Modal.getInstance(modalEntrenador);
                            modal.hide();
                            
                            // Mostrar mensaje de procesando
                            Swal.fire({
                                title: 'Procesando',
                                text: 'Actualizando datos del entrenador...',
                                icon: 'info',
                                allowOutsideClick: false,
                                showConfirmButton: false,
                                willOpen: () => {
                                    Swal.showLoading();
                                }
                            });
                            
                            // Construir URLSearchParams directamente desde el formulario
                            const params = new URLSearchParams();
                            const formData = new FormData(formEditarEntrenador);
                            
                            // Convertir FormData a URLSearchParams
                            for (const [key, value] of formData.entries()) {
                                params.append(key, value);
                            }
                            params.append('action', 'actualizarEntrenador');
                            
                            // Enviar solicitud para actualizar entrenador
                            fetch('EditarEntrenadorServlet', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/x-www-form-urlencoded',
                                },
                                body: params.toString()
                            })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success) {
                                    Swal.fire({
                                        title: '¡Éxito!',
                                        text: 'El entrenador ha sido actualizado correctamente',
                                        icon: 'success',
                                        confirmButtonColor: '#1976d2',
                                        confirmButtonText: 'Aceptar'
                                    }).then(() => {
                                        window.location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        title: 'Error',
                                        text: data.message || 'No se pudo actualizar el entrenador',
                                        icon: 'error',
                                        confirmButtonColor: '#1976d2',
                                        confirmButtonText: 'Cerrar'
                                    });
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                Swal.fire({
                                    title: 'Error',
                                    text: 'Ha ocurrido un error al procesar la solicitud',
                                    icon: 'error',
                                    confirmButtonColor: '#1976d2',
                                    confirmButtonText: 'Cerrar'
                                });
                            });
                        }
                    });
                    
                    // Manejar cambios de rol
                    document.querySelectorAll('.cambiar-rol').forEach(select => {
                        select.addEventListener('change', function() {
                            const id = this.getAttribute('data-id');
                            const nuevoRol = this.value;
                            const valorAnterior = this.value === '1' ? '2' : '1'; // Valor antes del cambio
                            const selectElement = this; // Referencia al select
                            
                            Swal.fire({
                                title: '¿Está seguro?',
                                text: '¿Desea cambiar el rol de este entrenador a ' + (nuevoRol === '1' ? 'Administrador' : 'Entrenador') + '?',
                                icon: 'question',
                                showCancelButton: true,
                                confirmButtonColor: '#1976d2',
                                cancelButtonColor: '#6c757d',
                                confirmButtonText: 'Sí, cambiar',
                                cancelButtonText: 'Cancelar'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    // Mostrar mensaje de procesando
                                    Swal.fire({
                                        title: 'Procesando',
                                        text: 'Actualizando rol del entrenador...',
                                        icon: 'info',
                                        allowOutsideClick: false,
                                        showConfirmButton: false,
                                        willOpen: () => {
                                            Swal.showLoading();
                                        }
                                    });
                                    
                                    // Enviar solicitud para cambiar rol
                                    fetch('EditarEntrenadorServlet', {
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/x-www-form-urlencoded',
                                        },
                                        body: 'action=cambiarRol&id=' + id + '&rol=' + nuevoRol
                                    })
                                    .then(response => response.json())
                                    .then(data => {
                                        if (data.success) {
                                            Swal.fire({
                                                title: '¡Éxito!',
                                                text: 'El rol ha sido actualizado correctamente',
                                                icon: 'success',
                                                confirmButtonColor: '#1976d2',
                                                confirmButtonText: 'Aceptar'
                                            });
                                        } else {
                                            // Revertir cambio si falló
                                            selectElement.value = valorAnterior;
                                            Swal.fire({
                                                title: 'Error',
                                                text: data.message || 'No se pudo actualizar el rol',
                                                icon: 'error',
                                                confirmButtonColor: '#1976d2',
                                                confirmButtonText: 'Cerrar'
                                            });
                                        }
                                    })
                                    .catch(error => {
                                        // Revertir cambio si hubo error
                                        selectElement.value = valorAnterior;
                                        console.error('Error:', error);
                                        Swal.fire({
                                            title: 'Error',
                                            text: 'Ha ocurrido un error al procesar la solicitud',
                                            icon: 'error',
                                            confirmButtonColor: '#1976d2',
                                            confirmButtonText: 'Cerrar'
                                        });
                                    });
                                } else {
                                    // Revertir cambio si el usuario cancela
                                    selectElement.value = valorAnterior;
                                }
                            });
                        });
                    });
                    
                    // Manejar cambios de estado activo
                    document.querySelectorAll('.cambiar-estado').forEach(checkbox => {
                        checkbox.addEventListener('change', function() {
                            const id = this.getAttribute('data-id');
                            const activo = this.checked;
                            const checkboxElement = this; // Referencia al checkbox
                            
                            Swal.fire({
                                title: '¿Está seguro?',
                                text: '¿Desea ' + (activo ? 'activar' : 'desactivar') + ' este entrenador?',
                                icon: 'question',
                                showCancelButton: true,
                                confirmButtonColor: '#1976d2',
                                cancelButtonColor: '#6c757d',
                                confirmButtonText: 'Sí, cambiar',
                                cancelButtonText: 'Cancelar'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    // Mostrar mensaje de procesando
                                    Swal.fire({
                                        title: 'Procesando',
                                        text: (activo ? 'Activando' : 'Desactivando') + ' entrenador...',
                                        icon: 'info',
                                        allowOutsideClick: false,
                                        showConfirmButton: false,
                                        willOpen: () => {
                                            Swal.showLoading();
                                        }
                                    });
                                    
                                    // Enviar solicitud para cambiar estado
                                    fetch('EditarEntrenadorServlet', {
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/x-www-form-urlencoded',
                                        },
                                        body: 'action=cambiarEstado&id=' + id + '&activo=' + activo
                                    })
                                    .then(response => response.json())
                                    .then(data => {
                                        if (data.success) {
                                            Swal.fire({
                                                title: '¡Éxito!',
                                                text: 'El entrenador ha sido ' + (activo ? 'activado' : 'desactivado') + ' correctamente',
                                                icon: 'success',
                                                confirmButtonColor: '#1976d2',
                                                confirmButtonText: 'Aceptar'
                                            });
                                        } else {
                                            // Revertir cambio si falló
                                            checkboxElement.checked = !activo;
                                            Swal.fire({
                                                title: 'Error',
                                                text: data.message || 'No se pudo actualizar el estado',
                                                icon: 'error',
                                                confirmButtonColor: '#1976d2',
                                                confirmButtonText: 'Cerrar'
                                            });
                                        }
                                    })
                                    .catch(error => {
                                        // Revertir cambio si hubo error
                                        checkboxElement.checked = !activo;
                                        console.error('Error:', error);
                                        Swal.fire({
                                            title: 'Error',
                                            text: 'Ha ocurrido un error al procesar la solicitud',
                                            icon: 'error',
                                            confirmButtonColor: '#1976d2',
                                            confirmButtonText: 'Cerrar'
                                        });
                                    });
                                } else {
                                    // Revertir cambio si el usuario cancela
                                    checkboxElement.checked = !activo;
                                }
                            });
                        });
                    });
                });
                </script>
            </div>

        <div id="horarios-view" class="view-container">
            <h2>Gestión de Horarios</h2>
            
            <!-- Pestañas secundarias para horarios -->
            <div class="row mb-4">
                <div class="col-12">
                    <div class="btn-group w-100" role="group">
                        <button type="button" class="btn btn-outline-primary horarios-tab active" id="btnJornadas" onclick="mostrarTabHorarios('jornadas')">
                            <i class="fas fa-clock me-2"></i>Gestionar Jornadas
                        </button>
                        <button type="button" class="btn btn-outline-primary horarios-tab" id="btnAsignaciones" onclick="mostrarTabHorarios('asignaciones')">
                            <i class="fas fa-user-clock me-2"></i>Asignar Horarios
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sección: Gestionar Jornadas -->
            <div id="jornadas-tab" class="horarios-tab-content active">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4>Jornadas Disponibles</h4>
                    <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modalJornada">
                        <i class="fas fa-plus me-2"></i>Nueva Jornada
                    </button>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover data-table">
                        <thead>
                            <tr>
                                <th>Día</th>
                                <th>Hora</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="jornadasTableBody">
                            <!-- Los datos se cargarán dinámicamente desde la base de datos -->
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Sección: Asignar Horarios -->
            <div id="asignaciones-tab" class="horarios-tab-content">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4>Asignaciones de Horarios</h4>
                    <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#modalAsignacion">
                        <i class="fas fa-user-plus me-2"></i>Nueva Asignación
                    </button>
                </div>



                <div class="table-responsive">
                    <table class="table table-hover data-table">
                        <thead>
                            <tr>
                                <th>Entrenador</th>
                                <th>Día</th>
                                <th>Horario</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="asignacionesTableBody">
                            <!-- Datos de ejemplo - reemplazar con datos reales del servidor -->
                            <tr>
                                <td>Daniel Castro</td>
                                <td><span class="badge bg-info">Lunes</span></td>
                                <td>08:00 - 10:00</td>
                                <td>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input cambiar-estado-asignacion" type="checkbox" checked data-id="1">
                                    </div>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-info-table btn-sm me-1" 
                                            data-bs-toggle="modal" data-bs-target="#modalAsignacion"
                                            data-id="1" data-entrenador="52" data-jornada="1">
                                        <i class="fas fa-edit"></i> Editar
                                    </button>
                                    <button type="button" class="btn btn-danger-table btn-sm" onclick="eliminarAsignacion(1)">
                                        <i class="fas fa-trash"></i> Eliminar
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>Tatiana Rincón</td>
                                <td><span class="badge bg-info">Miércoles</span></td>
                                <td>15:00 - 17:00</td>
                                <td>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input cambiar-estado-asignacion" type="checkbox" checked data-id="2">
                                    </div>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-info-table btn-sm me-1" 
                                            data-bs-toggle="modal" data-bs-target="#modalAsignacion"
                                            data-id="2" data-entrenador="54" data-jornada="2">
                                        <i class="fas fa-edit"></i> Editar
                                    </button>
                                    <button type="button" class="btn btn-danger-table btn-sm" onclick="eliminarAsignacion(2)">
                                        <i class="fas fa-trash"></i> Eliminar
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Modal para Jornada -->
            <div class="modal fade" id="modalJornada" tabindex="-1" aria-labelledby="modalJornadaLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title" id="modalJornadaLabel">Nueva Jornada</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <form id="formJornada" class="compact-form needs-validation" novalidate>
                                <div class="row g-3 mb-3">
                                    <div class="col-12">
                                        <label for="diaJornada" class="form-label small mb-1">Día de la Semana</label>
                                        <select class="form-select form-select-sm" id="diaJornada" name="diaJornada" required>
                                            <option value="">Selecciona un día...</option>
                                            <option value="Lunes">Lunes</option>
                                            <option value="Martes">Martes</option>
                                            <option value="Miércoles">Miércoles</option>
                                            <option value="Jueves">Jueves</option>
                                            <option value="Viernes">Viernes</option>
                                            <option value="Sábado">Sábado</option>
                                            <option value="Domingo">Domingo</option>
                                        </select>
                                        <div class="invalid-feedback">Por favor selecciona un día de la semana.</div>
                                    </div>
                                </div>
                                <div class="row g-3 mb-3">
                                    <div class="col-12">
                                        <label for="horaInicio" class="form-label small mb-1">Hora</label>
                                        <input type="time" class="form-control form-control-sm" id="horaInicio" name="horaInicio" required>
                                        <div class="invalid-feedback">Ingresa la hora.</div>
                                    </div>
                                </div>
                                <input type="hidden" id="idJornada" name="idJornada">
                            </form>
                        </div>
                        <div class="modal-footer bg-light">
                            <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-sm btn-primary" id="btnGuardarJornada">Guardar Jornada</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal para Asignación -->
            <div class="modal fade" id="modalAsignacion" tabindex="-1" aria-labelledby="modalAsignacionLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header bg-success text-white">
                            <h5 class="modal-title" id="modalAsignacionLabel">Nueva Asignación</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <form id="formAsignacion" class="compact-form needs-validation" novalidate>
                                <div class="row g-3 mb-3">
                                    <div class="col-12">
                                        <label for="entrenadorAsignacion" class="form-label small mb-1">Entrenador</label>
                                        <select class="form-select form-select-sm" id="entrenadorAsignacion" name="entrenadorAsignacion" required>
                                            <option value="">Selecciona un entrenador...</option>
                                            <option value="52">Daniel Castro</option>
                                            <option value="54">Tatiana Rincón</option>
                                            <option value="58">Marcos Vargas</option>
                                        </select>
                                        <div class="invalid-feedback">Por favor selecciona un entrenador.</div>
                                    </div>
                                </div>
                                <div class="row g-3 mb-3">
                                    <div class="col-12">
                                        <label for="jornadaAsignacion" class="form-label small mb-1">Jornada</label>
                                        <select class="form-select form-select-sm" id="jornadaAsignacion" name="jornadaAsignacion" required>
                                            <option value="">Selecciona una jornada...</option>
                                            <option value="1">Lunes 08:00 - 10:00</option>
                                            <option value="2">Miércoles 15:00 - 17:00</option>
                                            <option value="3">Viernes 09:00 - 11:00</option>
                                        </select>
                                        <div class="invalid-feedback">Por favor selecciona una jornada.</div>
                                    </div>
                                </div>
                                <input type="hidden" id="idAsignacion" name="idAsignacion">
                            </form>
                        </div>
                        <div class="modal-footer bg-light">
                            <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-sm btn-success" id="btnGuardarAsignacion">Guardar Asignación</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Pie de página -->
    <footer id="piePagina">
        <div class="container text-center">
            <p class="mb-0">&copy; 2024 ATSA Club. Todos los derechos reservados.</p>
            <p class="mb-0">Sistema de Gestión Deportiva</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <!-- Scripts principales -->
    <script>
        // Función para mostrar diferentes vistas
        function mostrarVista(vista) {
            // Ocultar todas las vistas
            document.querySelectorAll('.view-container').forEach(function(container) {
                container.classList.remove('active');
            });
            
            // Remover clase active de todos los botones
            document.querySelectorAll('.toggle-btn').forEach(function(btn) {
                btn.classList.remove('active');
            });
            
            // Mostrar la vista seleccionada
            const vistaSeleccionada = document.getElementById(vista + '-view');
            if (vistaSeleccionada) {
                vistaSeleccionada.classList.add('active');
            }
            
            // Activar el botón correspondiente
            if (vista === 'postulantes') {
                document.getElementById('btnPostulantes').classList.add('active');
            } else if (vista === 'entrenadores') {
                document.getElementById('btnEntrenadores').classList.add('active');
            } else if (vista === 'horarios') {
                document.getElementById('btnHorarios').classList.add('active');
            }
        }

        // Función para mostrar pestañas de horarios
        function mostrarTabHorarios(tab) {
            // Ocultar todas las pestañas de horarios
            document.querySelectorAll('.horarios-tab-content').forEach(function(content) {
                content.classList.remove('active');
            });
            
            // Remover clase active de todos los botones de pestañas
            document.querySelectorAll('.horarios-tab').forEach(function(btn) {
                btn.classList.remove('active');
            });
            
            // Mostrar la pestaña seleccionada
            const tabSeleccionada = document.getElementById(tab + '-tab');
            if (tabSeleccionada) {
                tabSeleccionada.classList.add('active');
            }
            
            // Activar el botón correspondiente
            if (tab === 'jornadas') {
                document.getElementById('btnJornadas').classList.add('active');
            } else if (tab === 'asignaciones') {
                document.getElementById('btnAsignaciones').classList.add('active');
            }
        }

        // Función para cerrar sesión
        function cerrarSesion() {
            Swal.fire({
                title: '¿Está seguro?',
                text: '¿Desea cerrar la sesión actual?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#1976d2',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, cerrar sesión',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '/atsaNet/ValidarPersonalT';
                }
            });
        }

        // Funciones para gestión de jornadas
        function eliminarJornada(id) {
            Swal.fire({
                title: '¿Está seguro?',
                text: '¿Desea eliminar esta jornada? Esta acción no se puede deshacer.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#dc3545',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Enviar solicitud de eliminación al servlet
                    const params = new URLSearchParams();
                    params.append('action', 'eliminar');
                    params.append('id', id);
                    
                    fetch('${pageContext.request.contextPath}/JornadaServlet', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: params.toString()
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            Swal.fire({
                                title: 'Eliminado',
                                text: data.message,
                                icon: 'success',
                                confirmButtonColor: '#1976d2'
                            }).then(() => {
                                // Recargar solo la tabla de jornadas
                                cargarJornadas();
                            });
                        } else {
                            Swal.fire({
                                title: 'Error',
                                text: data.message || 'No se pudo eliminar la jornada',
                                icon: 'error',
                                confirmButtonColor: '#1976d2'
                            });
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        Swal.fire({
                            title: 'Error',
                            text: 'Error de conexión con el servidor',
                            icon: 'error',
                            confirmButtonColor: '#1976d2'
                        });
                    });
                }
            });
        }

        // Funciones para gestión de asignaciones
        function eliminarAsignacion(id) {
            Swal.fire({
                title: '¿Está seguro?',
                text: '¿Desea eliminar esta asignación?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#dc3545',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Aquí iría la lógica para eliminar la asignación
                    Swal.fire({
                        title: 'Eliminado',
                        text: 'La asignación ha sido eliminada correctamente.',
                        icon: 'success',
                        confirmButtonColor: '#1976d2'
                    });
                }
            });
        }

        // Efectos de navbar al hacer scroll
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Función global para cargar jornadas desde la base de datos
        function cargarJornadas() {
            const tbody = document.getElementById('jornadasTableBody');
            tbody.innerHTML = '<tr><td colspan="3" class="text-center"><i class="fas fa-spinner fa-spin me-2"></i>Cargando jornadas...</td></tr>';
            
            fetch('${pageContext.request.contextPath}/JornadaServlet?action=listarJSON')
                .then(response => response.text())
                .then(responseText => {
                    try {
                        const data = JSON.parse(responseText);
                        
                        if (data.success) {
                            mostrarJornadasEnTabla(data.jornadas);
                        } else {
                            tbody.innerHTML = '<tr><td colspan="3" class="text-center text-danger">Error: ' + data.message + '</td></tr>';
                            Swal.fire({
                                title: 'Error',
                                text: 'No se pudieron cargar las jornadas: ' + data.message,
                                icon: 'error',
                                confirmButtonColor: '#1976d2'
                            });
                        }
                    } catch (parseError) {
                        tbody.innerHTML = '<tr><td colspan="3" class="text-center text-danger">Error al procesar respuesta del servidor</td></tr>';
                    }
                })
                .catch(error => {
                    tbody.innerHTML = '<tr><td colspan="3" class="text-center text-danger">Error de conexión: ' + error.message + '</td></tr>';
                    Swal.fire({
                        title: 'Error',
                        text: 'Error de conexión al cargar las jornadas: ' + error.message,
                        icon: 'error',
                        confirmButtonColor: '#1976d2'
                    });
                });
        }

        // Función global para mostrar jornadas en la tabla
        function mostrarJornadasEnTabla(jornadas) {
            const tbody = document.getElementById('jornadasTableBody');
            tbody.innerHTML = '';

            if (!jornadas || jornadas.length === 0) {
                tbody.innerHTML = '<tr><td colspan="3" class="text-center text-muted">No hay jornadas registradas</td></tr>';
                return;
            }

            jornadas.forEach((jornada, index) => {
                const row = document.createElement('tr');
                
                // Usar concatenación de strings en lugar de template literals
                const htmlContent = 
                    '<td><span class="badge bg-info">' + (jornada.dia_semana || 'Sin día') + '</span></td>' +
                    '<td>' + (jornada.hora_jornada || 'Sin hora') + '</td>' +
                    '<td>' +
                        '<button type="button" class="btn btn-info-table btn-sm me-1" ' +
                                'data-bs-toggle="modal" data-bs-target="#modalJornada" ' +
                                'data-id="' + jornada.id + '" data-dia="' + jornada.dia_semana + '" data-hora="' + jornada.hora_jornada + '">' +
                            'Editar' +
                        '</button>' +
                        '<button type="button" class="btn btn-danger-table btn-sm" onclick="eliminarJornada(' + jornada.id + ')">' +
                            'Eliminar' +
                        '</button>' +
                    '</td>';
                
                row.innerHTML = htmlContent;
                tbody.appendChild(row);
            });
        }

        // Funcionalidad de modales de horarios
        document.addEventListener('DOMContentLoaded', function() {
            // Modal de Jornada
            const modalJornada = document.getElementById('modalJornada');
            const formJornada = document.getElementById('formJornada');
            const btnGuardarJornada = document.getElementById('btnGuardarJornada');

            // Cargar jornadas al inicio
            cargarJornadas();

            // Prevenir envío automático del formulario
            formJornada.addEventListener('submit', function(event) {
                event.preventDefault();
                return false;
            });

            modalJornada.addEventListener('show.bs.modal', function(event) {
                const button = event.relatedTarget;
                const jornadaId = button.getAttribute('data-id');
                
                if (jornadaId) {
                    // Modo edición
                    document.getElementById('modalJornadaLabel').textContent = 'Editar Jornada';
                    document.getElementById('idJornada').value = jornadaId;
                    // Cargar datos de la jornada para edición
                    document.getElementById('diaJornada').value = button.getAttribute('data-dia') || '';
                    document.getElementById('horaInicio').value = button.getAttribute('data-hora') || '';
                } else {
                    // Modo creación
                    document.getElementById('modalJornadaLabel').textContent = 'Nueva Jornada';
                    formJornada.reset();
                    document.getElementById('idJornada').value = '';
                }
                
                formJornada.classList.remove('was-validated');
            });

            btnGuardarJornada.addEventListener('click', function(event) {
                // Prevenir cualquier comportamiento por defecto
                event.preventDefault();
                event.stopPropagation();
                
                if (!formJornada.checkValidity()) {
                    formJornada.classList.add('was-validated');
                    return;
                }

                const jornadaId = document.getElementById('idJornada').value;
                const accion = jornadaId ? 'actualizar' : 'crear';
                
                Swal.fire({
                    title: 'Procesando',
                    text: accion === 'crear' ? 'Creando jornada...' : 'Actualizando jornada...',
                    icon: 'info',
                    allowOutsideClick: false,
                    showConfirmButton: false,
                    willOpen: () => {
                        Swal.showLoading();
                    }
                });

                // Enviar datos al servlet
                const params = new URLSearchParams();
                params.append('action', accion);
                
                // Agregar los datos del formulario con los nombres correctos
                const diaJornada = document.getElementById('diaJornada').value;
                const horaInicio = document.getElementById('horaInicio').value;
                const idJornada = document.getElementById('idJornada').value;
                
                params.append('dia_semana', diaJornada);
                params.append('hora_jornada', horaInicio);
                
                if (accion === 'actualizar') {
                    params.append('id', idJornada);
                }
                
                fetch('${pageContext.request.contextPath}/JornadaServlet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: params.toString()
                })
                .then(response => {
                    return response.json();
                })
                .then(data => {
                    Swal.close();
                    if (data.success) {
                        Swal.fire({
                            title: '¡Éxito!',
                            text: data.message,
                            icon: 'success',
                            confirmButtonColor: '#1976d2'
                        }).then(() => {
                            const modal = bootstrap.Modal.getInstance(modalJornada);
                            modal.hide();
                            // Recargar solo la tabla de jornadas
                            cargarJornadas();
                        });
                    } else {
                        Swal.fire({
                            title: 'Error',
                            text: data.message || 'Ocurrió un error al procesar la solicitud',
                            icon: 'error',
                            confirmButtonColor: '#1976d2'
                        });
                    }
                })
                .catch(error => {
                    Swal.close();
                    console.error('Error en fetch:', error);
                    Swal.fire({
                        title: 'Error',
                        text: 'Error de conexión con el servidor: ' + error.message,
                        icon: 'error',
                        confirmButtonColor: '#1976d2'
                    });
                });
            });

            // Modal de Asignación
            const modalAsignacion = document.getElementById('modalAsignacion');
            const formAsignacion = document.getElementById('formAsignacion');
            const btnGuardarAsignacion = document.getElementById('btnGuardarAsignacion');

            // Prevenir envío automático del formulario
            formAsignacion.addEventListener('submit', function(event) {
                event.preventDefault();
                return false;
            });

            modalAsignacion.addEventListener('show.bs.modal', function(event) {
                const button = event.relatedTarget;
                const asignacionId = button.getAttribute('data-id');
                
                if (asignacionId) {
                    // Modo edición
                    document.getElementById('modalAsignacionLabel').textContent = 'Editar Asignación';
                    document.getElementById('idAsignacion').value = asignacionId;
                    // Cargar datos de la asignación para edición
                    document.getElementById('entrenadorAsignacion').value = button.getAttribute('data-entrenador') || '';
                    document.getElementById('jornadaAsignacion').value = button.getAttribute('data-jornada') || '';
                } else {
                    // Modo creación
                    document.getElementById('modalAsignacionLabel').textContent = 'Nueva Asignación';
                    formAsignacion.reset();
                    document.getElementById('idAsignacion').value = '';
                }
                
                formAsignacion.classList.remove('was-validated');
            });

            btnGuardarAsignacion.addEventListener('click', function() {
                if (!formAsignacion.checkValidity()) {
                    formAsignacion.classList.add('was-validated');
                    return;
                }

                const asignacionId = document.getElementById('idAsignacion').value;
                const accion = asignacionId ? 'actualizar' : 'crear';
                
                Swal.fire({
                    title: 'Procesando',
                    text: accion === 'crear' ? 'Creando asignación...' : 'Actualizando asignación...',
                    icon: 'info',
                    allowOutsideClick: false,
                    showConfirmButton: false,
                    willOpen: () => {
                        Swal.showLoading();
                    }
                });

                // Aquí iría la lógica para guardar/actualizar la asignación
                setTimeout(() => {
                    Swal.fire({
                        title: '¡Éxito!',
                        text: accion === 'crear' ? 'Asignación creada correctamente' : 'Asignación actualizada correctamente',
                        icon: 'success',
                        confirmButtonColor: '#1976d2'
                    }).then(() => {
                        const modal = bootstrap.Modal.getInstance(modalAsignacion);
                        modal.hide();
                        // Recargar tabla de asignaciones
                    });
                }, 1000);
            });

            // Cambios de estado para asignaciones
            document.querySelectorAll('.cambiar-estado-asignacion').forEach(checkbox => {
                checkbox.addEventListener('change', function() {
                    const id = this.getAttribute('data-id');
                    const activo = this.checked;
                    
                    // Aquí iría la lógica para cambiar el estado de la asignación
                    console.log('Cambiar estado de asignación ' + id + ' a ' + (activo ? 'activa' : 'inactiva'));
                });
            });
        });
    </script>

    <style>
        /* Estilos específicos para gestión de horarios */
        .horarios-tab-content {
            display: none;
        }

        .horarios-tab-content.active {
            display: block;
        }

        .horarios-tab {
            border-radius: 0;
        }

        .horarios-tab.active {
            background-color: #1976d2;
            color: white;
            border-color: #1976d2;
        }

        .avatar-sm {
            width: 40px;
            height: 40px;
            font-size: 14px;
            font-weight: bold;
        }

        .btn-info-table {
            background-color: #17a2b8;
            border-color: #17a2b8;
            color: white;
            padding: 0.25rem 0.5rem;
        }

        .btn-info-table:hover {
            background-color: #138496;
            border-color: #117a8b;
            color: white;
        }

        .btn-danger-table {
            background-color: #dc3545;
            border-color: #dc3545;
            color: white;
            padding: 0.25rem 0.5rem;
        }

        .btn-danger-table:hover {
            background-color: #c82333;
            border-color: #bd2130;
            color: white;
        }

        .compact-form .form-label {
            font-weight: 600;
            color: #495057;
        }

        .compact-form .form-control-sm,
        .compact-form .form-select-sm {
            font-size: 0.875rem;
        }

        .data-table th {
            background-color: #f8f9fa;
            border-top: none;
            font-weight: 600;
            color: #495057;
            font-size: 0.875rem;
        }

        .badge {
            font-size: 0.75rem;
        }

        .form-check-input:checked {
            background-color: #1976d2;
            border-color: #1976d2;
        }

        .modal-header.bg-primary {
            background-color: #1976d2 !important;
        }

        .modal-header.bg-success {
            background-color: #28a745 !important;
        }
    </style>
</body>
</html>