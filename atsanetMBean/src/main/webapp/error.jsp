<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Club Deportivo Atlético Santander</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            background: #f4f6fb;
            color: #263a5e;
            font-family: 'Roboto', sans-serif;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .error-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(25, 118, 210, 0.10);
            padding: 30px;
            max-width: 600px;
            width: 100%;
            text-align: center;
        }
        
        h1 {
            color: #dc3545;
            margin-bottom: 20px;
            font-weight: bold;
        }
        
        .error-message {
            margin-bottom: 30px;
            color: #6c757d;
        }
        
        .btn-volver {
            background: linear-gradient(90deg, #1976d2 0%, #63a4ff 100%);
            border: none;
            padding: 10px 20px;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-volver:hover {
            background: linear-gradient(90deg, #1565c0 0%, #4d8ef7 100%);
            transform: translateY(-2px);
        }
        
        .error-img {
            max-width: 200px;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <img src="/atsaNet/img/logo_club.png" alt="Logo" class="error-img">
        <h1>¡Oops! Ha ocurrido un error</h1>
        <div class="error-message">
            <p>Lo sentimos, ha ocurrido un error mientras procesábamos su solicitud.</p>
            <% if(exception != null) { %>
            <p><strong>Detalle del error:</strong> <%= exception.getMessage() %></p>
            <% } %>
        </div>
        <a href="/atsaNet/InicioUsuario" class="btn btn-primary btn-volver">Volver al Inicio</a>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
