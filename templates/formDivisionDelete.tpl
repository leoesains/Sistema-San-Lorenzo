{include 'templates/header.admin.tpl'}
    <div id="form_delete_jugador">
        <label id="pregunta-eliminar-jugador">¿Está seguro que quiere Eliminar Definitivamente la categoria {$division->nombre_div}?</label>
        <div class="btn-eliminar-jugador">
            <a class="btn btn-danger btn-volver" href="confirmar_eliminar_division/{$division->id_division}"><b>Eliminar</b></a>;
            <a class="btn btn-danger btn-volver" href="listar_divisiones"><b>Volver</b></a>;
        </div>
    </div>
{include 'templates/footer.tpl'}