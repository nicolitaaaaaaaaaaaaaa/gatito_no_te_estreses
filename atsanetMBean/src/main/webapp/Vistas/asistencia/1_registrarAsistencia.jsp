<%-- 
    Document   : 1_registrarAsistencia
    Created on : 24 jun 2025, 4:05:26 p. m.
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
    <title>Registrar Sesión de Entrenamiento</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: #f8fafc;
            color: #263a5e;
            font-family: 'Roboto', sans-serif;
            box-sizing: border-box;
        }
        main {
            background: transparent;
            width: 100vw;
            min-height: 100vh;
        }
        .dashboard-card {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 2px 12px rgba(25,118,210,0.10);
            padding: 32px 32px 24px 32px;
            margin-bottom: 32px;
        }
        h2 {
            color: #1976d2;
            font-weight: 700;
            text-align: center;
            margin-bottom: 24px;
        }
        .form-label {
            color: #1976d2;
            font-weight: 500;
        }
        .form-select, .form-control, textarea {
            border-radius: 10px;
            border: 1px solid #b6e0fe;
        }
        .table {
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        }
        .table thead {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            color: white;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .hidden {
            display: none;
        }
        .btn-primary {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            border: none;
            color: #fff;
            font-weight: 600;
            border-radius: 10px;
            padding: 10px 24px;
            transition: background 0.2s;
        }
        .btn-primary:hover {
            background: linear-gradient(90deg, #63a4ff 0%, #1976d2 100%);
        }
        .btn-secondary {
            background: #6c757d;
            border: none;
            color: #fff;
            font-weight: 600;
            border-radius: 10px;
            padding: 10px 24px;
        }
        .btn-home {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            border: none;
            color: #fff;
            padding: 10px 18px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: 600;
            transition: background 0.2s;
            display: inline-block;
        }
        .btn-home:hover {
            background: linear-gradient(90deg, #63a4ff 0%, #1976d2 100%);
            color: #fff;
        }
        /* Navbar estilos */
        .navbar {
            transition: box-shadow 0.3s, background 0.3s;
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            box-shadow: 0 4px 20px rgba(25,118,210,0.10);
        }
        .navbar-nav .nav-link {
            color: #fff !important;
            font-weight: 600;
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
        /* Footer */
        #piePagina {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            width: auto;
            height: 100px;
            border: none;
            color: white;
            box-shadow: 0 -4px 20px rgba(25, 118, 210, 0.10);
            margin-top: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
    <script>
        function mostrarGrupos() {
            document.getElementById("grupos").style.display = "block";
        }
        function mostrarAlumnos() {
            document.getElementById("alumnos").style.display = "block";
            document.getElementById("guardarAsistenciaBtn").style.display = "block";
        }
        function guardarAsistencia() {
            const inputs = document.querySelectorAll('.asistencia');
            let isValid = true;
            inputs.forEach(input => {
                const value = input.value.trim();
                if (value === '' || (value !== '0' && value !== '1')) {
                    isValid = false;
                    input.classList.add('is-invalid');
                } else {
                    input.classList.remove('is-invalid');
                }
            });
            if (isValid) {
                Swal.fire({
                    icon: 'success',
                    title: '¡Asistencia guardada exitosamente!',
                    showConfirmButton: false,
                    timer: 1500
                });
                inputs.forEach(input => input.setAttribute('disabled', 'true'));
                document.getElementById("modificarBtn").style.display = "block";
                document.getElementById("sesionEntrenamientoBtn").style.display = "block";
            } else {
                Swal.fire({
                    icon: 'error',
                    title: '¡Ups!',
                    text: 'Por favor, ingresa solo 1 (Sí) o 0 (No) en los campos de asistencia.',
                    confirmButtonText: 'Aceptar'
                });
            }
        }
        function modificarAsistencia() {
            const inputs = document.querySelectorAll('.asistencia');
            inputs.forEach(input => input.removeAttribute('disabled'));
            Swal.fire({
                icon: 'info',
                title: 'Ahora puedes modificar la asistencia.',
                showConfirmButton: false,
                timer: 1500
            });
        }
    </script>
</head>
<body>
    <!-- Barra superior -->
    <nav class="navbar navbar-expand-lg">
      <div class="container-fluid">
        <a class="navbar-brand ms-3" href="../1_inicioAdministrador.html">
          <img src="../img/logo_club.png" alt="Logo" style="width: 120px;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu"
          aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarMenu">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Entrenadores
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="../entrenadores/1_consultarCandidatos.html">Candidatos</a></li>
                <li><a class="dropdown-item" href="../entrenadores/1_consultarEntrenador.html">Entrenadores</a></li>
                <li><a class="dropdown-item" href="../entrenadores/1_modificarJornadaEntrenadores.html">Jornadas Entrenadores</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Alumnos
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="../matricula/1_consultarInscripciones.HTML">Inscripciones</a></li>
                <li><a class="dropdown-item" href="../matricula/1_consultarAlumnos.html">Alumnos</a></li>
                <li><a class="dropdown-item" href="../matricula/1_consultarCategorias.html">Categorías</a></li>
                <li><a class="dropdown-item" href="../matricula/1_verPosiciones.html">Posiciones</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Entrenamientos y objetivos
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="../entrenamiento/1_crearEntrenamiento.html">Creación</a></li>
                <li><a class="dropdown-item" href="../entrenamiento/1_consultarEntreyObjetivo.html">Consulta</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Sesión de Entrenamiento
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="../asistencia/1_consultarSesioEntrenamiento.html">Consulta</a></li>
                <li><a class="dropdown-item" href="../asistencia/1_registrarAsistencia.html">Registrar Asistencia y Objetivos</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Reportes
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="../otros/1_reporteAsistencia.html">Asistencia</a></li>
                <li><a class="dropdown-item" href="../otros/1_reporteObjetivos.html">Objetivos</a></li>
              </ul>
            </li>
          </ul>
          <div class="d-flex align-items-center me-3">
            <div class="text-end me-3">
              <span class="fw-bold text-white">Jonh M. Green</span><br>
              <span class="text-white-50" style="font-size: 0.9em;">Administrador</span>
            </div>
            <img src="../img/fotoPerfil.jpg" class="rounded-5 border border-3 border-light" style="width: 55px; height: 55px; object-fit: cover;">
            <a href="../1_inicioAdministrador.html" class="btn btn-outline-light ms-3">Ir al Perfil</a>
          </div>
        </div>
      </div>
    </nav>

    <main>
      <div class="container py-4">
        <div class="dashboard-card">
          <h2>Registrar Asistencia</h2>
          <div class="mb-3 mt-4">
              <label for="categoria" class="form-label">Selecciona la categoría:</label>
              <select id="categoria" class="form-select" onchange="mostrarGrupos()">
                  <option value="">-- Seleccionar categoría --</option>
                  <option value="Infantil">Infantil (4 a 7 años)</option>
                  <option value="Prejuvenil">Prejuvenil (8 a 11 años)</option>
                  <option value="Juvenil">Juvenil (12 a 17 años)</option>
                  <option value="Única">Única (18+ años)</option>
              </select>
          </div>
          <div id="grupos" class="hidden mb-3">
              <label for="grupo" class="form-label">Selecciona el grupo:</label>
              <select id="grupo" class="form-select" onchange="mostrarAlumnos()">
                  <option value="">-- Seleccionar grupo --</option>
                  <option value="A">Grupo A</option>
                  <option value="B">Grupo B</option>
                  <option value="C">Grupo C</option>
              </select>
          </div>
          <div id="alumnos" class="hidden">
              <h4 style="color:#1976d2;font-weight:700;">Lista de Alumnos</h4>
              <table class="table table-bordered mt-3">
                  <thead>
                      <tr>
                          <th>Nombre</th>
                          <th>Asistencia (1 = Sí, 0 = No)</th>
                          <th>Observaciones</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td></td>
                          <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                          <td><textarea class="form-control"></textarea></td>
                      </tr>
                      <tr>
                          <td></td>
                          <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                          <td><textarea class="form-control"></textarea></td>
                      </tr>
                      <tr>
                          <td></td>
                          <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                          <td><textarea class="form-control"></textarea></td>
                      </tr>
                      <tr>
                          <td></td>
                          <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                          <td><textarea class="form-control"></textarea></td>
                      </tr>
                      <tr>
                          <td></td>
                          <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                          <td><textarea class="form-control"></textarea></td>
                      </tr>
                      <tr>
                          <td></td>
                          <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                          <td><textarea class="form-control"></textarea></td>
                      </tr>
                      <tr>
                          <td></td>
                          <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                          <td><textarea class="form-control"></textarea></td>
                      </tr>
                      <tr>
                          <td></td>
                          <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                          <td><textarea class="form-control"></textarea></td>
                      </tr>
                  </tbody>
              </table>
          </div>
          <div class="d-flex justify-content-center mt-3">
              <button id="guardarAsistenciaBtn" class="btn btn-primary hidden" onclick="guardarAsistencia()">Guardar Asistencia</button>
          </div>
          <div class="d-flex justify-content-center mt-3">
              <button id="modificarBtn" class="btn btn-secondary hidden" onclick="modificarAsistencia()">Modificar Asistencia</button>
          </div>
          <div class="d-flex justify-content-center mt-3">
              <button id="sesionEntrenamientoBtn" class="btn btn-primary hidden" onclick="window.location.href='1_registrarObjetivos.html'">Iniciar Entrenamiento</button>
          </div>
        </div>
      </div>
    </main>

    <div class="footer" id="piePagina">
        <h5 class="w-100 text-center m-0">&copy; 2024 Club Deportivo Atlético Santander. Todos los derechos reservados.</h5>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>