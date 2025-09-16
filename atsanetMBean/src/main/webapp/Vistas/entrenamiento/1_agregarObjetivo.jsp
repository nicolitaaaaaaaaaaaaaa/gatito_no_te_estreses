<%-- 
    Document   : 1_agregarObjetivo
    Created on : 24 jun 2025, 4:28:59 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear y asignar objetivos</title>
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
            height: 220px;
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
            margin: 15px;
            padding: 30px;
            border-radius: 4px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.60);
            transition: transform 0.5s;
            color: white;
        }

        form:hover {
            transform: scale(1.05);
        }

        form .row {
            padding: 10px;
            margin: 10px;
        }

        #tarjeta {
            background: rgb(41, 2, 2);
            border-radius: 8px;
            color: white;
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
                <h1 class="display-6">Objetivos</h1>
                <small>Puedes crear y asignar objetivos, ya sean existentes o no</small>.<br>¿quieres
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
                <h3 class="my-4">Objetivos</h3>
            </div>
            <div class="row" id="contenedorFormulario">
                <!--Formulario con el nombre y la categoria del entrenamiento-->
                <div class="row">
                    <h4>-- Informacion del entrenamiento --</h4>
                    <form class="bg-secondary" id="estiloFormulario">
                        <fieldset disabled class="d-flex justify-content-center m-2">
                            <div class="col-auto m-1">
                                <!--Nombre del entrenamiento-->
                                <label class="form-label" for="txtNombreEntrenamiento">Nombre de
                                    entrenamiento</label>
                                <input type="text" id="txtNombreEntrenamiento" class="form-control"
                                    value="Linea Imaginaria">
                            </div>

                            <div class="col-auto m-1">
                                <label class="form-label" for="txtSeleccionar">Seleccionar la categoria</label>
                                <select class="form-select" id="txtSelectCategoria">
                                    <option value="3">-- Categoria 3(12 a 15) --</option>
                                </select>
                            </div>
                        </fieldset>
                    </form>
                </div>

                <div class="row">
                    <!--Columna para agregar objetivos-->
                    <div class="col">
                        <h4>Ingresa la informacion asignar un objetivo existente.</h4>
                        <form class="bg-secondary" id="AsignarObjetivos">
                            <div class="row">
                                <label class="form-label" for="txtIDobjetivo">Ingresa un codigo</label>
                                <input type="number" id="txtIDobjetivo" class="form-control" required placeholder="602"
                                    min="1" max="700" title="Debe ser un número válido, con valor de 1 a 700">
                                <div class="form-text">Ingrese un numero</div>
                            </div>

                            <div class="row">
                                <!--Nombre del objetivo nuevo-->
                                <label class="form-label" for="txtNombreObjetivo">Nombre de
                                    Objetivo</label>
                                <input type="text" id="txtNombreObjetivo" class="form-control" required placeholder=""
                                    pattern="[A-Za-z0-9\s#]+${5,15}"
                                    title="Debe tener entre 10 y 30  letras, sin caracteres especiales.">
                                <div class="form-text">Ingrese el Objetivo</div>
                            </div>

                            <div class="row d-flex justify-content-end">
                                <button type="submit" class="btn btn-dark" style="width: 200px; height: 50px;">Guardar
                                    Objetivo</a>
                                </button>
                            </div>
                        </form>
                    </div>

                    <!--Consultar objetivos existentes-->
                    <div class="col">
                        <div class="row">
                            <!--Collapse de consulta de alumnos-->
                            <h5 class="m-3">Ingresa algun dato del alumno que quieras consultar</h5>
                            <form class="d-flex bg-secondary" role="search">
                                <input class="form-control" type="search"
                                    placeholder="Ingresa nombre, identificacion...." aria-label="Search">
                                <button type="button" class="btn btn-4 btn-success m-2" data-bs-toggle="collapse"
                                    data-bs-target="#collapseConsultaAlumnos" aria-expanded="true"
                                    aria-controls="consultaA">
                                    Ingresar
                                </button>
                            </form>

                            <!--Creacion del contenido-->
                            <div class="collapse mt-3" id="collapseConsultaAlumnos">
                                <div class="card card-body p-5" id="tarjeta">
                                    Objetivos existentes
                                    <hr class="border-5 border-light m-2">
                                    <table class="table table-auto table-dark table-hover">
                                        <thead>
                                            <tr>
                                                <th>id Objetivo</th>
                                                <th>Objetivo</th>
                                                <th class="d-flex justify-content-center">#</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>301</td>
                                                <td>Coordinación</td>
                                                <td>
                                                    <button type="button" class="btn btn-success p-3"
                                                        onclick="asignarObjetivo()">Asignar</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>603</td>
                                                <td>Conducción</td>
                                                <td>
                                                    <button type="button" class="btn btn-success p-3"
                                                        onclick="asignarObjetivo()">Asignar</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>804</td>
                                                <td>Coontrataque</td>
                                                <td>
                                                    <button type="button" class="btn btn-success p-3"
                                                        onclick="asignarObjetivo()">Asignar</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>801</td>
                                                <td>Competitividad</td>
                                                <td>
                                                    <button type="button" class="btn btn-success p-3"
                                                        onclick="asignarObjetivo()">Asignar</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>806</td>
                                                <td>Comunicación</td>
                                                <td>
                                                    <button type="button" class="btn btn-success p-3"
                                                        onclick="asignarObjetivo()">Asignar</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>602</td>
                                                <td>Concentracion</td>
                                                <td>
                                                    <button type="button" class="btn btn-success p-3"
                                                        onclick="asignarObjetivo()">Asignar</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1601</td>
                                                <td>Cohesion grupal</td>
                                                <td>
                                                    <button type="button" class="btn btn-success p-3"
                                                        onclick="asignarObjetivo()">Asignar</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1303</td>
                                                <td>Control</td>
                                                <td>
                                                    <button type="button" class="btn btn-success p-3"
                                                        onclick="asignarObjetivo()">Asignar</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row d-flex justify-content-center">
                    <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#verEntrenamiento"
                        style="width: 300px; height: 50px;">Guardar Entrenamiento</button>
                </div>

                <!--Modal previsualizacion alumno-->
                <div class="modal fade" id="verEntrenamiento" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Vista previa entrenamientos</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Cerrar"></button>
                            </div>
                            <div class="modal-body">
                                Esta es el entrenamiento que acabas de crear.¿Deseas utilizarlo y continuar?
                                <form class="text-black" id="formulario">
                                    <fieldset disabled>
                                        <div class="row">
                                            <!--Nombre del entrenamiento-->
                                            <label class="form-label" for="txtNombreEntrenamiento">Nombre de
                                                entrenamiento</label>
                                            <input type="text" id="txtnumID" class="form-control"
                                                value="Linea Imaginaria">
                                        </div>

                                        <div class="row">
                                            <label class="form-label" for="txtSeleccionar">Seleccionar la
                                                categoria</label>
                                            <select class="form-select" id="txtSelectCategoria">
                                                <option value="3">-- Categoria 3(12 a 15) --</option>
                                            </select>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <label class="form-label" for="txtnumID">Codigo objetivo</label>
                                                <input type="number" id="txtnumID" class="form-control" value="602">
                                            </div>
                                            <div class="col">
                                                <label class="form-label" for="txtObjetivo1">Objetivo 1</label>
                                                <input type="text" id="txtObjetivo1" class="form-control"
                                                    value="Concentracion">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <label class="form-label" for="txtnumID">Codigo objetivo</label>
                                                <input type="number" id="txtnumID" class="form-control" value="806">
                                            </div>
                                            <div class="col">
                                                <label class="form-label" for="txtObjetivo2">Objetivo 2</label>
                                                <input type="text" id="txtObjetivo2" class="form-control"
                                                    value="Comunicación">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <label class="form-label" for="txtnumID">Codigo objetivo</label>
                                                <input type="number" id="txtnumID" class="form-control" value="603">
                                            </div>
                                            <div class="col">
                                                <label class="form-label" for="txtObjetivo3">Objetivo 3</label>
                                                <input type="text" id="txtObjetivo3" class="form-control"
                                                    value="Conducción">
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" onclick="aceptar()">Confirmar</button>
                                <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Cancelar</button>
                            </div>
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

        document.getElementById("AsignarObjetivos").addEventListener("submit", function (event) {
            event.preventDefault();
            const botonConfirmar = document.getElementById("");

            if (AsignarObjetivos.checkValidity()) {
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

        function aceptar() {
            Swal.fire({
                title: "",
                text: "Perfercto, has agregado el entrenamiento",
                icon: "success",
                showConfirmButton: false,
                timer: 2000,
                didOpen: () => {
                    Swal.showLoading();
                }
            });
            setTimeout(() => {
                window.location.href = "1_agregarObjetivo.html";
            }, 2000);
        }


        function asignarObjetivo() {
            Swal.fire({
                title: "",
                text: "has asignado el objetivo a la categoria, sigue asignando mas",
                icon: "success"
            });
        }

    </script>
</body>

</html>
