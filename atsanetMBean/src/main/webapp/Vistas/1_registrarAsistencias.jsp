<%-- 
    Document   : 1_registrarAsistencias
    Created on : 26 jun 2025, 6:13:33 p. m.
    Author     : tin
--%>

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
    <title>Gestión de Asistencia de Entrenamiento</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            margin: 0px;
            padding: 0px;
            background: #f4f6fb;
            color: #263a5e;
            font-family: 'Roboto', sans-serif;
            box-sizing: border-box;
        }

        main {
            background: transparent;
            width: 100vw;
            min-height: 70vh;
            margin-top: 20px;
            margin-left: 50px;
            margin-right: 50px;
            color: #263a5e;
        }

        h2 {
            color: #1976d2;
            text-align: center;
            font-size: 2.5em;
            /* Aumentado el tamaño del título */
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 0.5em;
            position: relative;
            justify-content: center;
        }

        h2::after {
            content: "";
            display: block;
            height: 4px;
            width: 80px;
            /* Aumentado el ancho de la línea */
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            border-radius: 2px;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            bottom: -8px;
        }


        #Informacion {
            background: #fff;
            width: 90%;
            /* Ancho aumentado para la tabla de asistencia */
            max-width: 1200px;
            /* Ancho máximo para mejor visualización en pantallas grandes */
            height: auto;
            border-radius: 18px;
            padding: 60px;
            margin: 10px auto;
            box-shadow: 0 2px 12px rgba(25, 118, 210, 0.10);
            color: #263a5e;
        }

        .table {
            background-color: #fff;
            border: 1px solid #e0e9ff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            width: 100%;
            /* Asegura que la tabla ocupe todo el ancho disponible */
        }

        .table thead {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            color: #FFFFFF;
        }

        .table th,
        .table td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #e0e9ff;
            vertical-align: middle;
            /* Alineación vertical de celdas */
        }

        .table th {
            font-weight: 600;
        }

        .table tbody tr:nth-child(even) {
            background-color: #f5f9ff;
        }

        .table tbody tr:hover {
            background-color: #e6f0ff;
        }

        .row {
            margin: 20px;
        }

        .hidden {
            display: none;
        }

        /* Estilos mejorados para los botones principales */
        .btn-main-action {
            color: white;
            margin: 10px;
            width: 220px;
            /* Ancho un poco mayor */
            height: 70px;
            /* Altura adecuada */
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            border: none;
            border-radius: 10px;
            /* Bordes más redondeados */
            font-size: 1.2em;
            /* Texto más grande */
            font-weight: bold;
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out, background 0.3s ease-in-out;
            box-shadow: 0 4px 15px rgba(25, 118, 210, 0.2);
            /* Sombra suave */
        }

        .btn-main-action:hover {
            background: linear-gradient(90deg, #63a4ff 0%, #1976d2 100%);
            /* Invertir degradado en hover */
            transform: translateY(-3px);
            /* Efecto 3D ligero */
            box-shadow: 0 8px 20px rgba(25, 118, 210, 0.4);
            /* Sombra más pronunciada */
        }

        /* Estilos para botones secundarios (Modificar) */
        .btn-secondary-action {
            color: white;
            margin: 10px;
            width: 220px;
            height: 70px;
            background-color: #6c757d;
            border-color: #6c757d;
            border-radius: 10px;
            font-size: 1.2em;
            font-weight: bold;
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out, background-color 0.3s ease-in-out;
            box-shadow: 0 4px 15px rgba(108, 117, 125, 0.2);
        }

        .btn-secondary-action:hover {
            background-color: #5a6268;
            border-color: #545b62;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(108, 117, 125, 0.4);
        }

        /* Estilos para el botón de Finalizar Sesión / Sesión Guardada en el modal */
        #finalizarSesionModalBtn {
            background: linear-gradient(90deg, #dc3545 0%, #e85a6a 100%);
            /* Degradado para el botón de peligro */
            border: none;
            color: white;
            font-weight: bold;
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out, background 0.3s ease-in-out;
            box-shadow: 0 4px 15px rgba(220, 53, 69, 0.2);
        }

        #finalizarSesionModalBtn:hover {
            background: linear-gradient(90deg, #e85a6a 0%, #dc3545 100%);
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(220, 53, 69, 0.4);
        }

        /* Nuevo estilo para el botón cuando los objetivos están guardados */
        .btn-success-saved {
            background: linear-gradient(90deg, #28a745 0%, #218838 100%) !important;
            /* Degradado verde */
            box-shadow: 0 4px 15px rgba(40, 167, 69, 0.2) !important;
        }

        .btn-success-saved:hover {
            background: linear-gradient(90deg, #218838 0%, #28a745 100%) !important;
            box-shadow: 0 8px 20px rgba(40, 167, 69, 0.4) !important;
        }


        #piePagina {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            width: auto;
            height: 120px;
            border: none;
            color: white;
            box-shadow: 0 -4px 20px rgba(25, 118, 210, 0.10);
            margin-top: 40px;
        }

        /* Navbar styles from the second code */
        .navbar {
            transition: box-shadow 0.3s, background 0.3s;
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            box-shadow: 0 4px 20px rgba(25, 118, 210, 0.10);
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
            background: #fff;
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

        /* Offcanvas styles to match the new theme */
        .offcanvas {
            background: #142441;
            border: 5px solid rgb(14, 25, 44);
            border-radius: 10px;
            box-shadow: 0 15px 15px rgba(0, 0, 0, 0.60);
            color: white;
        }

        .offcanvas-header {
            background: #1976d2;
            color: white;
            border-bottom: 1px solid #63a4ff;
        }

        .offcanvas-title {
            color: white;
        }

        .offcanvas-body {
            background: #263a5e;
            color: white;
        }

        .offcanvas-body p {
            color: #e0e0e0;
        }

        .offcanvas-body section button {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 15px auto;
            width: 300px;
            height: 50px;
            background: #1976d2;
            color: white;
            border: none;
            border-radius: 8px;
            transition: background 0.2s, transform 0.2s;
        }

        .offcanvas-body section button:hover {
            background: #63a4ff;
            transform: translateY(-2px);
        }

        .dropdown-menu {
            background-color: #263a5e;
            border: 1px solid #142441;
        }

        .dropdown-item {
            color: white;
            background-color: #263a5e;
            transition: background-color 0.2s, color 0.2s;
        }

        .dropdown-item:hover {
            background-color: #1976d2;
            color: #ffe082;
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #212529;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }

        /* Styles for the Modal Content */
        #objetivosModal .modal-content,
        #consultaSesionModal .modal-content {
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
        }

        #objetivosModal .modal-header,
        #consultaSesionModal .modal-header {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            color: white;
            border-bottom: none;
            padding: 1.5rem;
            border-top-left-radius: 18px;
            border-top-right-radius: 18px;
        }

        #objetivosModal .modal-title,
        #consultaSesionModal .modal-title {
            font-weight: 700;
            font-size: 1.8em;
        }

        #objetivosModal .modal-body,
        #consultaSesionModal .modal-body {
            padding: 2rem;
            color: #263a5e;
        }

        #objetivosModal .modal-footer,
        #consultaSesionModal .modal-footer {
            background-color: #f4f6fb;
            border-top: 1px solid #e0e9ff;
            padding: 1.5rem;
            border-bottom-left-radius: 18px;
            border-bottom-right-radius: 18px;
            display: flex;
            /* Asegura que los botones se alineen bien */
            justify-content: flex-end;
            /* Alinea los botones a la derecha */
            gap: 10px;
            /* Espacio entre los botones */
        }

        #objetivosModal .form-label,
        #consultaSesionModal .form-label {
            font-weight: 500;
        }

        /* Specific styles for the tables within the modals */
        #objetivosModal .table th,
        #consultaSesionModal .table th {
            background-color: #41B3E8;
            /* Using the color from the original objectives code */
            color: #FFFFFF;
        }

        #objetivosModal .table,
        #consultaSesionModal .table {
            border: 1px solid #e0e9ff;
            /* Consistent border */
            border-radius: 10px;
            /* Consistent border-radius */
            overflow: hidden;
        }

        #objetivosModal .table th,
        #objetivosModal .table td,
        #consultaSesionModal .table th,
        #consultaSesionModal .table td {
            padding: 12px 15px;
            /* Consistent padding */
            text-align: left;
            border: 1px solid #e0e9ff;
            vertical-align: middle;
        }

        #objetivosModal .is-invalid,
        #consultaSesionModal .is-invalid {
            border-color: red;
        }

        /* Custom Toggle Switch Styles */
        .switch {
            position: relative;
            display: inline-block;
            width: 45px;
            /* Ancho del switch */
            height: 25px;
            /* Alto del switch */
            margin: 0;
            /* Elimina margen extra */
            vertical-align: middle;
            /* Alineación vertical */
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
            border-radius: 25px;
            /* Bordes redondeados */
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 19px;
            /* Tamaño del círculo */
            width: 19px;
            /* Tamaño del círculo */
            left: 3px;
            bottom: 3px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
            border-radius: 50%;
            /* Círculo */
        }

        input:checked+.slider {
            background-color: #1976d2;
            /* Color azul cuando está activo */
        }

        input:focus+.slider {
            box-shadow: 0 0 1px #1976d2;
        }

        input:checked+.slider:before {
            -webkit-transform: translateX(20px);
            /* Mover el círculo a la derecha */
            -ms-transform: translateX(20px);
            transform: translateX(20px);
        }

        /* Estilos específicos para los botones de consultar sesión */
        .consult-session-buttons button {
            margin: 0 5px;
            font-size: 1em;
            padding: 8px 15px;
            height: auto;
            /* Ajustar altura para botones más pequeños */
            width: auto;
            /* Ajustar ancho */
        }

        #consultaSesionModal #tablaAsistenciaConsulta,
        #consultaSesionModal #tablaObjetivosConsulta,
        #consultaSesionModal .consult-session-buttons {
            /* Modificado para ocultar toda la fila de botones */
            display: none;
        }
    </style>

