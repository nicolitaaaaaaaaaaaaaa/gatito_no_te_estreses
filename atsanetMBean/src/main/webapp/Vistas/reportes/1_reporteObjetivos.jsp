<%-- 
    Document   : 1_reporteObjetivos
    Created on : 24 jun 2025, 9:15:04 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reporte de Objetivos</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <style>v
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
    <h2>Generar Reporte de Objetivos</h2>

    
    <div>
      <h4 class="section-title">Reporte Individual de Objetivos</h4>
      <div class="row">
        <div class="col-md-6">
          <label for="categoriaIndividual" class="form-label">Categoría:</label>
          <select class="form-select" id="categoriaIndividual" onchange="activarAlumno()">
            <option value="">Seleccione una categoría</option>
            <option value="Infantil">Infantil</option>
            <option value="Prejuvenil">Prejuvenil</option>
            <option value="Juvenil">Juvenil</option>
            <option value="Única">Única</option>
          </select>
          </div>
          <div class="col-md-6">
          <label for="grupoIndividual" class="form-label">Grupo:</label>
          <select class="form-select" id="grupoIndividual" onchange="activarAlumno()">
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
      <button class="btn btn-primary mt-3" onclick="generarReporteObjetivosIndividual()">Generar Reporte Individual de Objetivos</button>
    </div>


    
    <div class="mt-5">
      <h4 class="section-title">Reporte Grupal de Objetivos</h4>
      <div class="row">
        <div class="col-md-6">
          <label for="categoriaGrupo" class="form-label">Categoría:</label>
          <select class="form-select" id="categoriaGrupo">
            <option value="">Seleccione una categoría</option>
            <option value="Infantil">Infantil</option>
            <option value="Prejuvenil">Prejuvenil</option>
            <option value="Juvenil">Juvenil</option>
            <option value="Única">Única</option>
          </select>
        </div>
        <div class="col-md-6">
          <label for="grupoGrupo" class="form-label">Grupo:</label>
          <select class="form-select" id="grupoGrupo">
            <option value="">Seleccione un grupo</option>
            <option value="A">Grupo A</option>
            <option value="B">Grupo B</option>
            <option value="C">Grupo C</option>
          </select>
        </div>
      </div>
      <button class="btn btn-primary mt-3" onclick="generarReporteObjetivosGrupo()">Generar Reporte Grupal de Objetivos</button>
    </div>

    <div id="reporte" class="mt-4"></div>
  </div>

  <script>

