<%-- 
    Document   : 2_consultarEntreyObjetivo
    Created on : 24 jun 2025, 4:44:55 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultar Entrenamientos y objetivos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            margin: 0px;
            padding: 0px;
            background: whitesmoke;
            color: black;
            font: bold 20px Bahnschrift;
            box-sizing: border-box;
        }

        #encabezado {
            background: #68080a;
            width: auto;
            height: 220px;
            border: 5px solid rgb(41, 2, 2);
        }

        #contenedor {
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

        main .row {
            margin-bottom: 20px;
        }

        #botonActivarO {
            display: none;
        }

        #tarjetaE {
            display: none;
            height: auto;
            margin: 20px;
        }

        #tarjetaO {
            display: none;
        }

        .card {
            background: rgb(136, 136, 136);
            border-radius: 8px;
            box-shadow: 0 15px 15px rgba(0, 0, 0, 0.60);
            transition: transform 0.5s;
        }

        .card:hover {
            transform: scale(1.05);
        }

        table button {
            width: auto;
            height: auto;
            margin: 5px;
        }

        #contenedorTabla {
            padding: 30px;
            background: rgb(136, 136, 136);
            border-radius: 8px;
            box-shadow: 0 15px 15px rgba(0, 0, 0, 0.60);
            transition: transform 0.5s;
        }

        #contenedorTabla:hover {
            transform: scale(1.05);
        }

        .modal {
            background: rgb(41, 2, 2);
        }

        .modal-header {
            background: #68080a;
            color: white;
        }

        .modal-body {
            color: black;
        }

        .modal-footer {
            background: #68080a;
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
                <h1 class="display-6">Consultar objetivos y entrenamientos</h1>
                <small>Puedes consultar todos los objetivos y entrenamientos existentes<br>¿quieres
                    continuar?<br></small>
            </div>
        </div>
    </div>

    <!--Parte central-->
    <div class="container d-flex justify-content-center text-black" id="contenedor">
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
            </div>

            <div class="row my-2 m-3" id="contenido">
                <form class="d-flex" role="search">
                    <label class="form-label">Ingrese el nombre del entrenamiento</label>
                    <input type="text" id="txtBusquedaE" class="form-control" required placeholder="801...,correr...."
                        pattern="[A-Za-z0-9\s#]+${10,30}"
                        title="Debe tener entre 10 y 30  letras, sin caracteres especiales.">
                    <button class="btn btn-dark" type="button" id="BotonBuscarE">Buscar</button>
                </form>

                <!--Contenido que se despliega en las busquedas-->
                <div class="row">
                    <div class="card card-body" id="tarjetaE">
                        <table class="table table-auto table-dark table-hover">
                            <thead>
                                <tr>
                                    <th style="width: auto;">Codigo</th>
                                    <th style="width: auto;">Nombre entrenamiento</th>
                                    <th style="width: auto;">#</th>
                                    <th style="width: auto;">Codigo Objetivo</th>
                                    <th style="width: auto;"">Objetivos asignados</th>
                                    <th style=" width: auto;">#</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                <tr>
                                    <td rowspan="3">1</td>
                                    <td rowspan="3">Linea Imaginaria</td>
                                    <td rowspan="3">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                            data-bs-target="#modificarEntrenamiento">Modificar<br>Entrenamiento</button>
                                        <button type="button" class="btn btn-outline-danger"
                                            onclick="quitarEntrenamiento()">Eliminar<br>entrenamiento</button>
                                    </td>
                                    <th>602</th>
                                    <td>Concentracion</td>
                                    <td>
                                        <button type="button" class="btn btn-outline-danger"
                                            onclick="quitarObjetivoEntre()">Eliminar<br>de
                                            entrenamiento</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>806</td>
                                    <td>Comunicación</td>
                                    <td>
                                        <button type="button" class="btn btn-outline-danger"
                                            onclick="quitarObjetivoEntre()">Eliminar<br>de
                                            entrenamiento</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>603</td>
                                    <td>Conducción</td>
                                    <td>
                                        <button type="button" class="btn btn-outline-danger"
                                            onclick="quitarObjetivoEntre()">Eliminar<br>de
                                            entrenamiento</button>
                                    </td>
                                </tr>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row my-4">
                <div class="col" id="contenedorTabla">
                    <h4 class="my-4 text-white">Tabla general: Encuentra informacion de los entrenamientos existentes
                        con sus
                        respectivos objetivos, podras eliminarlos</h4>
                    <table class="table table-auto table-dark table-hover">
                        <h5>Entrenamientos</h5>
                        <hr class="border-5 border-light m-2">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre entrenamiento</th>
                                <th style="width: auto;">#</th>
                                <th>Codigo Objetivo</th>
                                <th>Objetivos asignados</th>
                                <th style="width: auto;">#</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td rowspan="3">1</td>
                                <td rowspan="3">Linea Imaginaria</td>
                                <td rowspan="3">
                                    <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                        data-bs-target="#modificarEntrenamiento">Modificar<br>Entrenamiento</button>
                                    <button type="button" class="btn btn-outline-danger"
                                        onclick="quitarEntrenamiento()">Eliminar<br>entrenamiento</button>
                                </td>
                                <th>602</th>
                                <td>Concentracion</td>
                                <td>
                                    <button type="button" class="btn btn-outline-danger"
                                        onclick="quitarObjetivoEntre()">Eliminar<br>de
                                        entrenamiento</button>
                                </td>
                            </tr>
                            <tr>
                                <td>806</td>
                                <td>Comunicación</td>
                                <td>
                                    <button type="button" class="btn btn-outline-danger"
                                        onclick="quitarObjetivoEntre()">Eliminar<br>de
                                        entrenamiento</button>
                                </td>
                            </tr>
                            <tr>
                                <td>603</td>
                                <td>Conducción</td>
                                <td>
                                    <button type="button" class="btn btn-outline-danger"
                                        onclick="quitarObjetivoEntre()">Eliminar<br>de
                                        entrenamiento</button>
                                </td>
                            </tr>

                            <tr>
                                <td rowspan="3">2</td>
                                <td rowspan="3">Sucesion de pases</td>
                                <td rowspan="3">
                                    <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                        data-bs-target="#modificarEntrenamiento">Modificar<br>Entrenamiento</button>
                                    <button type="button" class="btn btn-outline-danger"
                                        onclick="quitarEntrenamiento()">Eliminar<br>entrenamiento</button>
                                </td>
                                <th>804</th>
                                <td>Coontrataque</td>
                                <td>
                                    <button type="button" class="btn btn-outline-danger"
                                        onclick="quitarObjetivoEntre()">Eliminar<br>de
                                        entrenamiento</button>
                                </td>
                            </tr>

                            <tr>
                                <td>1601</td>
                                <td>Cohesion grupal</td>
                                <td>
                                    <button type="button" class="btn btn-outline-danger"
                                        onclick="quitarObjetivoEntre()">Eliminar<br>de
                                        entrenamiento</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row mt-5 mb-3 m-3" id="contenido">
                <form class="d-flex" role="search">
                    <label class="form-label">Ingrese el nombre del objetivo</label>
                    <input type="text" id="txtBusquedaO" class="form-control" required placeholder="801...,correr...."
                        pattern="[A-Za-z0-9\s#]+${10,30}"
                        title="Debe tener entre 10 y 30  letras, sin caracteres especiales.">
                    <button class="btn btn-dark" type="button" id="BotonBuscarO">Buscar</button>
                </form>

                <!--Contenido que se despliega en las busquedas-->
                <div class="row">
                    <div class="card card-body" id="tarjetaO">
                        <table class="table table-auto table-dark table-hover">
                            <thead>
                                <tr>
                                <tr>
                                    <th style="width: auto;">Codigo</th>
                                    <th style="width: auto;">Nombre Objetivo</th>
                                    <th style="width: auto;">#</th>
                                </tr>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>301</td>
                                    <td>Coordinación</td>
                                    <td>
                                        <button type="button" class="btn btn-secondary p-3" data-bs-toggle="modal"
                                            data-bs-target="#editarObjetivo">editar</button>
                                        <button type="button" class="btn btn-outline-danger p-3" id="botonDesactivarO"
                                            onclick="SuspenderObjetivo()">Inavilitar</button>
                                        <button type="button" class="btn btn-outline-success p-3"
                                            id="botonActivarO">Activar</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col my-4" id="contenedorTabla">
                    <h4 class="my-4 text-white">Tabla general: Encuentra la informacion de todos los objetivos
                        existentes, editalos o
                        inavilitalos</h4>
                    <table class="table table-auto table-dark table-hover">
                        <h4>Objetivos</h4>
                        <hr class="border-5 border-light m-2">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre Objetivo</th>
                                <th style="width: auto;">#</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            <tr>
                                <td>301</td>
                                <td>Coordinación</td>
                                <td>
                                    <button type="button" class="btn btn-secondary p-3" data-bs-toggle="modal"
                                        data-bs-target="#editarObjetivo">editar</button>
                                    <button type="button" class="btn btn-outline-success p-3"
                                        id="botonActivarO">Activar</button>
                                </td>
                            </tr>
                            <tr>
                                <td>603</td>
                                <td>Conducción</td>
                                <td>
                                    <button type="button" class="btn btn-secondary p-3" data-bs-toggle="modal"
                                        data-bs-target="#editarObjetivo">editar</button>
                                    <button type="button" class="btn btn-outline-success p-3"
                                        id="botonActivarO">Activar</button>
                                </td>
                            </tr>
                            <tr>
                                <td>804</td>
                                <td>Coontrataque</td>
                                <td>
                                    <button type="button" class="btn btn-secondary p-3" data-bs-toggle="modal"
                                        data-bs-target="#editarObjetivo">editar</button>
                                    <button type="button" class="btn btn-outline-success p-3"
                                        id="botonActivarO">Activar</button>
                                </td>
                            </tr>
                            <tr>
                                <td>801</td>
                                <td>Competitividad</td>
                                <td>
                                    <button type="button" class="btn btn-secondary p-3" data-bs-toggle="modal"
                                        data-bs-target="#editarObjetivo">editar</button>
                                    <button type="button" class="btn btn-outline-success p-3"
                                        id="botonActivarO">Activar</button>
                                </td>
                            </tr>
                            <tr>
                                <td>806</td>
                                <td>Comunicación</td>
                                <td>
                                    <button type="button" class="btn btn-secondary p-3" data-bs-toggle="modal"
                                        data-bs-target="#editarObjetivo">editar</button>
                                    <button type="button" class="btn btn-outline-success p-3"
                                        id="botonActivarO">Activar</button>
                                </td>
                            </tr>
                            <tr>
                                <td>602</td>
                                <td>Concentracion</td>
                                <td>
                                    <button type="button" class="btn btn-secondary p-3" data-bs-toggle="modal"
                                        data-bs-target="#editarObjetivo">editar</button>
                                    <button type="button" class="btn btn-outline-success p-3"
                                        id="botonActivarO">Activar</button>
                                </td>
                            </tr>
                            <tr>
                                <td>1601</td>
                                <td>Cohesion grupal/td>
                                <td>
                                    <button type="button" class="btn btn-secondary p-3" data-bs-toggle="modal"
                                        data-bs-target="#editarObjetivo">editar</button>
                                    <button type="button" class="btn btn-outline-success p-3"
                                        id="botonActivarO">Activar</button>
                                </td>
                            </tr>
                            <tr>
                                <td>1303</td>
                                <td>Control</td>
                                <td>
                                    <button type="button" class="btn btn-secondary p-3" data-bs-toggle="modal"
                                        data-bs-target="#editarObjetivo">editar</button>
                                    <button type="button" class="btn btn-outline-success p-3"
                                        id="botonActivarO">Activar</button>
                                </td>
                            </tr>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--Modal 1-->
            <div class="modal fade" id="editarObjetivo" tabindex="-1" aria-labelledby="ModalEditarPosicion"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModalCondirmacionIncrip">Editar Objetivo</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <p class="my-3">¿Quieres editar este objetivo</p>
                            <form id="ModificarObjetivo">
                                <div class="mb-3">
                                    <label class="form-label" for="txtCodigoO">Codigo Objetivo</label>
                                    <input type="text" id="txtCodigoO" class="form-control" value="301" disabled>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label" for="txtNombreAnteriorO">Nombre Anterior</label>
                                    <input type="text" id="txtNombreAnteriorO" class="form-control" value="Coordinación"
                                        disabled>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="editarNombreO">Nombre nuevo del objetivo</label>
                                    <input type="text" id="editarNombreO" class="form-control" required
                                        placeholder="(Correr mas rapido)" pattern="[A-Za-z0-9\s#]+${5,15}"
                                        title="Debe tener entre 10 y 30  letras, sin caracteres especiales.">
                                    <div class="form-text">Ingrese un nombre</div>
                                </div>

                                <button type="submit" id="botonConfirmar" class="btn btn-success"
                                    ata-bs-dismiss="modal">Confirmar</button>
                                <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Cancelar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!--Modal 2-->
            <div class="modal fade" id="modificarEntrenamiento" tabindex="-1" aria-labelledby="ModalEditar"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModalCondirmacionIncrip">Editar Entrenamiento</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <p class="my-3">¿Quieres editar este Entrenamiento</p>
                            <form id="ModificarEntrenamiento">
                                <div class="mb-3">
                                    <label class="form-label" for="txtCodigoO">Codigo Entrenamiento</label>
                                    <input type="text" id="txtCodigoO" class="form-control" value="301" disabled>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label" for="txtNombreAnteriorO">Nombre Anterior</label>
                                    <input type="text" id="txtNombreAnteriorO" class="form-control" value="Coordinación"
                                        disabled>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="editarNombreO">Nombre nuevo entrenamiento</label>
                                    <input type="text" id="editarNombreO" class="form-control" required
                                        placeholder="(Correr mas rapido)" pattern="[A-Za-z0-9\s#]+${5,15}"
                                        title="Debe tener entre 10 y 30  letras, sin caracteres especiales.">
                                    <div class="form-text">Ingrese un nombre</div>
                                </div>

                                <button type="submit" id="botonConfirmar" class="btn btn-success"
                                    ata-bs-dismiss="modal">Confirmar</button>
                                <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Cancelar</button>
                            </form>
                        </div>
                    </div>
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


        const BotonBuscarE = document.getElementById("BotonBuscarE");
        const desplegarTarjetaE = document.getElementById("tarjetaE");
        const entrenamiento1 = {
            name: "Linea Imaginaria"
        };

        BotonBuscarE.addEventListener("click", function (event) {
            const txtBusquedaE = document.getElementById("txtBusquedaE").value;

            if (txtBusquedaE === entrenamiento1.name) {
                Swal.fire({
                    title: 'Busqueda Correcta',
                    text: '',
                    icon: 'success',
                    buttons: false,
                    timer: 1000,
                });
                desplegarTarjetaE.style.display = "inline-block";
            } else if (txtBusquedaE != entrenamiento1.name) {
                Swal.fire({
                    title: 'Busqueda incorrecta',
                    text: 'El campo incresado no coincide o es incorrecto',
                    icon: 'error',
                });
            }
        });


        const BotonBuscarO = document.getElementById("BotonBuscarO");
        const desplegarTarjetaO = document.getElementById("tarjetaO");
        const objetivo1 = {
            name: "Coordinación"
        };

        BotonBuscarO.addEventListener("click", function (event) {
            const txtBusquedaO = document.getElementById("txtBusquedaO").value;

            if (txtBusquedaO === objetivo1.name) {
                Swal.fire({
                    title: 'Busqueda Correcta',
                    text: '',
                    icon: 'success',
                    buttons: false,
                    timer: 1000,
                });
                desplegarTarjetaO.style.display = "inline-block";
            } else if (txtBusquedaO != objetivo1.name) {
                Swal.fire({
                    title: 'Busqueda incorrecta',
                    text: 'El campo incresado no coincide o es incorrecto',
                    icon: 'error',
                });
            }
        });


        document.getElementById("ModificarObjetivo").addEventListener("submit", function (event) {
            event.preventDefault();
            const botonConfirmar = document.getElementById("");

            if (ModificarObjetivo.checkValidity()) {
                Swal.fire({
                    title: 'Guardar Modificacion?',
                    text: '¿Estas seguro de guardar los cambios?',
                    icon: 'question',
                    showCancelButton: true,
                    showConfirmButton: true,
                    confirmButtonText: 'Si, quiero ir.',
                    cancelButtonText: 'No, no quiero',
                    confirmButtonColor: '#2a6637',
                    cancelButtonColor: '#570808 ',
                    confirmButtonTextColor: '#ffffff ',
                    timer: 10000,
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire({
                            title: '',
                            text: 'Guardando cambios espera un momento',
                            icon: 'success',
                            showConfirmButton: false,
                            timer: 1000,
                            didOpen: () => {
                                Swal.showLoading();
                            }
                        })
                        setTimeout(() => {
                            window.location.href = "2_consultarEntreyObjetivo.html";
                        }, 2000);
                    }
                });
            }
        });


        document.getElementById("ModificarEntrenamiento").addEventListener("submit", function (event) {
            event.preventDefault();
            const botonConfirmar = document.getElementById("");

            if (ModificarEntrenamiento.checkValidity()) {
                Swal.fire({
                    title: 'Guardar Modificacion?',
                    text: '¿Estas seguro de guardar los cambios?',
                    icon: 'question',
                    showCancelButton: true,
                    showConfirmButton: true,
                    confirmButtonText: 'Si, quiero ir.',
                    cancelButtonText: 'No, no quiero',
                    confirmButtonColor: '#2a6637',
                    cancelButtonColor: '#570808 ',
                    confirmButtonTextColor: '#ffffff ',
                    timer: 10000,
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire({
                            title: '',
                            text: 'Guardando cambios espera un momento',
                            icon: 'success',
                            showConfirmButton: false,
                            timer: 1000,
                            didOpen: () => {
                                Swal.showLoading();
                            }
                        })
                        setTimeout(() => {
                            window.location.href = "2_consultarEntreyObjetivo.html";
                        }, 2000);
                    }
                });
            }
        });


        function SuspenderObjetivo() {
            Swal.fire({
                title: "Suspender Objetivo?",
                text: "¿Estas seguro que quieres suspender este objetivo? Su asociacion se quitara de todas partes",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Si, suspendelo",
                confirmButtonColor: "#2a6637",
                cancelButtonColor: "#570808",
                buttonTextColor: '#ffffff ',
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "Suspendido!",
                        text: "Haz suspendido al alumno correctamente.",
                        icon: "success"
                    });
                }
            });
        }

        const botonDesactivadoObj = document.getElementById("botonDesactivarO");
        const botonActivarObj = document.getElementById("botonActivarO");

        botonDesactivadoObj.addEventListener("click", function () {
            botonActivarObj.style.display = "inline-block";
        });



        function quitarObjetivoEntre() {
            Swal.fire({
                title: "Quitar objetivo",
                text: "¿Quieres eliminar este objetivo asociado al entrenamiento?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Si, Quiero quitarlo",
                confirmButtonColor: "#2a6637",
                cancelButtonColor: "#570808",
                buttonTextColor: '#ffffff ',
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "puff!",
                        text: "Se ha quitado el objetivo del entrenamiento",
                        icon: "success",
                        timer: 5000,
                    });
                }
            });

        }

        function quitarEntrenamiento() {
            Swal.fire({
                title: "Quitar Entrenamiento",
                text: "¿Estas seguro?, este entrenamiento esta asociado a unos objetivos, se eliminaran si lo suspendes",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Si, Quiero quitarlo",
                confirmButtonColor: "#2a6637",
                cancelButtonColor: "#570808",
                buttonTextColor: '#ffffff ',
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "puff!",
                        text: "Se ha quitado el entrenamiento",
                        icon: "success",
                        timer: 5000,
                    });
                }
            });

        }

    </script>
</body>

</html>
