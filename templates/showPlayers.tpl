{if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
    {include 'header.admin.tpl'}
{/if}
{if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
    {include 'header.tpl'}
{/if}
{if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
    <div class="titulo_mostrar_jugadores">
        <p><b>JUGADORES</b> DEL CLUB PARA LA <b>TEMPORADA 2020</b></p>
    </div>
{/if}
{if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
    <div>
        <div class="centrar btn_alta">
            <h4><a class="btn btn-danger" href="agregar_jugador"><b>Alta Jugador</b></a></h4>
        </div>
    </div>
{/if}
<div class="conteiner contenedor">
    {foreach from=$listaJugadores item=jugador}
        <div class="contenedor_show_player centrar">
            <div class="centrar">
                <div class="alto">
                    <b class="fuente_nombre">{$jugador->nombre|upper}</b>
                </div>
                <img class="imagen_show_player" src="{$jugador->imagen}">
            </div>
            <div class="centrar puesto">
                <h5><b>{$jugador->puesto|upper}</b></h5>
            </div>
            {if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
                <div class="centrar">
                    <h4><a class="btn btn-danger" href="ver_jugador/{$jugador->id_jugador}"><b>Perfil</b></a></h4>
                </div>
            {/if}
            {if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
                <div class="centrar">
                    <h4><a class="btn btn-danger" href="ver_jugador/{$jugador->id_jugador}"><b>Ver | Edit | Baja</b></a></h4>
                </div>
            {/if}
        </div>
    {/foreach}  
</div>
 
{include 'footer.tpl'}