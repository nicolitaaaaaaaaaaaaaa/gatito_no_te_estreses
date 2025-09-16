<%-- 
    Document   : plantilla
    Created on : 29 jun 2025, 12:21:36 p. m.
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
        </main>
        <footer class="pie">
        </footer>
    </div>
</body>
<!--Scripts de java y boostrap-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
<script src="/atsaNet/Vistas/script/plantilla.js"></script>

</html>