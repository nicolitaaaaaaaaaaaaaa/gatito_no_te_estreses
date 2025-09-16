<%-- 
    Document   : 1_consultarInscripciones
    Created on : 24 jun 2025, 9:07:08 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultar Alumnos</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Bostrap -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <!--Diseño de letra-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert2 -->

    <style>
        body {
            margin: 0px;
            padding: 0px;
            color: black;
            font-family: 'Roboto', sans-serif;
            box-sizing: border-box;
        }

        #contenedor {
            margin: 0px;
            padding: 0px;
            max-width: 100vw;
            min-height: 60vh;
            background: rgb(218, 215, 215);
        }

        #encabezado {
            background: rgb(65, 5, 5);
            width: auto;
            height: 220px;
            border: 5px solid rgb(41, 2, 2);
        }

        .offcanvas {
            background: #142441;
            border: 5px solid rgb(14, 25, 44);
            border-radius: 10px;
            box-shadow: 0 15px 15px rgba(0, 0, 0, 0.60);
            color: white;
        }

        .offcanvas-body section button {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 15px;
            width: 300px;
            height: 50px;
            background: #263a5e;
            color: white;
        }

        main {
            background: rgb(218, 215, 215);
            width: 100vw;
            margin-top: 20px;
            margin-left: 50px;
            margin-right: 50px;
            color: black;
        }

        h2 {
            font-size: 2rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 30px;
        }

        p {
            color: #263a5e;
        }

        #contenedorFormulario {
            background-color: #142441;
            border-radius: 15px;
            padding: 10px;
            display: flex;
            justify-content: center;
            text-align: left;
        }

        #tarjetaAspirante2 {
            display: none;
        }

        #tarjetaAspirante3 {
            display: none;
        }

        .card {
            background: #142441;
            border-radius: 8px;
            box-shadow: 0 15px 15px rgba(0, 0, 0, 0.60);
            transition: transform 0.5s;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .table-container {
            font-size: small;
        }

        .table {
            background-color: rgb(218, 215, 215);
            border: 2px solid rgb(41, 2, 2);
        }

        .table th {
            background-color: rgb(65, 5, 5);
            color: #FFFFFF;
        }

        .table td {
            background-color: rgb(218, 215, 215);
        }

        .botones button {
            border: 4px solid;
            margin: 10px;
            text-align: center;
            width: 150px;
            height: 80px;
        }

        .botones {
            display: flex;
            justify-content: center;
        }

        .modal {
            background: rgb(41, 2, 2);
        }

        .modal-header {
            background: rgb(65, 5, 5);
            color: white;
        }

        .modal-body {
            background: rgb(218, 215, 215);
            color: #263a5e;
        }

        .modal-body form .row {
            color: #263a5e;
            padding: 15px;
        }

        #piePagina {
            background: rgb(65, 5, 5);
            width: auto;
            height: 160px;
            border: 5px solid rgb(41, 2, 2);
            color: white;
        }
    </style>
</head>

