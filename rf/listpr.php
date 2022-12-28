<div class="col-xs-12 col-md-6 col-lg-4 mt-4">
    <div class="block-4 text-center border shadow p-3 mb-5 bg-white rounded" style="height: 22.5rem;">
        <figure class="block-4-image">

            <img src="/images/productos/<?php echo $fila['imagen']; ?>" alt="image placheholder" width="160px" class="img-fluid mt-1">
        </figure>
        <div class="block-4-text p-4 heigth-15">
            <h6>
                <?php echo $fila['nombre']; ?>
            </h6>
            <p class="mb-0">
                <?php echo $fila['descripcion']; ?>
            </p>

        </div>
    </div>
</div>