{if {$isAdmin}} {*SI ES UN ADMINISTRADOR*}
    {include 'header.admin.tpl'}
{/if}
{if {!$isAdmin}} {*SI NO ES UN ADMINISTRADOR*}
    {include 'header.home.tpl'}
{/if}
<div class="contenedorFrase">
    <h1>Institución dedicada a la Enseñanza del Deporte y la Formación Humana de niños, jóvenes y adultos</h1>
    <p class="frase">"Todos tenemos sueños, pero para que se vuelvan realidad se necesita una gran determinación, dedicación, autodisciplina y esfuerzo."</P>
</div>

    
{include 'templates/footer.tpl'}