<body>
    <!--Encabezado-->
    <div class="header text-white" id="encabezado">
        <div class="row d-flex align-items-center">
            <div class="col-4 d-flex justify-content-end">
                <img src="../img/logo_club.png" style="width: 200px">
            </div>
            <div class="col-7" style="padding-left: 60px;">
                <h1 class="display-5">Atlético Santander<br>
                    <h5>club deportivo</h5>
                </h1>

                <!--Columna de menu-->
                <div class="col">
                    <button class="btn btn-warning" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#menuDesplegale" aria-controls="menuDesplegale"
                        style="width: 200px; height: 50px;">Menu</button>

                    <div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="menuDesplegale"
                        aria-labelledby="menuDesplegale">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="menuDesplegale">Menu principal</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="closet"
                                aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <p class="text-white">Selecciona la opcion a la que quieras ingresar.</p>

                            <!--Menu lateral-->
                            <section class="menu">
                                <div class="row d-flex justify-content-center">
                                    <hr>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <button type="button" class="btn btn-sm dropdown-toggle"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            Entrenadores.
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item"
                                                    href="../entrenadores/1_consultarCandidatos.html">Candidatos</a>
                                            </li>
                                            <li><a class="dropdown-item"
                                                    href="../entrenadores/1_consultarEntrenador.html">Entrenadores</a>
                                            </li>
                                            <li><a class="dropdown-item"
                                                    href="../entrenadores/1_modificarJornadaEntrenadores.html">Jornadas
                                                    Entrenadores</a></li>
                                        </ul>
                                    </div>

                                    <div class="col">
                                        <button type="button" class="btn btn-sm dropdown-toggle"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            Alumnos.
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item"
                                                    href="../matricula/1_consultarInscripciones.HTML">Inscripciones</a>
                                            </li>
                                            <li><a class="dropdown-item"
                                                    href="../matricula/1_consultarAlumnos.html">Alumnos</a></li>
                                            <li><a class="dropdown-item"
                                                    href="../matricula/1_consultarCategorias.html">Categorías</a></li>
                                            <li><a class="dropdown-item"
                                                    href="../matricula/1_verPosiciones.html">Posiciones</a></li>
                                        </ul>
                                    </div>

                                    <div class="col">
                                        <button type="button" class="btn btn-sm dropdown-toggle"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            Entrenamientos y objetivos.
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item"
                                                    href="../entrenamiento/1_crearEntrenamiento.html">Creación</a></li>
                                            <li><a class="dropdown-item"
                                                    href="../entrenamiento/1_consultarEntreyObjetivo.html">Consulta</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="col">
                                        <button type="button" class="btn btn-sm dropdown-toggle"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            Sesion de Entrenamiento.
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item"
                                                    href="../asistencia/1_consultarSesioEntrenamiento.html">Consulta</a>
                                            </li>
                                            <li><a class="dropdown-item"
                                                    href="../asistencia/1_registrarAsistencia.html">RegistrarAsistencia<br>y
                                                    Objetivos</a></li>
                                        </ul>
                                    </div>

                                    <div class="col">
                                        <button type="button" class="btn btn-sm dropdown-toggle"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            Reportes.
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item"
                                                    href="../otros/1_reporteAsistencia.html">Asistencia</a></li>
                                            <li><a class="dropdown-item"
                                                    href="../otros/1_reporteObjetivos.html">Objetivos</a></li>
                                        </ul>
                                    </div>

                                    <div class="col">
                                        <button type="button" class="btn btn-md btn-warning p-3"
                                            onclick="cerrarSesion()">Ir al Perfil</button>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!--Parte central-->
    <div class="container d-flex align-items-center text-black" id="contenedor">
        <!--Contenido-->
        <main>
            <!--Repartir espacio de dos columnas-->
            <div class="row justify-content-center">
                <div class="col-lg-3 m-2">
                    <!--Titulo-->
                    <h2>Consulta Alumnos Inscritos</h2>
                    <hr class="border-5 border-dark opacity-50 mt-5">
                    <p>Encuentra las consultas que se han realizado</p>
                    <p>Ingresa una edad entre la cual quieres realizar la busqueda.</p>
                </div>
                <div class="col-lg-3 m-2">
                    <!--Consultas-->
                    <div class="row" id="contenedorFormulario">
                        <form class="d-flex justify-content-center align-items-center">
                            <input type="number" class="form-control" id="txtEdad" placeholder="5, 10, 12, 18..."
                                required min="4" max="25" title="Solo números, entre 4 y 25 dígitos"
                                style="height: 100px;">
                            <button id="BotonInscripcioneseEdad" class="btn btn-danger p-3 m-5 " type="button"
                                style="width:250px;">Buscar Inscripciones</button>
                        </form>
                    </div>
                </div>
            </div>

            <!--mostrar tablas-->
            <div class=" row">
                <!--tarjeta con informacion todas las incripciones-->
                <div class="card card-body m-5" id="tarjetaAspirante2">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 100px">Nombre Completo</th>
                                <th style="width: 10px">Tipo de Identificación</th>
                                <th style="width: 100px">Número de Identificación</th>
                                <th style="width: 50px">Edad</th>
                                <th style="width: 100px">Correo Electrónico</th>
                                <th style="width: 100px">Teléfono</th>
                                <th style="width: 300px"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Juan Pérez</td>
                                <td>CC</td>
                                <td>123456789</td>
                                <td>25</td>
                                <td>juan.perez@gmail.com</td>
                                <td>3001234567</td>
                                <td class="botones">
                                    <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                        data-bs-target="#aceptarAlumno">Aceptar<br>Alumno</button>
                                    <button type="button" class="btn btn-danger btn"
                                        onclick="rechazarAlumno()">Rechazar<br>Alumno</button>
                                    <button type="button" class="btn btn-secondary btn" data-bs-toggle="modal"
                                        data-bs-target="#verInformacion1">Ver<br>Info</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="card card-body m-5" id="tarjetaAspirante3">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 100px">Nombre Completo</th>
                                <th style="width: 10px">Tipo de Identificación</th>
                                <th style="width: 100px">Número de Identificación</th>
                                <th style="width: 50px">Edad</th>
                                <th style="width: 100px">Correo Electrónico</th>
                                <th style="width: 100px">Teléfono</th>
                                <th style="width: 300px"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Andres Martinez</td>
                                <td>CC</td>
                                <td>987654321</td>
                                <td>18</td>
                                <td>andres.martinez@gmail.com</td>
                                <td>3209876543</td>
                                <td class="botones">
                                    <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                        data-bs-target="#aceptarAlumno">Aceptar<br>Alumno</button>
                                    <button type="button" class="btn btn-danger btn"
                                        onclick="rechazarAlumno()">Rechazar<br>Alumno</button>
                                    <button type="button" class="btn btn-secondary btn" data-bs-toggle="modal"
                                        data-bs-target="#verInformacion2">Ver<br>Info</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!--Creacion de modal-->
            <!--Modal Confirmar Aceptar Alumno-->
            <div class="modal fade" id="aceptarAlumno" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title p-3" id="ModalCondirmacion">Aceptar Inscripcion</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <!--Titulo del formulario-->
                            <h4 class="mb-2 text-center">Selecciona la categoria a la que quieres que haga parte.</h4>

                            <!--Formulario-->
                            <form class="form" id="formularioAceptarAspirante">

                                <!--Filña numero 1-->
                                <div class="row">
                                    <label class="form-label" for="txtSelectCategoria">Categoria</label>
                                    <select class="form-select" id="txtSelectCategoria" required>
                                        <option value="">Elige...</option>
                                        <option value="1">-- Categoria 1(4 a 7) --</option>
                                        <option value="2"> -- Categoria 2(8 a 11) --</option>
                                        <option value="3">-- Categoria 3(12 a 15) --</option>
                                        <option value="4">-- Categoria 4(16 a 17) --</option>
                                        <option value="5">-- Categoria 5(18) --</option>
                                    </select>
                                    <div class="form-text">Selecciona Categoria</div>
                                </div>

                                <div class="row">
                                    <label class="form-label" for="txtSeleccionarEstado">Estado en el que estara el
                                        alumno</label>
                                    <select class="form-select" id=txtSeleccionarEstado" required>
                                        <option value="">Elige...</option>
                                        <option value="A">-- Aceptado --</option>
                                        <option value="R"> -- Rechazado --</option>
                                    </select>
                                    <div class="form-text">Selecciona estado</div>
                                </div>

                                <div class="row d-flex justify-content-center">
                                    <button type="submit" id="botonConfirmar" class="btn btn-success m-2"
                                        ata-bs-dismiss="modal">Confirmar</button>
                                    <button type="button" class="btn btn-warning m-2"
                                        data-bs-dismiss="modal">Cancelar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!--Primer modal informacion-->
            <div class="modal fade" id="verInformacion3" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Infomacion de Inscripcion</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <fieldset disabled>
                                    <div class="row">
                                        <div class="col-3 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Primer
                                                Nombre</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="Juan">
                                        </div>

                                        <div class="col-3 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Segundo
                                                Nombre</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica"
                                                readonly="true">
                                        </div>

                                        <div class="col-3 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Primer
                                                Apellido</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="Pérez">
                                        </div>

                                        <div class="col-3 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Segundo
                                                Apellido</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica"
                                                readonly="true">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-3 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Tipo ID</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="CC">
                                        </div>

                                        <div class="col-3 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Numero ID</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="123456789">
                                        </div>

                                        <div class="col-3 col auto">
                                            <label for="txtInfoEstatica" class="form-label">Sexo</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="M">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Fecha de
                                                Nacimiento</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="2004-01-12">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-4 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Direccion
                                                Domicilio</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="Carrera 5 #4-12 Barrio El Carmen">
                                        </div>

                                        <div class="col-4 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Numero
                                                Celular</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="3001234567">
                                        </div>

                                        <div class="col-4 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Correo
                                                Electronico</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="juan.perez@gmail.com">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-2">
                                            <label for="txtInfoEstatica" class="form-label">Tipo de
                                                sangre</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="B">
                                        </div>

                                        <div class="col-auto">
                                            <label for="txtInfoEstatica" class="form-label">RH</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="+">
                                        </div>

                                        <div class="col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Altura</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="81,04">
                                        </div>

                                        <div class="col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Peso</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="16">
                                        </div>

                                        <div class="col-auto">
                                            <label for="txtInfoEstatica" class="form-label">EPS</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="Sanitas">
                                        </div>

                                        <div class="col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Talla</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="4T">
                                        </div>

                                        <div class="col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Calzado</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="14">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-6">
                                            <label for="txtInfoEstatica" class="form-label">Pie
                                                Dominante</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="Diestro">
                                        </div>

                                        <div class="col-6">
                                            <label for="txtInfoEstatica" class="form-label">Posicion
                                                Cancha</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="Defensa segunda">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <label class="form-input" for="pdf">Autorizacion tratamiento de
                                                datos</label>
                                            <input type="file" class="form-control" id="pdf" disabled>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <label class="form-input" for="pdf">Autorizacion Medica</label>
                                            <input type="file" class="form-control" id="pdf" disabled>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <label class="form-input" for="pdf">Comprobante EPS</label>
                                            <input type="file" class="form-control" id="pdf" disabled>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!--Segundo modal-->
            <div class="modal fade" id="verInformacion2" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Infomacion de Inscripcion</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <fieldset disabled>
                                    <div class="row">
                                        <div class="col-3 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Primer
                                                Nombre</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="Andrés">
                                        </div>

                                        <div class="col-3 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Segundo
                                                Nombre</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="">
                                        </div>

                                        <div class="col-3 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Primer
                                                Apellido</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="Martínez">
                                        </div>

                                        <div class="col-3 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Segundo
                                                Apellido</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-3 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Tipo ID</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="TI">
                                        </div>

                                        <div class="col-3 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Numero ID</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="105858588">
                                        </div>

                                        <div class="col-3 col auto">
                                            <label for="txtInfoEstatica" class="form-label">Sexo</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="M">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Fecha de
                                                Nacimiento</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="2016-08-20">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-4 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Direccion
                                                Domicilio</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="Calle 3 #6-15 Barrio San Francisco">
                                        </div>

                                        <div class="col-4 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Numero
                                                Celular</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="3204567890">
                                        </div>

                                        <div class="col-4 col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Correo
                                                Electronico</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="afmartinez.andres@outlook.com">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-2">
                                            <label for="txtInfoEstatica" class="form-label">Tipo de
                                                sangre</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="B">
                                        </div>

                                        <div class="col-auto">
                                            <label for="txtInfoEstatica" class="form-label">RH</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="-">
                                        </div>

                                        <div class="col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Altura</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="1,35">
                                        </div>

                                        <div class="col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Peso</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="28">
                                        </div>

                                        <div class="col-auto">
                                            <label for="txtInfoEstatica" class="form-label">EPS</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="Salud total">
                                        </div>

                                        <div class="col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Talla</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="8">
                                        </div>

                                        <div class="col-auto">
                                            <label for="txtInfoEstatica" class="form-label">Calzado</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="5">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-6">
                                            <label for="txtInfoEstatica" class="form-label">Pie
                                                Dominante</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="Derecho">
                                        </div>

                                        <div class="col-6">
                                            <label for="txtInfoEstatica" class="form-label">Posicion
                                                Cancha</label>
                                            <input type="text" class="form-control" id="txtInfoEstatica" readonly="true"
                                                value="Defensa segunda">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <label class="form-input" for="pdf">Autorizacion tratamiento de
                                                datos</label>
                                            <input type="file" class="form-control" id="pdf" disabled>
                                        </div>
                                        <div class="col">
                                            <label class="form-input" for="pdf">Autorizacion Medica</label>
                                            <input type="file" class="form-control" id="pdf" disabled>
                                        </div>
                                        <div class="col">
                                            <label class="form-input" for="pdf">Comprobante EPS</label>
                                            <input type="file" class="form-control" id="pdf" disabled>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>

    </div>
    </main>
    </div>

    <!--Pie de pagina-->
    <div class="footer d-flex justify-content-center align-items-center" id="piePagina">
        <h5>&copy; 2024 Club Deportivo Atlético Santander. Todos los derechos reservados.</h5>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        const botonBuscar = document.getElementById("BotonInscripcioneseEdad");
        const desplegar1 = document.getElementById("tarjetaAspirante1");
        const desplegar2 = document.getElementById("tarjetaAspirante2");
        const desplegar3 = document.getElementById("tarjetaAspirante3");
        const aspirante1 = {
            edad: 30
        };
        const aspirante2 = {
            edad: 25
        };
        const aspirante3 = {
            edad: 18
        };

        botonBuscar.addEventListener("click", function (event) {
            const txtEdad = document.getElementById("txtEdad").value;

            if (txtEdad == aspirante1.edad) {
                Swal.fire({
                    title: 'Busqueda Correcta',
                    text: '',
                    icon: 'success',
                    buttons: false,
                    timer: 1000,
                });
                desplegar1.style.display = "block";
            } else if (txtEdad == aspirante2.edad) {
                Swal.fire({
                    title: 'Busqueda Correcta',
                    text: '',
                    icon: 'success',
                    buttons: false,
                    timer: 1000,
                });
                desplegar2.style.display = "block";
            } else if (txtEdad == aspirante3.edad) {
                Swal.fire({
                    title: 'Busqueda Correcta',
                    text: '',
                    icon: 'success',
                    buttons: false,
                    timer: 1000,
                });
                desplegar3.style.display = "block";
            } else {
                Swal.fire({
                    title: 'Busqueda incorrecta',
                    text: 'El campo incresado no coincide o es incorrecto',
                    icon: 'error',
                });
            }
        });

        function cerrarSesion() {
            Swal.fire({
                text: '¿Estas seguro de ir a la pagina principal?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#2a6637',
                buttonTextColor: '#ffffff ',
                cancelButtonColor: '#570808 ',
                confirmButtonText: 'Si, quiero ir.',
                cancelButtonText: 'No, quiero quedarme.',
                timer: 10000,
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Saliedo',
                        text: '',
                        icon: 'success',
                        showConfirmButton: false,
                        timer: 1000,
                        didOpen: () => {
                            Swal.showLoading();
                        }
                    })
                    setTimeout(() => {
                        window.location.href = "../1_inicioAdministrador.html";
                    }, 1000);
                }
            })
        }

        function rechazarAlumno() {
            Swal.fire({
                title: "Rechazar Aspirante?",
                text: "¿Estas seguro que quieres rechazar al aspirante seleccionado?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Si, rechazalo",
                confirmButtonColor: "#2a6637",
                cancelButtonColor: "#570808",
                buttonTextColor: '#ffffff ',
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "Rechazado!",
                        text: "Haz eliminado al aspirante correctamente.",
                        icon: "success"
                    });
                }
            });
        }


        const FormularioAceptar = document.getElementById("formularioAceptarAspirante");

        FormularioAceptar.addEventListener("submit", function (event) {
            event.preventDefault();

            if (FormularioAceptar.checkValidity()) {
                Swal.fire({
                    title: 'hmmm?',
                    text: '¿Estas seguro de guardar los cambios?',
                    icon: 'question',
                    showCancelButton: true,
                    showConfirmButton: true,
                    confirmButtonText: 'Si, quiero ir.',
                    cancelButtonText: 'No, no quiero.',
                    confirmButtonColor: '#2a6637',
                    cancelButtonColor: '#570808 ',
                    confirmButtonTextColor: '#ffffff ',
                    timer: 10000,
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire({
                            title: '',
                            text: 'Guardando cambios espera un momento',
                            icon: 'success',
                            showConfirmButton: false,
                            timer: 1000,
                            didOpen: () => {
                                Swal.showLoading();
                            }
                        })
                        setTimeout(() => {
                            window.location.href = "1_consultarInscripciones.html";
                        }, 2000);
                    }
                });
            }
        });
    </script>
</body>

</html>
