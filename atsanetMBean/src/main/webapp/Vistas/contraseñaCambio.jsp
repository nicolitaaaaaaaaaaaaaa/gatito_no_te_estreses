<%-- 
    Document   : contraseñaCambio
    Created on : 18/06/2025, 10:21:28 a. m.
    Author     : adminsena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambiar Contraseña</title>

    <!-- Bostrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!--Diseño de letra-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
     <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!--logo del ojo-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">


    <style>
        body {
            background-color: rgb(218, 215, 215);
            font-family: 'Roboto', sans-serif;
        }

        #encabezado {
            background: rgb(65, 5, 5);
            width: auto;
            height: 220px;
            border: 5px solid rgb(41, 2, 2);
        }

        .recovery-container {
            width: 500px;
            height: 800px;
            margin: 130px auto;
            padding: 30px;
            background: rgb(41, 2, 2);
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.60);
            transition: transform 0.5s;
        }

        .recovery-container:hover {
            transform: scale(1.05);
        }

        .row{
            padding: 5px;
        }
        
        p {
            color: rgb(219, 214, 214);
            text-align: center;
        }

        .recovery-icon {
            display: block;
            margin: 0 auto 20px;
            width: 100px;
            height: 100px;
            background-color: #A1090B;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .recovery-icon img {
            width: 60%;
        }

        .form-label {
            color: #ffffff;
            font-weight: bold;
        }

        .text-secondary {
            color: #9D9D9D;
        }

        .instructions {
            font-size: 0.9rem;
            color: #9D9D9D;
            margin-top: 5px;
        }

        .error-message {
            color: #dc3545; 
            font-size: 0.875rem;
            margin-top: 5px;
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
                <img src="img/logo_club.png" style="width: 200px">
            </div>
            <div class="col-5" style="padding-left: 60px;">
                <h1 class="display-5">Atlético Santander<br>
                    <h5>club deportivo</h5>
                </h1>
            </div>
        </div>
    </div>

    <!--Contenedor de informacion-->
    <div class="recovery-container">
        <!--Imagen-->
        <div class="row">
            <div class="recovery-icon">
                <img src="img/usuario.png" alt="Usuario">
            </div>
            <h1 class="text-center mb-4 text-white">Cambio de Contraseña</h1>
            <p>Ingresa una nueva contraseña para actualizar.</p>
        </div>

        <!--Formulario-->
        <div class="row">
            <form id="cambiarContrasenaForm">
                <div class="row">
                    <div class="p-3">
                        <label for="nuevaContrasena" class="form-label">Nueva Contraseña</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="nuevaContrasena" placeholder="Ingrese la nueva contraseña" style="height: 50px;" required>
                            <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                <i class="bi bi-eye"></i> 
                            </button>
                        </div>
                        <div class="instructions">
                            La contraseña debe tener entre 5 y 10 caracteres, al menos una mayúscula y dos números.
                        </div>
                        <div id="errorLongitud" class="error-message">La contraseña debe tener entre 5 y 10 caracteres, al menos una mayúscula y contener al menos dos números.</div>
                    </div>
                </div>

                <div class="row">
                    <div class="p-3">
                        <label for="confirmarContrasena" class="form-label">Confirmar Contraseña</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="confirmarContrasena" placeholder="Confirme la nueva contraseña" style="height: 50px;" required>
                            <button class="btn btn-outline-secondary" type="button" id="toggleConfirmPassword">
                                <i class="bi bi-eye"></i> <!-- Icono de ojo de Bootstrap Icons -->
                            </button>
                        </div>
                        <div id="errorCoincidencia" class="error-message">Las contraseñas no coinciden.</div>
                    </div>
                </div>

                <!--boton de confirmacion-->
                <div class="row">
                    <div class="col d-flex justify-content-center">
                        <button type="submit" class="btn btn-secondary" style="width: 400px; height: 55px;">Enviar</button>
                    </div>
                </div>  
            </form>
        </div>

       
    </div>

    <!--Pie de pagina-->
    <div class="footer d-flex justify-content-center text-center align-items-center" id="piePagina">
        <h5>&copy; 2024 Club Deportivo Atlético Santander. Todos los derechos reservados.</h5>
    </div>








    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Script para mostrar/ocultar contraseña -->
    <script>
        // Función para alternar entre mostrar y ocultar la contraseña
        function togglePasswordVisibility(inputId, buttonId) {
            const input = document.getElementById(inputId);
            const button = document.getElementById(buttonId);
            if (input.type === "password") {
                input.type = "text";
                button.innerHTML = '<i class="bi bi-eye-slash"></i>'; // Cambia el ícono a "ojo tachado"
            } else {
                input.type = "password";
                button.innerHTML = '<i class="bi bi-eye"></i>'; // Cambia el ícono a "ojo"
            }
        }

        // Asignar eventos a los botones de mostrar/ocultar
        document.getElementById('togglePassword').addEventListener('click', function () {
            togglePasswordVisibility('nuevaContrasena', 'togglePassword');
        });

        document.getElementById('toggleConfirmPassword').addEventListener('click', function () {
            togglePasswordVisibility('confirmarContrasena', 'toggleConfirmPassword');
        });

        // Validación del formulario (sin cambios)
        document.getElementById('cambiarContrasenaForm').addEventListener('submit', function (event) {
            event.preventDefault(); 

            const nuevaContrasena = document.getElementById('nuevaContrasena').value;
            const confirmarContrasena = document.getElementById('confirmarContrasena').value;

            // Ocultar todos los mensajes de error al inicio
            document.querySelectorAll('.error-message').forEach(function (el) {
                el.style.display = 'none';
            });

            // Validaciones
            const tieneMayuscula = /[A-Z]/.test(nuevaContrasena);
            const tieneDosNumeros = (nuevaContrasena.match(/\d/g) || []).length >= 2;
            const longitudValida = nuevaContrasena.length >= 5 && nuevaContrasena.length <= 10;
            const coinciden = nuevaContrasena === confirmarContrasena;

            let valido = true;

            if (!longitudValida) {
                document.getElementById('errorLongitud').style.display = 'block';
                valido = false;
            }
            if (!tieneMayuscula) {
                document.getElementById('errorMayuscula').style.display = 'block';
                valido = false;
            }
            if (!tieneDosNumeros) {
                document.getElementById('errorNumeros').style.display = 'block';
                valido = false;
            }
            if (!coinciden) {
                document.getElementById('errorCoincidencia').style.display = 'block';
                valido = false;
            }

            if (valido) {
                // Contraseña válida
                Swal.fire({
                    title: '¡Éxito!',
                    text: 'La contraseña ha sido cambiada correctamente.',
                    icon: 'success',
                    showConfirmButton: false,
                    timer: 2000, 
                }).then(() => {
                    // Redirige a otra página después de mostrar el mensaje de éxito
                    window.location.href = "inicioSesion.html";
                });
            }
        });
    </script>
</body>

</html>
