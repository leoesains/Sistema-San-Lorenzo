{if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
    {include 'header.admin.tpl'}
{/if}
{if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
    {include 'header.tpl'}
{/if}
<div class="titulo_mostrar_jugadores ancho">
    <p> PERFILES 
        {if {$datosJug->puesto} == "ARQUERO"}
            <b>ARQUEROS</b> 
        {/if}
        {if {$datosJug->puesto} == "DEFENSOR"}
            <b>DEFENSORES</b> 
        {/if}
        {if {$datosJug->puesto} == "VOLANTE"}
            <b>VOLANTES</b> 
        {/if}
        {if {$datosJug->puesto} == "DELANTERO"}
            <b>DELANTEROS</b> 
        {/if}
         TEMPORADA 2020
    </p>
</div>
<div class="contenedorPerfil">
    <div>
        <img class="imagen_perfil"src="{$datosJug->imagen}">
        {if {$isAdmin}} {* SI ES ADMINISTRADOR*}
            <h4><a class="btn btn-danger centrar btn_alta" href="editar_jugador/{$datosJug->id_jugador}"><b>Editar Jugador</b></a></h4>
            <h4><a class="btn btn-danger centrar btn_alta" href="eliminar_jugador/{$datosJug->id_jugador}"><b>Baja del Jugador</b></a></h4>
        {/if}
        {if {$datosJug->puesto} == "ARQUERO"}
            <h4><a class="btn btn-danger centrar btn_alta" href="ver_arqueros"><b>Volver</b></a>; 
        {/if}
        {if {$datosJug->puesto} == "DEFENSOR"}
            <h4><a class="btn btn-danger centrar btn_alta" href="ver_defensores"><b>Volver</b></a>; 
        {/if}
        {if {$datosJug->puesto} == "VOLANTE"}
            <h4><a class="btn btn-danger centrar btn_alta" href="ver_volantes"><b>Volver</b></a>; 
        {/if}
        {if {$datosJug->puesto} == "DELANTERO"}
            <h4><a class="btn btn-danger centrar btn_alta" href="ver_delanteros"><b>Volver</b></a>;
        {/if}
    </div>
    <div class="datosJugador">
        <p id="nombre_jugador_perfil">{$datosJug->nombre|upper}</p>
        <h1>{$datosJug->puesto}</h1>
        {if $datosJug->id_division == 1}
            <h3><b>PRIMERA DIVISIÓN</b></h3>
        {/if}
        {if $datosJug->id_division == 5}
            <h3><b>QUINTA DIVISIÓN</b></h3>
        {/if}
        {if $datosJug->id_division == 6}
            <h3><b>SEXTA DIVISIÓN</b></h3>
        {/if}
        {if $datosJug->id_division == 7}
            <h3><b>SÉPTIMA DIVISIÓN</b></h3>
        {/if}
        {if $datosJug->id_division == 8}
            <h3><b>OCTAVA DIVISIÓN</b></h3>
        {/if}
        {if $datosJug->id_division == 9}
            <h3><b>NOVENA DIVISIÓN</b></h3>
        {/if}
        {if $datosJug->id_division == 10}
            <h3><b>DÉCIMA DIVISIÓN</b></h3>
        {/if}
        <br><h4><b>EDAD</b></h4>
        <h3>{$datosJug->edad} años</h3>
        <h4><b>FECHA DE NACIMIENTO</b></h4>
        <h3>{$datosJug->fecha_nac}</h3>
        <h4><b>CARNET</b></h4>
        <h3>{$datosJug->carnet}</h3>
        <h4><b>CLUB AL QUE PERTENECE EL PASE</b></h4>
        <h3>{$datosJug->club_origen}</h3>
    </div>
    <div class="contenedorTablaJugadores">
        <div class="otros_perfiles">
            <p class="titulo_otros_perfiles"><b>OTROS PERFILES</b></p>
        </div>
        <div class="contenedorTablaJugadores">    
            <table class="table-fixed">
                <tbody>
                    <tr>
                        {foreach from=$listaJugadores item=jugador}
                            <td id="nombre">
                                <div class="col-sm">
                                    {if $jugador->puesto == "ARQUERO"}
                                        <h6><a  class="fila" href="ver_jugador_puesto/{$jugador->id_jugador}/{$jugador->puesto}">ARQ | {$jugador->nombre|upper}</a></h6>
                                    {/if}
                                    {if $jugador->puesto == "DEFENSOR"}
                                        <h6><a class="fila" href="ver_jugador_puesto/{$jugador->id_jugador}/{$jugador->puesto}">DEF | {$jugador->nombre|upper}</a></h6>
                                    {/if}
                                    {if $jugador->puesto == "VOLANTE"}
                                        <h6><a  class="fila" href="ver_jugador_puesto/{$jugador->id_jugador}/{$jugador->puesto}">VOL | {$jugador->nombre|upper}</a></h6>
                                    {/if}
                                    {if $jugador->puesto == "DELANTERO"}
                                        <h6><a  class="fila" href="ver_jugador_puesto/{$jugador->id_jugador}/{$jugador->puesto}">DEL | {$jugador->nombre|upper}</a></h6>
                                    {/if}
                                </div>
                            </td>
                        {/foreach}      
                    </tr>
                </tbody>
            </table>
        </div>    
    </div>
</div>
        
 
{include 'templates/footer.tpl'}