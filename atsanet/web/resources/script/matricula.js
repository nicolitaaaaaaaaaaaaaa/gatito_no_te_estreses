const targets = document.querySelectorAll('[data-target]')
    const content = document.querySelectorAll('[data-content]')

    targets.forEach(target => {
        target.addEventListener('click', () => {

            content.forEach(c => {
                c.classList.remove('active');
            });

            const t = document.querySelector(target.dataset.target)
            t.classList.add('active');
        })
    })


// Toggle switch para mostrar texto de estado en la tabla
    document.addEventListener('DOMContentLoaded', function () {
        // Switch y texto de estado
        const estadoSwitch1 = document.getElementById('estadoSwitch1');
        const estadoTexto1 = document.getElementById('estadoTexto1');
        if (estadoSwitch1 && estadoTexto1) {
            estadoSwitch1.addEventListener('change', function () {
                if (this.checked) {
                    estadoTexto1.textContent = 'Activo';
                    estadoTexto1.classList.remove('text-danger');
                    estadoTexto1.classList.add('text-success');
                } else {
                    estadoTexto1.textContent = 'Inactivo';
                    estadoTexto1.classList.remove('text-success');
                    estadoTexto1.classList.add('text-danger');
                }
            });
        }

        // Botón Guardar cambios
        const formEstado = document.getElementById('ConfirmarCambiosEstado1');
        if (formEstado) {
            formEstado.addEventListener('submit', function (event) {
                event.preventDefault();
                if (window.Swal) {
                    Swal.fire({
                        title: '¿Guardar cambios?',
                        text: '¿Estás seguro de guardar los cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        confirmButtonText: 'Sí, guardar',
                        cancelButtonText: 'No, cancelar',
                        confirmButtonColor: '#1976d2',
                        cancelButtonColor: '#d33',
                        timer: 10000,
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire({
                                title: '',
                                text: 'Guardando cambios, espera un momento',
                                icon: 'success',
                                showConfirmButton: false,
                                timer: 1000,
                                didOpen: () => {
                                    Swal.showLoading();
                                }
                            });
                        }
                    });
                } else {
                    alert('¡Cambios guardados!');
                }
            });
        }

        // Toggle switch para mostrar texto de estado en el modal
        const editarEstado = document.getElementById('editarEstado');
        const editarEstadoTexto = document.getElementById('editarEstadoTexto');
        if (editarEstado && editarEstadoTexto) {
            editarEstado.addEventListener('change', function () {
                if (this.checked) {
                    editarEstadoTexto.textContent = 'Activo';
                    editarEstadoTexto.classList.remove('text-danger');
                    editarEstadoTexto.classList.add('text-success');
                } else {
                    editarEstadoTexto.textContent = 'Inactivo';
                    editarEstadoTexto.classList.remove('text-success');
                    editarEstadoTexto.classList.add('text-danger');
                }
            });
        }

        // Modal: Guardar cambios en edición de posición
        const formPosicion = document.getElementById("formPosicion");
        if (formPosicion) {
            formPosicion.addEventListener("submit", function (event) {
                event.preventDefault();
                if (window.Swal) {
                    Swal.fire({
                        title: '¿Guardar cambios?',
                        text: '¿Estas seguro de guardar los cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        confirmButtonText: 'Sí, guardar',
                        cancelButtonText: 'No, cancelar',
                        confirmButtonColor: '#1976d2',
                        cancelButtonColor: '#d33',
                        timer: 10000,
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire({
                                title: '',
                                text: 'Guardando cambios, espera un momento',
                                icon: 'success',
                                showConfirmButton: false,
                                timer: 1000,
                                didOpen: () => {
                                    Swal.showLoading();
                                }
                            });
                        }
                    });
                } else {
                    alert('¡Cambios guardados!');
                }
            });
        }
    });