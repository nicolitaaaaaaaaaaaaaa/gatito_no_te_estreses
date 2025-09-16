<%-- 
    Document   : 1_inicioAdministrador
    Created on : 18/06/2025, 10:22:46 a. m.
    Author     : adminsena
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
    <title>Inicio Administrador</title>

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
            min-height: 100vh;
        }

        .dashboard-welcome {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 2px 12px rgba(25,118,210,0.10);
            padding: 32px 32px 24px 32px;
            margin-bottom: 32px;
        }

        .dashboard-welcome h3 {
            color: #1976d2;
            font-weight: 700;
        }

        .dashboard-welcome p {
            color: #4a6fa5;
            font-size: 1.1em;
        }

        .dashboard-cards .card {
    border: none;
    border-radius: 18px;
    box-shadow: 0 4px 18px rgba(25,118,210,0.10);
    transition: transform 0.2s, box-shadow 0.2s;
    background: #fff;
    height: 230px;           
    min-height: 230px;
    max-height: 230px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    overflow: hidden;        
}
.dashboard-cards .card-body {
    flex: 1 1 auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    min-height: 90px;
}

        .dashboard-cards .card:hover {
            transform: translateY(-6px) scale(1.03);
            box-shadow: 0 8px 32px rgba(25,118,210,0.18);
        }

        .dashboard-cards .card img {
            width: 60px;
            height: 60px;
            margin-bottom: 10px;
        }

        .dashboard-cards .card-title {
            color: #1976d2;
            font-size: 1.1em;
            font-weight: 700;
        }

        .dashboard-cards .card-text b {
            color: #1976d2;
            font-size: 2em;
        }

        .dashboard-quote {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            color: #fff;
            border-radius: 18px;
            padding: 30px 24px;
            margin-top: 32px;
            box-shadow: 0 2px 12px rgba(25,118,210,0.10);
            font-size: 1.2em;
        }

        #carouselA img {
            height: 700px;
            border-radius: 15px;
            box-shadow: 0 6px 16px rgba(25, 118, 210, 0.15);
            object-fit: cover;
        }

        .horario-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            background: #fff;
        }

        .horario-table thead {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            color: white;
        }

        .horario-table th,
        .horario-table td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #e0e9ff;
        }

        .horario-table th {
            font-weight: 600;
        }

        .horario-table tbody tr:nth-child(even) {
            background-color: #f5f9ff;
        }

        .horario-table tbody tr:hover {
            background-color: #e6f0ff;
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

        .btn-light {
            background-color: #f8f9fa;
            border-color: #f8f9fa;
        }

        .btn-danger {
            background: linear-gradient(90deg, #ff5252 0%, #ff1744 100%);
            border: none;
        }

        .btn-danger:hover {
            background: linear-gradient(90deg, #ff1744 0%, #ff5252 100%);
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

        
        .horario-title {
            color: #1976d2;
            font-size: 2em;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 0.5em;
            position: relative;
        }
        .horario-title::after {
            content: "";
            display: block;
            height: 4px;
            width: 60px;
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            border-radius: 2px;
            position: absolute;
            left: 0;
            bottom: -8px;
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
            <img src="/atsaNet/img/fotoPerfil.jpg" class="rounded-5 border border-3 border-light" style="width: 55px; height: 55px; object-fit: cover;">
            <button class="btn btn-outline-light ms-3" onclick="cerrarSesion()">Cerrar Sesión</button>
          </div>
        </div>
      </div>
    </nav>

    <!--Contenido principal-->
    <main>
        <div class="container py-4">
            <!-- Saludo y resumen -->
            <div class="dashboard-welcome mb-4">
                <h3>¡Bienvenido de nuevo, <%= nombre1 %> <%= apellido1 %>!</h3>
                <p>Prepárate para gestionar y mejorar las actividades del Club.<br>
                Hoy tienes <b>5 inscripciones pendientes</b> y <b>10 entrenadores activos</b>.</p>
            </div>

            <!-- Tarjetas de resumen -->
            <div class="row dashboard-cards g-4 mb-4">
                <div class="col-md-3 col-sm-6">
                    <div class="card text-center p-3">
                        <img src="/atsaNet/img/entrenador.png" alt="Entrenadores">
                        <div class="card-body">
                            <div class="card-title">Entrenadores Activos</div>
                            <div class="card-text"><b>10</b></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="card text-center p-3">
                        <img src="/atsaNet/img/inscripcion.png" alt="Inscripciones">
                        <div class="card-body">
                            <div class="card-title">Inscripciones Pendientes</div>
                            <div class="card-text"><b>5</b></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="card text-center p-3">
                        <img src="/atsaNet/img/entrenamiento.png" alt="Entrenamientos">
                        <div class="card-body">
                            <div class="card-title">Próximos Entrenamientos</div>
                            <div class="card-text"><b>10</b></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="card text-center p-3">
                        <img src="/atsaNet/img/aActivos.png" alt="Alumnos" style="width:50px;height:50px;">
                        <div class="card-body">
                            <div class="card-title">Alumnos Activos</div>
                            <div class="card-text"><b>10</b></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Carrusel de imágenes -->
            <div class="row mb-4">
                <div class="col-12">
                    <div id="carouselA" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="/atsaNet/img/ca_img2.jpg" class="d-block w-100" alt="Imagen 1">
                            </div>
                            <div class="carousel-item">
                                <img src="/atsaNet/img/ca_img3.jpg" class="d-block w-100" alt="Imagen 2">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselA" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselA" data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Horario -->
            <div class="row mb-4">
                <div class="col-12">
                    <h4 class="horario-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#1976d2" class="bi bi-calendar2-week" viewBox="0 0 16 16">
                            <path d="M4.5 0a.5.5 0 0 1 .5.5V1h6V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zm9 3H2a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1zm1 2H1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5zm-3 2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-6a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h6z"/>
                        </svg>
                        Tus horarios
                    </h4>
                    <table class="horario-table">
                        <thead>
                            <tr>
                                <th>Horas</th>
                                <th>Lunes</th>
                                <th>Martes</th>
                                <th>Miércoles</th>
                                <th>Jueves</th>
                                <th>Viernes</th>
                                <th>Sábado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Frase motivacional -->
            <div class="row">
                <div class="col-12">
                    <div class="dashboard-quote text-center">
                        <strong>
                            "Ver la pelota y correr tras ella me convierte en el hombre más feliz del mundo"
                            <br>
                            <small><em>- Diego Maradona</em></small>
                        </strong>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!--Pie de pagina-->
    <div class="footer d-flex justify-content-center text-center align-items-center" id="piePagina">
        <h5>&copy; 2024 Club Deportivo Atlético Santander. Todos los derechos reservados.</h5>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        //Funcion para volver al perfil
        function cerrarSesion() {
            Swal.fire({
                text: '¿Estas seguro de cerrar sesión?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#2a6637',
                confirmButtonTextColor: '#ffffff ',
                cancelButtonColor: '#570808 ',
                confirmButtonText: 'Sí, quiero salir.',
                cancelButtonText: 'No, quiero quedarme.',
                timer: 10000,
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Saliendo',
                        text: '',
                        icon: 'success',
                        showConfirmButton: false,
                        timer: 1000,
                        didOpen: () => {
                            Swal.showLoading();
                        }
                    })
                    setTimeout(() => {
                        window.location.href = "/atsaNet/ValidarPersonalT";
                    }, 1000);
                }
            })
        }

        function miInformacion() {
            window.location.href = "pagina500.html";
        }

        // Animación de barra al hacer scroll
        window.addEventListener('scroll', function () {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 10) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });
    </script>
</body>
</html>