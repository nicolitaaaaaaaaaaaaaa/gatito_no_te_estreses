<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
    <c:when test="${empty alumnos}">
        <option value="">No hay alumnos en esta categoría</option>
    </c:when>
    <c:otherwise>
        <option value="">Seleccione un alumno</option>
        <c:forEach var="alumno" items="${alumnos}">
            <option value="${alumno.idAlumno}">${alumno.nombreCompleto}</option>
        </c:forEach>
    </c:otherwise>
</c:choose>
