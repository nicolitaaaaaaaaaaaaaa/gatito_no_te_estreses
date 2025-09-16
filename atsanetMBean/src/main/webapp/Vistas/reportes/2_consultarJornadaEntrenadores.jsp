<%-- 
    Document   : 2_consultarJornadaEntrenadores
    Created on : 24 jun 2025, 9:16:07 p. m.
    Author     : tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mi Información</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background-color: white;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .container {
      width: 100%;
      max-width: 800px;
      padding: 20px;
      background-color: #171846;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    h1 {
      font-size: 2rem;
      color: #41B3E8;
      margin-bottom: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    table, th, td {
      border: 1px solid #ddd;
    }

    th, td {
      padding: 12px;
      text-align: left;
      color: white;
    }

    th {
      background-color: #41B3E8;
    }

    td {
      background-color: #2C2A54;
    }

    .btn {
      display: inline-block;
      width: 45%;
      padding: 10px;
      background-color: #E70209;
      color: #fff;
      border: none;
      border-radius: 4px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s;
      font-weight: bold;
      margin: 10px 5px 0;
    }

    .btn:hover {
      background-color: #A1090B;
    }

    .btn:active {
      background-color: #9D9D9D;
    }

    .btn-back {
      width: 100%;
      padding: 10px;
      background-color: #E70209;
      color: #fff;
      border: none;
      border-radius: 4px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s;
      font-weight: bold;
      margin-top: 20px;
    }

    .btn-back:hover {
      background-color: #A1090B;
    }

    form {
      display: none;
      margin-top: 20px;
    }

    form.active {
      display: block;
    }

    form input, form select {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 1rem;
    }

    form button {
      width: 100%;
      padding: 10px;
      background-color: #41B3E8;
      color: white;
      border: none;
      border-radius: 4px;
      font-size: 1rem;
      cursor: pointer;
      font-weight: bold;
    }

    form button:hover {
      background-color: #2C88C1;
    }

    .alarmas {
      background-color: #F4D03F;
      padding: 10px;
      margin-top: 20px;
      border-radius: 4px;
      font-size: 1.2rem;
      color: #2C2A54;
    }
  </style>
  
  
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <script>
    const entrenador = {
      nombre: "Martín Acevedo",
      cedula: "1070751009",
      horario: "Lunes - Viernes, 8 AM - 4 PM",
      categorias: ["Prejuvenil (8 a 11 años)", "Juvenil (12 a 17 años)"],
      jornada: "Mañana"
    };
    
   
    function mostrarInformacion() {
      const datosEntrenador = {
        nombres: "Martín Acevedo",
        apellidos: "Pérez",
        fechaNacimiento: "15/03/1990",
        tipoID: "Cédula de Ciudadanía",
        numeroID: "1070751009",
        sexo: "Masculino",
        direccion: "Calle 123c128 c26",
        celular: "3001234567",
        email: "martinacevedo@gmail.com",
        tipoSangre: "O+",
        rh: "+",
        eps: "SURA",
        usuario: "MartinA",
      };

      
      const formulario = document.getElementById("form-informacion");
      formulario.classList.add("active");

      
      for (const key in datosEntrenador) {
        const input = formulario.querySelector(`[name="${key}"]`);
        if (input) input.value = datosEntrenador[key];
      }
    } 
  </script>
</head>
<body>
  <div class="container">
    <h1>Mi Información </h1>
    <table>
      <tr>
        <th>Nombre</th>
        <td>Martín Acevedo</td>
      </tr>
      <tr>
        <th>ID</th>
        <td>1070751009</td>
      </tr>
      <tr>
        <th>Horario</th>
        <td>Lunes - Viernes, 8 AM - 4 PM</td>
      </tr>
      <tr>
        <th>Categorías</th>
        <td>Prejuvenil, Juvenil</td>
      </tr>
      <tr>
        <th>Jornada</th>
        <td>Mañana</td>
      </tr>
    </table>
    <div class="alarmas" id="alarmas"></div>
    <button class="btn" onclick="mostrarInformacion()">Ver Información personal</button>
    <button class="btn-back" onclick="volverAlInicio()">Volver al Inicio</button>

    <!-- Formulario de información -->
    <form id="form-informacion">
      <h2>Información del Entrenador</h2>
      <input type="text" name="nombres" placeholder="Nombres" readonly>
      <input type="text" name="apellidos" placeholder="Apellidos" readonly>
      <input type="text" name="fechaNacimiento" placeholder="Fecha de Nacimiento" readonly>
      <input type="text" name="tipoID" placeholder="Tipo de ID" readonly>
      <input type="text" name="numeroID" placeholder="Número de ID" readonly>
      <input type="text" name="sexo" placeholder="Sexo" readonly>
      <input type="text" name="direccion" placeholder="Dirección" readonly>
      <input type="text" name="celular" placeholder="Celular" readonly>
      <input type="text" name="email" placeholder="Correo Electrónico" readonly>
      <input type="text" name="tipoSangre" placeholder="Tipo de Sangre" readonly>
      <input type="text" name="rh" placeholder="RH" readonly>
      <input type="text" name="eps" placeholder="EPS" readonly>
      <input type="text" name="usuario" placeholder="Usuario" readonly>
      </form>

  <script>
    // Función para volver al inicio (como ejemplo, puedes adaptarlo)
    function volverAlInicio() {
      window.location.href = "../2_inicioEntrenador.html"; // Cambia la URL al inicio de tu sitio
    }
  </script>
</body>
</html>
