{if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
    {include 'header.admin.tpl'}
{/if}
{if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
    {include 'header.tpl'}
{/if}
    <div class="text-center">
        <p id="error">Mensaje</p>
        <h2>{$mensaje}</h2>
        <a class="btn btn-danger" href="listar_divisiones"><b>Volver</b></a>;
        {*<img src="images/Escudo transparente.png">*}
         
    </div>
{include 'templates/footer.tpl'}