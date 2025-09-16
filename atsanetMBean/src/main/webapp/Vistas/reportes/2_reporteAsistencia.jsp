<%-- 
    Document   : 2_reporteAsistencia
    Created on : 24 jun 2025, 9:16:50 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reporte de Asistencia</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <style>
    body {
      background-color: #f4f7fc;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0;
      flex-direction: column;
    }

    .container {
      background-color: #ffffff;
      border-radius: 15px;
      padding: 30px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      width: 80%;
      max-width: 1000px;
      margin-bottom: 20px;
    }

    h2 {
      text-align: center;
      background-color: #41B3E8;
      color: #ffffff;
      padding: 15px;
      border-radius: 10px;
    }

    .form-label {
      font-weight: bold;
    }

    .btn-primary {
      background-color: #41B3E8;
      border-color: #41B3E8;
    }

    .btn-primary:hover {
      background-color: #3498db;
    }

    .section-title {
      font-weight: bold;
      color: #333;
      margin-top: 20px;
    }

    #reporte {
      margin-top: 20px;
    }

    .btn-profile {
      position: absolute;
      top: 20px;
      right: 20px;
      background-color: #41B3E8;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      color: white;
      font-weight: bold;
      cursor: pointer;
    }

    .btn-profile:hover {
      background-color: #3498db;
    }
  </style>
</head>

