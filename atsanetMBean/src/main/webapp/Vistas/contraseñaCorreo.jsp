<%-- 
    Document   : contraseñaCorreo
    Created on : 18/06/2025, 10:18:49 a. m.
    Author     : adminsena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contraseña</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Bostrap -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <!--Diseño de letra-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert2 -->

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
            height: 700px;
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

        .row {
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
            <h1 class="text-center mb-4 text-white">¿Olvidaste tu contraseña?</h1>
            <p>Ingresa el correo que registraste para enviarte un codigo.</p>
        </div>

        <!--Formulario-->
        <div class="row">
            <form id="recoveryForm">
                <div class="row">
                    <div class="col p-3">
                        <label for="email" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="email" placeholder="Ingrese su correo" style="height: 60px;" required>
                    </div>
                </div>

                <div class="row">
                    <!--boton de confirmacion-->
                    <div class="col d-flex justify-content-center">
                        <button type="submit" id="botonConfirmar" class="btn btn-secondary" style="width: 400px; height: 55px;">Enviar</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="row">
            <!--boton de regresar-->
             <div class="col d-flex justify-content-center">
                <button type="submi" class="btn btn-md btn-danger" style="width: 400px; height: 55px;" onclick="cerrarSesion()">
                    <- Volver</button>
            </div>
        </div>
    </div>

    <!--Pie de pagina-->
    <div class="footer d-flex justify-content-center text-center align-items-center" id="piePagina">
        <h5>&copy; 2024 Club Deportivo Atlético Santander. Todos los derechos reservados.</h5>
    </div>
 
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        //Despliegue de mensaje
        document.getElementById('recoveryForm').addEventListener('submit', function (event) {
            event.preventDefault();

            //Mensaje de espera
            Swal.fire({
                title: 'Enviando código...',
                text: 'Por favor, espera un momento.',
                didOpen: () => {
                    Swal.showLoading();
                },
                allowOutsideClick: false,
                showConfirmButton: false,
                timer: 2000,
            });

            //Mensaje de confirmacion y redirecion
            setTimeout(() => {
                Swal.fire({
                    title: '¡Listo!',
                    text: 'El código ya ha sido enviado a tu correo.',
                    icon: 'success',
                    showConfirmButton: false,
                    timer: 1000,
                }).then(() => {
                    window.location.href = "contraseñaCodigo.html";
                });
            }, 2000);
        });

        function cerrarSesion() {
            Swal.fire({
                text: '¿Estas seguro de ir al inicio de sesion?',
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
                        title: 'Saliedo',
                        text: '',
                        icon: 'success',
                        showConfirmButton: false,
                        timer: 10000,
                        didOpen: () => {
                            Swal.showLoading();
                        }
                    })
                    setTimeout(() => {
                        window.location.href = "inicioSesion.html";
                    }, 1000);
                }
            })
        }
    </script>
</body>

</html>