function activarAlumno() {
  const categoriaIndividual = document.getElementById("categoriaIndividual").value;
  const grupoIndividual = document.getElementById("grupoIndividual").value;
  const nombreAlumno = document.getElementById("nombreAlumno");

  
  if (categoriaIndividual && grupoIndividual) {
    nombreAlumno.disabled = false;
  } else {
    
    nombreAlumno.disabled = true;
    nombreAlumno.value = "";  
  }
}

    
    const datosObjetivos = {
      "Juan Pérez": {
        lunes: { cumplidos: 3, total: 4 },
        martes: { cumplidos: 4, total: 4 },
        miercoles: { cumplidos: 3, total: 4 },
        jueves: { cumplidos: 3, total: 4 },
        viernes: { cumplidos: 4, total: 4 }
      },
      "Ana García": {
        lunes: { cumplidos: 2, total: 4 },
        martes: { cumplidos: 3, total: 4 },
        miercoles: { cumplidos: 2, total: 4 },
        jueves: { cumplidos: 4, total: 4 },
        viernes: { cumplidos: 3, total: 4 }
      },
      "Pedro Martínez": {
        lunes: { cumplidos: 4, total: 4 },
        martes: { cumplidos: 4, total: 4 },
        miercoles: { cumplidos: 4, total: 4 },
        jueves: { cumplidos: 3, total: 4 },
        viernes: { cumplidos: 3, total: 4 }
      },
      "Lucía Fernández": {
        lunes: { cumplidos: 3, total: 4 },
        martes: { cumplidos: 3, total: 4 },
        miercoles: { cumplidos: 4, total: 4 },
        jueves: { cumplidos: 4, total: 4 },
        viernes: { cumplidos: 4, total: 4 }
      },
      "Carlos Gómez": {
        lunes: { cumplidos: 4, total: 4 },
        martes: { cumplidos: 4, total: 4 },
        miercoles: { cumplidos: 4, total: 4 },
        jueves: { cumplidos: 4, total: 4 },
        viernes: { cumplidos: 3, total: 4 }
      },
      "Sofía Pérez": {
        lunes: { cumplidos: 3, total: 4 },
        martes: { cumplidos: 2, total: 4 },
        miercoles: { cumplidos: 3, total: 4 },
        jueves: { cumplidos: 3, total: 4 },
        viernes: { cumplidos: 4, total: 4 }
      }
    };

    
    function generarReporteObjetivosIndividual() {
      const nombreAlumno = document.getElementById("nombreAlumno").value;

      if (nombreAlumno === "") {
        Swal.fire({
          icon: 'warning',
          title: '¡Alerta!',
          text: 'Debes seleccionar categoria, grupo y alumno.',
          confirmButtonText: 'Aceptar',
          showConfirmButton: true
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
        const alumno = datosObjetivos[nombreAlumno];
        let tablaObjetivos = '';
        let totalCumplidos = 0;
        let totalNoCumplidos = 0;
        let totalObjetivos = 0;

        
        for (let dia in alumno) {
          const { cumplidos, total } = alumno[dia];
          totalCumplidos += cumplidos;
          totalNoCumplidos += total - cumplidos;
          totalObjetivos += total;

          tablaObjetivos += `
            <tr>
              <td>${dia.charAt(0).toUpperCase() + dia.slice(1)}</td>
              <td>${cumplidos}/${total}</td>
            </tr>
          `;
        }

       
        document.getElementById("reporte").innerHTML = `
          <h3>Reporte Individual de Objetivos</h3>
          <p><strong>Alumno:</strong> ${nombreAlumno}</p>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Día</th>
                <th>Objetivos Cumplidos</th>
              </tr>
            </thead>
            <tbody>
              ${tablaObjetivos}
            </tbody>
          </table>
          <p><strong>Total Objetivos Cumplidos:</strong> ${totalCumplidos}</p>
          <p><strong>Total Objetivos No Cumplidos:</strong> ${totalNoCumplidos}</p>
          <p><strong>Total Objetivos que Debió Cumplir:</strong> ${totalObjetivos}</p>
        `;

        
        Swal.fire({
          title: 'Reporte Generado',
          text: 'El reporte individual de objetivos ha sido generado correctamente.',
          icon: 'success',
          confirmButtonText: 'Cerrar'
        });
      }, 5000); 
    }
    



    function generarReporteObjetivosGrupo() {
      const categoria = document.getElementById("categoriaGrupo").value;
      const grupo = document.getElementById("grupoGrupo").value;

      if (!categoria || !grupo) {
        Swal.fire({
          icon: 'warning',
          title: '¡Alerta!',
          text: 'Debes seleccionar una categoria y un grupo.',
          confirmButtonText: 'Aceptar',
          showConfirmButton: true
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
        let tablaAlumnos = '';
        let totalCumplidosGrupo = 0;
        let totalNoCumplidosGrupo = 0;
        let totalObjetivosGrupo = 0;

        
        for (let alumnoNombre in datosObjetivos) {
          const alumno = datosObjetivos[alumnoNombre];
          let totalCumplidos = 0;
          let totalNoCumplidos = 0;
          let totalObjetivos = 0;

          
          for (let dia in alumno) {
            const { cumplidos, total } = alumno[dia];
            totalCumplidos += cumplidos;
            totalNoCumplidos += total - cumplidos;
            totalObjetivos += total;
          }

          
          tablaAlumnos += `
            <tr>
              <td>${alumnoNombre}</td>
              <td>${totalCumplidos}/${totalObjetivos}</td>
            </tr>
          `;

          
          totalCumplidosGrupo += totalCumplidos;
          totalNoCumplidosGrupo += totalNoCumplidos;
          totalObjetivosGrupo += totalObjetivos;
        }

        
        document.getElementById("reporte").innerHTML = `
          <h3>Reporte Grupal de Objetivos</h3>
          <p><strong>Categoría:</strong> ${categoria}</p>
          <p><strong>Grupo:</strong> ${grupo}</p>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Alumno</th>
                <th>Objetivos Cumplidos</th>
              </tr>
            </thead>
            <tbody>
              ${tablaAlumnos}
            </tbody>
          </table>
          <p><strong>Total Objetivos Cumplidos del Grupo:</strong> ${totalCumplidosGrupo}</p>
          <p><strong>Total Objetivos No Cumplidos del Grupo:</strong> ${totalNoCumplidosGrupo}</p>
          <p><strong>Total Objetivos que Debió Cumplir el Grupo:</strong> ${totalObjetivosGrupo}</p>
        `;

       
        Swal.fire({
          title: 'Reporte Generado',
          text: 'El reporte grupal de objetivos ha sido generado correctamente.',
          icon: 'success',
          confirmButtonText: 'Cerrar'
        });
      }, 5000); 
    }

    
    function irAlPerfil() {
      window.location.href = "../1_inicioAdministrador.html"; 
    }
  </script>
</body>
</html>