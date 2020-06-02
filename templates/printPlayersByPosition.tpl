{if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
    {include 'header.admin.tpl'}
{/if}
{if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
    {include 'header.tpl'}
{/if}
    {if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
        <div class="titulo_mostrar_jugadores">
            <p>
                <b>
                    {if {$jugadoresXpuesto[0]->puesto} == "ARQUERO"} 
                        ARQUEROS
                    {/if}
                    {if {$jugadoresXpuesto[0]->puesto} == "DEFENSOR"} 
                        DEFENSORES
                    {/if}
                    {if {$jugadoresXpuesto[0]->puesto} == "VOLANTE"} 
                        VOLANTES
                    {/if}
                    {if {$jugadoresXpuesto[0]->puesto} == "DELANTERO"} 
                        DELANTEROS
                    {/if}
                </b> 
                DEL CLUB PARA LA TEMPORADA 2020
            </p>
        </div>
    {/if}
    {if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
    <div class="centrar btn_alta">
        <h4><a class="btn btn-danger" href="agregar_jugador"><b>Alta Jugador</b></a></h4>
    </div>
    {/if}
    <div class="conteiner contenedor">
        {foreach from=$jugadoresXpuesto item=jugXpos}
            <div class="contenedor_show_player">
                <div class="centrar">
                    <div class="alto">
                        <b class="fuente_nombre">{$jugXpos->nombre|upper}</b>
                    </div>
                    <img class="imagen_show_player" src="{$jugXpos->imagen}">
                </div>
                <div class="centrar puesto">
                    <h5><b>{$jugXpos->puesto|upper}</b></h5>
                </div>
                <div class="centrar">
                    {if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
                        <h4><a class="btn btn-danger" href="ver_jugador_puesto/{$jugXpos->id_jugador}/{$jugXpos->puesto}"><b>Ver | Edit | Baja</b></a></h4>
                    {/if}                
                    {if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
                        <h4><a class="btn btn-danger" href="ver_jugador_puesto/{$jugXpos->id_jugador}/{$jugXpos->puesto}"><b>Perfil</b></a></h4>
                    {/if}
                </div>
            </div>
        {/foreach}  
    </div>    



{include 'templates/footer.tpl'}