</head>

<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand ms-3" href="../1_inicioAdministrador.html">
                <img src="../img/logo_club.png" alt="Logo" style="width: 120px;">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#menuDesplegale"
                aria-controls="menuDesplegale" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarMenu">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Entrenadores
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Alumnos
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Entrenamientos y objetivos
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            Sesion de Entrenamiento
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Reportes
                        </a>
                    </li>
                </ul>
                <div class="d-flex align-items-center me-3">
    <div class="text-end me-3">
        <span class="fw-bold text-white">Pedro L. Torres</span><br>
        <span class="text-white-50" style="font-size: 0.9em;">Entrenador</span>
    </div>
    <img src="../img/perfil.webp" class="rounded-5 border border-3 border-light"
        style="width: 55px; height: 55px; object-fit: cover;">
    <button class="btn btn-outline-light ms-3" onclick="cerrarSesion()">Cerrar Sesión</button>
</div>
            </div>
        </div>
    </nav>

    <div class="container d-flex text-white" id="contenedor">
        <main>
            <div class="row d-flex justify-content-center">
                <h2 class="my-5">Gestión de Asistencia de Entrenamiento</h2>
                <hr class="border-5 border-dark opacity-50" style="width: 900px;">
            </div>

            <div class="row my-5 d-flex justify-content-center">
                <div class="col-md-10" id="Informacion">
                    <div class="row">
                        <form>
                            <div class="col-auti mb-3 mt-4">
                                <label for="categoria" class="form-label">Selecciona la categoría:</label>
                                <select id="categoria" class="form-select" onchange="mostrarGrupos()">
                                    <option value="">-- Seleccionar categoría --</option>
                                    <option value="Categoria1">Categoría 1</option>
                                    <option value="Categoria2">Categoría 2</option>
                                    <option value="Categoria3">Categoría 3</option>
                                </select>
                            </div>

                            <div class="col-auto hidden mb-3" id="grupos">
                                <label for="grupo" class="form-label">Selecciona el grupo:</label>
                                <select id="grupo" class="form-select" onchange="mostrarAlumnos()">
                                    <option value="">-- Seleccionar grupo --</option>
                                    <option value="Grupo1">Grupo 1</option>
                                    <option value="Grupo2">Grupo 2</option>
                                    <option value="Grupo3">Grupo 3</option>
                                </select>
                            </div>
                        </form>
                    </div>

                    <div class="row hidden" id="alumnos">
                        <h4 class="mt-4">Registrar Asistencia de Alumnos</h4>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID Asistencia</th>
                                        <th>Número de Alumno</th>
                                        <th>Fecha de Asistencia</th>
                                        <th>Asistencia</th>
                                        <th>Observaciones de Asistencia</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="row d-flex justify-content-center">
                        <button id="guardarAsistenciaBtn" class="btn btn-main-action hidden"
                            onclick="guardarAsistencia()">Guardar
                            Asistencia</button>

                        <button id="modificarBtn" class="btn btn-secondary-action hidden"
                            onclick="modificarAsistencia()">Modificar
                            Asistencia</button>

                        <button id="sesionEntrenamientoBtn" class="btn btn-main-action hidden" data-bs-toggle="modal"
                            data-bs-target="#objetivosModal">Iniciar
                            Entrenamiento</button>

                        <button id="consultarSesionBtn" class="btn btn-main-action" data-bs-toggle="modal"
                            data-bs-target="#consultaSesionModal">Consultar Sesión de Entrenamiento</button>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <div class="footer d-flex justify-content-center text-center align-items-center" id="piePagina">
        <h5>&copy; 2024 Club Deportivo Atlético Santander. Todos los derechos reservados.</h5>
    </div>

    <div class="modal fade" id="objetivosModal" tabindex="-1" aria-labelledby="objetivosModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="objetivosModalLabel">Sesión de Entrenamiento y Registro de Objetivos
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label for="idSesionEntrenamiento" class="form-label">ID Sesión Entrenamiento:</label>
                                <input type="text" class="form-control" id="idSesionEntrenamiento" value="" readonly>
                            </div>
                            <div class="col-md-4">
                                <label for="fechaSesion" class="form-label">Fecha de Sesión:</label>
                                <input type="date" class="form-control" id="fechaSesion" value="" readonly>
                            </div>
                            </div>

                        <h4 class="mb-3">Registro de Objetivos por Alumno</h4>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID Alumno</th>
                                        <th>Nombre del Alumno</th>
                                        <th>Valoración de Objetivo</th>
                                        <th>Observaciones</th>
                                    </tr>
                                </thead>
                                <tbody id="objetivosTbody">
                                    </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary-action" data-bs-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-main-action" onclick="guardarObjetivosModal()">Guardar
                        Objetivos</button>
                    <button type="button" class="btn btn-info btn-secondary-action"
                        onclick="modificarObjetivosModal()">Modificar Objetivos</button>
                    <button type="button" class="btn btn-danger" id="finalizarSesionModalBtn"
                        onclick="finalizarSesionModal()" disabled>Finalizar Sesión</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="consultaSesionModal" tabindex="-1" aria-labelledby="consultaSesionModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="consultaSesionModalLabel">Consultar Sesión de Entrenamiento</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="consultaCategoria" class="form-label">Selecciona la categoría:</label>
                                <select id="consultaCategoria" class="form-select"
                                    onchange="mostrarGruposConsulta(); cargarDatosConsulta()">
                                    <option value="">-- Seleccionar categoría --</option>
                                    <option value="Categoria1">Categoría 1</option>
                                    <option value="Categoria2">Categoría 2</option>
                                    <option value="Categoria3">Categoría 3</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="consultaGrupo" class="form-label">Selecciona el grupo:</label>
                                <select id="consultaGrupo" class="form-select" onchange="cargarDatosConsulta()">
                                    <option value="">-- Seleccionar grupo --</option>
                                    </select>
                            </div>
                            <div class="col-md-4">
                                <label for="consultaFecha" class="form-label">Selecciona la fecha:</label>
                                <select id="consultaFecha" class="form-select" onchange="cargarDatosConsulta()">
                                    <option value="">Seleccione fecha</option>
                                    </select>
                            </div>
                        </div>

                        <div id="tablaAsistenciaConsulta" class="mt-4">
                            <h4>Asistencia</h4>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Estudiante</th>
                                            <th>Asistencia</th>
                                        </tr>
                                    </thead>
                                    <tbody id="asistenciaConsultaTbody">
                                        </tbody>
                                </table>
                            </div>
                        </div>

                        <div id="tablaObjetivosConsulta" class="mt-4">
                            <h4>Objetivos</h4>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Estudiante</th>
                                            <th>Objetivo 1</th>
                                            <th>Objetivo 2</th>
                                            <th>Objetivo 3</th>
                                            <th>Objetivo 4</th>
                                            <th>Observaciones</th>
                                        </tr>
                                    </thead>
                                    <tbody id="objetivosConsultaTbody">
                                        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer consult-session-buttons">
                    <button type="button" class="btn btn-secondary-action" data-bs-dismiss="modal">Cerrar</button>
                    <button class="btn btn-warning btn-secondary-action" onclick="modificarSesionConsulta()">Modificar
                        Sesión</button>
                    <button class="btn btn-main-action" onclick="guardarModificacionesConsulta()" disabled>Guardar
                        Modificaciones</button>
                    <button class="btn btn-danger" onclick="eliminarSesionConsulta()">Eliminar Sesión</button>
                </div>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Variables para controlar el estado de guardado
        let asistenciaGuardada = false;
        let objetivosGuardados = false;

        function mostrarGrupos() {
            document.getElementById("grupos").style.display = "block";
            // Lógica para cargar grupos desde la base de datos (a través de Java) iría aquí.
            // Por ejemplo, una llamada a una API: fetch('/api/grupos?categoria=' + categoriaSeleccionada)
        }

        function mostrarAlumnos() {
            document.getElementById("alumnos").style.display = "block";
            document.getElementById("guardarAsistenciaBtn").style.display = "block";
            // Lógica para cargar alumnos y sus estados de asistencia desde la base de datos (a través de Java) iría aquí.
            // Se deberían generar las filas de la tabla #alumnos tbody dinámicamente.
        }

        function guardarAsistencia() {
            // Aquí iría la lógica para recopilar los datos de asistencia de la tabla y enviarlos a la base de datos (a través de Java).
            // Ejemplo de cómo obtener los datos (pero el envío real sería por fetch/ajax a un endpoint de Java):
            const checkboxes = document.querySelectorAll('#alumnos .asistencia');
            const attendanceData = [];
            checkboxes.forEach((checkbox) => {
                const row = checkbox.closest('tr');
                // Obtén los datos de la fila (ID Asistencia, Número de Alumno, Fecha de Asistencia)
                // Usar IDs reales si los datos se cargan dinámicamente
                const idAsistencia = row.cells[0].innerText; 
                const numeroAlumno = row.cells[1].innerText; 
                const fechaAsistencia = row.cells[2].innerText; 
                const asistenciaValue = checkbox.checked ? 1 : 0;
                const observaciones = row.querySelector('textarea').value;

                attendanceData.push({
                    idAsistencia: idAsistencia,
                    numeroAlumno: numeroAlumno,
                    fechaAsistencia: fechaAsistencia,
                    asistencia: asistenciaValue,
                    observaciones: observaciones
                });
            });

            // Simulamos el éxito de guardar para la UI
            Swal.fire({
                icon: 'success',
                title: '¡Asistencia guardada exitosamente!',
                showConfirmButton: false,
                timer: 1500
            });

            // Deshabilitar inputs después de simular guardar
            checkboxes.forEach(checkbox => checkbox.setAttribute('disabled', 'true'));
            document.querySelectorAll('#alumnos textarea').forEach(textarea => textarea.setAttribute('disabled', 'true'));

            asistenciaGuardada = true;
            document.getElementById("modificarBtn").style.display = "block";
            document.getElementById("sesionEntrenamientoBtn").style.display = "block";
        }

        function modificarAsistencia() {
            const checkboxes = document.querySelectorAll('#alumnos .asistencia');
            checkboxes.forEach(checkbox => checkbox.removeAttribute('disabled'));
            document.querySelectorAll('#alumnos textarea').forEach(textarea => textarea.removeAttribute('disabled'));

            asistenciaGuardada = false; // Permite modificar
            Swal.fire({
                icon: 'info',
                title: 'Ahora puedes modificar la asistencia.',
                showConfirmButton: false,
                timer: 1500
            });
        }

        // --- Funciones para el Modal de Sesión de Entrenamiento (Registro) ---

        // Renderiza la tabla de objetivos dentro del modal
        function renderObjetivosTable(editable = true) {
            const tbody = document.getElementById("objetivosTbody");
            tbody.innerHTML = ""; // Limpiar tabla

            // Aquí se debería cargar la lista de alumnos y sus objetivos/observaciones desde la base de datos
            // a través de tu backend de Java.
            // Por cada alumno, crear una fila similar a esta:
            /*
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>ID_ALUMNO</td>
                <td>NOMBRE_ALUMNO</td>
                <td>
                    <label class="switch">
                        <input type="checkbox" class="valoracion-objetivo" ${OBJETIVO_CUMPLIDO ? 'checked' : ''} ${!editable ? 'disabled' : ''}>
                        <span class="slider"></span>
                    </label>
                </td>
                <td>
                    <textarea class="form-control observaciones-objetivo" rows="1" placeholder="Observaciones" ${!editable ? 'disabled' : ''}>OBSERVACIONES_ACTUALES</textarea>
                </td>
            `;
            tbody.appendChild(row);
            */
            // Ejemplo de cómo se vería una fila si tuvieras datos del backend
            // for (const alumno of dataFromBackend.alumnos) {
            //     const row = document.createElement("tr");
            //     row.innerHTML = `
            //         <td>${alumno.id}</td>
            //         <td>${alumno.nombre}</td>
            //         <td>
            //             <label class="switch">
            //                 <input type="checkbox" class="valoracion-objetivo" ${alumno.objetivoCumplido ? 'checked' : ''} ${!editable ? 'disabled' : ''}>
            //                 <span class="slider"></span>
            //             </label>
            //         </td>
            //         <td>
            //             <textarea class="form-control observaciones-objetivo" rows="1" placeholder="Observaciones" ${!editable ? 'disabled' : ''}>${alumno.observaciones}</textarea>
            //         </td>
            //     `;
            //     tbody.appendChild(row);
            // }

            // Deja el tbody vacío o con un mensaje si no hay datos.
            // Para fines de visualización inicial, podrías añadir un placeholder si lo deseas, pero lo ideal es que Java lo llene.
        }


        // Guarda los objetivos desde el modal
        function guardarObjetivosModal() {
            // Aquí iría la lógica para recopilar los datos de objetivos de la tabla y enviarlos a la base de datos (a través de Java).
            // Deberías iterar sobre las filas del tbody #objetivosTbody y obtener los valores de los checkboxes y textareas.

            // Simulamos el éxito de guardar para la UI
            objetivosGuardados = true;
            renderObjetivosTable(false); // Deshabilita la edición

            const finalizarBtn = document.getElementById("finalizarSesionModalBtn");
            finalizarBtn.disabled = false;
            finalizarBtn.textContent = 'Sesión Guardada'; // Cambiar texto
            finalizarBtn.classList.remove('btn-danger'); // Quitar estilo de peligro
            finalizarBtn.classList.add('btn-success-saved'); // Añadir estilo de guardado

            Swal.fire({
                icon: 'success',
                title: '¡Objetivos guardados exitosamente!',
                showConfirmButton: false,
                timer: 1500
            });
        }

        // Habilita la edición de los objetivos en el modal
        function modificarObjetivosModal() {
            if (objetivosGuardados) {
                renderObjetivosTable(true); // Habilita la edición
                objetivosGuardados = false;

                const finalizarBtn = document.getElementById("finalizarSesionModalBtn");
                finalizarBtn.disabled = true;
                finalizarBtn.textContent = 'Finalizar Sesión'; // Restaurar texto
                finalizarBtn.classList.remove('btn-success-saved'); // Quitar estilo de guardado
                finalizarBtn.classList.add('btn-danger');

                Swal.fire({
                    icon: 'info',
                    title: 'Edición habilitada',
                    text: 'Ahora puedes modificar los objetivos.'
                });
            } else {
                Swal.fire({
                    icon: 'warning',
                    title: 'No guardado',
                    text: 'Primero guarda los objetivos antes de intentar modificar.'
                });
            }
        }

        // Finaliza la sesión de entrenamiento y cierra el modal
        function finalizarSesionModal() {
            if (objetivosGuardados) {
                Swal.fire({
                    title: '¿Finalizar Sesión?',
                    text: 'Se registrará el cierre de la sesión de entrenamiento. ¿Estás seguro?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Sí, finalizar sesión',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Aquí se enviaría la señal al backend (Java) para finalizar la sesión
                        Swal.fire({
                            icon: 'success',
                            title: '¡Sesión Finalizada!',
                            text: 'La sesión de entrenamiento y los objetivos se guardaron correctamente.',
                            showConfirmButton: false,
                            timer: 2000
                        }).then(() => {
                            const objetivosModal = bootstrap.Modal.getInstance(document.getElementById('objetivosModal'));
                            objetivosModal.hide(); // Cierra el modal
                        });
                    }
                });
            } else {
                Swal.fire({
                    icon: 'warning',
                    title: 'No guardado',
                    text: 'Debes guardar los objetivos antes de finalizar la sesión.',
                    confirmButtonText: 'Aceptar'
                });
            }
        }

        // Cargar la tabla de objetivos cuando el modal se muestre
        document.getElementById('objetivosModal').addEventListener('shown.bs.modal', function () {
            renderObjetivosTable(true); // Siempre editable al abrir
            objetivosGuardados = false; // Reiniciar estado al abrir el modal
            const finalizarBtn = document.getElementById("finalizarSesionModalBtn");
            finalizarBtn.disabled = true;
            finalizarBtn.textContent = 'Finalizar Sesión'; // Asegurar texto inicial
            finalizarBtn.classList.remove('btn-success-saved');
            finalizarBtn.classList.add('btn-danger');

            // Setear ID de sesión y fecha (esto debería venir del backend/lógica de sesión, o generarse aquí temporalmente)
            document.getElementById("idSesionEntrenamiento").value = "SE" + new Date().toISOString().slice(0, 10).replace(/-/g, '') + "XXX"; // Ejemplo de ID
            document.getElementById("fechaSesion").value = new Date().toISOString().slice(0, 10);
        });

        // --- Funciones para el Nuevo Modal de Consultar Sesión de Entrenamiento ---

        function mostrarGruposConsulta() {
            // Lógica para cargar los grupos disponibles para la categoría seleccionada desde la base de datos (a través de Java).
            const grupoSelect = document.getElementById("consultaGrupo");
            grupoSelect.innerHTML = "<option value=''>-- Seleccionar grupo --</option>"; // Limpiar opciones existentes
            // Ejemplo de cómo llamar a tu API de Java para obtener grupos:
            // const categoriaSeleccionada = document.getElementById("consultaCategoria").value;
            // if (categoriaSeleccionada) {
            //     fetch('/api/gruposConsulta?categoria=' + categoriaSeleccionada)
            //         .then(response => response.json())
            //         .then(data => {
            //             data.forEach(grupo => {
            //                 const option = document.createElement('option');
            //                 option.value = grupo.id; // Asume que tu backend devuelve un 'id' para el grupo
            //                 option.textContent = grupo.nombre; // Asume que tu backend devuelve un 'nombre' para el grupo
            //                 grupoSelect.appendChild(option);
            //             });
            //         })
            //         .catch(error => console.error('Error al cargar grupos:', error));
            // }

            // Ocultar tablas al cambiar categoría
            document.getElementById("tablaAsistenciaConsulta").style.display = "none";
            document.getElementById("tablaObjetivosConsulta").style.display = "none";
            document.querySelector("#consultaSesionModal .consult-session-buttons").style.display = "none";
        }


        function cargarDatosConsulta() {
            const categoria = document.getElementById("consultaCategoria").value;
            const grupo = document.getElementById("consultaGrupo").value;
            const fecha = document.getElementById("consultaFecha").value;

            const asistenciaTbody = document.getElementById("asistenciaConsultaTbody");
            const objetivosTbody = document.getElementById("objetivosConsultaTbody");

            asistenciaTbody.innerHTML = ""; // Limpiar tablas
            objetivosTbody.innerHTML = ""; // Limpiar tablas

            const btnGuardarModificaciones = document.querySelector("#consultaSesionModal .btn-main-action");
            btnGuardarModificaciones.disabled = true; // Deshabilitar guardar por defecto

            if (categoria && grupo && fecha) {
                // Aquí se realizaría la llamada al backend (Java) para obtener los datos de la sesión
                // Ejemplo: fetch(`/api/sesion?categoria=${categoria}&grupo=${grupo}&fecha=${fecha}`)
                // .then(response => response.json())
                // .then(data => {
                //     if (data) {
                //         // Llenar tabla de asistencia
                //         data.asistencia.forEach(estudiante => {
                //             const row = asistenciaTbody.insertRow();
                //             row.insertCell(0).innerText = estudiante.nombre;
                //             const asistenciaCell = row.insertCell(1);
                //             asistenciaCell.innerHTML = `
                //                 <label class="switch">
                //                     <input type="checkbox" class="asistencia-consulta" ${estudiante.asistio ? 'checked' : ''} disabled>
                //                     <span class="slider"></span>
                //                 </label>
                //             `;
                //         });
                //
                //         // Llenar tabla de objetivos
                //         data.objetivos.forEach(estudiante => {
                //             const row = objetivosTbody.insertRow();
                //             row.insertCell(0).innerText = estudiante.nombre;
                //             // Asumiendo que tu backend devuelve un array de objetivos (e.g., [1, 0, 1, 1])
                //             estudiante.objetivos.forEach((objetivo, index) => {
                //                 const objetivoCell = row.insertCell(index + 1);
                //                 objetivoCell.innerHTML = `
                //                     <label class="switch">
                //                         <input type="checkbox" class="objetivo-consulta" ${objetivo ? 'checked' : ''} disabled>
                //                         <span class="slider"></span>
                //                     </label>
                //                 `;
                //             });
                //             const observacionCell = row.insertCell(5);
                //             observacionCell.innerHTML = `<textarea class="form-control observaciones-consulta" rows="1" disabled>${estudiante.observacion}</textarea>`;
                //         });
                //
                //         document.getElementById("tablaAsistenciaConsulta").style.display = "block";
                //         document.getElementById("tablaObjetivosConsulta").style.display = "block";
                //         document.querySelector("#consultaSesionModal .consult-session-buttons").style.display = "flex";
                //     } else {
                //         Swal.fire({
                //             icon: 'info',
                //             title: 'No hay datos',
                //             text: 'No se encontraron datos para la sesión seleccionada.'
                //         });
                //         document.getElementById("tablaAsistenciaConsulta").style.display = "none";
                //         document.getElementById("tablaObjetivosConsulta").style.display = "none";
                //         document.querySelector("#consultaSesionModal .consult-session-buttons").style.display = "none";
                //     }
                // })
                // .catch(error => {
                //     console.error('Error al cargar datos de sesión:', error);
                //     Swal.fire({
                //         icon: 'error',
                //         title: 'Error de carga',
                //         text: 'Hubo un problema al cargar los datos de la sesión.'
                //     });
                // });

                // Esto es solo para mostrar las tablas vacías una vez que se selecciona todo (sin datos)
                document.getElementById("tablaAsistenciaConsulta").style.display = "block";
                document.getElementById("tablaObjetivosConsulta").style.display = "block";
                document.querySelector("#consultaSesionModal .consult-session-buttons").style.display = "flex";
            } else {
                // Ocultar tablas y botones si no todos los selectores tienen valor
                document.getElementById("tablaAsistenciaConsulta").style.display = "none";
                document.getElementById("tablaObjetivosConsulta").style.display = "none";
                document.querySelector("#consultaSesionModal .consult-session-buttons").style.display = "none";
            }
        }


        function modificarSesionConsulta() {
            Swal.fire({
                title: '¿Qué deseas modificar?',
                text: 'Selecciona la tabla a modificar',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Modificar Asistencia',
                cancelButtonText: 'Modificar Objetivos y Observaciones',
                reverseButtons: true
            }).then((result) => {
                const btnGuardarModificaciones = document.querySelector("#consultaSesionModal .btn-main-action");
                btnGuardarModificaciones.disabled = false; // Habilitar el botón de guardar

                if (result.isConfirmed) {
                    const inputsAsistencia = document.querySelectorAll("#tablaAsistenciaConsulta input.asistencia-consulta");
                    inputsAsistencia.forEach(input => input.disabled = false);
                    Swal.fire('¡Listo!', 'La tabla de asistencia está lista para modificarse.', 'success');
                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    const inputsObjetivos = document.querySelectorAll("#tablaObjetivosConsulta input.objetivo-consulta");
                    inputsObjetivos.forEach(input => input.disabled = false);
                    const textareasObservaciones = document.querySelectorAll("#tablaObjetivosConsulta textarea.observaciones-consulta");
                    textareasObservaciones.forEach(textarea => textarea.disabled = false);
                    Swal.fire('¡Listo!', 'Las tablas de objetivos y observaciones están listas para modificarse.', 'success');
                }
            });
        }

        function guardarModificacionesConsulta() {
            Swal.fire({
                title: '¿Estás seguro?',
                text: "Guardaremos todos los cambios realizados.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, guardar cambios',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Aquí se recopilarían los datos modificados de las tablas de consulta
                    // y se enviarían al backend (Java) para actualizar la base de datos.
                    // Necesitarás obtener la categoría, grupo y fecha seleccionados para saber qué sesión actualizar.

                    // Ejemplo de cómo obtener datos (el envío real sería por fetch/ajax a un endpoint de Java):
                    // const categoria = document.getElementById("consultaCategoria").value;
                    // const grupo = document.getElementById("consultaGrupo").value;
                    // const fecha = document.getElementById("consultaFecha").value;
                    //
                    // const asistenciaModificada = [];
                    // document.querySelectorAll("#asistenciaConsultaTbody tr").forEach(row => {
                    //     const nombreEstudiante = row.cells[0].innerText;
                    //     const asistio = row.querySelector('.asistencia-consulta').checked ? 1 : 0;
                    //     asistenciaModificada.push({ nombreEstudiante, asistio });
                    // });
                    //
                    // const objetivosModificados = [];
                    // document.querySelectorAll("#objetivosConsultaTbody tr").forEach(row => {
                    //     const nombreEstudiante = row.cells[0].innerText;
                    //     const objetivos = [];
                    //     for (let i = 1; i <= 4; i++) { // Asumiendo 4 objetivos
                    //         objetivos.push(row.cells[i].querySelector('.objetivo-consulta').checked ? 1 : 0);
                    //     }
                    //     const observacion = row.cells[5].querySelector('.observaciones-consulta').value;
                    //     objetivosModificados.push({ nombreEstudiante, objetivos, observacion });
                    // });
                    //
                    // // Envía estos datos a tu API de Java
                    // fetch('/api/actualizarSesion', {
                    //     method: 'POST', // O 'PUT'
                    //     headers: { 'Content-Type': 'application/json' },
                    //     body: JSON.stringify({
                    //         categoria,
                    //         grupo,
                    //         fecha,
                    //         asistencia: asistenciaModificada,
                    //         objetivos: objetivosModificados
                    //     })
                    // });

                    // Deshabilitar todos los inputs después de guardar
                    document.querySelectorAll("#consultaSesionModal input").forEach(input => input.disabled = true);
                    document.querySelectorAll("#consultaSesionModal textarea").forEach(textarea => textarea.disabled = true);

                    const btnGuardarModificaciones = document.querySelector("#consultaSesionModal .btn-main-action");
                    btnGuardarModificaciones.disabled = true; // Deshabilitar después de guardar

                    Swal.fire(
                        'Guardado',
                        'Los cambios se han guardado correctamente.',
                        'success'
                    );
                }
            });
        }

        function eliminarSesionConsulta() {
            Swal.fire({
                title: '¿Estás seguro?',
                text: "No podrás recuperar esta sesión de entrenamiento.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Aquí se realizaría la llamada al backend (Java) para eliminar la sesión completa
                    // (usando la categoría, grupo y fecha seleccionados).
                    // const categoria = document.getElementById("consultaCategoria").value;
                    // const grupo = document.getElementById("consultaGrupo").value;
                    // const fecha = document.getElementById("consultaFecha").value;
                    // fetch(`/api/eliminarSesion?categoria=${categoria}&grupo=${grupo}&fecha=${fecha}`, { method: 'DELETE' });

                    // Limpiar las tablas y selectores después de eliminar
                    document.getElementById("asistenciaConsultaTbody").innerHTML = "";
                    document.getElementById("objetivosConsultaTbody").innerHTML = "";
                    document.getElementById("consultaCategoria").value = "";
                    document.getElementById("consultaGrupo").innerHTML = "<option value=''>-- Seleccionar grupo --</option>";
                    document.getElementById("consultaFecha").innerHTML = "<option value=''>Seleccione fecha</option>"; // Reset fechas

                    document.getElementById("tablaAsistenciaConsulta").style.display = "none";
                    document.getElementById("tablaObjetivosConsulta").style.display = "none";
                    document.querySelector("#consultaSesionModal .consult-session-buttons").style.display = "none";

                    Swal.fire(
                        'Eliminado',
                        'La sesión ha sido eliminada',
                        'success'
                    );
                }
            });
        }

        // Event listener para limpiar y resetear el modal de consulta cuando se abre
        document.getElementById('consultaSesionModal').addEventListener('shown.bs.modal', function () {
            document.getElementById("consultaCategoria").value = "";
            document.getElementById("consultaGrupo").innerHTML = "<option value=''>-- Seleccionar grupo --</option>";
            document.getElementById("consultaFecha").innerHTML = "<option value=''>Seleccione fecha</option>"; // Reset fechas
            document.getElementById("tablaAsistenciaConsulta").style.display = "none";
            document.getElementById("tablaObjetivosConsulta").style.display = "none";
            document.querySelector("#consultaSesionModal .consult-session-buttons").style.display = "none"; // Ocultar botones al abrir
            // Lógica para cargar fechas disponibles para la categoría y grupo seleccionados (a través de Java) iría aquí
            // fetch('/api/fechasSesion?categoria=' + categoria + '&grupo=' + grupo)
            // .then(response => response.json())
            // .then(data => {
            //     const fechaSelect = document.getElementById("consultaFecha");
            //     data.forEach(fecha => {
            //         const option = document.createElement('option');
            //         option.value = fecha;
            //         option.textContent = fecha; // Formato de fecha si es necesario
            //         fechaSelect.appendChild(option);
            //     });
            // });
        });


        function cerrarSesion() {
            Swal.fire({
                title: '¿Estás seguro?',
                text: 'Estás a punto de cerrar tu sesión.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, cerrar sesión',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '#'; // Reemplaza con la URL de tu página de inicio de sesión
                }
            });
        }
    </script>
</body>

</html>