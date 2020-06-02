{include 'templates/header.admin.tpl'}
    <div id="form_delete_jugador">
        <label id="pregunta-eliminar-jugador">¿Está seguro que quiere Eliminar Definitivamente al jugador {$jugador->nombre}?</label>
        <div class="btn-eliminar-jugador">
            <a class="btn btn-danger btn-volver" href="confirmar_eliminar_jugador/{$jugador->id_jugador}"><b>Eliminar</b></a>;
            <a class="btn btn-danger btn-volver" href="listar_jugadores"><b>Volver</b></a>;
        </div>
    </div>
{include 'templates/footer.tpl'}
