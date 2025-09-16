<%-- 
    Document   : formularioEntrenador
    Created on : 18/06/2025, 10:18:19 a. m.
    Author     : adminsena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Formulario Entrenador</title>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <!-- Bostrap -->
            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
            <!--Diseño de letra-->
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert2 -->
            <style>
                body {
                    margin: 0;
                    padding: 0;
                    color: #263a5e;
                    font-family: 'Roboto', sans-serif;
                    background: linear-gradient(135deg, #e3f0ff 0%, #b6e0fe 100%);
                }

                #encabezado {
                    background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
                    width: auto;
                    height: 220px;
                    border: none;
                    color: white;
                    box-shadow: 0 4px 20px rgba(25, 118, 210, 0.10);
                }

                #contenedor {
                    margin: 0 auto;
                    padding: 0;
                    max-width: 1200px;
                    min-height: 60vh;
                    background: transparent;
                }

                main {
                    background: #fff;
                    margin: 40px auto 30px auto;
                    padding: 40px 30px 30px 30px;
                    color: #263a5e;
                    border-radius: 25px;
                    box-shadow: 0 8px 32px 0 rgba(25, 118, 210, 0.13);
                    max-width: 1100px;
                }

                .form-section {
                    background: linear-gradient(135deg, #e3f0ff 60%, #b6e0fe 100%);
                    border-radius: 18px;
                    box-shadow: 0 4px 16px rgba(25, 118, 210, 0.08);
                    border: 1px solid #e3f0ff;
                    margin-bottom: 32px;
                    padding: 32px 24px 24px 24px;
                }

                .form-section h2 {
                    color: #1976d2;
                    font-size: 1.4rem;
                    font-weight: 700;
                    margin-bottom: 18px;
                    letter-spacing: 1px;
                }

                .form-label {
                    color: #1976d2;
                    font-weight: 700;
                    letter-spacing: 0.5px;
                }

                .form-control,
                .form-select {
                    background: #f4faff;
                    border: 1px solid #b6e0fe;
                    color: #1976d2;
                    font-size: 1rem;
                    border-radius: 10px;
                    box-shadow: 0 2px 8px rgba(25, 118, 210, 0.03);
                    margin-bottom: 12px;
                }

                .form-control:focus,
                .form-select:focus {
                    background: #e3f0ff;
                    color: #0d47a1;
                    border: 1.5px solid #1976d2;
                    box-shadow: 0 0 0 2px #63a4ff44;
                }

                #containerForm1,
                #containerForm2 {
                    background: #d2e6f5;
                    border-radius: 10px;
                    margin: 10px;
                    padding: 50px;
                }

                form label,
                input {
                    display: flex;
                    justify-content: flex-start;
                    align-items: flex-end;
                    width: 200px;
                }

                form input {
                    width: 100;
                }

                .row {
                    margin-bottom: 12px;
                }

                .form-section .row:last-child {
                    margin-bottom: 0;
                }

                .form-section .col,
                .form-section .col.col-auto {
                    margin-bottom: 18px;
                }

                #botonConfirmar {
                    background: linear-gradient(90deg, #ff5252 0%, #ff1744 100%);
                    color: #fff;
                    font-weight: bold;
                    border: none;
                    border-radius: 10px;
                    width: 100%;
                    height: 50px;
                    transition: background 0.3s, color 0.3s, transform 0.2s;
                    font-size: 1.1rem;
                    margin-top: 10px;
                }

                #botonConfirmar:hover {
                    background: linear-gradient(90deg, #ff1744 0%, #ff5252 100%);
                    color: #fff;
                    transform: scale(1.03);
                }

                .footer,
                #piePagina {
                    background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
                    width: auto;
                    height: 160px;
                    border: none;
                    color: white;
                    box-shadow: 0 -4px 20px rgba(25, 118, 210, 0.10);
                    border-radius: 0 0 20px 20px;
                }

                /* Responsive */
                @media (max-width: 991px) {
                    main {
                        padding: 20px 5px;
                    }

                    .form-section {
                        padding: 18px 8px;
                    }
                }
            </style>

        </head>

        <body>
            <!--Encabezado-->
            <div class="header text-white" id="encabezado">
                <div class="row d-flex align-items-center">
                    <div class="col-4 d-flex justify-content-end">
                        <img src="/atsaNet/img/logo_club.png" style="width: 200px">
                    </div>
                    <div class="col-5" style="padding-left: 60px;">
                        <h1 class="display-5">Atlético Santander<br>
                            <h5>club deportivo</h5>
                        </h1>
                    </div>
                    <div class="col-3">
                        <a class="btn btn-danger p-4" onclick="cerrarSesion()">Ir pagina principal</a>
                    </div>
                </div>
            </div>

            <!--Parte central-->
            <div class="container d-flex text-black" id="contenedor">
                <!--Contenido-->
                <main>
                    <!--Informacion principal-->
                    <div class="row text-center m-5">
                        <h2>Bienvenido al Club Deportivo Atlético Santander.</h2>
                        <hr class="border-5 border-dark opacity-50">
                        <p>¡¡Llena el siguiente formulario para ser parte de nuestra familia!!</p>
                        <p>Llena el formulario con información verídica,<br>los datos puestos aquí estarán
                            <kbd>protegidos.</kbd>
                        </p>
                    </div>

                    <!--Formulario-->
                    <div class="row d-flex">
                        <div class="row text-center">
                            <h2>Formulario de Inscripción de Entrenador.</h3>
                        </div>

                        <form class="form needs-validation" id="formInscripcionE" novalidate method="post"
                            action="${pageContext.request.contextPath}/PostulanteEntrenadorServlet">
                            <div class="row">
                                <!--Formulario 1-->
                                <div class="col" id="containerForm1">
                                    <!--Tituloh-->
                                    <div class="row text-red">
                                        <h2><i>Datos Personales</i></h2>
                                    </div>

                                    <!--Fila 1-->
                                    <div class="row">
                                        <div class="col">
                                            <label class="form-label" for="txtTipoId">Tipo Id</label>
                                            <select class="form-select" id="txtTipoId" name="tipo_id" required>
                                                <option value="">Elige...</option>
                                                <option value="RC">RC</option>
                                                <option value="TI">TI</option>
                                                <option value="CC">CC</option>
                                                <option value="PAS">PAS</option>
                                            </select>
                                            <div class="invalid-feedback">
                                                Por favor selecciona un tipo de identificación.
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label class="form-label" for="txtNumeroID">Número ID</label>
                                            <input type="number" id="txtNumeroID" name="id_persona" class="form-control"
                                                required placeholder="Ingresa Número..." min="10000000" max="2147483647"
                                                title="Debe ser un número válido (8 a 10 dígitos, máximo 2147483647)."
                                                pattern="\d{8,10}">
                                            <div class="invalid-feedback">
                                                Ingresa un número válido (8 a 10 dígitos, máximo 2147483647).
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--Fila 2-->
                                <div class="row">
                                    <div class="col">
                                        <label class="form-label" for="txtPNombre">Primer Nombre</label>
                                        <input type="text" id="txtPNombre" name="nom1_persona" class="form-control"
                                            required placeholder="Ingresa Nombre"
                                            pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ\s'-]{3,20}" maxlength="20"
                                            title="Debe tener entre 3 y 20 caracteres.">
                                        <div class="invalid-feedback">
                                            Ingresa un nombre válido (3 a 20 caracteres, solo letras y caracteres
                                            especiales permitidos).
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label class="form-label" for="txtSNombre">Segundo Nombre</label>
                                        <input type="text" id="txtSNombre" name="nom2_persona" class="form-control"
                                            placeholder="Ingresa Nombre" pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ\s'-]{0,20}"
                                            maxlength="20" title="Opcional. Hasta 20 caracteres.">
                                        <div class="invalid-feedback">
                                            Ingresa un nombre válido (opcional, hasta 20 caracteres, solo letras y
                                            caracteres especiales permitidos).
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label class="form-label" for="txtPApellido">Primer Apellido</label>
                                        <input type="text" id="txtPApellido" name="ape1_persona" class="form-control"
                                            required placeholder="Ingresa Apellido"
                                            pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ\s'-]{3,20}" maxlength="20"
                                            title="Debe tener entre 3 y 20 caracteres.">
                                        <div class="invalid-feedback">
                                            Ingresa un apellido válido (3 a 20 caracteres, solo letras y caracteres
                                            especiales permitidos).
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label class="form-label" for="txtSapellido">Segundo Apellido</label>
                                        <input type="text" id="txtSapellido" name="ape2_persona" class="form-control"
                                            placeholder="Ingresa Apellido" pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ\s'-]{0,20}"
                                            maxlength="20" title="Opcional. Hasta 20 caracteres.">
                                        <div class="invalid-feedback">
                                            Ingresa un apellido válido (opcional, hasta 20 caracteres, solo letras y
                                            caracteres especiales permitidos).
                                        </div>
                                    </div>
                                </div>

                                <!--Fila 3-->
                                <div class="row d-flex align-items-end">
                                    <div class="col">
                                        <label class="form-label" for="txtSexo">Genero</label>
                                        <select class="form-select" id="txtSexo" name="fk_genero" required>
                                            <option value="">Elige...</option>
                                            <option value="1">Masculino</option>
                                            <option value="2">Femenino</option>
                                        </select>
                                        <div class="invalid-feedback">
                                            Por favor selecciona un género.
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label class="form-label" for="txtFechaN">Fecha de nacimiento</label>
                                        <input type="date" id="txtFechaN" name="fecha_nacimiento" class="form-control"
                                            required placeholder="Ingresa Fecha" min="1950-01-01" max="2005-12-31"
                                            title="Selecciona tu fecha de nacimiento">
                                        <div class="invalid-feedback">
                                            Selecciona una fecha válida.
                                        </div>
                                    </div>
                                </div>

                                <!--Fila 4-->
                                <div class="row">
                                    <div class="col">
                                        <label class="form-label" for="txtDireccion">Dirección domicilio</label>
                                        <input type="text" id="txtDireccion" name="direc_persona" class="form-control"
                                            required placeholder="Ingresa Dirección" maxlength="100"
                                            title="Debe ser una dirección válida con letras, números, espacios y algunos caracteres especiales (#, ., -).">
                                        <div class="invalid-feedback">
                                            Ingresa una dirección válida.
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label class="form-label" for="txtCelular">Número celular</label>
                                        <input type="tel" id="txtCelular" name="tel_persona" class="form-control"
                                            required placeholder="Ingresa Número" pattern="^\d{10}$"
                                            title="Debe contener 10 dígitos.">
                                        <div class="invalid-feedback">
                                            Ingresa un número de celular válido (10 dígitos).
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label class="form-label" for="txtCorreo">Correo Electrónico</label>
                                        <input type="email" id="txtCorreo" name="email_persona" class="form-control"
                                            required placeholder="example@gmail.com" maxlength="100"
                                            title="Ingresa un correo electrónico válido.">
                                        <div class="invalid-feedback">
                                            Ingresa un correo electrónico válido.
                                        </div>
                                    </div>
                                </div>

                                <div class="col" id="containerForm2">
                                    <!--Titulo-->

                                    <div class="row text-red">
                                        <h2><i>Salud</i></h2>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <label class="form-label" for="txtTSangre">Tipo de sangre</label>
                                            <select id="txtTSangre" name="fk_rh" class="form-select" required>
                                                <option value="">Elige...</option>
                                                <option value="1">A+</option>
                                                <option value="2">A-</option>
                                                <option value="3">B+</option>
                                                <option value="4">B-</option>
                                                <option value="5">AB+</option>
                                                <option value="6">AB-</option>
                                                <option value="7">O+</option>
                                                <option value="8">O-</option>
                                            </select>
                                            <div class="invalid-feedback">
                                                Por favor selecciona un tipo de sangre.
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label class="form-label" for="txtEps">Eps</label>
                                            <select id="txtEps" name="fk_eps" class="form-select" required>
                                                <option value="">Elige...</option>
                                                <option value="1">sanitas</option>
                                                <option value="2">sura</option>
                                                <option value="3">compensar</option>
                                                <option value="4">salud total</option>
                                                <option value="5">famisanar</option>
                                                <option value="6">capital salud</option>
                                                <option value="7">aliansalud</option>
                                                <option value="8">salud bolivar</option>
                                            </select>
                                            <div class="invalid-feedback">
                                                Por favor selecciona una eps.
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label class="form-label" for="contrasena">Contraseña</label>
                                            <input type="password" class="form-control" name="contrasena"
                                                id="contrasena" placeholder="Ingresa una contraseña" required
                                                minlength="6" maxlength="20" title="Mínimo 6 y máximo 20 caracteres">
                                            <div class="invalid-feedback">
                                                Ingresa una contraseña válida (6 a 20 caracteres).
                                            </div>
                                        </div>
                                    </div>

                                    <!--boton de confirmacion-->
                                    <div class="row">
                                        <div class="col d-flex justify-content-center">
                                            <button type="submit" id="botonConfirmar" class="btn btn-warning mb-5"
                                                style="height: 50px;">Enviar
                                                Formulario</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                    </div>
            </div>
            </form>
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
                function cerrarSesion() {
                    Swal.fire({
                        title: "¿Estas seguro de ir a la pagina principal?",
                        text: 'se borraran los datos del formulario',
                        icon: 'question',
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
                                window.location.href = "/atsaNet//index.jsp";
                            }, 1000);
                        }
                    })
                }

                // Bootstrap 5 validation
                (() => {
                    'use strict';
                    const forms = document.querySelectorAll('.needs-validation');
                    Array.from(forms).forEach(form => {
                        form.addEventListener('submit', event => {
                            if (!form.checkValidity()) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                })();

                // Mostrar mensaje de éxito si el backend lo envía
                window.addEventListener('DOMContentLoaded', function () {
                    const mensaje = "${mensaje != null ? mensaje : ''}";
                    if (mensaje && mensaje.includes('exitoso')) {
                        Swal.fire({
                            title: '¡Perfecto!',
                            text: mensaje,
                            icon: 'success',
                            confirmButtonText: 'Aceptar',
                            allowOutsideClick: false
                        }).then(() => {
                            // Limpiar el formulario después de aceptar
                            document.getElementById('formInscripcionE').reset();
                            document.getElementById('formInscripcionE').classList.remove('was-validated');
                        });
                    } else if (mensaje && mensaje.length > 0) {
                        Swal.fire({
                            title: 'Atención',
                            text: mensaje,
                            icon: 'warning',
                            confirmButtonText: 'Aceptar',
                            allowOutsideClick: false
                        });
                    }
                });

                document.getElementById("formInscripcionE").addEventListener("submit", function (event) {
                    if (!formInscripcionE.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    formInscripcionE.classList.add('was-validated');
                });
            </script>
        </body>

        </html>