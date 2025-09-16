<%-- 
    Document   : 1_verPosiciones
    Created on : 24 jun 2025, 9:07:56 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar posicion</title>
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
            border: 5px solid #686767;
        }

        #encabezado {
            background: #68080a;
            width: auto;
            height: 220px;
            border: 5px solid rgb(41, 2, 2);
        }

        #contenedor {
            margin: 0px;
            padding: 0px;
            max-width: 100vw;
            min-height: 100vh;
        }

        main {
            background: whitesmoke;
            width: 100vw;
            min-height: 100vh;
            margin-left: 50px;
            margin-right: 50px;
        }

        .contenedorBoton {
            padding: 5px;
            display: flex;
            justify-content: center;
            text-align: left;
        }

        table form {
            display: flex;
            justify-content: center;

        }

        form .row {
            padding: 10px;
            display: flex;
            justify-content: center;
            text-align: left;
            color: white;
        }

        #tarjeta {
            background: rgb(136, 136, 136);
            border-radius: 8px;
            box-shadow: 0 15px 15px rgba(0, 0, 0, 0.60);
            transition: transform 0.5s;
        }

        #tarjeta:hover {
            transform: scale(1.05);
        }

        table {
            font-size: smaller;
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
            <div class="col-md-5 d-flex justify-content-end">
                <img src="../img/logo_club.png" style="width: 200px">
            </div>
            <div class="col-md-7">
                <h1 class="display-6">Ver y Modificar Posiciones</h1>
                <small>Aqui podras ver las posiciones existentes y modificarlas.<br>¿quieres
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

            </div>

            <div class="row">
                <!--Collapse de consulta de alumnos-->
                <h3 class="m-3">¿Quieres ver todas las posiciones existentes?</h3>
                    <div class="card card-body gy-3" id="tarjeta">
                        <!--Tabla con todas las posiciones-->
                        <table class="table table-lg table-dark table-hover border border-4 border-info"
                            id="tablaTodasLasPosiciones">
                            <thead>
                                <tr>
                                    <th>Codigo Posicion</th>
                                    <th>Descripcion de posicion</th>
                                    <th>Estado de posicion</th>
                                    <th>Descripcion de estado</th>
                                    <th>#</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Filas-->
                                <tr>
                                    <td>1-POR</td>
                                    <td>Portero</td>
                                    <td>
                                        <form class="form" id="ConfirmarCambiosEstado">
                                            <input type="number" class="form-control text-center" min="0" max="1"
                                                value="1" placeholder="1 = activado, 0 = desactivado">
                                            <button id="Guardarmodal" type="submit"
                                                class="btn btn-warning border-4 m-1 text-center">Guardar
                                                cambios</button>
                                        </form>
                                    </td>
                                    <td></td>
                                    <!--Boton para abrir modal de edicion de posicion-->
                                    <td>
                                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal"
                                            data-bs-target="#botonEditarPosicion" style="margin: 30px;">
                                            Editar
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>1-DEF</td>
                                    <td>Defensor Central</td>
                                    <td>
                                        <form class="form" id="ConfirmarCambiosEstado">
                                            <input type="number" class="form-control text-center" min="0" max="1"
                                                value="1" placeholder="1 = activado, 0 = desactivado">
                                            <button type="submit"
                                                class="btn btn-warning border-4 m-1 text-center">Guardar
                                                cambios</button>
                                        </form>
                                    </td>
                                    <td></td>
                                    <!--Boton para abrir modal de edicion de posicion-->
                                    <td>
                                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal"
                                            data-bs-target="#botonEditarPosicion" style="margin: 30px;">
                                            Editar
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>2-DEF</td>
                                    <td>Centro campista Ofensivo</td>
                                    <td>
                                        <form class="form" id="ConfirmarCambiosEstado">
                                            <input type="number" class="form-control text-center" min="0" max="1"
                                                value="1" placeholder="1 = activado, 0 = desactivado">
                                            <button type="submit"
                                                class="btn btn-warning border-4 m-1 text-center">Guardar
                                                cambios</button>
                                        </form>
                                    </td>
                                    <td></td>
                                    <!--Boton para abrir modal de edicion de posicion-->
                                    <td>
                                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal"
                                            data-bs-target="#botonEditarPosicion" style="margin: 30px;">
                                            Editar
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>1-CEN</td>
                                    <td>Centro campoista Ofensivo</td>
                                    <td>
                                        <form class="form" id="ConfirmarCambiosEstado">
                                            <input type="number" class="form-control text-center" min="0" max="1"
                                                value="1" placeholder="1 = activado, 0 = desactivado">
                                            <button type="submit"
                                                class="btn btn-warning border-4 m-1 text-center">Guardar
                                                cambios</button>
                                        </form>
                                    </td>
                                    <td></td>
                                    <!--Boton para abrir modal de edicion de posicion-->
                                    <td>
                                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal"
                                            data-bs-target="#botonEditarPosicion" style="margin: 30px;">
                                            Editar
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>2-CEN</td>
                                    <td>Defensor lateral</td>
                                    <td>
                                        <form class="form" id="ConfirmarCambiosEstado">
                                            <input type="number" class="form-control text-center" min="0" max="1"
                                                value="1" placeholder="1 = activado, 0 = desactivado">
                                            <button type="submit"
                                                class="btn btn-warning border-4 m-1 text-center">Guardar
                                                cambios</button>
                                        </form>
                                    </td>
                                    <td></td>
                                    <!--Boton para abrir modal de edicion de posicion-->
                                    <td>
                                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal"
                                            data-bs-target="#botonEditarPosicion" style="margin: 30px;">
                                            Editar
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>1-DEL</td>
                                    <td>Delantero central</td>
                                    <td>
                                        <form class="form" id="ConfirmarCambiosEstado">
                                            <input type="number" class="form-control text-center" min="0" max="1"
                                                value="1" placeholder="1 = activado, 0 = desactivado">
                                            <button type="submit"
                                                class="btn btn-warning border-4 m-1 text-center">Guardar
                                                cambios</button>
                                        </form>
                                    </td>
                                    <td></td>
                                    <!--Boton para abrir modal de edicion de posicion-->
                                    <td>
                                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal"
                                            data-bs-target="#botonEditarPosicion" style="margin: 30px;">
                                            Editar
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>2-DEL</td>
                                    <td>Delantero extremo</td>
                                    <td>
                                        <form class="form" id="ConfirmarCambiosEstado">
                                            <input type="number" class="form-control text-center" min="0" max="1"
                                                value="1" placeholder="1 = activado, 0 = desactivado">
                                            <button type="submit"
                                                class="btn btn-warning border-4 m-1 text-center">Guardar
                                                cambios</button>
                                        </form>
                                    </td>
                                    <td></td>
                                    <!--Boton para abrir modal de edicion de posicion-->
                                    <td>
                                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal"
                                            data-bs-target="#botonEditarPosicion" style="margin: 30px;">
                                            Editar
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
             
            </div>

            <!--Modal-->
            <div class="modal fade" id="botonEditarPosicion" tabindex="-1" aria-labelledby="ModalEditarPosicion"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModalCondirmacionIncrip">Editar</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <p class="my-3">¿Quieres editar esta posicion?</p>
                            <form class="form" id="formPosicion">
                                <div class="mb-3">
                                    <label class="form-label" for="editarId">Codigo posicion</label>
                                    <input type="text" id="editarId" class="form-control" required placeholder="(2-CAR)"
                                        pattern="^[A-Z0-9\s#.-]+${5}"
                                        title="Debe ser un texto de un mayusculas, puedes ingresar numeros y caracteres especiales.">
                                    <div class="form-text">Ingresa Un codigo</div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="editarDescripcion">Descripcion
                                        Posicion</label>
                                    <input type="text" id="editarDescripcion" class="form-control" required
                                        placeholder="(Portero)" pattern="[A-Za-z]{5,15}"
                                        title="Debe tener entre 3 y 15 letras, sin números ni caracteres especiales.">
                                    <div class="form-text">Ingrese Una descripcion</div>
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
                        window.location.href = "../1_inicioAdministrador.html";
                    }, 1000);
                }
            })
        }

        const FormulariosPosicion = document.getElementById("ConfirmarCambiosEstado");

        FormulariosPosicion.addEventListener("submit", function (event) {
            event.preventDefault();
            
            if (FormulariosPosicion.checkValidity()) {
                Swal.fire({
                title: 'hmmm?',
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
                        timer: 2000,
                        didOpen: () => {
                            Swal.showLoading();
                        }
                    })
                    setTimeout(() => {
                        window.location.href = "1_verPosiciones.html";
                    }, 1000);
                }
            });
            }
        });

        document.getElementById("formPosicion").addEventListener("submit", function (event) {
            event.preventDefault();
            const botonConfirmar = document.getElementById("");
            
            if (formPosicion.checkValidity()) {
                Swal.fire({
                title: 'hmmm?',
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
                        window.location.href = "1_verPosiciones.html";
                    }, 2000);
                }
            });
            }
        });
    </script>
</body>

</html>