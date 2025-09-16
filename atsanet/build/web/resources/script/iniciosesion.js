
function mostrarMensajeBienvenida(message, redirectUrl) {
    const loginForm = document.getElementById("loginForm");
    const welcomeMessage = document.getElementById("welcomeMessage");
    const welcomeText = document.getElementById("welcomeText");

    loginForm.style.display = "none";
    welcomeMessage.style.display = "block";
    welcomeText.textContent = message;


    setTimeout(() => {
        location.href = redirectUrl;
    }, 3000);
}

function cerrarSesion() {
    Swal.fire({
        text: '¿Estas seguro de ir a la pagina principal?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#2a6637',
        confirmButtonTextColor: '#ffffff ',
        cancelButtonColor: '#570808 ',
        confirmButtonText: 'Si, quiero ir.',
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
                window.location.href = "/atsaNet/index.jsp";
            }, 1000);
        }
    })
}
