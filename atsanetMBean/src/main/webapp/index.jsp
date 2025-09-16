<%-- 
    Document   : index
    Created on : 18/06/2025, 10:14:57 a. m.
    Author     : adminsena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club Deportivo Atlético Santander</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #e3f0ff 0%, #b6e0fe 100%);
            color: #263a5e;
        }

        .header {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            padding-right: 50px;
            padding-left: 50px;
            width: auto;
            height: 220px;
            border: none;
            color: white;
            box-shadow: 0 4px 20px rgba(25, 118, 210, 0.10);
        }

        #inicioSesion {
            background: linear-gradient(90deg, #ff5252 0%, #ff1744 100%);
            border-radius: 30px;
            border: none;
            color: white;
            padding: 20px;
            font-weight: bold;
            transition: background 0.3s;
        }

        #inicioSesion:hover {
            background: linear-gradient(90deg, #ff1744 0%, #ff5252 100%);
        }

        .intro p {
            color: #141212;
        }

        h2 {
            font-size: 2rem;
            font-weight: bold;   
        }

        #carouselImagnesClub img {
            height: 550px;
            border-radius: 15px;
            box-shadow: 0 18px 18px rgba(0, 0, 0, 0.20);
            transition: transform 0.2s;
        }

        #carouselImagnesClub img:hover {
            transform: scale(1.05);
        }

        #horario_categoria {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            border-radius: 15px;
            box-shadow: 0 18px 18px rgba(25, 118, 210, 0.10);
            display: flex;
            flex-wrap: wrap;
        }

        .row .card {
            background: #fff;
            width: 250px;
            height: 200px;
            color: #1976d2;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(25, 118, 210, 0.10);
            margin: 10px;
            border: 1px solid #e3f0ff;
            transition: box-shadow 0.3s, transform 0.3s;
        }

        .card {
            transition: transform 0.5s;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 40px 0 rgba(25, 118, 210, 0.18);
        }

        #botones a {
            background: linear-gradient(90deg, #ff5252 0%, #ff1744 100%);
    width: 280px;
    height: 70px;
    margin: 10px;
    border-radius: 15px;
    box-shadow: 0 5px 5px rgba(255, 82, 82, 0.10);
    color: white;
    font-weight: bold;
    font-size: 1.1rem;
    transition: transform 0.5s, background 0.3s;
    display: flex;
    align-items: center;
    justify-content: center;
    border: none;
}

#botones a:hover {
    transform: scale(1.05);
    background: linear-gradient(90deg, #ff1744 0%, #ff5252 100%);
}

        footer {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            width: auto;
            height: 160px;
            border: none;
            color: white;
            box-shadow: 0 -4px 20px rgba(25, 118, 210, 0.10);
        }
    </style>
</head>

