<%-- 
    Document   : reporte.jsp
    Created on : 9 jul 2025, 10:11:39 p. m.
    Author     : tin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  <title>Reporte de Objetivos</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
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
        min-height: 80vh;
    }
    
    .container {
      background-color: #ffffff;
      border-radius: 15px;
      padding: 30px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      width: 80%;
      max-width: 1000px;
      margin-top: 20px;
      margin-bottom: 20px;
    }

    h2 {
      text-align: center;
      background-color: #41B3E8;
      color: #ffffff;
      padding: 15px;
      border-radius: 10px;
    }

    .form-label {
      font-weight: bold;
    }

    .btn-primary {
      background-color: #41B3E8;
      border-color: #41B3E8;
    }

    .btn-primary:hover {
      background-color: #3498db;
    }

    .section-title {
      font-weight: bold;
      color: #333;
      margin-top: 20px;
    }

    #reporte {
      margin-top: 20px;
    }

    #piePagina {
        background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
        width: auto;
        height: 120px;
        border: none;
        color: white;
        box-shadow: 0 -4px 20px rgba(25,118,210,0.10);
    }

    .navbar {
        transition: box-shadow 0.3s, background 0.3s;
    }
    .navbar.scrolled {
        box-shadow: 0 8px 32px rgba(25,118,210,0.18);
        background: linear-gradient(90deg, #1976d2 80%, #63a4ff 100%);
    }
    .navbar-nav .nav-link {
        position: relative;
        transition: color 0.2s;
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
  </style>
</head>
<body>
   <nav class="navbar navbar-expand-lg" style="background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%); box-shadow: 0 4px 20px rgba(25,118,210,0.10);">
      <div class="container-fluid">
        <!-- Logo -->
         <a href="/atsaNet/InicioUsuario">
                    <img src="/atsaNet/img/logo_club.png" style="width: 200px">
                </a>
        <!-- Menú hamburguesa para móvil -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu"
          aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Menú principal -->
        <div class="collapse navbar-collapse" id="navbarMenu">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link text-white fw-bold" href="/atsaNet/ListarPostulantesServlet">
                Entrenadores
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white fw-bold" href="/atsaNet/Vistas/matricula.jsp">
                Alumnos
              </a>
              
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle text-white fw-bold" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Entrenamientos y Objetivos
              </a>
              
            </li>
            <li class="nav-item">
              <a class="nav-link text-white fw-bold" href="/atsaNet/Vistas/1_registrarAsistencias.jsp">
                Sesión de Entrenamiento
              </a>
              
            </li>
            <li class="nav-item">
              <a class="nav-link text-white fw-bold" href="/atsaNet/ReporteServlet?action=cargarDatos">
                Reportes
              </a>
              
            </li>
          </ul>
          <!-- Perfil a la derecha -->
          <div class="d-flex align-items-center me-3">
            <div class="text-end me-3">
              <span class="fw-bold text-white"><%= nombre1 %> <%= apellido1 %></span><br>
              <span class="text-white-50" style="font-size: 0.9em;">Administrador</span>
            </div>
            <img src="/atsaNet/img/fotoPerfil.jpg" class="rounded-5 border border-3 border-light" style="width: 55px; height: 55px; object-fit: cover;" alt="foto-Perfil">
            <button class="btn btn-outline-light ms-3" onclick="cerrarSesion()">Cerrar Sesión</button>
          </div>
        </div>
      </div>
    </nav>
  
  <main>
    <div class="container">
        <h2>Generar Reporte de Objetivos</h2>

        <!-- Formulario Individual -->
        <form method="post" action="/atsaNet/ReporteServlet">
        <div>
        <h4 class="section-title">Reporte Individual de Objetivos</h4>
        <input type="hidden" name="action" value="generarReporteIndividual">
        
        <div class="row">
            <div class="col-md-12">
            <label for="categoriaIndividual" class="form-label">Categoría:</label>
            <select class="form-control" id="categoriaIndividual" name="categoria" onchange="cargarAlumnosPorCategoria('individual')" required>
                <option value="">Seleccione una categoría</option>
                <c:forEach var="categoria" items="${categorias}">
                    <option value="${categoria.idCategoria}">${categoria.nomCategoria}</option>
                </c:forEach>
            </select>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12">
            <label for="idAlumno" class="form-label">Alumno:</label>
            <select class="form-control" id="idAlumno" name="idAlumno" disabled required>
                <option value="">Seleccione primero una categoría</option>
            </select>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-6">
                <label for="fechaInicioIndividual" class="form-label">Fecha de Inicio:</label>
                <input type="date" class="form-control" id="fechaInicioIndividual" name="fechaInicio" required>
            </div>
            <div class="col-md-6">
                <label for="fechaFinIndividual" class="form-label">Fecha Final:</label>
                <input type="date" class="form-control" id="fechaFinIndividual" name="fechaFin" required>
            </div>
        </div>
        <button type="submit" class="btn btn-primary mt-3">Generar Reporte Individual de Objetivos</button>
        </div>
        </form>

        <!-- Formulario Grupal -->
        <form method="post" action="/atsaNet/ReporteServlet">
        <div class="mt-5">
        <h4 class="section-title">Reporte Grupal de Objetivos</h4>
        <input type="hidden" name="action" value="generarReporteGrupal">
        
        <div class="row">
            <div class="col-md-12">
            <label for="categoriaGrupo" class="form-label">Categoría:</label>
            <select class="form-control" id="categoriaGrupo" name="categoria" required>
                <option value="">Seleccione una categoría</option>
                <c:forEach var="categoria" items="${categorias}">
                    <option value="${categoria.idCategoria}">${categoria.nomCategoria}</option>
                </c:forEach>
            </select>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-6">
                <label for="fechaInicioGrupo" class="form-label">Fecha de Inicio:</label>
                <input type="date" class="form-control" id="fechaInicioGrupo" name="fechaInicio" required>
            </div>
            <div class="col-md-6">
                <label for="fechaFinGrupo" class="form-label">Fecha Final:</label>
                <input type="date" class="form-control" id="fechaFinGrupo" name="fechaFin" required>
            </div>
        </div>
        <button type="submit" class="btn btn-primary mt-3">Generar Reporte Grupal de Objetivos</button>
        </div>
        </form>

        <!-- Mostrar Reportes con JSTL -->
        <c:if test="${not empty tipoReporte}">
            <div id="reporte" class="mt-4">
                <c:choose>
                    <c:when test="${tipoReporte == 'individual'}">
                        <h3>Reporte Individual de Objetivos por Entrenamiento</h3>
                        <p><strong>Categoría:</strong> ${nombreCategoria}</p>
                        <p><strong>Alumno:</strong> ${nombreAlumno}</p>
                        <p><strong>Período:</strong> ${fechaInicio} al ${fechaFin}</p>
                        
                        <c:choose>
                            <c:when test="${empty reportesIndividuales}">
                                <div class="alert alert-warning">No se encontraron datos para el período seleccionado.</div>
                            </c:when>
                            <c:otherwise>
                                <table class="table table-bordered table-striped">
                                    <thead class="table-primary">
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Asistencia</th>
                                            <th>Tipo de Entrenamiento</th>
                                            <th>Objetivo Cumplido</th>
                                            <th>Observaciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="reporte" items="${reportesIndividuales}">
                                            <tr>
                                                <td>${reporte.fechaEntrenamiento}</td>
                                                <td>
                                                    <span class="badge ${reporte.asistencia == 'PRESENTE' ? 'bg-success' : reporte.asistencia == 'AUSENTE' ? 'bg-danger' : 'bg-warning'}">
                                                        ${reporte.asistencia}
                                                    </span>
                                                </td>
                                                <td>${reporte.tipoEntrenamiento}</td>
                                                <td>
                                                    <span class="badge ${reporte.objetivoCumplido == 'SÍ' ? 'bg-success' : reporte.objetivoCumplido == 'NO' ? 'bg-danger' : 'bg-secondary'}">
                                                        ${reporte.objetivoCumplido}
                                                    </span>
                                                </td>
                                                <td>${not empty reporte.observaciones ? reporte.observaciones : 'Sin observaciones'}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="mt-3">
                                    <p><strong>Total de registros:</strong> ${reportesIndividuales.size()}</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    
                    <c:when test="${tipoReporte == 'grupal'}">
                        <h3>Reporte Grupal de Asistencia y Objetivos</h3>
                        <p><strong>Categoría:</strong> ${nombreCategoria}</p>
                        <p><strong>Período:</strong> ${fechaInicio} al ${fechaFin}</p>
                        
                        <c:choose>
                            <c:when test="${empty reportesGrupales}">
                                <div class="alert alert-warning">No se encontraron datos para el período seleccionado.</div>
                            </c:when>
                            <c:otherwise>
                                <table class="table table-bordered table-striped">
                                    <thead class="table-primary">
                                        <tr>
                                            <th>Alumno</th>
                                            <th>Total Entrenamientos</th>
                                            <th>Asistencias</th>
                                            <th>% Asistencia</th>
                                            <th>Objetivos Cumplidos</th>
                                            <th>% Objetivos</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="totalAlumnos" value="${reportesGrupales.size()}" />
                                        <c:set var="sumaAsistencia" value="0" />
                                        <c:set var="sumaObjetivos" value="0" />
                                        
                                        <c:forEach var="reporte" items="${reportesGrupales}">
                                            <c:set var="sumaAsistencia" value="${sumaAsistencia + reporte.porcentajeAsistencia}" />
                                            <c:set var="sumaObjetivos" value="${sumaObjetivos + reporte.porcentajeObjetivos}" />
                                            <tr>
                                                <td>${reporte.nombreCompleto}</td>
                                                <td>${reporte.totalEntrenamientos}</td>
                                                <td>${reporte.totalAsistencias}</td>
                                                <td><fmt:formatNumber value="${reporte.porcentajeAsistencia}" maxFractionDigits="1"/>%</td>
                                                <td>${reporte.totalObjetivosCumplidos}</td>
                                                <td><fmt:formatNumber value="${reporte.porcentajeObjetivos}" maxFractionDigits="1"/>%</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                
                                <div class="row mt-4">
                                    <div class="col-md-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Estadísticas Generales</h5>
                                                <p><strong>Total de alumnos:</strong> ${totalAlumnos}</p>
                                                <p><strong>Promedio de asistencia:</strong> 
                                                    <fmt:formatNumber value="${sumaAsistencia / totalAlumnos}" maxFractionDigits="1"/>%
                                                </p>
                                                <p><strong>Promedio de objetivos:</strong> 
                                                    <fmt:formatNumber value="${sumaObjetivos / totalAlumnos}" maxFractionDigits="1"/>%
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                </c:choose>
            </div>
        </c:if>
    </div>
  </main>

  <div class="footer d-flex justify-content-center text-center align-items-center" id="piePagina">
    <h5>&copy; 2024 Club Deportivo Atlético Santander. Todos los derechos reservados.</h5>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
  <script>

// Función para cargar alumnos por categoría vía AJAX
function cargarAlumnosPorCategoria(tipo) {
    const categoriaId = document.getElementById('categoriaIndividual').value;
    const selectAlumnos = document.getElementById('idAlumno');
    
    if (!categoriaId) {
        selectAlumnos.innerHTML = '<option value="">Seleccione primero una categoría</option>';
        selectAlumnos.disabled = true;
        return;
    }
    
    selectAlumnos.innerHTML = '<option value="">Cargando alumnos...</option>';
    selectAlumnos.disabled = true;
    
    fetch('/atsaNet/ReporteServlet?action=obtenerAlumnosPorCategoria&categoriaId=' + encodeURIComponent(categoriaId))
        .then(response => response.text())
        .then(html => {
            selectAlumnos.innerHTML = html;
            selectAlumnos.disabled = false;
        })
        .catch(error => {
            console.error('Error al cargar alumnos:', error);
            selectAlumnos.innerHTML = '<option value="">Error al cargar alumnos</option>';
            selectAlumnos.disabled = true;
        });
}

function cerrarSesion() {
  if (confirm('¿Estás seguro de cerrar sesión?')) {
    window.location.href = "/atsaNet/ValidarPersonalT";
  }
}
  </script>
</body>
</html>
