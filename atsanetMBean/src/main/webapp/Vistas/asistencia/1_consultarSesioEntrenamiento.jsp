<%-- 
    Document   : 1_consultarSesioEntrenamiento
    Created on : 24 jun 2025, 4:02:50 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultar Sesión de Entrenamiento</title>

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
            min-height: 70vh;
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
            color: #171846;
            text-align: center;
        }

        #Informacion {
            background: #142441;
            width: 600px;
            height: auto;
            border-radius: 15px;
            padding: 60px;
            margin: 10px;
            box-shadow: 0 15px 15px rgba(0, 0, 0, 0.60);
            color: white;
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

        .form-select {
            margin-bottom: 20px;
        }

        .btn-modificar,
        .btn-eliminar,
        .btn-guardar {
            margin-top: 20px;
            background-color: rgb(65, 5, 5);
            color: white;
            padding: 5px 10px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 15px;
            width: 180px;
            height: 60px;
        }

        .btn-modificar:hover,
        .btn-eliminar:hover,
        .btn-guardar:hover {
            background-color: rgb(41, 2, 2);
        }

        .btn-guardar:disabled {
            background-color: #d6d6d6;
            cursor: not-allowed;
        }

        #botones {
            display: none;
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
                            <p>Selecciona la opcion a la que quieras ingresar.</p>

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
    <div class="container d-flex text-white" id="contenedor">
        <main>
            <div class="row d-flex justify-content-center">
                <!--Titulo principal-->
                <h2 class="my-5">Consultar Sesión de Entrenamiento</h2>
                <hr class="border-5 border-dark opacity-50" style="width: 900px;">
            </div>

            <div class="row d-flex justify-content-center my-5">
                <div class="col" id="Informacion">
                    <!--Formulario-->
                    <div class="row">
                        <div class="col-md-4">
                            <label for="categoria" class="form-label">Selecciona la categoría:</label>
                            <select id="categoria" class="form-select" onchange="mostrarGrupos(); cargarDatos()">
                                <option value="">-- Seleccionar categoría --</option>
                                <option value="inicial">Inicial (4 a 6 años)</option>
                                <option value="intermedio">Intermedia (7 a 9 años)</option>
                                <option value="avanzada">Avanzada (10 a 12 años)</option>
                                <option value="juvenil">Juvenil (13 a 17 años)</option>
                                <option value="unica">Única (18 a 20 años)</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="grupo" class="form-label">Selecciona el grupo:</label>
                            <select id="grupo" class="form-select" onchange="cargarDatos()">
                                <option value="">-- Seleccionar grupo --</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="fecha" class="form-label">Selecciona la fecha:</label>
                            <select id="fecha" class="form-select" onchange="cargarDatos()">
                                <option value="">Seleccione fecha</option>
                                <option value="2024-11-28">28 de noviembre de 2024</option>
                                <option value="2024-11-29">29 de noviembre de 2024</option>
                                <option value="2024-11-30">30 de noviembre de 2024</option>
                            </select>
                        </div>
                    </div>

                    <!--Tabla 1-->
                    <div id="tablaAsistencia" class="mt-4" style="display: none;">
                        <h4>Asistencia</h4>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Estudiante</th>
                                    <th>Asistencia</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>

                    <!--Tabla 2-->
                    <div id="tablaObjetivos" class="mt-4" style="display: none;">
                        <h4>Objetivos</h4>
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
                            <tbody>
                            </tbody>
                        </table>
                    </div>

                    <div id="botones" class="mt-4">
                        <button class="btn-modificar" onclick="modificarSesion()">Modificar sesión</button>
                        <button class="btn-guardar" onclick="guardarModificaciones()">Guardar modificaciones</button>
                        <button class="btn-eliminar" onclick="eliminarSesion()">Eliminar sesión</button>
                    </div>
                </div>
            </div>


            
        </main>
    </div>


    <!--Pie de pagina-->
    <div class="footer d-flex justify-content-center text-center align-items-center" id="piePagina">
        <h5>&copy; 2024 Club Deportivo Atlético Santander. Todos los derechos reservados.</h5>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <script>
        function cargarDatos() {
            const categoria = document.getElementById("categoria").value;
            const grupo = document.getElementById("grupo").value;
            const fecha = document.getElementById("fecha").value;

            if (categoria && grupo && fecha) {
                document.getElementById("tablaAsistencia").style.display = "block";
                document.getElementById("tablaObjetivos").style.display = "block";
                actualizarTablas(categoria, grupo, fecha);

                document.getElementById("botones").style.display = "block";
            }
        }

        function actualizarTablas(categoria, grupo, fecha) {
            const asistenciaTabla = document.getElementById("tablaAsistencia").getElementsByTagName('tbody')[0];
            const objetivosTabla = document.getElementById("tablaObjetivos").getElementsByTagName('tbody')[0];

            asistenciaTabla.innerHTML = "";
            objetivosTabla.innerHTML = "";

            const estudiantes = [
                { nombre: "Juan Pérez", asistio: 1, objetivos: [1, 1, 1, 1], observacion: "Buen desempeño." },
                { nombre: "María López", asistio: 0, objetivos: [0, 0, 0, 0], observacion: "No pasó por inasistencia." },
                { nombre: "Pedro Gómez", asistio: 1, objetivos: [1, 1, 0, 1], observacion: "Excelente en la técnica." },
                { nombre: "Laura Martínez", asistio: 0, objetivos: [0, 0, 0, 0], observacion: "No pasó por inasistencia." },
                { nombre: "Carlos Rodríguez", asistio: 1, objetivos: [1, 1, 1, 1], observacion: "Mostró una buena actitud." },
                { nombre: "Sofía Ramírez", asistio: 1, objetivos: [1, 0, 1, 0], observacion: "Excelente rendimiento." }
            ];

            estudiantes.forEach(estudiante => {
                const rowAsistencia = asistenciaTabla.insertRow();
                rowAsistencia.insertCell(0).innerText = estudiante.nombre;
                const asistenciaCell = rowAsistencia.insertCell(1);
                asistenciaCell.innerHTML = `<input type="number" min="0" max="1" class="form-control" value="${estudiante.asistio}" id="asistencia-${estudiante.nombre}" disabled>`;

                const rowObjetivos = objetivosTabla.insertRow();
                rowObjetivos.insertCell(0).innerText = estudiante.nombre;
                estudiante.objetivos.forEach((objetivo, index) => {
                    const objetivoCell = rowObjetivos.insertCell(index + 1);
                    objetivoCell.innerHTML = `<input type="number" min="0" max="1" class="form-control" value="${objetivo}" id="objetivo-${estudiante.nombre}-${index}" disabled>`;
                });
                const observacionCell = rowObjetivos.insertCell(5);
                observacionCell.innerHTML = `<input type="text" class="form-control" value="${estudiante.observacion}" id="observacion-${estudiante.nombre}" disabled>`;
            });
        }

        function mostrarGrupos() {
            const categoria = document.getElementById("categoria").value;
            const grupoSelect = document.getElementById("grupo");
            grupoSelect.innerHTML = "";

            if (categoria) {
                grupoSelect.innerHTML = `
                        <option value="">Seleccione grupo</option>
                        <option value="A">Grupo A</option>
                        <option value="B">Grupo B</option>
                        <option value="C">Grupo C</option>
                    `;
            }
        }

        function modificarSesion() {
            Swal.fire({
                title: '¿Qué deseas modificar?',
                text: 'Selecciona la tabla a modificar',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Modificar Asistencia',
                cancelButtonText: 'Modificar Objetivos y Observaciones',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {

                    const inputsAsistencia = document.querySelectorAll("#tablaAsistencia input");
                    inputsAsistencia.forEach(input => input.disabled = false);
                    Swal.fire('¡Listo!', 'La tabla de asistencia está lista para modificarse.', 'success');
                } else if (result.dismiss === Swal.DismissReason.cancel) {

                    const inputsObjetivos = document.querySelectorAll("#tablaObjetivos input");
                    inputsObjetivos.forEach(input => input.disabled = false);
                    Swal.fire('¡Listo!', 'Las tablas de objetivos y observaciones están listas para modificarse.', 'success');
                }
            });
        }

        function guardarModificaciones() {
            Swal.fire({
                title: '¿Estás seguro?',
                text: "Guardaremos todos los cambios realizados.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, guardar cambios',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {

                    Swal.fire(
                        'Guardado',
                        'Los cambios se han guardado correctamente.',
                        'success'
                    );


                    const inputsAsistencia = document.querySelectorAll("#tablaAsistencia input");
                    inputsAsistencia.forEach(input => input.disabled = true);
                    const inputsObjetivos = document.querySelectorAll("#tablaObjetivos input");
                    inputsObjetivos.forEach(input => input.disabled = true);


                    document.querySelector(".btn-guardar").disabled = true;
                }
            });
        }

        function eliminarSesion() {
            Swal.fire({
                title: '¿Estás seguro?',
                text: "No podrás recuperar esta sesión de entrenamiento.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        'Eliminado',
                        'La sesión ha sido eliminada',
                        'success'
                    );

                }
            });
        }
    </script>
</body>

</html>