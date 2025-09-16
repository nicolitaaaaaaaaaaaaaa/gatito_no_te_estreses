<%-- 
    Document   : matricula
    Created on : 29 jun 2025, 12:11:45 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session ="true"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    if (session.getAttribute("nombre1") == null) {
        response.sendRedirect("../inicioSesion.jsp");
        return;
    }
    String nombre1 = (String) session.getAttribute("nombre1");
    String apellido1 = (String) session.getAttribute("apellido1");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>plantilla</title>
    <!--links de css-->
    <link rel="stylesheet" href="/atsaNet/Vistas/css/plantilla.css">
    <link rel="stylesheet" href="/atsaNet/Vistas/css/matricula.css">

    <!--Links de boostrap y letra-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>

<body>
    <!--Contenedor de todo-->
    <div class="grid-container">
        <header class="navbar navbar-expand-lg navbar-dark">
        </header>
        <main class="contenido">
            <div class="grid-main">
                <section class="inicio">
                    <div class="titulo">
                        <div class="imagen">
                            <h1>Gestion Matricula</h1>
                        </div>
                    </div>
                    <div class="menu">
                        <p data-target="#matricula">Matricula</p>
                        <p data-target="#categorias">Categoria</p>
                        <p data-target="#alumno">Alumnos</p>
                        <p data-target="#posiciones">posiciones</p>
                    </div>
                </section>
                <section class="contenido">
                    <div data-content id="matricula" class="active">
                        <div class="descripcion">
                            <h3>📒Alumnos matriculados</h3>
                            <div class="line"></div>
                        </div>
                        <section class="tabla-alumnos">
                            <h4>📖 Todos los alumnos</h4>
                            <form class="form formulario-alumnos">
                                <label class="form-label" for="categoria">Elige una categoria de filtro:</label>
                                <select class="form-select" id="categoria" required>
                                    <option value="">Elige...</option>
                                    <option value="1">-- Categoria 1(4 a 7) --</option>
                                    <option value="2">-- Categoria 2(8 a 11) --</option>
                                    <option value="3">-- Categoria 3(12 a 15) --</option>
                                    <option value="4">-- Categoria 4(16 a 17) --</option>
                                    <option value="5">-- Categoria 5(18) --</option>
                                </select>
                                <button type="submit" class="btn">Buscar</button>
                            </form>
                            <table class="table table-responsive table-primary table-striped">
                                <thead>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Correo</th>
                                    <th>Telefono</th>
                                    <th>Categoria</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </tbody>
                            </table>
                        </section>
                        <section class="buscar-alumno">
                            <h4>🔎Buscar Alumno</h4>
                            <form class="form formulario-buscar">
                                <label class="form-label" for="nombre">Ingresa el nombre: </label>
                                <input type="text" id="nombre" placeholder="Escribe aqui.." class="form-control"
                                    minlength="4" maxlength="20" pattern="[A-Za-z]">
                                <label class="form-label" for="apellido">Ingresa el apellido: </label>
                                <input type="text" id="apellido" placeholder="Escribe aqui.." class="form-control"
                                    minlength="6" maxlength="20" pattern="[A-Za-z]">
                                <button type="submit" class="btn">Buscar</button>
                            </form>
                            <table class="table table-responsive table-primary table-striped">
                                <thead>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Correo</th>
                                    <th>Telefono</th>
                                    <th>Categoria</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th>
                                            <button type="button" class="btn" data-bs-toggle="modal"
                                                data-bs-target="#editarAlumno">Editar alumno</button>
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                        </section>
                    </div>
                    <div data-content id="categorias">
                        <div class="descripcion">
                            <h3>👨‍👩‍👧‍👦 Categorias existentes</h3>
                            <div class="line"></div>
                        </div>
                        <section class="buscar-categoria">
                            <h4>👨‍👩‍👧‍👦 Categorias existentes</h4>
                            <form class="form formulario-categoria">
                                <label class="form-label" for="categoria">Elige una categoria de filtro:</label>
                                <select class="form-select" id="categoria" required>
                                    <option value="">Elige...</option>
                                    <option value="1">-- Categoria 1(4 a 7) --</option>
                                    <option value="2">-- Categoria 2(8 a 11) --</option>
                                    <option value="3">-- Categoria 3(12 a 15) --</option>
                                    <option value="4">-- Categoria 4(16 a 17) --</option>
                                    <option value="5">-- Categoria 5(18) --</option>
                                </select>

                                <label class="form-label" for="posicion">Elige una posicion de filtro:</label>
                                <select id="posicion" class="form-select" required>
                                    <option value="">Elige...</option>
                                    <option value="Portero">Portero</option>
                                    <option value="Defensa">Defensa</option>
                                    <option value="MedioCampo">Medio Campo</option>
                                    <option value="Delantero">Delantero</option>
                                </select>

                                <button type="submit" class="btn">Buscar</button>
                            </form>
                            <table class="table table-responsive table-primary table-striped">
                                <thead>
                                    <th>Nombre</th>
                                    <th>Cantidad Alumnos</th>
                                    <th>Posiciones</th>
                                    <th>Alumnos posicion</th>
                                    <th>Alumnos posicion</th>
                                    <th></th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th>
                                            <button type="button" class="btn" data-bs-toggle="modal"
                                                data-bs-target="#editarCategoria">Editar categoria</button>
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                        </section>
                    </div>
                    <div data-content id="alumno">
                        <div class="descripcion">
                            <h3>💻 Aspirantes inscritos</h3>
                            <div class="line"></div>
                        </div>
                        <section class="tabla-inscripciones">
                            <h4>🥅 Inscripciones</h4>
                            <form class="form formulario-categoria">
                                <label class="form-label" for="edad">Ingresa la edad: </label>
                                <input type="number" id="edad" placeholder="Escribe aqui.." class="form-control" min="4"
                                    max="18">
                                <label class="form-label" for="genero">Selecciona el genero: </label>
                                <select class="form-select" id="genero">
                                    <option value="">Elige...</option>
                                    <option value="M">Masculino</option>
                                    <option value="F">Femenino</option>
                                    <option value="NB">No binario</option>
                                </select>
                                <button type="submit" id="BuscarInscripciones">Buscar</button>
                            </form>
                            <table class="table table-responsive table-primary table-striped">
                                <thead>
                                    <th>Nombre</th>
                                    <th>Cantidad Alumnos</th>
                                    <th>Posiciones</th>
                                    <th>Alumnos posicion</th>
                                    <th>Alumnos posicion</th>
                                    <th></th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th>
                                            <button type="button" class="btn" data-bs-toggle="modal"
                                                data-bs-target="#informacion">ver informacion</button>
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                        </section>
                    </div>
                    <div data-content id="posiciones">
                        <div class="descripcion">
                            <h3>⛹️ Posiciones entrenamiento</h3>
                            <div class="line"></div>
                        </div>
                        <section class="tabla-posiciones">
                            <h4>⛹️ Posiciones existentes</h4>
                            <table class="table table-responsive table-primary table-striped">
                                <thead>
                                    <th>Nombre</th>
                                    <th>Descripcion</th>
                                    <th>Estado</th>
                                    <th>Actualizacion</th>
                                    <th></th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th>
                                            <form class="form d-flex align-items-center gap-2"
                                                id="ConfirmarCambiosEstado1" onsubmit="return false;" novalidate>
                                                <label class="switch">
                                                    <input type="checkbox" id="estadoSwitch1" checked>
                                                    <span class="slider"></span>
                                                </label>
                                                <span id="estadoTexto1" class="ms-2 fw-bold text-success">Activo</span>
                                                <button type="submit">Guardar</button>
                                            </form>
                                        </th>
                                        <th></th>
                                        <th>
                                            <button type="button" class="btn" data-bs-toggle="modal"
                                                data-bs-target="#editarPosicion">Editar posicion</button>
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                        </section>
                    </div>
                </section>
            </div>

            <!-- Modal Posicion -->
            <div class="modal fade" id="editarPosicion" tabindex="-1" aria-labelledby="staticBackdropLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" id="nose">
                        <div class="modal-body">
                            <div class="titulo-modal">
                                <h3>Editar Categoria</h3>
                            </div>
                            <form class="form formulario-categoria">
                                <label class="form-label" for="nombre">Nombre posicion: </label>
                                <input type="text" id="nombre" placeholder="Escribe aqui.." class="form-control"
                                    minlength="15" maxlength="20" required>
                                <label class="form-label" for="descripcion">Descripcion: </label>
                                <input type="text" id="nombre" placeholder="Escribe aqui.." class="form-control"
                                    minlength="15" maxlength="20" required>

                                <label class="form-label" for="descripcion">Estado: </label>
                                <label class="switch">
                                    <input type="checkbox" id="editarEstado" checked>
                                    <span class="slider"></span>
                                </label>

                                <label class="form-label" for="fechaActualizacion">Fecha
                                    actualizacion: </label>
                                <input type="date" id="fechaActualizacion" class="form-control" disabled>

                                <div class="botones">
                                    <button type="submit" id="botonConfirmar"
                                        class="btn btn-main-action btn-success">Confirmar</button>
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">cancelar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Informacion -->
            <div class="modal fade" id="informacion" tabindex="-1" aria-labelledby="staticBackdropLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content" id="nose">
                        <div class="modal-body">
                            <div class="titulo-modal">
                                <h3>Informacion Aspirante</h3>
                            </div>
                            <form class="form formulario-informacion">
                                <div class="partes">
                                    <h5>Informacion principal:</h5>
                                    <label class="form-label info" for="id_persona">Identificacion: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="tipo_id">Tipo identificacion: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="nom1">Primer nombre: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="nom2">Segundo nombre: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="ape1">Primer apellido: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="ape2">segundo apelldio: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="nacimiento">Fecha nacimiento: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="edad">edad: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="genero">Genero: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="eps">Eps: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="rh">Rh: </label>
                                    <p>hola</p>
                                </div>
                                <div class="partes">
                                    <h5>Informacion de contacto:</h5>
                                    <label class="form-label info" for="direccion">Direccion: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="telefono">Telefono: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="email">Email: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="nom1Acu">Primer nombre acudiente: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="nom2Acu">Segundo nombre acudiente: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="ape1Acu">Primer apellido acudiente: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="ape2Acu">Segundo apellido acudiente: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="telefonoAcu">Telefono acudiente: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="parentesco">Parentesco: </label>
                                </div>
                                <div class="partes">
                                    <h5>Informacion Fisica:</h5>
                                    <label class="form-label info" for="talla">Talla: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="calzado">Calzado: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="piedom">Pie dominante: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="nomPosicion">Posicion: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="foto">Foto Aspirante: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="categoria">Categoria: </label>
                                    <p>hola</p>
                                    <label class="form-label info" for="estado">Estado Aspirante: </label>
                                    <p>hola</p>
                                </div>

                                <div class="partes">
                                    <h5>Documentos:</h5>
                                    <label class="form-label info" for="archivoDatos">Tratamiento de datos: </label>
                                    <input class="form-control" type="file" id="archivoDatos" multiple>
                                    <label class="form-label info" for="archivoAutorizacion">Autorizacion medica:
                                    </label>
                                    <input class="form-control" type="file" id="archivoAutorizacion" multiple>
                                    <label class="form-label info" for="archivoEps">Comprobante eps: </label>
                                    <input class="form-control" type="file" id="archivoEps" multiple>
                                </div>

                                <div class="botones">
                                    <button type="submit" id="botonConfirmar"
                                        class="btn btn-main-action btn-success">Aceptar
                                        Aspirante</button>
                                    <button type="submit" id="botonRechazar"
                                        class="btn btn-main-action btn-danger">Rechazar
                                        Aspirante</button>
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">cancelar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Categoria -->
            <div class="modal fade" id="editarCategoria" tabindex="-1" aria-labelledby="staticBackdropLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content" id="nose">
                        <div class="modal-body">
                            <div class="titulo-modal">
                                <h3>Elige categoria a cambiar</h3>
                            </div>
                            <form class="form formulario-categoria">
                                <label for="categoria">Categoría:</label>
                                <select class="form-select" id="categoria">
                                    <option value="">Elige...</option>
                                    <option value="1">-- Categoria 1(4 a 7) --</option>
                                    <option value="2">-- Categoria 2(8 a 11) --</option>
                                    <option value="3">-- Categoria 3(12 a 15) --</option>
                                    <option value="4">-- Categoria 4(16 a 17) --</option>
                                    <option value="5">-- Categoria 5(18) --</option>
                                </select>
                                <label class="form-label" for="nombre">Nombre posicion: </label>
                                <input type="text" id="nombre" placeholder="Escribe aqui.." class="form-control"
                                    minlength="15" maxlength="20" required>
                                <div class="botones">
                                    <button type="submit" id="botonConfirmar"
                                        class="btn btn-main-action btn-success">Confirmar</button>
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">cancelar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Alumno -->
            <div class="modal fade" id="editarAlumno" tabindex="-1" aria-labelledby="staticBackdropLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content" id="nose">
                        <div class="modal-body">
                            <div class="titulo-modal">
                                <h3>Editar Alumno</h3>
                            </div>
                            <form class="form formulario-alumno">
                                <div class="partes">
                                    <h5>Información principal:</h5>
                                    <label for="id_persona">Identificación:</label>
                                    <input type="text" class="form-control" id="id_persona" name="id_persona" disabled
                                        placeholder="Ingresa tu identificacion" pattern="\d{9,10}"
                                        title="Entre 9 y 10 dígitos numéricos">

                                    <label for="tipo_id">Tipo de identificación:</label>
                                    <select class="form-select" id="tipo_id" name="tipo_id" disabled required>
                                        <option value="">Elige...</option>
                                        <option value="RC">RC</option>
                                        <option value="TI">TI</option>
                                        <option value="CC">CC</option>
                                        <option value="PASAPORTE">PAS</option>
                                    </select>
                                    <div class="invalid-feedback">Por favor selecciona un tipo de identificación.</div>

                                    <label for="nom1">Primer nombre:</label>
                                    <input type="text" class="form-control" id="nom1" name="nom1"
                                        placeholder="Ingresa tu nombre" pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+"
                                        title="Solo letras de 3 a 20" minlength="3" maxlength="20" required>

                                    <label for="nom2">Segundo nombre:</label>
                                    <input type="text" class="form-control" id="nom2" name="nom2"
                                        placeholder="Ingresa tu nombre de 3 a 20 letras" minlength="3" maxlength="20"
                                        pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]*" required>

                                    <label for="ape1">Primer apellido:</label>
                                    <input type="text" class="form-control" id="ape1" name="ape1"
                                        placeholder="Ingresa tu apellido" minlength="3" maxlength="20"
                                        pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+" title="Solo letras de 3 a 20" required>

                                    <label for="ape2">Segundo apellido:</label>
                                    <input type="text" class="form-control" id="ape2" name="ape2"
                                        placeholder="Ingresa tu apellido de 3 a 20 letras" minlength="3" maxlength="20"
                                        pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]*" required>

                                    <label for="nacimiento">Fecha nacimiento (antes de 2005):</label>
                                    <input type="date" class="form-control" id="nacimiento" name="nacimiento"
                                        placeholder="Ingresa tu nacimiento" max="2005-12-31" disable>

                                    <label for="edad">Edad:</label>
                                    <input type="number" class="form-control" id="edad" name="edad" disabled>

                                    <label for="genero">Género:</label>
                                    <select class="form-control" id="genero" name="genero" disable>
                                        <option value="">Elige</option>
                                        <option value="M">Masculino</option>
                                        <option value="F">Femenino</option>
                                        <option value="O">Otro</option>
                                    </select>

                                    <label for="eps">EPS:</label>
                                    <input type="text" class="form-control" id="eps" name="eps"
                                        placeholder="Ingresa tu eps" minlength="3" maxlength="15"
                                        pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+" title="Solo letras de 3 a 15" required>

                                    <label for="rh">RH:</label>
                                    <select class="form-control" id="rh" name="rh" disabled>
                                        <option value="">Elige...</option>
                                        <option>O+</option>
                                        <option>O-</option>
                                        <option>A+</option>
                                        <option>A-</option>
                                        <option>B+</option>
                                        <option>B-</option>
                                        <option>AB+</option>
                                        <option>AB-</option>
                                    </select>
                                </div>

                                <div class="partes">
                                    <h5>Información de contacto:</h5>
                                    <label for="direccion">Dirección:</label>
                                    <input type="text" class="form-control" id="direccion" name="direccion"
                                        placeholder="Ingresa tu direccion" minlength="10" maxlength="30"
                                        pattern="[a-zA-Z0-9._%+-]+" title="de 10 a 30 caracteres" required>

                                    <label for="telefono">Teléfono:</label>
                                    <input type="tel" class="form-control" id="telefono" name="telefono"
                                        placeholder="Ingresa tu teléfono" pattern="^\d{7,10}$"
                                        title="Debe tener entre 7 y 10 dígitos numéricos" required>
                                    <div class="invalid-feedback">El teléfono debe tener entre 7 y 10 números.</div>

                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" id="email" name="email"
                                        placeholder="Ingresa tu email" required>

                                    <label for="nom1Acu">Primer nombre acudiente:</label>
                                    <input type="text" class="form-control" id="nom1Acu" name="nom1Acu"
                                        placeholder="Ingresa el nombre del acudiente" pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+"
                                        title="Solo letras" required>

                                    <label for="nom2Acu">Segundo nombre acudiente:</label>
                                    <input type="text" class="form-control" id="nom2Acu" name="nom2Acu"
                                        placeholder="Ingresa el nombre del acudiente" pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]*"
                                        required>

                                    <label for="ape1Acu">Primer apellido acudiente:</label>
                                    <input type="text" class="form-control" id="ape1Acu" name="ape1Acu"
                                        placeholder="Ingresa el apellido del acudiente"
                                        pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+" required>

                                    <label for="ape2Acu">Segundo apellido acudiente:</label>
                                    <input type="text" class="form-control" id="ape2Acu" name="ape2Acu"
                                        placeholder="Ingresa el apellido del acudiente"
                                        pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]*" required>

                                    <label for="telefonoAcu">Teléfono acudiente:</label>
                                    <input type="tel" class="form-control" id="telefonoAcu" name="telefonoAcu"
                                        placeholder="Ingresa el teléfono del acudiente" pattern="^\d{7,10}$"
                                        title="Debe tener entre 7 y 10 dígitos numéricos" required>
                                    <div class="invalid-feedback">El teléfono debe tener entre 7 y 10 números.</div>
                                    
                                    <label for="parentesco">Parentesco:</label>
                                    <input type="text" class="form-control" id="parentesco" name="parentesco"
                                        placeholder="Ingresa el parentesco" pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]*" required>
                                </div>

                                <div class="partes">
                                    <h5>Información física:</h5>
                                    <label for="talla">Talla (cm):</label>
                                    <input type="number" class="form-control" id="talla" name="talla"
                                        placeholder="Ingresa tu talla" min="50" max="250" required>

                                    <label for="calzado">Calzado:</label>
                                    <input type="number" class="form-control" id="calzado" name="calzado"
                                        placeholder="Ingresa tu calzado" min="15" max="50" required>

                                    <label for="piedom">Pie dominante:</label>
                                    <select id="piedom" name="piedom" class="form-select" required>
                                        <option value="">Elige...</option>
                                        <option value="Diestro">Diestro</option>
                                        <option value="Zurdo">Zurdo</option>
                                        <option value="Ambidiestro">Ambidiestro</option>
                                    </select>

                                    <label for="nomPosicion">Posición:</label>
                                    <select id="nomPosicion" name="nomPosicion" class="form-select" required>
                                        <option value="">Elige...</option>
                                        <option value="Portero">Portero</option>
                                        <option value="Defensa">Defensa</option>
                                        <option value="MedioCampo">Medio Campo</option>
                                        <option value="Delantero">Delantero</option>
                                    </select>

                                    <label for="foto">Foto aspirante:</label>
                                    <input type="file" class="form-control" id="archivoImagen" name="archivoImagen"
                                        required>

                                    <label for="categoria">Categoría:</label>
                                    <select class="form-select" id="categoria" required>
                                        <option value="">Elige...</option>
                                        <option value="1">-- Categoria 1(4 a 7) --</option>
                                        <option value="2">-- Categoria 2(8 a 11) --</option>
                                        <option value="3">-- Categoria 3(12 a 15) --</option>
                                        <option value="4">-- Categoria 4(16 a 17) --</option>
                                        <option value="5">-- Categoria 5(18) --</option>
                                    </select>

                                    <label for="estado">Estado aspirante:</label>

                                </div>

                                <div class="partes">
                                    <h5>Documentos:</h5>
                                    <label for="archivoDatos">Tratamiento de datos:</label>
                                    <input type="file" class="form-control" id="archivoDatos" name="archivoDatos"
                                        required>

                                    <label for="archivoAutorizacion">Autorización médica:</label>
                                    <input type="file" class="form-control" id="archivoAutorizacion"
                                        name="archivoAutorizacion" required>

                                    <label for="archivoEps">Comprobante EPS:</label>
                                    <input type="file" class="form-control" id="archivoEps" name="archivoEps" required>
                                </div>

                                <div class="botones">
                                    <button type="submit" id="botonConfirmar"
                                        class="btn btn-main-action btn-success">Confirmar</button>
                                    <button type="button" class="btn btn-warning"
                                        data-bs-dismiss="modal">Cancelar</button>
                                </div>
                                <div class="botones">
                                    <button type="submit" id="botonConfirmar"
                                        class="btn btn-main-action btn-success">Confirmar</button>
                                    <button type="button" class="btn btn-danger">Suspender Alumno</button>
                                    <button type="button" class="btn btn-primary">Activar Alumno</button>
                                    <button type="button" class="btn btn-info">Generar carnet</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer class="pie">
        </footer>
    </div>
</body>
<!--Scripts de java y boostrap-->
<script>
    // Exponer variables de sesión para que plantilla.js pueda accederlas
    window.datosUsuario = {
        nombre: "<%= nombre1 %>",
        apellido: "<%= apellido1 %>"
    };
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/atsaNet/Vistas/script/plantilla.js"></script>
<script src="/atsaNet/Vistas/script/matricula.js"></script>


</html>