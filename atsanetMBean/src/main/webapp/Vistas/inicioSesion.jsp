<%-- 
    Document   : inicioSesion
    Created on : 18/06/2025, 10:16:42 a. m.
    Author     : adminsena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Sesión</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><!-- Bostrap -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"><!--Diseño de letra-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert2 -->

    <style>
        body {
            background: linear-gradient(135deg, #e3f0ff 0%, #b6e0fe 100%);
            font-family: 'Roboto', sans-serif;
            min-height: 100vh;
        }

        #encabezado {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            width: auto;
            height: 220px;
            border: none;
            box-shadow: 0 4px 20px rgba(25, 118, 210, 0.10);
        }

        .login-container {
            width: 420px;
            margin: 20px auto;
            padding: 35px 30px 30px 30px;
            background: #fcfbfbd2;
            border-radius: 20px;
            box-shadow: 0 8px 32px 0 rgba(25, 118, 210, 0.10);
            border: 1px solid #e3f0ff;
            transition: transform 0.4s;
        }

        .login-container:hover {
            transform: scale(1.01);
            box-shadow: 0 12px 40px 0 rgba(25, 118, 210, 0.18);
        }

        .login-icon {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 25px auto; /* Centrado horizontal y margen inferior */
            width: 90px;
            height: 90px;
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            border-radius: 50%;
            box-shadow: 0 4px 16px rgba(67,233,123,0.2);
        }
        .login-icon img {
            width: 60%;
        }

        .form-label {
            color: #1976d2;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .form-control {
            background: #f4faff;
            border: 1px solid #b6e0fe;
            color: #1976d2;
            font-size: 1.1rem;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(25, 118, 210, 0.03);
        }
        .form-control:focus {
            background: #c8c9ca;
            color: #0d47a1;
            border: 1.5px solid #1976d2;
            box-shadow: 0 0 0 2px #63a4ff44;
        }

        .btn-secondary {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            color: #fff;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            transition: background 0.3s, color 0.3s;
        }
        .btn-secondary:hover {
            background: linear-gradient(90deg, #63a4ff 0%, #1976d2 100%);
            color: #fff;
        }

        .btn-danger {
            background: linear-gradient(90deg, #ff5252 0%, #ff1744 100%);
            border: none;
            border-radius: 10px;
            font-weight: bold;
            color: #fff;
            transition: background 0.3s;
        }
        .btn-danger:hover {
            background: linear-gradient(90deg, #ff1744 0%, #ff5252 100%);
        }

        .alert-danger {
            background: rgba(255, 82, 82, 0.9);
            color: #fff;
            border: none;
            border-radius: 10px;
        }

        .welcome-message {
            display: none;
            background: linear-gradient(90deg, #b6e0fe 0%, #e3f0ff 100%);
            color: #1976d2;
            border: none;
            padding: 18px;
            border-radius: 10px;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            font-size: 1.1rem;
        }

        .text-secondary {
            color: #7b8a99 !important;
        }

        #piePagina {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            width: auto;
            height: 140px;
            border: none;
            color: white;
            box-shadow: 0 -4px 20px rgba(25, 118, 210, 0.10);
            border-radius: 0 0 20px 20px;
        }
    </style>
</head>

<body>
    <div class="header text-white" id="encabezado">
        <div class="row d-flex align-items-center">
            <div class="col-4 d-flex justify-content-end">
                <img src="/atsaNet/img/logo_club.png" style="width: 200px">
            </div>
            <div class="col-5" style="padding-left: 60px;">
                <h1 class="display-5">Atlético Santander<br>
                    <h5>Club Deportivo</h5>
                </h1>
            </div>
        </div>
    </div>


    <!--Contenedor del login-->
    <div class="login-container">
        <!--Imagen-->
        <div class="login-icon">
            <img src="/atsaNet/img/usuario.png" alt="Usuario">
        </div>
        <h1 class="text-center mb-4 text-black">Inicio de Sesión</h1>

    <% if (request.getAttribute("fail") != null) { %>
        <div class="alert alert-danger text-center" role="alert">
            <%= request.getAttribute("fail") %>
        </div>
    <% } %>

        <!--Formulario con validaciones-->
        <form id="loginForm" action="/atsaNet/ValidarPersonalT" method="POST">
        <div class="p-3">
            <label for="username" class="form-label">Número de Identificación</label>
            <!-- Limita el número máximo al valor máximo de un int -->
        <input type="number" class="form-control" id="username" name="cedula"
            placeholder="Ingrese su número de identificación"
            min="10000000" max="2147483647"
            title="Debe contener entre 8 y 10 dígitos y no superar Int"
            style="height: 50px;" required>
        </div>
        <div class="p-3">
            <label for="password" class="form-label">Contraseña</label>
            <input type="password" class="form-control" id="password" name="pass" placeholder="Ingrese su contraseña"
            pattern=".{1,20}" title="La contraseña debe tener hasta 20 caracteres" style="height: 50px;" required>
        </div>
        <div class="p-3">
            <button type="submit" name="action" value="validar" class="btn btn-secondary w-100" style="height: 50px;">Ingresar</button>
            <button type="button" class="btn btn-md btn-danger p-3 w-100 mt-3" onclick="cerrarSesion()">
                Volver a la página principal
            </button>
        </div>
    </form>

        <!--Mensaje de bienvenida-->
        <div id="welcomeMessage" class="welcome-message">
            <span id="welcomeText"></span>
        </div>
        <div class="text-center mt-3">
            <a href="contraseñaCorreo.html" class="text-secondary">¿Olvidó su contraseña?</a>
        </div>
    </div>

    <!--Pie de pagina-->
    <div class="footer d-flex justify-content-center text-center align-items-center" id="piePagina">
        <h5>&copy; 2024 Club Deportivo Atlético Santander. Todos los derechos reservados.</h5>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function mostrarMensajeBienvenida(message, redirectUrl) {
            const loginForm = document.getElementById("loginForm");
            const welcomeMessage = document.getElementById("welcomeMessage");
            const welcomeText = document.getElementById("welcomeText");

            loginForm.style.display = "none";
            welcomeMessage.style.display = "block";
            welcomeText.textContent = message;


            setTimeout(() => {
                location.href = redirectUrl;
            }, 3000);
        }

        function cerrarSesion() {
            Swal.fire({
                text: '¿Estas seguro de ir a la pagina principal?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#2a6637',
                confirmButtonTextColor: '#ffffff ',
                cancelButtonColor: '#570808 ',
                confirmButtonText: 'Si, quiero ir.',
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
                        window.location.href = "/atsaNet/index.jsp";
                    }, 1000);
                }
            })
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