<body>
    <div class="header text-white" id="encabezado">
        <div class="row d-flex align-items-center">
            <div class="col-4 d-flex justify-content-end">
                <img src="img/logo_club.png" style="width: 200px">
            </div>
            <div class="col-5" style="padding-left: 60px;">
                <h1 class="display-5">Atlético Santander<br>
                    <h5>club deportivo</h5>
                </h1>
            </div>
            <div class="col-3">
                <a href="Vistas/inicioSesion.jsp" class="btn btn-danger" id="inicioSesion">Iniciar Sesión</a>
            </div>
        </div>
    </div>

    <header class="container text-center my-5">
        <h1 class="display-4">CLUB DEPORTIVO ATLÉTICO SANTANDER</h1>
        <p class="lead">Bienvenidos al Club Deportivo Atlético Santander</p>
        <hr class="border-5 border-dark opacity-50">
    </header>

    <section class="container intro text-center my-2">
        <p>Ubicado en el corazón de Vélez, Santander, el "Club Deportivo Atlético Santander" es una escuela dedicada al
            desarrollo integral de jóvenes talentos en el fútbol. Con más de una década de experiencia, nuestro objetivo
            es formar deportistas comprometidos y disciplinados, fomentando tanto el crecimiento físico como el
            desarrollo de valores a través del deporte.</p>
        <div class="row">
            <div id="carouselImagnesClub" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/imagen1.jpg" alt="Imagen 1">
                    </div>
                    <div class="carousel-item">
                        <img src="img/imagen2.jpg" alt="Imagen2">
                    </div>
                    <div class="carousel-item">
                        <img src="img/imagen3.jpg" alt="Imagen3">
                    </div>
                    <div class="carousel-item">
                        <img src="img/imagen4.jpg" alt="Imagen4">
                    </div>
                    <div class="carousel-item">
                        <img src="img/imagen5.jpg" alt="Imagen5">
                    </div>
                    <div class="carousel-item">
                        <img src="img/equipo.jpeg" alt="Imagen6">
                    </div>
                    <div class="carousel-item">
                        <img src="img/trofeos.jpeg" alt="Imagen7">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container text-center my-5">
        <h2>Información del Club</h2>
        <hr class="border-5 border-dark opacity-50">
    </section>


    <section class="container d-flex justify-content-center align-items-center p-5 text-white" id="horario_categoria">
        <div class="col-lg m-3">
            <h2 class="text-center">Categorías</h2>
            <p class="text-center">Nuestra escuela está abierta para niños, niñas y jóvenes desde los 4 hasta los 20
                años, organizados en las siguientes categorías:</p>

            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Infantil (4 a 7 años)</h5>
                            <hr>
                            <hr>
                            <p class="card-text">Descubrimiento del fútbol a través del juego y el desarrollo de la
                                coordinación motriz.</p>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Infantil (8 a 11 años)</h5>
                            <hr>
                            <hr>
                            <p class="card-text">Aprendizaje de fundamentos técnicos básicos y fomento de la diversión
                                en
                                equipo.</p>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Adolescente (12 a 15 años)</h5>
                            <hr>
                            <hr>
                            <p class="card-text">Desarrollo de habilidades técnicas específicas y principios básicos de
                                táctica.</p>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Prejuvenil (16 a 17 años)</h5>
                            <hr>
                            <hr>
                            <p class="card-text">Perfeccionamiento técnico y táctico enfocado en competencias
                                deportivas.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col d-flex justify-content-center">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Adultos (18 años)</h5>
                            <hr>
                            <hr>
                            <p class="card-text">Optimización del rendimiento físico y técnico con un enfoque recreativo
                                y
                                competitivo.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg m-3 text-center " id="horario">
            <h2>Horario de Entrenamiento</h2>
            <p>Martes, jueves y sábados: <strong>2:00 p.m. - 4:00 p.m.</strong></p>
            <p>¡Únete al Club Deportivo Atlético Santander y vive la pasión del fútbol mientras creces como deportista y
                persona!</p>

            <div class="d-flex justify-content-center mt-4">
                <a href="https://www.facebook.com/profile.php?id=100065061757021&mibextid=ZbWKwL" class="m-3" target="_blank" rel="noopener">
                    <img src="img/facebook.avif" alt="Facebook" width="50" class="rounded-circle">
                </a>
                <a href="mailto:contacto@clubatletico.com" class="m-3" target="_blank" rel="noopener">
                    <img src="img/telefono.jpg" alt="Teléfono" width="50" class="rounded-circle">
                </a>
                <a href="https://www.google.com/maps/place/Cra.+4+%2314-30,+Velez,+V%C3%A9lez,+Santander/@6.0193872,-73.6695442,17z/data=!3m1!4b1!4m6!3m5!1s0x8e41f06594745fc7:0xb299b58379d4ff95!8m2!3d6.0193872!4d-73.6695442!16s%2Fg%2F11tf6m33wz?entry=ttu&g_ep=EgoyMDI0MTExMi4wIKXMDSoASAFQAw%3D%3D"
                    class="m-3" target="_blank" rel="noopener">
                    <img src="img/logosmpa.png" alt="Ubicación" width="50" class="rounded-circle">
                </a>
            </div>
        </div>
    </section>

    <section class="container my-5 text-center">
        <h2>Inscripción y Renovación</h2>
        <hr class="border-5 border-dark opacity-50">
        <p>¿Estás listo para unirte o renovar tu matrícula en el Club Deportivo Atlético Santander? Haz clic en los
            siguientes enlaces para más información, también puedes ser parte de nuestra escuela como un grandioso
            entrenador enlace de inscripción abajo.</p>

        <div class="row d-flex justify-content-center m-5" id="botones">
            <a href="Vistas/formularioInscripcion.jsp" class="btn">Formulario Inscripción</a>
            <a href="Vistas/renovacion.jsp" class="btn">Renovación Matriculas</a>
            <a href="Vistas/formularioEntrenador.jsp" class="btn">Formulario Entrenador</a>
        </div>

    </section>

    <footer class="d-flex justify-content-center align-items-center py-3">
        <p>&copy; 2024 Club Deportivo Atlético Santander. Todos los derechos reservados.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>

</html>
