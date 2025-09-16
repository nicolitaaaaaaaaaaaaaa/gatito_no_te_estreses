<%-- 
    Document   : formularioInscripcion
    Created on : 18/06/2025, 10:17:42 a. m.
    Author     : adminsena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
            background: #b6e0fe;
            border-radius: 18px;
            box-shadow: 0 4px 16px rgba(25, 118, 210, 0.08);
            border: 1px solid #e3f0ff;
            margin-bottom: 32px;
            padding: 10px;
        }

        .form-section h2 {
            color: #1976d2;
            font-size: 1.4rem;
            font-weight: 700;
            margin-bottom: 18px;
            letter-spacing: 1px;
        }

        .form-label {
            width: 200px;
            color: #1976d2;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .form input, select {
            display: flex;
            align-items: flex;
            border-radius: 10px;
            background: #f0eeee;
            color: black;
            transition: border 0.2s, box-shadow 0.2s;
            box-shadow: 0 2px 8px rgba(33, 42, 51, 0.342);
        }

        .form-control, .form-select {
            background: #f4faff;
            border: 1px solid #b6e0fe;
            color: #1976d2;
            font-size: 1rem;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(25, 118, 210, 0.03);
            margin-bottom: 12px;
        }

        .form-control:focus, .form-select:focus {
            background: #e3f0ff;
            color: #0d47a1;
            border: 1.5px solid #1976d2;
            box-shadow: 0 0 0 2px #63a4ff44;
        }

        .row {
            margin-bottom: 2px;
        }

        .form-section .row:last-child {
            margin-bottom: 0;
        }

        .form-section .col-lg, 
        .form-section .col-lg.col-auto {
            margin-bottom: 18px;
        }

        #containerForm1,
        #containerForm2,
        #containerForm3{
            width: auto;
            background: #d2e6f5;
            border-radius: 10px;
            margin: 10px;
        }

       #containerForm3{
            width: 1030px;
       }

        #botonConfirmar {
            background: linear-gradient(90deg, #ff5252 0%, #ff1744 100%);
            color: #fff;
            font-weight: bold;
            border: none;
            border-radius:10px;
            margin-top:20px;
            width: 400px;
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

        .footer, #piePagina {
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
                <button type="button" class="btn btn-md btn-danger p-3" onclick="cerrarSesion()">
                    Ir pagina principal</button>
            </div>
        </div>
    </div>

    <!--Contenedor de base -->
    <div class="container d-flex align-items-center text-black" id="contenedor">
        <!--Contenedor de informacion-->
        <main>
            <!--Informacion principal-->
            <div class="row text-center m-2">
                <h2>Bienvenido al Club Deportivo Atlético Santander.</h2>
                <hr class="border-5 border-dark opacity-50">
            </div>

            <!--Formulario-->
            <div class="row">
                <div class="row">
                    <h2 class="text-center">Formulario de Inscripción.</h2>
                </div>

                <form class="form needs-validation" id="formInscripcion" novalidate>
                    <div class="row">
                        <!--Formulario 1-->
                        <div class="col-lg col-auto p-5" id="containerForm1">
                            <!--Tituloh-->
                            <div class="row text-red">
                                <h2><i>Datos Personales</i></h2>
                            </div>

                            <!--Fila 1-->
                            <div class="row">
                                <div class="col-lg col-auto">
                                    <label class="form-label" for="txtTipoId">Tipo Id</label>
                                    <select class="form-select" id="txtTipoId" required>
                                        <option value="">Elige...</option>
                                        <option value="RC">RC</option>
                                        <option value="TI">TI</option>
                                        <option value="CC">CC</option>
                                        <option value="PASAPORTE">PAS</option>
                                    </select>
                                    <div class="invalid-feedback">
                                        Por favor selecciona un tipo de identificación.
                                    </div>
                                </div>
                                <div class="col-lg col-auto">
                                    <label class="form-label" for="txtNumeroID">Número ID</label>
                                    <input type="number" id="txtNumeroID" class="form-control" required
                                        placeholder="Ingresa Número..." min="999999" max="9999999999"
                                        title="Debe ser un número válido.">
                                    <div class="invalid-feedback">
                                        Ingresa un número válido (6 a 12 dígitos).
                                    </div>
                                </div>
                            </div>

                            <!--Fila 2-->
                            <div class="row">
                                <div class="col-lg col-auto">
                                    <label class="form-label" for="txtPNombre">Primer Nombre</label>
                                    <input type="text" id="txtPNombre" class="form-control" required placeholder="Ingresa Nombre"
                                        pattern="[A-Za-z]{3,15}"
                                        title="Debe tener entre 3 y 15 letras, sin números ni caracteres especiales.">
                                    <div class="invalid-feedback">
                                        Ingresa un nombre válido (3 a 15 letras).
                                    </div>
                                </div>
                                <div class="col-lg col-auto">
                                    <label class="form-label" for="txtSNombre">Segundo Nombre</label>
                                    <input type="text" id="txtSNombre" class="form-control" placeholder="Ingresa Nombre"
                                        pattern="[A-Za-z]{3,15}" title="Opcional. Hasta 15 letras.">
                                    <div class="invalid-feedback">
                                        Ingresa un nombre válido (opcional, hasta 15 letras).
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg col-auto">
                                    <label class="form-label" for="txtPApellido">Primer Apellido</label>
                                    <input type="text" id="txtPApellido" class="form-control" required
                                        placeholder="Ingresa Apellido" pattern="[A-Za-z]{3,15}"
                                        title="Debe tener entre 3 y 15 letras.">
                                    <div class="invalid-feedback">
                                        Ingresa un apellido válido (3 a 15 letras).
                                    </div>
                                </div>
                                <div class="col-lg col-auto">
                                    <label class="form-label" for="txtSapellido">Segundo Apellido</label>
                                    <input type="text" id="txtSapellido" class="form-control" placeholder="Ingresa Apellido"
                                        pattern="[A-Za-z]{3,15}" title="Opcional. Hasta 15 letras.">
                                    <div class="invalid-feedback">
                                        Ingresa un apellido válido (opcional, hasta 15 letras).
                                    </div>
                                </div>
                            </div>

                            <!--Fila 3-->
                            <div class="row d-flex align-items-end">
                                <div class="col-lg col-auto">
                                    <label class="form-label" for="txtSexo">Genero</label>
                                    <select class="form-select" id="txtSexo" required>
                                        <option value="">Elige...</option>
                                        <option value="M">Masculino</option>
                                        <option value="F">Femenino</option>
                                        <option value="NB">No binario</option>
                                    </select>
                                    <div class="invalid-feedback">
                                        Por favor selecciona un género.
                                    </div>
                                </div>
                                <div class="col-lg col-auto">
                                    <label class="form-label" for="txtFechaN">Fecha de nacimiento</label>
                                    <input type="date" id="txtFechaN" class="form-control" required
                                        placeholder="Ingresa Fecha" min="2005-01-01" max="2019-12-31"
                                        title="Selecciona tu fecha de nacimiento">
                                    <div class="invalid-feedback">
                                        Selecciona una fecha válida.
                                    </div>
                                </div>
                                <div class="col">
                                    <label class="form-label" for="txtFechaN">Edad</label>
                                    <input type="number" id="txtedad" class="form-control" disabled>
                                    <div class="invalid-feedback">
                                        La edad se calculara
                                    </div>
                                </div>
                                <div class="col-lg col-auto">
                                    <label class="form-label" for="txtEps">EPS</label>
                                    <input type="text" id="txtEps" class="form-control" required
                                        placeholder="Ingresa Eps" pattern="[A-Za-z\s]{5,15}"
                                        title="Solo se permiten letras y espacios, máximo 15 caracteres.">
                                    <div class="invalid-feedback">
                                        Ingresa una EPS válida (solo letras y espacios, 5 a 15 caracteres).
                                    </div>
                                </div>
                            </div>

                            <!--Fila 4-->
                            <div class="row">
                                <div class="col-lg col-auto">
                                    <label class="form-label" for="txtDireccion">Dirección domicilio</label>
                                    <input type="text" id="txtDireccion" class="form-control" required
                                        placeholder="Ingresa Dirección"
                                        title="Debe ser una dirección válida con letras, números, espacios y algunos caracteres especiales (#, ., -).">
                                    <div class="invalid-feedback">
                                        Ingresa una dirección válida.
                                    </div>
                                </div>
                                <div class="col-lg col-auto">
                                    <label class="form-label" for="txtCelular">Número celular</label>
                                    <input type="tel" id="txtCelular" class="form-control" required
                                        placeholder="Ingresa Número" pattern="^\d{10}$" title="Debe contener 10 dígitos.">
                                    <div class="invalid-feedback">
                                        Ingresa un número de celular válido (10 dígitos).
                                    </div>
                                </div>
                                <div class="col-lg col-auto">
                                    <label class="form-label" for="txtCorreo">Correo Electrónico</label>
                                    <input type="email" id="txtCorreo" class="form-control" required
                                        placeholder="example@gmail.com" maxlength="100"
                                        title="Ingresa un correo electrónico válido.">
                                    <div class="invalid-feedback">
                                        Ingresa un correo electrónico válido.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg">
                            <!--Formulario 2-->
                            <div class="row p-5" id="containerForm2">
                                <!--Titulos-->
                                <div class="row text-red">
                                    <h2><i>Datos Fisicos</i></h2>
                                </div>

                                <!--Fila 1-->
                                <div class="row">
                                    <div class="col-lg col-auto">
                                        <label class="form-label" for="txtTSangre">Tipo de sangre</label>
                                        <select id="txtTSangre" class="form-select" required>
                                            <option value="">Elige...</option>
                                            <option value="A">A-</option>
                                            <option value="B">B+</option>
                                            <option value="B">B-</option>
                                            <option value="AB">AB+</option>
                                            <option value="AB">AB-</option>
                                            <option value="O">O+</option>
                                            <option value="O">O-</option>
                                        </select>
                                        <div class="invalid-feedback">
                                            Por favor selecciona un tipo de sangre.
                                        </div>
                                    </div>
                                </div>

                                <!--Fila 2-->
                                <div class="row">
                                    <div class="col-lg col-auto">
                                        <label class="form-label" for="txtAltura">Altura</label>
                                        <input type="number" id="txtAltura" class="form-control" required
                                            placeholder="Ingresa Altura" min="0.50" max="2.50" step="0.01"
                                            title="Ingresa un valor entre 0.50 y 2.50 metros.">
                                        <div class="invalid-feedback">
                                            Ingresa una altura válida (0.50 a 2.50 metros).
                                        </div>
                                    </div>
                                    <div class="col-lg col-auto">
                                        <label class="form-label" for="txtPeso">Peso</label>
                                        <input type="number" id="txtPeso" class="form-control" required
                                            placeholder="Ingresa Peso" min="10" max="100" step="0.01"
                                            title="Ingresa un valor entre 10 y 100 kg.">
                                        <div class="invalid-feedback">
                                            Ingresa un peso válido (10 a 100 kg).
                                        </div>
                                    </div>
                                    <div class="col-lg col-auto">
                                        <label class="form-label" for="txtTalla">Talla</label>
                                        <input type="text" id="txtTalla" class="form-control" required
                                            placeholder="Ingresa Talla" pattern="[A-Za-z0-9]{2,6}"
                                            title="Solo se permiten letras (e.g., XS, M, L) y números.">
                                        <div class="invalid-feedback">
                                            Ingresa una talla válida (2 a 6 caracteres, letras o números).
                                        </div>
                                    </div>
                                    <div class="col-lg col-auto">
                                        <label class="form-label" for="txtCalzado">Calzado</label>
                                        <input type="number" id="txtCalzado" class="form-control" required
                                            placeholder="ingresa Calzado" min="15" max="50"
                                            title="Ingresa un número entre 15 y 50.">
                                        <div class="invalid-feedback">
                                            Ingresa una talla de calzado válida (15 a 50).
                                        </div>
                                    </div>
                                </div>

                                <!--Fila 3-->
                                <div class="row">
                                    <div class="col-lg col-auto">
                                        <label class="form-label" for="txtPieD">Pie Dominante</label>
                                        <select id="txtPieD" class="form-select" required>
                                            <option value="">Elige...</option>
                                            <option value="Diestro">Diestro</option>
                                            <option value="Zurdo">Zurdo</option>
                                            <option value="Ambidiestro">Ambidiestro</option>
                                        </select>
                                        <div class="invalid-feedback">
                                            Por favor selecciona el pie dominante.
                                        </div>
                                    </div>
                                    <div class="col-lg col-auto">
                                        <label class="form-label" for="txtPosicion">Posición en Cancha</label>
                                        <select id="txtPosicion" class="form-select" required>
                                            <option value="">Elige...</option>
                                            <option value="Portero">Portero</option>
                                            <option value="Defensa">Defensa</option>
                                            <option value="MedioCampo">Medio Campo</option>
                                            <option value="Delantero">Delantero</option>
                                        </select>
                                        <div class="invalid-feedback">
                                            Por favor selecciona una posición en cancha.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Formulario 3-->
                            <div class="row p-5" id="containerForm3">
                                <!--Titulos-->
                                <div class="row text-red">
                                    <h2><i>Autorizaciones</i></h2>
                                </div>

                                <!--Fila 1-->
                                <div class="row d-flex align-items-end">
                                    <div class="col-sm col-auto">
                                        <label class="form-label" for="fileTratamiento">Tratamiento de
                                            datos</label>
                                        <input type="file" class="form-control" id="fileTratamiento"
                                            accept="application/pdf" required>
                                        <div class="invalid-feedback">
                                            Adjunta el PDF de tratamiento de datos.
                                        </div>
                                    </div>

                                    <div class="col-sm col-auto">
                                        <label class="form-label" for="fileMedica">Autorización Médica</label>
                                        <input type="file" class="form-control" id="fileMedica" accept="application/pdf"
                                            required>
                                        <div class="invalid-feedback">
                                            Adjunta el PDF de autorización médica.
                                        </div>
                                    </div>

                                    <div class="col-sm col-auto">
                                        <label class="form-label" for="fileEps">Comprobante EPS</label>
                                        <input type="file" class="form-control" id="fileEps" accept="application/pdf"
                                            required>
                                        <div class="invalid-feedback">
                                            Adjunta el PDF del comprobante EPS.
                                        </div>
                                    </div>
                                </div>

                                <!--boton de confirmacion-->
                                <div class="row">
                                    <div class="col d-flex justify-content-center">
                                        <button type="submit" id="botonConfirmar" class="btn btn-warning" style="height: 50px;">Enviar Formulario de Inscripción</button>
                                    </div>
                                </div>
                            </div>
                    </div>
                </form>
            </div>

            <div class="row text-center m-5">
                <p>¡¡Llena el formulario para ser parte de nuestra familia!!</p>
                <p>Llena el formulario con información verídica,<br>los datos puestos aquí estarán
                    <kbd>protegidos.</kbd>
                </p>
            </div>
        </main>
    </div>

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
                    window.location.href = "/atsaNet/index.jsp";
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

        document.getElementById("formInscripcion").addEventListener("submit", function (event) {
            if (formInscripcion.checkValidity()) {
                event.preventDefault();
                Swal.fire({
                    title: 'Perfecto!!',
                    text: 'Se ha enviado correctamente el formulario',
                    icon: 'success',
                    confirmButtonText: 'Continuar',
                    showCancelButton: false,
                    allowOutsideClick: false,
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
                        }, 2000);
                    }
                });
            }
        });
    </script>
</body>

</html>
