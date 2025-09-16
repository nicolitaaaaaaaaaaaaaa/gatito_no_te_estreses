<%-- 
    Document   : 2_registrarObjetivos
    Created on : 24 jun 2025, 4:08:32 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Objetivos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        
        const alumnos = [
            { nombre: 'Juan Pérez', objetivos: ['', '', '', ''], observaciones: '' },
            { nombre: 'María López', objetivos: ['', '', '', ''], observaciones: '' },
            { nombre: 'Pedro García', objetivos: ['', '', '', ''], observaciones: '' },
            { nombre: 'Sofía Martínez', objetivos: ['', '', '', ''], observaciones: '' },
            { nombre: 'Andrés Torres', objetivos: ['', '', '', ''], observaciones: '' },
            { nombre: 'Lucía Fernández', objetivos: ['', '', '', ''], observaciones: '' },
            { nombre: 'Carlos Ramírez', objetivos: ['', '', '', ''], observaciones: '' },
            { nombre: 'Paula Díaz', objetivos: ['', '', '', ''], observaciones: '' }
        ];

        let guardado = false;

       
        function renderTable(editable = true) {
            const tbody = document.querySelector("tbody");
            tbody.innerHTML = ""; 
            alumnos.forEach((alumno, index) => {
                const row = document.createElement("tr");
                row.innerHTML = `
                    <td>${alumno.nombre}</td>
                    ${alumno.objetivos.map(obj => `
                        <td>
                            <input type="number" class="form-control objetivo" value="${obj}" 
                                placeholder="0 o 1" max="1" min="0" step="1" ${!editable ? 'disabled' : ''}>
                        </td>
                    `).join('')}
                    <td>
                        <input type="text" class="form-control observaciones" value="${alumno.observaciones}" 
                            placeholder="Observaciones" ${!editable ? 'disabled' : ''}>
                    </td>
                `;
                tbody.appendChild(row);
            });
        }

       
        function guardarObjetivos() {
            const filas = document.querySelectorAll("tbody tr");
            let valid = true;

            filas.forEach((fila, index) => {
                const inputs = fila.querySelectorAll(".objetivo");
                const observaciones = fila.querySelector(".observaciones");

                
                inputs.forEach((input, colIndex) => {
                    const value = input.value.trim();
                    if (value !== '0' && value !== '1') {
                        valid = false;
                        input.classList.add("is-invalid");
                    } else {
                        input.classList.remove("is-invalid");
                        alumnos[index].objetivos[colIndex] = value;
                    }
                });

                
                alumnos[index].observaciones = observaciones.value.trim();
            });

            if (valid) {
                guardado = true;
                renderTable(false);
                document.getElementById("finalizarBtn").disabled = false; 
                Swal.fire({
                    icon: 'success',
                    title: 'Guardado',
                    text: 'Los registros se han guardado correctamente.'
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Por favor, ingresa solo valores 0 o 1 en los objetivos.'
                });
            }
        }

        
        function modificarRegistro() {
            if (guardado) {
                renderTable(true); 
                guardado = false; 
                document.getElementById("finalizarBtn").disabled = true; 
                Swal.fire({
                    icon: 'info',
                    title: 'Edición habilitada',
                    text: 'Ahora puedes modificar los registros.'
                });
            } else {
                Swal.fire({
                    icon: 'warning',
                    title: 'No guardado',
                    text: 'Primero guarda los registros antes de intentar modificar.'
                });
            }
        }

       
        function finalizarSesion() {
            if (guardado) {
                Swal.fire({
                    icon: 'success',
                    title: 'Sesión Finalizada',
                    text: 'Se guardo correctamente la sesion.'
                }).then(() => {
                    window.location.href = "../2_inicioEntrenador.html";
                });
            }
        }

        window.onload = () => {
            renderTable(); 
            document.getElementById("finalizarBtn").disabled = true; 
        };
    </script>
    <style>
        body {
            background-color: #FFFFFF;
            color: #171846;
            font-family: Arial, sans-serif;
        }
        h2 {
            color: #171846;
            padding: 15px;
            background-color: #f8f9fa;
            border: 2px solid #41B3E8;
            border-radius: 10px;
            text-align: center;
            font-size: 1.5rem;
        }
        .table th {
            background-color: #41B3E8;
            color: #FFFFFF;
        }
        .is-invalid {
            border-color: red;
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
        }
        .btn-home:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <a href="../2_inicioEntrenador.html" class="btn-home">Ir al Perfil</a>
        <h2 class="mb-4">Registro de Objetivos</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Nombre</th>
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
        <button class="btn btn-primary" onclick="guardarObjetivos()">Guardar</button>
        <button class="btn btn-secondary" onclick="modificarRegistro()">Modificar Registro</button>
        <button class="btn btn-danger" id="finalizarBtn" onclick="finalizarSesion()">Finalizar Sesión</button>
    </div>
</body>
</html>

