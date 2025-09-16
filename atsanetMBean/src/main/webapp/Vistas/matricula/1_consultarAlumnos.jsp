<%-- 
    Document   : 1_consultarAlumnos
    Created on : 24 jun 2025, 9:05:34 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultar Matriculados</title>

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

        #containerI1 {
            background: #142441;
            width: 400px;
            height: auto;
            border-radius: 15px;
            padding: 60px;
            margin: 10px;
            box-shadow: 0 15px 15px rgba(0, 0, 0, 0.60);
            transition: transform 0.5s;
        }

        #containerI1:hover {
            transform: scale(1.05);
        }

        #containerI2 {
            background: #142441;
            width: 800px;
            height: auto;
            border-radius: 15px;
            padding: 20px;
            margin: 10px;
            box-shadow: 0 15px 15px rgba(0, 0, 0, 0.60);
            transition: transform 0.5s;
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

        #filaDesplegada {
            display: none;
        }

        #botonActivarAlumno {
            display: none;
        }

        form .row {
            padding: 8px;
            display: flex;
            justify-content: center;
            text-align: left;
            color: white;
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
        }

        #piePagina {
            background: rgb(73, 5, 5);
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
    <div class="container d-flex justify-content-center text-center" id="contenedor">
        <!--Contenido-->
        <main>
            <div class="row d-flex justify-content-center">
                <!--Titulo principal-->
                <h2 class="my-5">Consulta Alumnos</h2>
                <hr class="border-5 border-dark opacity-50" style="width: 900px;">
                <p>Ingresa el nombre o la identificacion del alumno deseado.</p>
            </div>

            <div class="row d-flex justify-content-center my-5">
                <!--Tabla de alumnos-->
                <div class="col-lg" id="containerI1">
                    <!--Titulos de tabla-->
                    <div class="row text-center text-white">
                        <h2><a href="#" class="link-danger">Alumnos Matriculados</a></h2>
                    </div>

                    <!--Tabla con todas las posiciones-->
                    <div class="row">
                        <table class="table table-hover" id="tablaTodasLasPosiciones">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Numero id</th>
                                    <th>Correo</th>
                                    <th>Edad</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Filas-->
                                <tr>
                                    <td>Juan</td>
                                    <td>Rodríguez</td>
                                    <td>102455678</td>
                                    <td>juancarlos.rodriguez85@gmail.com</td>
                                    <td>7 años</td>
                                </tr>
                                <tr>
                                    <td>Jorge</td>
                                    <td>Gómez</td>
                                    <td>106737898</td>
                                    <td>enrique.gomez.jorge@gmail.com</td>
                                    <td> 9 años</td>
                                </tr>
                                <tr>
                                    <td>Andrés</td>
                                    <td>Martínez</td>
                                    <td>102455678</td>
                                    <td>afmartinez.andres@outlook.com</td>
                                    <td>13 años</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!--Consulta de alumnos-->
                <div class="col-lg" id="containerI2">
                    <div class="row">
                        <!--Titulos de tabla-->
                        <div class="row text-center text-white">
                            <h2><a href="#" class="link-danger">Consultar Alumno:</a></h2>
                        </div>

                        <div class="row">
                            <form class="form d-flex justify-content-center align-items-center" role="search">
                                <input type="text" id="txtConsulta" class="form-control" required
                                    placeholder="Maria, 1028662497,...." pattern="[A-Za-z]{3-15}"
                                    title="Ingresa un nombre o numero correcto" style="height: 80px;">
                                <button id="BotonConsultarAlumnos" class="btn btn-danger p-3 m-5" type="button"
                                    style="width:250px;">Buscar</button>
                            </form>
                        </div>

                        <!--Informacion desplegada-->
                        <div class="row" id="filaDesplegada">
                            <form class="form">
                                <fieldset disabled>
                                    <!--SEPARADOR - Titulo-->
                                    <div class="row text-center text-white">
                                        <h4><a href="#" class="link-danger">Datos personales</a></h4>
                                    </div>

                                    <!--Fila 1-->
                                    <div class="row">
                                        <div class="col-auto">
                                            <label class="form-label" for="txtTipoId">Tipo Id</label>
                                            <select class="form-select" id="txtTipoId">
                                                <option value="TI">TI</option>
                                            </select>
                                        </div>

                                        <div class="col-auto">
                                            <label class="form-label" for="txtNumeroID">Número ID</label>
                                            <input type="number" id="txtNumeroID" class="form-control"
                                                value="1028662497">
                                        </div>
                                    </div>

                                    <!--Fila 2-->
                                    <div class="row">
                                        <div class="col-auto">
                                            <label class="form-label" for="txtPNombre">Primer Nombre</label>
                                            <input type="text" id="txtPNombre" class="form-control" value="Juan">
                                        </div>

                                        <div class="col-auto">
                                            <label class="form-label" for="txtSNombre">Segundo Nombre</label>
                                            <input type="text" id="txtSNombre" class="form-control" value="Carlos">
                                        </div>

                                        <div class="col-auto">
                                            <label class="form-label" for="txtPApellido">Primer Apellido</label>
                                            <input type="text" id="txtPApellido" class="form-control" value="Rodriguez">
                                        </div>

                                        <div class="col-auto">
                                            <label class="form-label" for="txtSapellido">Segundo Apellido</label>
                                            <input type="text" id="txtSapellido" class="form-control" value="Gomez">
                                        </div>
                                    </div>

                                    <!--Fila 3-->
                                    <div class="row d-flex align-items-end">
                                        <div class="col-auto">
                                            <label class="form-label" for="txtSexo">Genero</label>
                                            <select class="form-select" id="txtSexo">
                                                <option value="M">Masculino</option>
                                            </select>
                                        </div>
                                        <div class="col-auto">
                                            <label class="form-label" for="txtFechaN">Fecha de nacimiento</label>
                                            <input type="date" id="txtFechaN" class="form-control" value="2017-03-02">
                                        </div>
                                        <div class="col-auto">
                                            <label class="form-label" for="txtEps">EPS</label>
                                            <input type="text" id="txtEps" class="form-control" value="Compensar">
                                        </div>
                                    </div>

                                    <!--Fila 4-->
                                    <div class="row">
                                        <div class="col-auto">
                                            <label class="form-label" for="txtDireccion">Dirección domicilio</label>
                                            <input type="text" id="txtDireccion" class="form-control"
                                                value="Calle 1 #2-10 Barrio Centro">
                                        </div>

                                        <div class="col-auto">
                                            <label class="form-label" for="txtCelular">Número celular</label>
                                            <input type="tel" id="txtCelular" class="form-control" value="3105678910">
                                        </div>

                                        <div class="col-auto">
                                            <label class="form-label" for="txtCorreo">Correo Electrónico</label>
                                            <input type="email" id="txtCorreo" class="form-control"
                                                value="juancarlos.rodriguez85@gmail.com">
                                        </div>
                                    </div>

                                    <!--SEPARADOR - Titulo-->
                                    <div class="row text-center text-white">
                                        <h4><a href="#" class="link-danger">Datos Fisicos</a></h4>
                                    </div>

                                    <!--Fila 1-->
                                    <div class="row">
                                        <div class="col-auto">
                                            <label class="form-label" for="txtTSangre">Tipo de sangre</label>
                                            <select id="txtTSangre" class="form-select">
                                                <option value="A">A</option>
                                            </select>
                                        </div>
                                        <div class="col-auto">
                                            <label class="form-label" for="txtRh">RH</label>
                                            <select id="txtRh" class="form-select">
                                                <option value="+">+</option>
                                            </select>
                                        </div>
                                    </div>

                                    <!--Fila 2-->
                                    <div class="row">
                                        <div class="col-auto">
                                            <label class="form-label" for="txtAltura">Altura</label>
                                            <input type="number" id="txtAltura" class="form-control" value="1.04">
                                        </div>
                                        <div class="col-auto">
                                            <label class="form-label" for="txtPeso">Peso</label>
                                            <input type="number" id="txtPeso" class="form-control" value="16">
                                        </div>

                                        <div class="col-auto">
                                            <label class="form-label" for="txtTalla">Talla</label>
                                            <input type="text" id="txtTalla" class="form-control" value="8">
                                        </div>
                                        <div class="col-auto">
                                            <label class="form-label" for="txtCalzado">Calzado</label>
                                            <input type="number" id="txtCalzado" class="form-control" value="5">
                                        </div>
                                    </div>

                                    <!--Fila 3-->
                                    <div class="row">
                                        <div class="col-auto">
                                            <label class="form-label" for="txtSelectCategoria">Categoria</label>
                                            <select class="form-select" id="txtSelectCategoria" required>
                                                <option value="2"> -- Categoria 2(8 a 11) --</option>
                                            </select>
                                        </div>
                                        <div class="col-auto">
                                            <label class="form-label" for="txtEdad">Edad Calculada</label>
                                            <input type="number" id="txtEdad" class="form-control" value="8" disabled>
                                        </div>
                                        <div class="col-auto">
                                            <label class="form-label" for="txtIMC">IMC Calculado</label>
                                            <input type="number" id="txtEdad" class="form-control" value="17.4"
                                                disabled>
                                        </div>
                                    </div>

                                    <!--Fila 4-->
                                    <div class="row">
                                        <div class="col-auto">
                                            <label class="form-label" for="txtPieD">Pie Dominante</label>
                                            <select id="txtPieD" class="form-select">
                                                <option value="Diestro">Diestro</option>
                                            </select>
                                        </div>

                                        <div class="col-auto">
                                            <label class="form-label" for="txtPosicion">Posición en Cancha</label>
                                            <select id="txtPosicion" class="form-select">
                                                <option value="Portero">Portero</option>
                                            </select>
                                        </div>
                                    </div>

                                    <!--SEPARADOR - Titulo-->
                                    <div class="row text-center text-white">
                                        <h4><a href="#" class="link-danger">Autorizaciones</a></h4>
                                    </div>

                                    <!--Fila 1-->
                                    <div class="row d-flex align-items-end">
                                        <div class="col-auto">
                                            <label class="form-label" for="fileTratamiento">Autorización tratamiento de
                                                datos</label>
                                            <input type="file" class="form-control" id="fileTratamiento"
                                                accept="application/pdf" required>
                                        </div>

                                        <div class="col-auto">
                                            <label class="form-label" for="fileMedica">Autorización Médica</label>
                                            <input type="file" class="form-control" id="fileMedica"
                                                accept="application/pdf" required>
                                        </div>

                                        <div class="col-auto">
                                            <label class="form-label" for="fileEps">Comprobante EPS</label>
                                            <input type="file" class="form-control" id="fileEps"
                                                accept="application/pdf" required>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>

                            <!--Titulo-->
                            <div class="row text-center text-white mt-5">
                                <h2><a href="#" class="link-danger">Actividades</a></h2>
                            </div>

                            <!--Botones de actividades-->
                            <div class="row">
                                <div class="col">
                                    <button type="button" class="btn btn-warning" data-bs-toggle="modal"
                                        data-bs-target="#botonEditarInformacion" style="margin: 10px; width: 300px;">
                                        Editar información
                                    </button>
                                </div>
                                <div class="col">
                                    <button id="botonDesactivarAlumno" type="button" class="btn btn-danger btn"
                                        onclick="SuspenderAlumno() " style="margin: 10px; width: 300px;">Suspender
                                        Alumno</button>

                                    <button id="botonActivarAlumno" type="button" class="btn btn-success btn"
                                        style="margin: 10px; width: 300px;" onclick="activarAlumno()">Actiivar
                                        Alumno</button>
                                </div>
                                <div class="col">
                                    <button id="botonCarnet" type="button" class="btn btn-secondary"
                                        data-bs-toggle="modal" data-bs-target="#botonGenerarcarnet"
                                        style="margin: 10px; width: 300px;" onclick="GenerarCarnet()">
                                        Generar carnet</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!--Creacion modales-->
    <!--Modal editar informacion-->
    <div class="modal fade" id="botonEditarInformacion" tabindex="-1" aria-labelledby="ModalEditarInformacion"
        aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title p-3" id="ModalCondirmacionIncrip">Editar Informacion
                        Alumno</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>

                <div class="modal-body ">
                    <h4 class="mb-2 text-center">Editar Alumno</h4>
                    <form class="form" id="editarA">
                        <!--SEPARADOR - Titulo-->
                        <div class="row text-center text-white">
                            <h4><a href="#" class="link-danger">Datos personales</a></h4>
                        </div>

                        <!--Fila 1-->
                        <div class="row">
                            <div class="col-auto">
                                <label class="form-label" for="txtTipoId">Tipo Id</label>
                                <select class="form-select" id="txtTipoId" disabled>
                                    <option value="TI">TI</option>
                                </select>
                            </div>

                            <div class="col-auto">
                                <label class="form-label" for="txtNumeroID">Número ID</label>
                                <input type="number" id="txtNumeroID" class="form-control" value="1028662497" disabled>
                            </div>
                        </div>

                        <!--Fila 2-->
                        <div class="row">
                            <div class="col-auto">
                                <label class="form-label" for="txtPNombre">Primer Nombre</label>
                                <input type="text" id="txtPNombre" class="form-control" value="Juan" disabled>
                            </div>

                            <div class="col-auto">
                                <label class="form-label" for="txtSNombre">Segundo Nombre</label>
                                <input type="text" id="txtSNombre" class="form-control" value="Carlos" disabled>
                            </div>

                            <div class="col-auto">
                                <label class="form-label" for="txtPApellido">Primer Apellido</label>
                                <input type="text" id="txtPApellido" class="form-control" value="Rodriguez" disabled>
                            </div>

                            <div class="col-auto">
                                <label class="form-label" for="txtSapellido">Segundo Apellido</label>
                                <input type="text" id="txtSapellido" class="form-control" value="Gomez" disabled>
                            </div>
                        </div>

                        <!--Fila 3-->
                        <div class="row d-flex align-items-end">
                            <div class="col-auto">
                                <label class="form-label" for="txtSexo">Genero</label>
                                <select class="form-select" id="txtSexo">
                                    <option value="">Elige...</option>
                                    <option value="M">Masculino</option>
                                    <option value="F">Femenino</option>
                                    <option value="NB">No binario</option>
                                </select>
                            </div>
                            <div class="col-auto">
                                <label class="form-label" for="txtFechaN">Fecha de nacimiento</label>
                                <input type="date" id="txtFechaN" class="form-control" value="2017-03-02" disabled>
                            </div>
                            <div class="col-auto">
                                <label class="form-label" for="txtEps">EPS</label>
                                <input type="text" id="txtEps" class="form-control" placeholder="Sura, Compensar"
                                    pattern="[A-Za-z\s]{5, 15}"
                                    title="Solo se permiten letras y espacios, máximo 15 caracteres.">
                                <div id="txtAyudaEps" class="form-text">Ingresa la EPS a la cual
                                    perteneces</div>
                            </div>
                        </div>

                        <!--Fila 4-->
                        <div class="row">
                            <div class="col-auto">
                                <label class="form-label" for="txtDireccion">Dirección
                                    domicilio</label>
                                <input type="text" id="txtDireccion" class="form-control" placeholder="Calle 45 #3g"
                                    pattern="^[A-Za-z0-9\s#.-]+$" minlength="15" maxlength="100"
                                    title="Debe ser una dirección válida con letras, números, espacios y algunos caracteres especiales (#, ., -).">
                            </div>
                            <div class="col-auto">
                                <label class="form-label" for="txtCelular">Número
                                    celular</label>
                                <input type="tel" id="txtCelular" class="form-control" placeholder="3245643334"
                                    pattern="^\d{10}$" title="Debe contener 10 dígitos.">
                            </div>
                            <div class="col-auto">
                                <label class="form-label" for="txtCorreo">Correo
                                    Electrónico</label>
                                <input type="email" id="txtCorreo" class="form-control" placeholder="example@gmail.com"
                                    maxlength="100" title="Ingresa un correo electrónico válido.">
                            </div>
                        </div>

                        <!--SEPARADOR - Titulo-->
                        <div class="row text-center text-white mt-2">
                            <h4><a href="#" class="link-danger">Datos Fisicos</a></h4>
                        </div>

                        <!--Fila 1-->
                        <div class="row">
                            <div class="col-auto">
                                <label class="form-label" for="txtTSangre">Tipo de sangre</label>
                                <select id="txtTSangre" class="form-select" disabled>
                                    <option value="A">A</option>
                                </select>
                            </div>
                            <div class="col-auto">
                                <label class="form-label" for="txtRh">RH</label>
                                <select id="txtRh" class="form-select" disabled>
                                    <option value="+">+</option>
                                </select>
                            </div>
                        </div>

                        <!--Fila 2-->
                        <div class="row">
                            <div class="col-auto">
                                <label class="form-label" for="txtAltura">Altura</label>
                                <input type="number" id="txtAltura" class="form-control" placeholder="1.64" min="0.50"
                                    max="2.50" step="0.01" title="Ingresa un valor entre 0.50 y 2.50 metros.">
                            </div>
                            <div class="col-auto">
                                <label class="form-label" for="txtPeso">Peso</label>
                                <input type="number" id="txtPeso" class="form-control" placeholder="63.34" min="10"
                                    max="100" step="0.01" title="Ingresa un valor entre 10 y 100 kg.">
                            </div>

                            <div class="col-auto">
                                <label class="form-label" for="txtTalla">Talla</label>
                                <input type="text" id="txtTalla" class="form-control" placeholder="M, L, XS..."
                                    pattern="[A-Za-z0-9]{3, 6}"
                                    title="Solo se permiten letras (e.g., XS, M, L) y numero(1,2,3--)">
                            </div>
                            <div class="col-auto">
                                <label class="form-label" for="txtCalzado">Calzado</label>
                                <input type="number" id="txtCalzado" class="form-control" placeholder="38, 40, 35"
                                    min="15" max="50" title="Ingresa un número entre 15 y 50.">
                            </div>
                        </div>

                        <!--Fila 3-->
                        <div class="row">
                            <div class="col-auto">
                                <label class="form-label" for="txtSelectCategoria">Categoria</label>
                                <select class="form-select" id="txtSelectCategoria">
                                    <option value="">Elige...</option>
                                    <option value="1">-- Categoria 1(4 a 7) --</option>
                                    <option value="2"> -- Categoria 2(8 a 11) --</option>
                                    <option value="3">-- Categoria 3(12 a 15) --</option>
                                    <option value="4">-- Categoria 4(16 a 17) --</option>
                                    <option value="5">-- Categoria 5(18) --</option>
                                </select>
                            </div>
                            <div class="col-auto">
                                <label class="form-label" for="txtEdad">Edad Calculada</label>
                                <input type="number" id="txtEdad" class="form-control" value="8" disabled>
                            </div>
                            <div class="col-auto">
                                <label class="form-label" for="txtIMC">IMC Calculado</label>
                                <input type="number" id="txtEdad" class="form-control" value="17.4" disabled>
                            </div>
                        </div>

                        <!--Fila 4-->
                        <div class="row">
                            <div class="col-auto">
                                <label class="form-label" for="txtPieD">Pie Dominante</label>
                                <select id="txtPieD" class="form-select">
                                    <option value="">Elige...</option>
                                    <option value="Diestro">Diestro</option>
                                    <option value="Zurdo">Zurdo</option>
                                    <option value="Ambidiestro">Ambidiestro</option>
                                </select>
                            </div>

                            <div class="col-auto">
                                <label class="form-label" for="txtPosicion">Posición en
                                    Cancha</label>
                                <select id="txtPosicion" class="form-select">
                                    <option value="">Elige...</option>
                                    <option value="Portero">Portero</option>
                                    <option value="Defensa">Defensa</option>
                                    <option value="MedioCampo">Medio Campo</option>
                                    <option value="Delantero">Delantero</option>
                                </select>
                            </div>
                        </div>

                        <!--SEPARADOR - Titulo-->
                        <div class="row text-center text-white mt-2">
                            <h4><a href="#" class="link-danger">Autorizaciones</a></h4>
                        </div>

                        <!--Fila 1-->
                        <div class="row d-flex align-items-end">
                            <div class="col-auto">
                                <label class="form-label" for="fileTratamiento">Autorización tratamiento de
                                    datos</label>
                                <input type="file" class="form-control" id="fileTratamiento" accept="application/pdf"
                                    disabled>
                            </div>

                            <div class="col-auto">
                                <label class="form-label" for="fileMedica">Autorización Médica</label>
                                <input type="file" class="form-control" id="fileMedica" accept="application/pdf"
                                    disabled>
                            </div>

                            <div class="col-auto">
                                <label class="form-label" for="fileEps">Comprobante EPS</label>
                                <input type="file" class="form-control" id="fileEps" accept="application/pdf" disabled>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4 d-flex justify-content-center my-4">
                                <button type="submit" id="botonConfirmar" class="btn btn-success" style="height: 60px;">Enviar
                                    Formulario de
                                    Inscripcion</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
        //Mensaje de cerrar sesion
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

        //Buscar al alumno
        const botonBuscar = document.getElementById("BotonConsultarAlumnos");
        const desplegar = document.getElementById("filaDesplegada");
        const alumno1 = {
            nombre: "Juan",
            apellido: "carlos",
            id: 1028662497
        }

        botonBuscar.addEventListener("click", function (event) {
            const txtConsulta = document.getElementById("txtConsulta").value;

            if (txtConsulta == alumno1.nombre || txtConsulta == alumno1.apellido || txtConsulta == alumno1.id) {
                Swal.fire({
                    title: 'Busqueda Correcta',
                    text: '',
                    icon: 'success',
                    buttons: false,
                    timer: 1000,
                });
                desplegar.style.display = "block";
            } else {
                Swal.fire({
                    title: 'Busqueda incorrecta',
                    text: 'El campo incresado no coincide o es incorrecto',
                    icon: 'error',
                });
            }
        });


        //Mensaje de confimar supender alumno
        function SuspenderAlumno() {
            Swal.fire({
                title: "Suspender Alumno?",
                text: "¿Estas seguro de a este alumno?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Si, suspendelo",
                confirmButtonColor: "#2a6637",
                cancelButtonColor: "#570808",
                buttonTextColor: '#ffffff ',
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "Suspendido!",
                        text: "Has suspendido al alumno correctamente.",
                        icon: "success"
                    });
                }
            });
        }


        //Accion de que aparezca el boton de activar alumno
        const botonDesactivadoObj = document.getElementById("botonDesactivarAlumno");
        const botonActivarObj = document.getElementById("botonActivarAlumno");

        botonDesactivadoObj.addEventListener("click", function () {
            botonActivarObj.style.display = "inline-block";
        });


        //Mensaje de activar alumno suspendido
        function activarAlumno() {
            Swal.fire({
                title: 'Activar?',
                text: '¿Quieres activar este alumno suspendido?',
                icon: 'question',
                showCancelButton: true,
                showConfirmButton: true,
                confirmButtonText: 'Si.',
                cancelButtonText: 'No.',
                confirmButtonColor: '#2a6637',
                cancelButtonColor: '#570808 ',
                confirmButtonTextColor: '#ffffff ',
                timer: 10000,
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: '',
                        text: 'Guardando cambios, espera un momento',
                        icon: 'success',
                        showConfirmButton: false,
                        timer: 10000,
                        didOpen: () => {
                            Swal.showLoading();
                        }
                    })
                    setTimeout(() => {
                        window.location.href = "1_consultarAlumnos.html";
                    }, 1000);
                }
            });
        }

        //Mensaje para confirmar cambio al alumno
        document.getElementById("editarA").addEventListener("submit", function (event) {
            event.preventDefault();
            const botonConfirmar = document.getElementById("");

            if (editarA.checkValidity()) {
                Swal.fire({
                    title: 'hmmm?',
                    text: '¿Estas seguro de guardar los cambios?',
                    icon: 'question',
                    showCancelButton: true,
                    showConfirmButton: true,
                    confirmButtonText: 'Si, quiero ir.',
                    cancelButtonText: 'No, quiero quedarme.',
                    confirmButtonColor: '#2a6637',
                    cancelButtonColor: '#570808 ',
                    confirmButtonTextColor: '#ffffff ',
                    timer: 10000,
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire({
                            title: '',
                            text: 'Guardando cambios, espera un momento',
                            icon: 'success',
                            showConfirmButton: false,
                            timer: 10000,
                            didOpen: () => {
                                Swal.showLoading();
                            }
                        })
                        setTimeout(() => {
                            window.location.href = "1_consultarAlumnos.html";
                        }, 1000);
                    }
                });
            }
        });

        //Mensaje para la creacion del carnet
        function GenerarCarnet() {
            Swal.fire({
                title: 'hmmm?',
                text: '¿Quieres generar este carnet y enviarlo al alumno?',
                icon: 'question',
                showCancelButton: true,
                showConfirmButton: true,
                confirmButtonText: 'Si, quiero enviarlo.',
                cancelButtonText: 'No, cancelar.',
                confirmButtonColor: '#2a6637',
                cancelButtonColor: '#570808 ',
                confirmButtonTextColor: '#ffffff ',
                timer: 10000,
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: '',
                        text: 'Generando carnet....',
                        icon: 'success',
                        showConfirmButton: false,
                        timer: 10000,
                        didOpen: () => {
                            Swal.showLoading();
                        }
                    })
                    setTimeout(() => {
                        window.location.href = "1_consultarAlumnos.html";
                    }, 1000);
                }
            });
        }
    </script>
</body>

</html>
