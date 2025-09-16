<%-- 
    Document   : 2_crearEntrenamiento
    Created on : 24 jun 2025, 4:45:55 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Entrenamiento</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            margin: 0px;
            padding: 0px;
            background: #0a0b27;
            color: black;
            font: bold 20px Bahnschrift;
            box-sizing: border-box;
        }

        #encabezado {
            background: #68080a;
            width: auto;
            height: 195px;
            border: 5px solid rgb(41, 2, 2);
        }

        #contenedor {
            margin: 0px;
            padding: 0px;
            max-width: 100vw;
            min-height: 100vh;
            background: whitesmoke;
            border: 5px solid #686767;
        }

        main {
            background: whitesmoke;
            width: 100vw;
            min-height: 100vh;
            margin-left: 50px;
            margin-right: 50px;
        }

        #contenedorFormulario {
            text-align: left;
            padding: 50px;
            background: rgb(136, 136, 136);
            border-radius: 8px;
            box-shadow: 0 15px 15px rgba(0, 0, 0, 0.60);
        }

        form {
            margin: 10px;
            border-radius: 4px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.60);
            transition: transform 0.5s;
        }

        form:hover {
            transform: scale(1.05);
        }

        form .row {
            padding: 10px;
            margin: 10px;
            color: white;
        }

        #piePagina {
            background: #68080a;
            width: auto;
            height: 160px;
            border: 5px solid rgb(41, 2, 2);
        }
    </style>
</head>

