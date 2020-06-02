{include 'templates/header.admin.tpl'}
    <form id="form_edit_jugador" action="guardar_edicion_jugador" method="POST">
        <h1>MODIFIQUE LOS DATOS QUE DESEE CAMBIAR</h1>
        <input type="hidden" name="dni" value="{$jugador->id_jugador}">
        <div class="fila_form_edit_jugador">
            <label>NOMBRE COMPLETO</label>
            <input type="text" class="mayuscula" name="nombre" value="{$jugador->nombre|upper}">
        </div>
        <div class="fila_form_edit_jugador">
            <label>EDAD</label>
            <input type="number" name="edad" value="{$jugador->edad}">
        </div>
        <div class="fila_form_edit_jugador">
            <label>FECHA DE NACIMIENTO</label>
            <input type="text" name="fechaNacimiento" value="{$jugador->fecha_nac}">
        </div>
        <div class="fila_form_edit_jugador">
            <label>N° DE CARNET</label>
            <input type="text" name="numeroCarnet" value="{$jugador->carnet}">
        </div>
        <div class="fila_form_edit_jugador">
            <label>PUESTO</label >
            <select name="puesto" value="{$jugador->puesto}">
                <option selected>{$jugador->puesto}</option>
                <option>ARQUERO</option>
                <option>DEFENSOR</option>
                <option>VOLANTE</option>
                <option>DELANTERO</option>
            </select>
        </div>
        <div class="fila_form_edit_jugador">
        <label>CLUB AL QUE PERTENECE EL PASE</label>
        <select name="clubOrigen" value="{$jugador->club_origen}">
            <option selected>{$jugador->club_origen}</option>
            <option>SAN LORENZO</option>
            <option>BOTAFOGO</option>
            <option>AGRARIA</option>
            <option>DEPORTIVO RAUCH</option>
        </select>
        </div>
        <div class="fila_form_edit_jugador">
            <label>TELÉFONO</label>
            <input type="text" name="telefono" value="{$jugador->telefono}">
        </div>
        <div class="fila_form_edit_jugador">
            <label>DIVISIÓN</label>
            {*<input type="text" name="categoria" value="{$jugador->id_division}">*}
            <select name="categoria" value="{$jugador->id_division}">
                <option selected>{$jugador->id_division}</option>
                {foreach from=$listaDivisiones item=division} 
                    <option>{$division->id_division}</option>
                {/foreach}
            </select>
        </div>
        <div class="fila_form_edit_jugador">
            <label>FOTO</label>
            <input type="text" name="foto" value="{$jugador->imagen}">
        </div>
        <div class="fila_form_edit_jugador contenedor-btn-mensaje">
            <div>
                {if {$error}}
                    <div class="alert alert-danger contenedor-alert-edit-exit">
                        {$error}
                    </div>
                {/if}
            </div>
            <div>
                <button type="submit" class="btn btn-danger btn-volver"><b>Enviar</b></button>
                <a class="btn btn-danger btn-volver btn-volver-edit-jug" href="listar_jugadores"><b>Volver</b></a>;
            </div>
        </div>

        
    </form>
{include 'footer.tpl'}    
