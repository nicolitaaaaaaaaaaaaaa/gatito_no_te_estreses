<%-- 
    Document   : 1_consultarCategorias
    Created on : 24 jun 2025, 9:06:09 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultar Categorias</title>
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
            margin-left: 100px;
            margin-right: 100px;
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
                <h1 class="display-6">Consultar Categorias</h1>
                <small>Gestiona las categorias del club deportivo.<br>¿Quieres
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
                <h3 class="my-4">Categorias</h3>
            </div>

            <div class="row d-flex justify-content-center">
                <h5 class="m">Observa todas las catergorias existentes en el club deportivo.</h5>

                    <div class="card card-body my-5" id="tarjeta">
                        <!--Tabla con todas las posiciones-->
                        <table class="table table-auto table-dark table-hover" id="tablaTodasLasPosiciones">
                            <thead>
                                <tr>
                                    <th style="width: 200px;">Nombre categoria</th>
                                    <th style="width: 100px;">Horario</th>
                                    <th style="width: 80px;">Cantidad Alumnos</th>
                                    <th style="width: 100px;">Posiciones</th>
                                    <th style="width: 80px;">Cantidad Alumnos Posicion</th>
                                    <th style="width: 30px;">#</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Filas-->
                                <!--Categoria 1-->
                                <tr>
                                    <td rowspan="7">4 a 7 años</td>
                                    <td rowspan="7">Lunes 2:05pm a 3:05pm</td>
                                    <td rowspan="7">8</td>
                                    <td>Portero</td>
                                    <td>1</td>
                                    <td rowspan="7">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                            data-bs-target="#modificarCategoria">Modificar<br>Categoria</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Defensor central</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td>Defensor lateral</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td>Centrocampista defensivo</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>Centrocampista Ofencivo</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>Delantero central</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>Delantero extremo</td>
                                    <td>2</td>
                                </tr>

                                <!--Categoria 2-->
                                <tr>
                                    <td rowspan="7"> 8 a 11 años</td>
                                    <td rowspan="7">Jueves 3:30pm a 4:30pm</td>
                                    <td rowspan="7">9</td>
                                    <td>Portero</td>
                                    <td>3</td>
                                    <td rowspan="7">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                            data-bs-target="#modificarCategoria">Modificar<br>Categoria</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Defensor central</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>Defensor lateral</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>Centrocampista defensivo</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>Centrocampista Ofencivo</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>Delantero central</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td>Delantero extremo</td>
                                    <td>2</td>
                                </tr>

                                <!--Categoria 3-->
                                <tr>
                                    <td rowspan="7">12-15 años</td>
                                    <td rowspan="7">Jueves 2:30pm a 3:30pm</td>
                                    <td rowspan="7">12</td>
                                    <td>Portero</td>
                                    <td>2</td>
                                    <td rowspan="7">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                            data-bs-target="#modificarCategoria">Modificar<br>Categoria</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Defensor central</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>Defensor lateral</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>Centrocampista defensivo</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td>Centrocampista Ofencivo</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>Delantero central</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td>Delantero extremo</td>
                                    <td>2</td>
                                </tr>

                                <!--Categoria 4-->
                                <tr>
                                    <td rowspan="7">16-17 años</td>
                                    <td rowspan="7">Miercoles 3:00pm a 4:00pm</td>
                                    <td rowspan="7">7</td>
                                    <td>Portero</td>
                                    <td>1</td>
                                    <td rowspan="7">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                            data-bs-target="#modificarCategoria">Modificar<br>Categoria</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Defensor central</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>Defensor lateral</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>Centrocampista defensivo</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>Centrocampista Ofencivo</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>Delantero central</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td>Delantero extremo</td>
                                    <td>2</td>
                                </tr>

                                <!--Categoria 5-->
                                <tr>
                                    <td rowspan="7">18 años</td>
                                    <td rowspan="7">Miercoles 2:05pm a 3:00pm</td>
                                    <td rowspan="7">10</td>
                                    <td>Portero</td>
                                    <td>2</td>
                                    <td rowspan="7">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                            data-bs-target="#modificarCategoria">Modificar<br>Categoria</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Defensor central</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>Defensor lateral</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>Centrocampista defensivo</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>Centrocampista Ofencivo</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>Delantero central</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>Delantero extremo</td>
                                    <td>0</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                <!--Modal-->
                <div class="modal fade" id="modificarCategoria" tabindex="-1" aria-labelledby="ModalCategoria"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="ModalCondirmacionIncrip">Modificar Categorias</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Cerrar"></button>
                            </div>
                            <div class="modal-body">
                                <p class="my-3">¿Quieres editar esta categoria?</p>
                                <form class="form" id="editarCategoria">
                                    <hr class="m-3">
                                    <h5 class="m-3">Editar informacion categoria</h5>
                                    <div class="mb-3">
                                        <label class="form-label" for="txtSelectCategoria">Categoria que quieres
                                            cambiar</label>
                                        <select class="form-select" id="txtSelectCategoria" required>
                                            <option value="">Elige...</option>
                                            <option value="1">-- Categoria 1(4 a 7) --</option>
                                            <option value="2"> -- Categoria 2(8 a 11) --</option>
                                            <option value="3">-- Categoria 3(12 a 15) --</option>
                                            <option value="4">-- Categoria 4(16 a 17) --</option>
                                            <option value="5">-- Categoria 5(18) --</option>
                                        </select>
                                        <div class="form-text">Selecciona Categoria</div>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="editarDescripcion">Nombre nuevo de
                                            categoria</label>
                                        <input type="text" id="editarDescripcion" class="form-control" required
                                            placeholder="12 a 11 años" pattern="[A-Za-z0-9]{5,15}"
                                            title="Debe tener entre 3 y 15 letras, sin caracteres especiales.">
                                        <div class="form-text">Ingrese Una descripcion para la nueva categoria</div>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="txtrangoEdad">Rango de ingreso 1</label>
                                        <input type="number" id="txtrangoEdad" class="form-control" required
                                            placeholder="5" min="4" max="25" title="Debe ser un número válido.">
                                        <div class="form-text">Ingrese un rago de edad</div>

                                        <label class="form-label" for="txtrangoEdad">Rango de ingreso 1</label>
                                        <input type="number" id="txtrangoEdad" class="form-control" required
                                            placeholder="7" min="4" max="25" title="Debe ser un número válido.">
                                        <div class="form-text">Ingrese un rago de edad</div>
                                    </div>

                                    <button type="submit" id="botonConfirmar" class="btn btn-success"
                                        ata-bs-dismiss="modal">Confirmar</button>
                                </form>
                                <hr class="mt-4">
                                <form class="form" id="editarHorario">
                                    <h5 class="m-3">Editar infromacion horario categoria</h5>
                                    <div class="mb-3">
                                        <label class="form-label" for="horaIngreso">Hora de ingreso</label>
                                        <input type="time" id="horaIngreso" class="form-control" required>
                                        <div class="form-text">Ingrese una hora</div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="horaSalida">Hora de salida</label>
                                        <input type="time" id="horaSalida" class="form-control" required>
                                        <div class="form-text">Ingrese una hora</div>
                                    </div>

                                    <button type="submit" id="botonConfirmar" class="btn btn-success"
                                        ata-bs-dismiss="modal">Confirmar</button>
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

        const FormularioHorario = document.getElementById("editarHorario");

        FormularioHorario.addEventListener("submit", function (event) {
            event.preventDefault();

            if (FormularioHorario.checkValidity()) {
                Swal.fire({
                    title: 'hmmm?',
                    text: '¿Estas seguro de guardar los cambios?',
                    icon: 'question',
                    showCancelButton: true,
                    showConfirmButton: true,
                    confirmButtonText: 'Si, quiero ir.',
                    cancelButtonText: 'No, no quiero.',
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
                            window.location.href = "1_consultarCategorias.html";
                        }, 2000);
                    }
                });
            }
        });


        const FormularioCategoria = document.getElementById("editarCategoria");

        FormularioCategoria.addEventListener("submit", function (event) {
            event.preventDefault();

            if (FormularioCategoria.checkValidity()) {
                Swal.fire({
                    title: 'hmmm?',
                    text: '¿Estas seguro de guardar los cambios?',
                    icon: 'question',
                    showCancelButton: true,
                    showConfirmButton: true,
                    confirmButtonText: 'Si, quiero ir.',
                    cancelButtonText: 'No, no quiero quedarme.',
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
                            window.location.href = "1_consultarCategorias.html";
                        }, 2000);
                    }
                });
            }
        });

    </script>
</body>

</html>
