
const header = document.querySelector('header');
const footer = document.querySelector("footer");
const nombreUsuario = window.datosUsuario ? window.datosUsuario.nombre : '';
const apellidoUsuario = window.datosUsuario ? window.datosUsuario.apellido : '';
header.innerHTML = `

<a href="/atsaNet/InicioUsuario">
                <img src="/atsaNet/img/logo_club.png" style="width: 200px">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu"
                aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarMenu">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/atsaNet/ListarPostulantesServlet">Entrenadores</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Alumnos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Entrenamientos y Objetivos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sesión de Entrenamiento</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Reportes</a>
                    </li>
                </ul>
                <div class="d-flex align-items-center">
                    <div class="text-end me-3">
                        <span class="fw-bold text-white">
                            ${nombreUsuario} ${apellidoUsuario}
                        </span><br>

                        <span class="text-white-50" style="font-size: 0.9em;">Administrador</span>

                    </div>
                    <img src="/atsaNet/img/fotoPerfil.jpg" class="rounded-5 border border-3 border-light"
                        style="width: 55px; height: 55px; object-fit: cover;">
                    <button class="btn btn-outline-light ms-3" onclick="cerrarSesion()">Cerrar Sesión</button>
                </div>
            </div>

`;

footer.innerHTML = `
<p>
                © 2024 Club Deportivo Atlético Santander. Todos los derechos reservados.
                Este sitio web y su contenido son propiedad del Club Deportivo Atlético Santander
                Queda prohibida su reproducción total o parcial sin autorización previa por escrito.
                Síguenos en nuestras redes sociales para estar al tanto de noticias, eventos y actividades del club.
            </p>

`;
function cerrarSesion() {
            Swal.fire({
                text: '¿Estas seguro de cerrar sesión?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#2a6637',
                confirmButtonTextColor: '#ffffff ',
                cancelButtonColor: '#570808 ',
                confirmButtonText: 'Sí, quiero salir.',
                cancelButtonText: 'No, quiero quedarme.',
                timer: 10000,
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Saliendo',
                        text: '',
                        icon: 'success',
                        showConfirmButton: false,
                        timer: 1000,
                        didOpen: () => {
                            Swal.showLoading();
                        }
                    })
                    setTimeout(() => {
                        window.location.href = "/atsaNet/ValidarPersonalT";
                    }, 1000);
                }
            })
        }