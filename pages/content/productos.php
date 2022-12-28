    <main id="productos">

        <section class="section-padding" id="section_3">
            <div class="container">
                <div class="row">

                    <div class="col-lg-12 col-12 text-center mb-0">
                        <h2>Productos</h2>
                    </div>

                    <div class="col-lg-12 col-12 text-center mb-4">
                        <form class="custom-form search-form" action="#" method="post" role="form">
                            <input class="form-control" type="search" placeholder="Search" aria-label="Search">

                            <button type="submit" class="form-control">
                                <i class="bi-search"></i>
                            </button>
                        </form>
                    </div>


                    <div class="container-fluid">
                        <div class="row mt-5 mx-5   ">
                            <?php
                            include("../sesion/conexion.php");
                            $resultado = $conex->query("select * from listarproductos") or die($conex->error);
                            while ($fila = mysqli_fetch_array($resultado)) {
                            ?>
                                <?php
                                include("../rf/listpr.php");
                                ?>
                            <?php } ?>
                        </div>
                    </div>


                </div>
            </div>
        </section>



    </main>