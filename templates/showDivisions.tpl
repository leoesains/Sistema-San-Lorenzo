{if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
    {include 'header.admin.tpl'}
{/if}
{if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
    {include 'header.tpl'}
{/if}
{if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
    <div class="titulo_mostrar_jugadores">
        <p><b>DIVISIONES</b> DEL CLUB PARA LA TEMPORADA 2020</p>
    </div>
{/if}
{if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
    <div class="contenedor-btn-mensaje">
        <div>
            {if {$error}}
                <div class="alert alert-danger contenedor-alert-division">
                    {$error}
                </div>
            {/if}
        </div>
        
        <div class="centrar btn_alta">
            <h4><a class="btn btn-danger" href="agregar_division"><b>Alta División</b></a></h4>
        </div>
    </div>
{/if}
<div class="conteiner contenedor_divisiones">

    {foreach from=$listaDivisiones item=division} 
        <div class="contenedor_show_division centrar">
            <div class="centrar">
                <b class="fuente_nombre">{$division->nombre_div} DIVISIÓN</b>
            </div>
            <div class="centrar">
                <p>Edad Máxima {$division->edad_limite} años</p>
            </div>
            <div class="centrar">
                <p>Cantidad Máxima de jugadores en <b>Lista de Buena Fe</b>: {$division->limite_jugadores_LBF}</p>
            </div>
            <div class="centrar alto_excepciones">
                Observaciones: {$division->excepciones}
            </div>
            {if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
                <div class="centrar">
                    <a class="btn btn-danger" href="divisiones_jugadores/{$division->id_division}"><b>Ver Jugadores</b></a>
                </div>          
            {/if}
            {if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
                <div class="centrar">
                    <a class="btn btn-danger" href="divisiones_jugadores/{$division->id_division}"><b>Ver Jugadores</b></a>
                    <a class="btn btn-danger" href="editar_division/{$division->id_division}"><b>Modificar</b></a>
                    <a class="btn btn-danger" href="eliminar_division/{$division->id_division}"><b>Baja</b></a>
                </div>
                           
            {/if}
        </div>    
    {/foreach}
    
      
</div>
{include 'templates/footer.tpl'}