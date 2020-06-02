{include 'templates/header.admin.tpl'}
    
    <form id="form_add_jugador" action="guardar_edicion_division" method="POST">
        <h1>MODIFIQUE LOS DATOS QUE DESEA CAMBIAR</h1>
        <input type="hidden" name="id_division" value="{$division->id_division}">
        <label>NOMBRE</label>
        <input type="text" name="nombre_div" value="{$division->nombre_div}">
        <label>EDAD LÍMITE</label>
        <input type="text" name="edad_limite" value="{$division->edad_limite}">
        <label>CANTIDAD MÁX JUGADORES EN LBF</label>
        <input type="text" name="limite_jugadores_LBF" value="{$division->limite_jugadores_LBF}">
        <label>OBSERVACIONES / EXCEPCIONES</label>
        <textarea name="excepciones" value="{$division->excepciones}">{$division->excepciones}</textarea>
        <button type="submit" class="btn btn-danger btn-volver"><b>Enviar</b></button>
        <a class="btn btn-danger btn-volver" href="listar_divisiones"><b>Volver</b></a>;
        {if $error}
            <div class="alert alert-danger contenedor-alert-modif-div">
                {$error}
            </div>
        {/if} 
    </form>
    
{include 'templates/footer.tpl'}

