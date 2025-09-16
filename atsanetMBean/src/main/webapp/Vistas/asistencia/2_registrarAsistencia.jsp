<%-- 
    Document   : 2_registrarAsistencia
    Created on : 24 jun 2025, 4:06:24 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Sesión de Entrenamiento</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background-color: #ffffff;
            color: #000000;
        }

        h2 {
            color: #000000;
            padding: 15px;
            background-color: #f8f9fa;
            border: 2px solid #41B3E8;
            border-radius: 10px;
            text-align: center;
            font-size: 1.5rem;
        }

        .form-label {
            color: #000000;
        }

        .hidden {
            display: none;
        }

        .btn-primary, .btn-secondary {
            color: #ffffff;
        }

        .btn-primary {
            background-color: #41B3E8;
            border-color: #41B3E8;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #0f66b1;
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
                if (input.value === '') {
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
                    text: 'Por favor, completa todos los campos de asistencia.',
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
    <div class="container mt-4">
        <a href="../2_inicioEntrenador.html" class="btn-home">
            Ir al Perfil
        </a>
    <div class="container mt-4">
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
            <h4>Lista de Alumnos</h4>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Asistencia (1 = Sí, 0 = No)</th>
                        <th>Observaciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Juan Pérez</td>
                        <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                        <td><textarea class="form-control"></textarea></td>
                    </tr>
                    <tr>
                        <td>María López</td>
                        <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                        <td><textarea class="form-control"></textarea></td>
                    </tr>
                    <tr>
                        <td>Pedro García</td>
                        <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                        <td><textarea class="form-control"></textarea></td>
                    </tr>
                    <tr>
                        <td>Sofía Martínez</td>
                        <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                        <td><textarea class="form-control"></textarea></td>
                    </tr>
                    <tr>
                        <td>Andrés Torres</td>
                        <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                        <td><textarea class="form-control"></textarea></td>
                    </tr>
                    <tr>
                        <td>Lucía Fernández</td>
                        <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                        <td><textarea class="form-control"></textarea></td>
                    </tr>
                    <tr>
                        <td>Carlos Ramírez</td>
                        <td><input type="number" min="0" max="1" class="form-control asistencia"></td>
                        <td><textarea class="form-control"></textarea></td>
                    </tr>
                    <tr>
                        <td>Paula Díaz</td>
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
            <button id="sesionEntrenamientoBtn" class="btn btn-primary hidden" onclick="window.location.href='2_registrarObjetivos.html'">Iniciar Entrenamiento</button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
