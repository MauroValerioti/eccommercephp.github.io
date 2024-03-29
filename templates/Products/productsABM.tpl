{include file="templates/header.tpl"}
<h1>Bienvenido: {$usuario->username}!!!</h1>

<a class="btn btn-danger" href="logout">logout</a>
<a class="btn btn-warning" href="usersView">Users</a>
    
<h2>Crear Producto</h2>

    <form action="createProduct" method="POST">
        <input type="text" name="nombre" id="nombre" placeholder="nombre del producto" value="">
        <input type="text" name="descripcion" id="descripcion" placeholder="descripcion del producto" value="">
        <input type="number" name="precio" id="precio" placeholder="precio del producto" value="">
        {if $usuario->admin != 0}
            <input type="text" name="image" id="image" placeholder="url de la imagen" value="">
        {/if}
        <input type="number" name="categoria" id="categoria" placeholder="categoria a la que pertenece el producto" value="">
        <input type="submit" class="btn btn-primary" value="Agregar">
    </form>


<h2>Modificar Producto</h2>

    <form action="updateProduct" method="POST">
        <input type="text" name="newName" id="newName" placeholder="nuevo nombre">
        <input type="text" name="newDescription" id="newDescription" placeholder="nueva descripcion">
        <input type="number" name="newPrice" id="newPrice" placeholder="nuevo precio">
        {if $usuario->admin != 0}
            <input type="text" name="newImage" id="newImage" placeholder="nueva imagen" value="">
        {/if}
        <input type="number" name="id" id="id" placeholder="id del producto">
        <input type="submit" class="btn btn-warning" value="Actualizar">
    </form>
    
    <a class="btn btn-dark" href="viewCategories">Ver Categorias</a>
    

<h1>{$titulo}</h1>

        {foreach from=$productosConCategoria item=$producto}
        <div class="show-product">
            <div>
                <img class="imagen" src="{$producto->imagen}" alt={$producto->nombre}>
            </div>
            <ul>        
                <li>Id: {$producto->id_producto}</li>
                <li>Nombre: {$producto->nombre} </li>
                <li>Descripcion: {$producto->descripcion}</li> 
                <li>Precio: ${$producto->precio}</li> 
                <li>Categoria: {$producto->categoria}</li> 
                
                <a class="btn btn-primary" href="viewProduct/{$producto->id_producto}">ver</a>
                <a class="btn btn-danger" href="deleteProduct/{$producto->id_producto}">Borrar</a>
            </ul>
        </div>
        {/foreach}

{include file="templates/footer.tpl"}