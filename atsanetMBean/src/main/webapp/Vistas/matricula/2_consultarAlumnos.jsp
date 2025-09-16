<%-- 
    Document   : 2_consultarAlumnos
    Created on : 24 jun 2025, 9:09:06 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultar Matriculados</title>
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

        #botonActivarAlumno {
            display: none;
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

        img {
            transition: transform 0.5s;
        }

        img:hover {
            transform: scale(1.05);
        }

        table {
            font-size: large;
        }

        form .row {
            padding: 10px;
            display: flex;
            justify-content: center;
            text-align: left;
            color: white;
        }

        #botonEditarInformacion form label {
            color: rgb(22, 22, 22);
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
            <div class="col-md-5 d-flex justify-content-end">
                <img src="../img/logo_club.png" style="width: 200px">
            </div>
            <div class="col-md-7">
                <h1 class="display-6">Consultar Alumnos Matriculados</h1>
                <small>Gestiona a todos los alumnos del club deportivo, desde buscar hasta consultar.<br>¿Quieres
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
                <h3 class="my-4">Matriculados</h3>
            </div>

            <div class="row">
                <!--Columna de todos los alumnos-->
                <div class="col m-3">
                    <div class="row">
                        <!--Collapse de consulta de alumnos-->
                        <h5 class="m-3">Ingresa algun dato del alumno que quieras consultar</h5>
                        <form class="d-flex" role="search">
                            <input class="form-control" type="search" placeholder="Ingresa nombre, identificacion...."
                                aria-label="Search">
                            <button type="button" class="btn btn-4 btn-success m-2" data-bs-toggle="collapse"
                                data-bs-target="#collapseConsultaAlumnos" aria-expanded="true"
                                aria-controls="consultaA">
                                Ingresar
                            </button>
                        </form>

                        <!--Creacion del contenido-->
                        <div class="collapse mt-5" id="collapseConsultaAlumnos">
                            <div class="card card-body" id="tarjeta">
                                <form class="form text-white" id="formInscripcion">
                                    <fieldset disabled>
                                        <div class="row">
                                            <div class="col-3 col-auto">
                                                <label class="form-label" for="txtPNombre">Primer Nombre</label>
                                                <input type="text" id="txtPNombre" class="form-control" value="Juan">
                                                <div class="form-text">Ingrese tu nombre</div>
                                            </div>

                                            <div class="col-3 col-auto">
                                                <label class="form-label" for="txtSNombre">Segundo Nombre</label>
                                                <input type="text" id="txtSNombre" class="form-control" value="Carlos">
                                                <div class="form-text">Ingrese tu nombre</div>
                                            </div>

                                            <div class="col-3 col-auto">
                                                <label class="form-label" for="txtPApellido">Primer Apellido</label>
                                                <input type="text" id="txtPApellido" class="form-control"
                                                    value="Rodriguez">
                                                <div class="form-text">Ingrese un apellido</div>
                                            </div>

                                            <div class="col-3 col-auto">
                                                <label class="form-label" for="txtSapellido">Segundo Apellido</label>
                                                <input type="text" id="txtSapellido" class="form-control" value="Gomez">
                                                <div class="form-text">Ingrese un apellido</div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-2 col-auto">
                                                <label class="form-label" for="txtTipoId">Tipo Id</label>
                                                <select class="form-select" id="txtTipoId">
                                                    <option value="TI">TI</option>
                                                </select>
                                                <div class="form-text">Selecciona un tipo de identidad</div>
                                            </div>

                                            <div class="col-2 col-auto">
                                                <label class="form-label" for="txtNumeroID">Número ID</label>
                                                <input type="number" id="txtNumeroID" class="form-control"
                                                    value="102455678">
                                                <div class="form-text">Ingrese tu número ID</div>
                                            </div>

                                            <div class="col-2 col-auto">
                                                <label class="form-label" for="txtSexo">Sexo</label>
                                                <select class="form-select" id="txtSexo">
                                                    <option value="M">Masculino</option>
                                                </select>
                                                <div class="form-text">Selecciona tu sexo</div>
                                            </div>

                                            <div class="col-2 col-auto">
                                                <label class="form-label" for="txtFechaN">Fecha de nacimiento</label>
                                                <input type="date" id="txtFechaN" class="form-control"
                                                    value="2017-03-02">
                                                <div class="form-text">Selecciona tu fecha de nacimiento</div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-4 col-auto">
                                                <label class="form-label" for="txtDireccion">Dirección domicilio</label>
                                                <input type="text" id="txtDireccion" class="form-control"
                                                    value="Calle 1 #2-10 Barrio Centro">
                                                <div class="form-text">Ingresa tu dirección</div>
                                            </div>

                                            <div class="col-4 col-auto">
                                                <label class="form-label" for="txtCelular">Número celular</label>
                                                <input type="tel" id="txtCelular" class="form-control"
                                                    value="3105678910">
                                                <div class="form-text">Ingrese tu número de celular</div>
                                            </div>

                                            <div class="col-4 col-auto">
                                                <label class="form-label" for="txtCorreo">Correo Electrónico</label>
                                                <input type="email" id="txtCorreo" class="form-control"
                                                    value="juancarlos.rodriguez85@gmail.com">
                                                <div class="form-text">Ingresa tu correo electrónico</div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-auto">
                                                <label class="form-label" for="txtTSangre">Tipo de sangre</label>
                                                <select id="txtTSangre" class="form-select">
                                                    <option value="A">A</option>
                                                </select>
                                                <div id="txtAyudaTSangre" class="form-text">Selecciona tu tipo de sangre
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <label class="form-label" for="txtRh">RH</label>
                                                <select id="txtRh" class="form-select">
                                                    <option value="+">+</option>
                                                </select>
                                                <div id="txtAyudaRh" class="form-text">Selecciona tu RH</div>
                                            </div>
                                            <div class="col-auto">
                                                <label class="form-label" for="txtAltura">Altura</label>
                                                <input type="number" id="txtAltura" class="form-control" value="1.04">
                                                <div class="form-text">Ingrese tu número ID</div>
                                            </div>
                                            <div class="col-auto">
                                                <label class="form-label" for="txtPeso">Peso</label>
                                                <input type="number" id="txtPeso" class="form-control" value="16">
                                                <div id="txtAyudaPeso" class="form-text">Ingresa tu peso en kg</div>
                                            </div>
                                            <div class="col-auto">
                                                <label class="form-label" for="txtEps">EPS</label>
                                                <input type="text" id="txtEps" class="form-control" value="Compensar">
                                                <div id="txtAyudaEps" class="form-text">Ingresa la EPS a la cual
                                                    perteneces
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <label class="form-label" for="txtTalla">Talla</label>
                                                <input type="text" id="txtTalla" class="form-control" value="8">
                                                <div id="txtAyudaTalla" class="form-text">Ingresa tu talla de ropa</div>
                                            </div>
                                            <div class="col-auto">
                                                <label class="form-label" for="txtCalzado">Calzado</label>
                                                <input type="number" id="txtCalzado" class="form-control" value="5">
                                                <div id="txtAyudaCalzado" class="form-text">Ingresa tu número de calzado
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="mb-3">
                                                    <label class="form-label" for="txtSelectCategoria">Categoria</label>
                                                    <select class="form-select" id="txtSelectCategoria" required>
                                                        <option value="2"> -- Categoria 2(8 a 11) --</option>
                                                    </select>
                                                    <div class="form-text">Selecciona Categoria</div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <label class="form-label" for="txtEdad">Edad Calculada</label>
                                                <input type="number" id="txtEdad" class="form-control" value="8"
                                                    disabled>
                                            </div>
                                            <div class="col">
                                                <label class="form-label" for="txtIMC">IMC Calculado</label>
                                                <input type="number" id="txtEdad" class="form-control" value="17.4"
                                                    disabled>
                                            </div>
                                            <div class="col">
                                                <label class="form-label" for="txtPieD">Pie Dominante</label>
                                                <select id="txtPieD" class="form-select">
                                                    <option value="Diestro">Diestro</option>
                                                </select>
                                                <div id="txtAyudaPieD" class="form-text">Selecciona tu pie dominante
                                                </div>
                                            </div>

                                            <div class="col">
                                                <label class="form-label" for="txtPosicion">Posición en Cancha</label>
                                                <select id="txtPosicion" class="form-select">
                                                    <option value="Portero">Portero</option>
                                                </select>
                                                <div id="txtAyudaPosicion" class="form-text">Selecciona la posición que
                                                    prefieres</div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <label class="form-label" for="fileTratamiento">Autorización tratamiento
                                                    de
                                                    datos</label>
                                                <input type="file" class="form-control" id="fileTratamiento"
                                                    accept="application/pdf" required>
                                                <div id="helpTratamiento" class="form-text">Carga un archivo en formato
                                                    PDF.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <label class="form-label" for="fileMedica">Autorización Médica</label>
                                                <input type="file" class="form-control" id="fileMedica"
                                                    accept="application/pdf" required>
                                                <div id="helpMedica" class="form-text">Carga un archivo en formato PDF.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <label class="form-label" for="fileEps">Comprobante EPS</label>
                                                <input type="file" class="form-control" id="fileEps"
                                                    accept="application/pdf" required>
                                                <div id="helpEps" class="form-text">Carga un archivo en formato PDF.
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>

                                <hr class="border-5 border-black mt-5">

                                <!--fila de botones-->
                                <div class="row">
                                    <div class="col d-flex justify-content-center">
                                        <button type="button" class="btn btn-warning" data-bs-toggle="modal"
                                            data-bs-target="#botonEditarInformacion"
                                            style="margin: 10px; width: 300px;">
                                            Editar informacion
                                        </button>
                                    </div>

                                    <div class="col d-flex justify-content-center">
                                        <button id="botonDesactivarAlumno" type="button" class="btn btn-danger btn"
                                            onclick="SuspenderAlumno() "
                                            style="margin: 10px; width: 300px;">Suspender<br>Alumno</button>
                                    </div>

                                    <div class="col d-flex justify-content-center">
                                        <button id="botonActivarAlumno" type="button" class="btn btn-danger btn"
                                            style="margin: 10px; width: 300px;"
                                            onclick="activarAlumno()">Actiivar<br>Alumno</button>
                                    </div>

                                    <div class="col d-flex justify-content-center">
                                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal"
                                            data-bs-target="#botonGenerarcarnet" style="margin: 10px; width: 300px;">
                                            Generar carnet
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!--Columna de buscar por uno solo-->
                <div class="col m-3">
                    <div class="row mb-4 d-flex justify-content-center">
                        <img src="../img/buscar.png" style="width: 300px; height: 300px;">
                    </div>
                    <div class="row m-3">
                        <h5>¿Quieres ver la tabla de todos los alumno?</h5>
                        <button type="button" class="btn btn-dark p-4" data-bs-toggle="collapse"
                            data-bs-target="#collapseDesplegarTabla" aria-expanded="false"
                            aria-controls="collapsetabla">
                            -- Si --
                        </button>

                        <div class="collapse mt-3" id="collapseDesplegarTabla">
                            <div class="card card-body" id="tarjeta">
                                <!--Tabla con todas las posiciones-->
                                <table class="table table-auto table-dark table-hover" id="tablaTodasLasPosiciones">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Numero id</th>
                                            <th>Telefono</th>
                                            <th>Correo</th>
                                            <th>Edad</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!--Filas-->
                                        <tr>
                                            <td>Juan</td>
                                            <td>Rodríguez</td>
                                            <td>102455678</td>
                                            <td>3105678910</td>
                                            <td>juancarlos.rodriguez85@gmail.com</td>
                                            <td>7 años</td>
                                        </tr>

                                        <tr>
                                            <td>Jorge</td>
                                            <td>Gómez</td>
                                            <td>106737898</td>
                                            <td>3122345678</td>
                                            <td>enrique.gomez.jorge@gmail.com</td>
                                            <td> 9 años</td>
                                        </tr>

                                        <tr>
                                            <td>Andrés</td>
                                            <td>Martínez</td>
                                            <td>102455678</td>
                                            <td>3204567890</td>
                                            <td>afmartinez.andres@outlook.com</td>
                                            <td>13 años</td>
                                        </tr>

                                        <tr>
                                            <td>Paula</td>
                                            <td>Romero</td>
                                            <td>104488484</td>
                                            <td>3229876543</td>
                                            <td>paula.andrea.romero98@yahoo.com</td>
                                            <td>15 años</td>
                                        </tr>


                                        <tr>
                                            <td>Sebastián</td>
                                            <td>González</td>
                                            <td>107388484</td>
                                            <td>3211234567</td>
                                            <td>sebastian.a.gonzalez@hotmail.com</td>
                                            <td>16-17 años</td>
                                        </tr>

                                        <tr>
                                            <td>Oscar</td>
                                            <td>Cárdenas</td>
                                            <td>105885858</td>
                                            <td>3106781234</td>
                                            <td>oscar.e.cardenas92@outlook.com</td>
                                            <td>18 años</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>


            </div>
        </main>

        <!--Creacion modales-->
        <!--Modal editar informacion-->
        <div class="modal fade" id="botonEditarInformacion" tabindex="-1" aria-labelledby="ModalEditarInformacion"
            aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalCondirmacionIncrip">Editar Informacion
                            Alumno</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body ">
                        <p class="mb-2">¿Quieres editar este alumno?</p>
                        <form class="form" id="editarA">
                            <div class="row">
                                <div class="col-3 col-auto">
                                    <label class="form-label" for="txtPNombre">Primer Nombre</label>
                                    <input type="text" id="txtPNombre" class="form-control" value="Juan" disabled>
                                    <div class="form-text">Ingrese tu nombre</div>
                                </div>

                                <div class="col-3 col-auto">
                                    <label class="form-label" for="txtSNombre">Segundo
                                        Nombre</label>
                                    <input type="text" id="txtSNombre" class="form-control" value="Carlos" disabled>
                                    <div class="form-text">Ingrese tu nombre</div>
                                </div>

                                <div class="col-3 col-auto">
                                    <label class="form-label" for="txtPApellido">Primer
                                        Apellido</label>
                                    <input type="text" id="txtPApellido" class="form-control" value="Rodriguez"
                                        disabled>
                                    <div class="form-text">Ingrese un apellido</div>
                                </div>

                                <div class="col-3 col-auto">
                                    <label class="form-label" for="txtSapellido">Segundo
                                        Apellido</label>
                                    <input type="text" id="txtSapellido" class="form-control" value="Gomez" disabled>
                                    <div class="form-text">Ingrese un apellido</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-2 col-auto">
                                    <label class="form-label" for="txtTipoId">Tipo Id</label>
                                    <select class="form-select" id="txtTipoId" disabled>
                                        <option value="TI">TI</option>
                                    </select>
                                    <div class="form-text">Selecciona un tipo de identidad</div>
                                </div>

                                <div class="col-2 col-auto">
                                    <label class="form-label" for="txtNumeroID">Número ID</label>
                                    <input type="number" id="txtNumeroID" class="form-control" value="102455678"
                                        disabled>
                                    <div class="form-text">Ingrese tu número ID</div>
                                </div>

                                <div class="col-2 col-auto">
                                    <label class="form-label" for="txtSexo">Sexo</label>
                                    <select class="form-select" id="txtSexo">
                                        <option value="">Elige...</option>
                                        <option value="M">Masculino</option>
                                        <option value="F">Femenino</option>
                                        <option value="NB">No binario</option>
                                    </select>
                                    <div class="form-text">Selecciona tu sexo</div>
                                </div>

                                <div class="col-2 col-auto">
                                    <label class="form-label" for="txtFechaN">Fecha de
                                        nacimiento</label>
                                    <input type="date" id="txtFechaN" class="form-control" value="2017-03-02" disabled>
                                    <div class="form-text">Selecciona tu fecha de nacimiento</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4 col-auto">
                                    <label class="form-label" for="txtDireccion">Dirección
                                        domicilio</label>
                                    <input type="text" id="txtDireccion" class="form-control" placeholder="Calle 45 #3g"
                                        pattern="^[A-Za-z0-9\s#.-]+$" minlength="15" maxlength="100"
                                        title="Debe ser una dirección válida con letras, números, espacios y algunos caracteres especiales (#, ., -).">
                                    <div class="form-text">Ingresa tu dirección</div>
                                </div>

                                <div class="col-4 col-auto">
                                    <label class="form-label" for="txtCelular">Número
                                        celular</label>
                                    <input type="tel" id="txtCelular" class="form-control" placeholder="3245643334"
                                        pattern="^\d{10}$" title="Debe contener 10 dígitos.">
                                    <div class="form-text">Ingrese tu número de celular</div>
                                </div>

                                <div class="col-4 col-auto">
                                    <label class="form-label" for="txtCorreo">Correo
                                        Electrónico</label>
                                    <input type="email" id="txtCorreo" class="form-control"
                                        placeholder="example@gmail.com" maxlength="100"
                                        title="Ingresa un correo electrónico válido.">
                                    <div class="form-text">Ingresa tu correo electrónico</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-auto">
                                    <label class="form-label" for="txtTSangre">Tipo de
                                        sangre</label>
                                    <select id="txtTSangre" class="form-select" disabled>
                                        <option value="A">A</option>
                                    </select>
                                    <div id="txtAyudaTSangre" class="form-text">Selecciona tu tipo
                                        de sangre
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <label class="form-label" for="txtRh">RH</label>
                                    <select id="txtRh" class="form-select" disabled>
                                        <option value="+">+</option>
                                    </select>
                                    <div id="txtAyudaRh" class="form-text">Selecciona tu RH</div>
                                </div>
                                <div class="col-auto">
                                    <label class="form-label" for="txtAltura">Altura</label>
                                    <input type="number" id="txtAltura" class="form-control" placeholder="1.64"
                                        min="0.50" max="2.50" step="0.01"
                                        title="Ingresa un valor entre 0.50 y 2.50 metros.">
                                    <div id="txtAyudaAltura" class="form-text">Ingresa tu altura en
                                        metros (ej. 1.64)</div>
                                </div>
                                <div class="col-auto">
                                    <label class="form-label" for="txtPeso">Peso</label>
                                    <input type="number" id="txtPeso" class="form-control" placeholder="63.34" min="10"
                                        max="100" step="0.01" title="Ingresa un valor entre 10 y 100 kg.">
                                    <div id="txtAyudaPeso" class="form-text">Ingresa tu peso en kg
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <label class="form-label" for="txtEps">EPS</label>
                                    <input type="text" id="txtEps" class="form-control" placeholder="Sura, Compensar"
                                        pattern="[A-Za-z\s]{5, 15}"
                                        title="Solo se permiten letras y espacios, máximo 15 caracteres.">
                                    <div id="txtAyudaEps" class="form-text">Ingresa la EPS a la cual
                                        perteneces</div>
                                </div>
                                <div class="col-auto">
                                    <label class="form-label" for="txtTalla">Talla</label>
                                    <input type="text" id="txtTalla" class="form-control" placeholder="M, L, XS..."
                                        pattern="[A-Za-z0-9]{3, 6}"
                                        title="Solo se permiten letras (e.g., XS, M, L) y numero(1,2,3--)">
                                    <div id="txtAyudaTalla" class="form-text">Ingresa tu talla de
                                        ropa</div>
                                </div>
                                <div class="col-auto">
                                    <label class="form-label" for="txtCalzado">Calzado</label>
                                    <input type="number" id="txtCalzado" class="form-control" placeholder="38, 40, 35"
                                        min="15" max="50" title="Ingresa un número entre 15 y 50.">
                                    <div id="txtAyudaCalzado" class="form-text">Ingresa tu número de
                                        calzado</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3">
                                        <label class="form-label" for="txtSelectCategoria">Categoria</label>
                                        <select class="form-select" id="txtSelectCategoria">
                                            <option value="">Elige...</option>
                                            <option value="1">-- Categoria 1(4 a 7) --</option>
                                            <option value="2"> -- Categoria 2(8 a 11) --</option>
                                            <option value="3">-- Categoria 3(12 a 15) --</option>
                                            <option value="4">-- Categoria 4(16 a 17) --</option>
                                            <option value="5">-- Categoria 5(18) --</option>
                                        </select>
                                        <div class="form-text">Selecciona Categoria</div>
                                    </div>
                                </div>
                                <div class="col">
                                    <label class="form-label" for="txtEdad">Edad Calculada</label>
                                    <input type="number" id="txtEdad" class="form-control" value="8" disabled>
                                </div>
                                <div class="col">
                                    <label class="form-label" for="txtIMC">IMC Calculado</label>
                                    <input type="number" id="txtEdad" class="form-control" value="17.4" disabled>
                                </div>
                                <div class="col-6">
                                    <label class="form-label" for="txtPieD">Pie Dominante</label>
                                    <select id="txtPieD" class="form-select">
                                        <option value="">Elige...</option>
                                        <option value="Diestro">Diestro</option>
                                        <option value="Zurdo">Zurdo</option>
                                        <option value="Ambidiestro">Ambidiestro</option>
                                    </select>
                                    <div id="txtAyudaPieD" class="form-text">Selecciona tu pie
                                        dominante</div>
                                </div>

                                <div class="col-6">
                                    <label class="form-label" for="txtPosicion">Posición en
                                        Cancha</label>
                                    <select id="txtPosicion" class="form-select">
                                        <option value="">Elige...</option>
                                        <option value="Portero">Portero</option>
                                        <option value="Defensa">Defensa</option>
                                        <option value="MedioCampo">Medio Campo</option>
                                        <option value="Delantero">Delantero</option>
                                    </select>
                                    <div id="txtAyudaPosicion" class="form-text">Selecciona la
                                        posición que prefieres</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label class="form-label" for="fileTratamiento">Autorización
                                        tratamiento de datos</label>
                                    <input type="file" class="form-control" id="fileTratamiento"
                                        accept="application/pdf" disabled>
                                    <div id="helpTratamiento" class="form-text">Carga un archivo en
                                        formato PDF.</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label class="form-label" for="fileMedica">Autorización
                                        Médica</label>
                                    <input type="file" class="form-control" id="fileMedica" accept="application/pdf"
                                        disabled>
                                    <div id="helpMedica" class="form-text">Carga un archivo en
                                        formato PDF.</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label class="form-label" for="fileEps">Comprobante EPS</label>
                                    <input type="file" class="form-control" id="fileEps" accept="application/pdf"
                                        disabled>
                                    <div id="helpEps" class="form-text">Carga un archivo en formato
                                        PDF.</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4 d-flex justify-content-center my-4">
                                    <button type="submit" id="botonConfirmar" class="btn btn-success">Enviar
                                        Formulario de
                                        Inscripcion</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal para suspender alumno-->
        <div class="modal fade" id="botonESuspenderAlumno" tabindex="-1" aria-labelledby="ModalSuspender"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalCondirmacionIncrip">Suspender alumno</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        <p class="my-3">¿Estas seguro de que quieres suspender a este alumno?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" id="botonConfirmar" class="btn btn-success"
                            ata-bs-dismiss="modal">Confirmar</button>

                    </div>
                </div>
            </div>
        </div>
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
                buttonTextColor: '#ffffff ',
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

        function SuspenderAlumno() {
            Swal.fire({
                title: "Suspender Alumno?",
                text: "¿Estas seguro que quieres suspender al alumno consultado?",
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

        const botonDesactivadoObj = document.getElementById("botonDesactivarAlumno");
        const botonActivarObj = document.getElementById("botonActivarAlumno");

        botonDesactivadoObj.addEventListener("click", function () {
            botonActivarObj.style.display = "inline-block";
        });

        function activarAlumno() {
            Swal.fire({
                title: 'Activar?',
                text: '¿Quieres que este alumno este denuevo activo en el club deportiv0?',
                icon: 'question',
                showCancelButton: true,
                showConfirmButton: true,
                confirmButtonText: 'Si.',
                cancelButtonText: 'No.',
                confirmButtonColor: '#2a6637',
                cancelButtonColor: '#570808 ',
                confirmButtonTextColor: '#ffffff ',
                timer: 2000,
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: '',
                        text: 'Guardando cambios, espera un momento',
                        icon: 'success',
                        showConfirmButton: false,
                        timer: 2000,
                        didOpen: () => {
                            Swal.showLoading();
                        }
                    })
                    setTimeout(() => {
                        window.location.href = "2_consultarAlumnos.html";
                    }, 1000);
                }
            });

        }




        document.getElementById("editarA").addEventListener("submit", function (event) {
            event.preventDefault();
            const botonConfirmar = document.getElementById("");

            if (editarA.checkValidity()) {
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
                            timer: 10000,
                            didOpen: () => {
                                Swal.showLoading();
                            }
                        })
                        setTimeout(() => {
                            window.location.href = "2_consultarAlumnos.html";
                        }, 100);
                    }
                });
            }
        });

    </script>
</body>

</html>