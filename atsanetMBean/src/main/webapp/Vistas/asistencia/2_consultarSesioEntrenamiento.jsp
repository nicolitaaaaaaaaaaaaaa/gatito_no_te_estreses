<%-- 
    Document   : 2_consultarSesioEntrenamiento
    Created on : 24 jun 2025, 4:06:05 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultar Sesión de Entrenamiento</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        h2 {
            color: #171846;
            text-align: center;
        }

        .container {
            margin-top: 30px;
        }

        .table {
            background-color: #ffffff;
        }

        .table th {
            background-color: #007bff;
            color: #FFFFFF;
        }

        .table td {
            background-color: #f8f9fa;
        }

        .form-select {
            margin-bottom: 20px;
        }

        .btn-home {
            background-color: #007bff;
            border: none;
            color: #fff;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .btn-modificar,
        .btn-eliminar,
        .btn-guardar {
            margin-top: 20px;
            background-color: #007bff;
            border: none;
            color: white;
            padding: 5px 10px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            width: 150px;
        }

        .btn-modificar:hover,
        .btn-eliminar:hover,
        .btn-guardar:hover {
            background-color: #0056b3;
        }

        .btn-guardar:disabled {
            background-color: #d6d6d6;
            cursor: not-allowed;
        }

        #botones {
            display: none;
        }
    </style>
</head>

<body>
    <div class="container mt-4">
        <a href="../2_inicioEntrenador.html" class="btn-home">
            Ir al Perfil
        </a>
        <div class="container">
            <h2 class="mb-4">Consultar Sesión de Entrenamiento</h2>
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
</body>

</html>