<body>
    <!--Encabezado-->
    <div class="header text-white" id="encabezado">
        <div class="row d-flex align-items-center">
            <div class="col-5 d-flex justify-content-end">
                <img src="../img/logo_club.png" style="width: 200px">
            </div>
            <div class="col-7">
                <h1 class="display-6">Entrenamiento y objetivos</h1>
                <small>Puedes crear y asignar entrenamientos y objetivos, ya sean existentes o no</small>.<br>¿quieres
                continuar?<br></small>
            </div>
        </div>
    </div>

    <!--Parte central-->
    <div class="container d-flex text-black" id="contenedor">
        <!--Contenido-->
        <main class="p-5">
            <!--Fila para informacion inicial-->
            <div class="row text-center">
                <div class="row">
                    <small class="m-2">Si no quieres continuar oprime el siguiente boton</small>
                    <button type="button" class="btn btn-md btn-outline-danger p-3" onclick="cerrarSesion()">
                        Volver a la pagina principal</button>
                </div>
            </div>

            <div class="row">
                <hr class="border-5 border-dark opacity-50 mt-5">
                <h3 class="my-4">Entrenamiento</h3>
            </div>

            <!--Contenedor para el los formularios-->
            <div class="row" id="contenedorFormulario">
                <!--Formulario de asignar entrenamientos-->
                <div class="col">
                    <h4>Ingresa la informacion asignar un entrenamiento existente.</h4>
                    <form id="AsignarEntrenamientos" class="bg-secondary"
                        action="../entrenamiento/2_agregarObjetivo.html">
                        <div class="row">
                            <!--Nombre del entrenamiento-->
                            <label class="form-label" for="txtSeleccionarEntrenamiento">Seleccionar un
                                entrenamiento</label>
                            <select class="form-select" id="txtSeleccionarEntrenamiento" required>
                                <option value="">Elige...</option>
                                <option value="1">-- Pases por Tríos 1 --</option>
                                <option value="2"> -- Mete y corre --</option>
                                <option value="3">-- Sucesion de pases --</option>
                                <option value="4">-- Torpedos --</option>
                                <option value="5">-- 2 contra 1 --</option>
                                <option value="6">-- Linea imaginaria --</option>
                            </select>
                            <div class="form-text">Selecciona uno de los entrenamientos existentes</div>
                        </div>

                        <div class="row">
                            <label class="form-label" for="txtSeleccionar">Seleccionar la categoria</label>
                            <select class="form-select" id="txtSelectCategoria" required>
                                <option value="">Elige...</option>
                                <option value="1">-- Categoria 1(4 a 7) --</option>
                                <option value="2"> -- Categoria 2(8 a 11) --</option>
                                <option value="3">-- Categoria 3(12 a 15) --</option>
                                <option value="4">-- Categoria 4(16 a 17) --</option>
                                <option value="5">-- Categoria 5(18) --</option>
                            </select>
                            <div class="form-text">Selecciona la categoria que quieres que pertenezca el
                                entrenamiento</div>
                        </div>

                        <!--Boton para crear objetivos-->
                        <div class="row d-flex justify-content-end">
                            <button type="submit" class="btn btn-dark" style="width: 200px; height: 100px;">Crear
                                entrenamiento<br>(Siguiente objetivos)</a>
                            </button>
                        </div>
                    </form>
                </div>

                <!--Formulario de crear entrenamientos-->
                <div class="col">
                    <h4>Ingresa la informacion Crear un entrenamiento.</h4>
                    <form id="CrearEntrenamientos" class="bg-secondary borde">
                        <div class="row">
                            <!--Nombre del entrenamiento-->
                            <label class="form-label" for="txtNombreEntrenamiento">Nombre de
                                entrenamiento</label>
                            <input type="text" id="txtNombreEntrenamiento" class="form-control" required placeholder=""
                                pattern="[A-Za-z0-9]{10,30}"
                                title="Debe tener entre 10 y 30  letras, sin caracteres especiales.">
                            <div class="form-text">Ingrese el nombre del entrenamiento</div>
                        </div>

                        <div class="row">
                            <label class="form-label" for="txtSeleccionar">Seleccionar la categoria</label>
                            <select class="form-select" id="txtSelectCategoria" required>
                                <option value="">Elige...</option>
                                <option value="1">-- Categoria 1(4 a 7) --</option>
                                <option value="2"> -- Categoria 2(8 a 11) --</option>
                                <option value="3">-- Categoria 3(12 a 15) --</option>
                                <option value="4">-- Categoria 4(16 a 17) --</option>
                                <option value="5">-- Categoria 5(18) --</option>
                            </select>
                            <div class="form-text">Selecciona la categoria que quieres que pertenezca el
                                entrenamiento</div>
                        </div>

                        <!--Boton para crear objetivos-->
                        <div class="row d-flex justify-content-end">
                            <button type="submit" class="btn btn-dark" style="width: 200px; height: 100px;">Crear
                                entrenamiento<br>(Siguiente objetivos)</a>
                            </button>
                        </div>
                    </form>
                </div>
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
                text: '¿Estas seguro de ir a la pagina principal?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#2a6637',
                confirmButtonTextColor: '#ffffff ',
                cancelButtonColor: '#570808 ',
                confirmButtonText: 'Si, quiero ir.',
                cancelButtonText: 'No, no quiero quedarme.',
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
                        window.location.href = "../2_inicioEntrenador.html";
                    }, 1000);
                }
            })
        }


        document.getElementById("AsignarEntrenamientos").addEventListener("submit", function (event) {
            event.preventDefault();
            const botonConfirmar = document.getElementById("");

            if (AsignarEntrenamientos.checkValidity()) {
                Swal.fire({
                    title: 'hmmm?',
                    text: '¿Estas seguro de guardar los cambios al asignar los entrenamiento y pasar a la siguente pagina?',
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
                            timer: 1000,
                            didOpen: () => {
                                Swal.showLoading();
                            }
                        })
                        setTimeout(() => {
                            window.location.href = "1_agregarObjetivo.html";
                        }, 2000);
                    }
                });
            }
        });

        document.getElementById("CrearEntrenamientos").addEventListener("submit", function (event) {
            event.preventDefault();
            const botonConfirmar = document.getElementById("");

            if (CrearEntrenamientos.checkValidity()) {
                Swal.fire({
                    title: 'hmmm?',
                    text: '¿Estas seguro de guardar los cambios al asignar los entrenamiento y pasar a la siguente pagina?',
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
                            timer: 1000,
                            didOpen: () => {
                                Swal.showLoading();
                            }
                        })
                        setTimeout(() => {
                            window.location.href = "2_agregarObjetivo.html";
                        }, 2000);
                    }
                });
            }
        });


    </script>
</body>

</html>