<body>

  <button class="btn-profile" onclick="irAlPerfil()">Ir al Perfil</button>

  <div class="container">
    <h2>Generar Reporte de Asistencia</h2>


    <div>
      <h4 class="section-title">Reporte Individual</h4>
      <div class="row">
        <div class="col-md-6">
          <label for="categoriaIndividual" class="form-label">Categoría:</label>
          <select class="form-select" id="categoriaIndividual" onchange="habilitarAlumno()">
            <option value="">Seleccione una categoría</option>
            <option value="Infantil">Infantil</option>
            <option value="Prejuvenil">Prejuvenil</option>
            <option value="Juvenil">Juvenil</option>
            <option value="Única">Única</option>
          </select>
        </div>
        <div class="col-md-6">
          <label for="grupoIndividual" class="form-label">Grupo:</label>
          <select class="form-select" id="grupoIndividual" onchange="habilitarAlumno()">
            <option value="">Seleccione un grupo</option>
            <option value="A">Grupo A</option>
            <option value="B">Grupo B</option>
            <option value="C">Grupo C</option>
          </select>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-md-12">
          <label for="nombreAlumno" class="form-label">Nombre del Alumno:</label>
          <select class="form-select" id="nombreAlumno" disabled>
            <option value="">Seleccione un alumno</option>
            <option value="Juan Pérez">Juan Pérez</option>
            <option value="Ana García">Ana García</option>
            <option value="Pedro Martínez">Pedro Martínez</option>
            <option value="Lucía Fernández">Lucía Fernández</option>
            <option value="Carlos Gómez">Carlos Gómez</option>
            <option value="Sofía Pérez">Sofía Pérez</option>
          </select>
        </div>
      </div>
      <button class="btn btn-primary mt-3" onclick="generarReporteIndividual()">Generar Reporte Individual</button>
    </div>


    <div class="mt-5">
      <h4 class="section-title">Reporte Grupal</h4>
      <div class="row">
        <div class="col-md-6">
          <label for="categoriaGrupo" class="form-label">Categoría:</label>
          <select class="form-select" id="categoriaGrupo" onchange="habilitarGrupo()">
            <option value="">Seleccione una categoría</option>
            <option value="Infantil">Infantil</option>
            <option value="Prejuvenil">Prejuvenil</option>
            <option value="Juvenil">Juvenil</option>
            <option value="Única">Única</option>
          </select>
        </div>
        <div class="col-md-6">
          <label for="grupoGrupo" class="form-label">Grupo:</label>
          <select class="form-select" id="grupoGrupo" onchange="habilitarGrupo()">
            <option value="">Seleccione un grupo</option>
            <option value="A">Grupo A</option>
            <option value="B">Grupo B</option>
            <option value="C">Grupo C</option>
          </select>
        </div>
      </div>
      <button class="btn btn-primary mt-3" onclick="generarReporteGrupo()">Generar Reporte Grupal</button>
    </div>

    <div id="reporte" class="mt-4"></div>
  </div>

  <script>

    const datosAsistencia = {
      "Juan Pérez": { dias: [1, 1, 0, 1, 1] },
      "Ana García": { dias: [1, 1, 1, 0, 1] },
      "Pedro Martínez": { dias: [0, 1, 1, 1, 0] },
      "Lucía Fernández": { dias: [1, 1, 1, 1, 1] },
      "Carlos Gómez": { dias: [1, 0, 1, 0, 1] },
      "Sofía Pérez": { dias: [0, 1, 0, 1, 1] }
    };


    function habilitarAlumno() {
      const categoria = document.getElementById("categoriaIndividual").value;
      const grupo = document.getElementById("grupoIndividual").value;
      const nombreAlumno = document.getElementById("nombreAlumno");


      if (categoria && grupo) {
        nombreAlumno.disabled = false;
      } else {
        nombreAlumno.disabled = true;
      }
    }


    function generarReporteIndividual() {
      const categoria = document.getElementById("categoriaIndividual").value;
      const grupo = document.getElementById("grupoIndividual").value;
      const nombreAlumno = document.getElementById("nombreAlumno").value;


      if (!categoria || !grupo || !nombreAlumno) {
        Swal.fire({
          title: 'Falta información',
          text: 'Por favor, seleccione la categoría, grupo y alumno.',
          icon: 'warning',
          confirmButtonText: 'Aceptar'
        });
        return;
      }


      Swal.fire({
        title: 'Generando reporte...',
        html: 'Por favor espere.',
        didOpen: () => {
          Swal.showLoading();
        }
      });


      setTimeout(() => {
        const alumno = datosAsistencia[nombreAlumno];
        const totalDias = alumno.dias.length;
        const asistencias = alumno.dias.filter(dia => dia === 1).length;
        const inasistencias = totalDias - asistencias;


        document.getElementById("reporte").innerHTML = `  
          <h3>Reporte Individual</h3>
          <p><strong>Nombre del Alumno:</strong> ${nombreAlumno}</p>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Lunes</th>
                <th>Martes</th>
                <th>Miércoles</th>
                <th>Jueves</th>
                <th>Viernes</th>
                <th>Días Asistidos</th>
                <th>Días Inasistidos</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>${alumno.dias[0]}</td>
                <td>${alumno.dias[1]}</td>
                <td>${alumno.dias[2]}</td>
                <td>${alumno.dias[3]}</td>
                <td>${alumno.dias[4]}</td>
                <td>${asistencias}</td>
                <td>${inasistencias}</td>
              </tr>
            </tbody>
          </table>`;


        Swal.fire({
          title: 'Reporte Generado',
          text: 'El reporte ha sido generado correctamente.',
          icon: 'success',
          confirmButtonText: 'Cerrar'
        });
      }, 3000);
    }


    function generarReporteGrupo() {
      const categoria = document.getElementById("categoriaGrupo").value;
      const grupo = document.getElementById("grupoGrupo").value;


      if (!categoria || !grupo) {
        Swal.fire({
          title: 'Falta información',
          text: 'Por favor, seleccione la categoría y el grupo.',
          icon: 'warning',
          confirmButtonText: 'Aceptar'
        });
        return;
      }


      Swal.fire({
        title: 'Generando reporte...',
        html: 'Por favor espere.',
        didOpen: () => {
          Swal.showLoading();
        }
      });


      setTimeout(() => {

        document.getElementById("reporte").innerHTML = `
          <h3>Reporte Grupal - Categoría ${categoria} - Grupo ${grupo}</h3>
          <p><strong>Asistencias de los Alumnos:</strong></p>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Alumno</th>
                <th>Lunes</th>
                <th>Martes</th>
                <th>Miércoles</th>
                <th>Jueves</th>
                <th>Viernes</th>
              </tr>
            </thead>
            <tbody>
              ${Object.entries(datosAsistencia).map(([nombre, datos]) => {
          return `
                  <tr>
                    <td>${nombre}</td>
                    <td>${datos.dias[0]}</td>
                    <td>${datos.dias[1]}</td>
                    <td>${datos.dias[2]}</td>
                    <td>${datos.dias[3]}</td>
                    <td>${datos.dias[4]}</td>
                  </tr>`;
        }).join('')}
            </tbody>
          </table>`;


        Swal.fire({
          title: 'Reporte Generado',
          text: 'El reporte ha sido generado correctamente.',
          icon: 'success',
          confirmButtonText: 'Cerrar'
        });
      }, 5000);
    }


    function irAlPerfil() {
      window.location.href = "../2_inicioEntrenador.html";
    }
  </script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>

</html>
