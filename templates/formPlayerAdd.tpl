{include 'header.admin.tpl'}
    <form id="form_add_jugador" action="guardar_jugador" method="POST">
        <h1>DATOS DEL NUEVO JUGADOR</h1>
        <input type="namber" placeholder="INGRESE DNI" name="dni">
        <input type="text" class="mayuscula" placeholder="Ingrese Nombre y Apellido" name="name">
        <input type="text" placeholder="INGRESE EDAD" name="edad">
        <div>
            <label>INGRESE FECHA DE NACIMIENTO</label>
            <input type="date" placeholder="INGRESE FECHA DE NACIMIENTO" name="fechaNacimiento">
        </div>
        <input type="text" class="mayuscula" placeholder="INGRESE N° DE CARNET" name="numeroCarnet">
        <select name="puesto">
            <option disabled selected>SELECCIONE UN PUESTO</option>
            <option>ARQUERO</option>
            <option>DEFENSOR</option>
            <option>VOLANTE</option>
            <option>DELANTERO</option>
        </select>
        <select name="clubOrigen">
            <option disabled selected>CLUB ORIGEN DEL JUGADOR</option>
            <option>SAN LORENZO</option>
            <option>BOTAFOGO</option>
            <option>AGRARIA</option>
            <option>DEPORTIVO RAUCH</option>
        </select>
        <input type="text" placeholder="INGRESE TELÉFONO" name="telefono"> 
        <select name="categoria">
            <option disabled selected>SELECCIONE UNA DIVISIÓN</option>
            {foreach from=$listaDivisiones item=division} 
                <option>{$division->id_division}</option>
            {/foreach}
        </select>
        <input type="text" placeholder="INGRESE FOTO" name="foto">

        <button type="submit" class="btn btn-danger"><b>Enviar</b></button>
        
        <a class="btn btn-danger btn-volver" href="listar_jugadores"><b>Volver</b></a>
        {if {$error}}
            <div class="alert alert-danger contenedor-alert-usuario">
                {$error}
            </div>
        {/if}

    </form>
{include 'templates/footer.tpl'}