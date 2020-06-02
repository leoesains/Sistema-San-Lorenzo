{if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
    {include 'header.admin.tpl'}
{/if}
{if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
    {include 'header.tpl'}
{/if}
    <div class="text-center">
        <p id="error">Error</p>
        <h2>{$mensaje}</h2>
        <img src="images/errores/error_icon.png"> 
    </div>
{include 'templates/footer.tpl'}