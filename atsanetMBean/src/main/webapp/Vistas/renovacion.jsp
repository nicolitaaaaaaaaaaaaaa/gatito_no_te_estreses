<%-- 
    Document   : renovacion
    Created on : 18/06/2025, 10:24:00 a. m.
    Author     : adminsena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Renovacion Matricula</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

  <style>
    body {
      margin: 0px;
      padding: 0px;
      background: linear-gradient(135deg, #e3f0ff 0%, #b6e0fe 100%);
      color: #263a5e;
      font-family: 'Roboto', sans-serif;
      box-sizing: border-box;
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
      margin: 0px;
      padding: 0px;
      max-width: 100vw;
      min-height: 70vh;
      background: transparent;
      border: none;
    }

    #login-container {
      margin: 60px auto;
      padding: 80px;
      width: 600px;
      background: #fff;
      border-radius: 20px;
      box-shadow: 0 8px 32px 0 rgba(25, 118, 210, 0.13);
      transition: transform 0.4s;
      color: #263a5e;
    }

    #login-container:hover {
      transform: scale(1.001);
      box-shadow: 0 12px 40px 0 rgba(25, 118, 210, 0.18);
    }

    form {
      font-size: 1rem;
    }

    form .row {
      padding-bottom: 8px;
      color: #1976d2;
    }

    label {
      display: block;
      margin: 10px 0 5px;
      color: #1976d2;
      font-weight: 700;
      letter-spacing: 0.5px;
    }

    input,
    select {
     display: flex;
            align-items: flex;
            border-radius: 10px;
            background: #f0eeee;
            color: black;
            transition: border 0.2s, box-shadow 0.2s;
            box-shadow: 0 2px 8px rgba(33, 42, 51, 0.342);
    }

    .btn-dark,
    .btn-danger {
      background: linear-gradient(90deg, #ff5252 0%, #ff1744 100%);
      color: #fff !important;
      font-weight: bold;
      border: none;
      border-radius: 10px;
      transition: background 0.3s, color 0.3s, transform 0.2s;
      margin-bottom: 10px;
    }

    .btn-dark:hover,
    .btn-danger:hover {
      background: linear-gradient(90deg, #ff1744 0%, #ff5252 100%);
      color: #fff !important;
      transform: scale(1.03);
    }

    #piePagina {
      background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
      width: auto;
      height: 160px;
      border: none;
      color: white;
      box-shadow: 0 -4px 20px rgba(25, 118, 210, 0.10);
    }
  </style>
</head>

<body>
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


  <!--Parte central-->
  <div class="container d-flex justify-content-center text-white" id="contenedor">
    <!--Contenido-->
    <!--Espacio para el login-->
    <div id="login-container">
      <div class="col">
        <div class="row">
          <h1 class="m-4">Renovación de Matrícula</h1>
        </div>

        <div class="row">
          <form id="login-form" class="needs-validation" novalidate>
  <div class="col col-auto mb-3">
    <label class="form-label" for="tipoId">Tipo Id</label>
    <select class="form-select" id="tipoId" required>
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

  <div class="col col-auto mb-3">
    <label class="form-label" for="numeroId">Número ID</label>
    <input type="text" class="form-control" id="numeroId" placeholder="Ingresa Número"
      required pattern="\d{6,12}" title="Solo números, entre 6 y 12 dígitos">
    <div class="invalid-feedback">
      Ingresa un número válido (6 a 12 dígitos).
    </div>
  </div>

  <div class="col col-auto mb-3">
    <label class="form-label" for="code">Código</label>
    <input type="text" class="form-control" id="code" placeholder="Ingresa Código"
      required pattern="[A-Za-z0-9]{6,12}" title="Letras y números, entre 6 y 12 caracteres">
    <div class="invalid-feedback">
      Ingresa un código válido (6 a 12 letras o números).
    </div>
  </div> 

  <div class="row">
    <button type="submit" class="btn btn-dark p-3" id="validate-btn">Validar</button>
  </div>
</form>

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
</script>
        </div>
      </div>
    </div>
  </div>

  <!--Pie de pagina-->
  <div class="footer d-flex justify-content-center text-center align-items-center" id="piePagina">
    <h5>&copy; 2024 Club Deportivo Atlético Santander. Todos los derechos reservados.</h5>
</div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>
