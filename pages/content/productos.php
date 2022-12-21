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

                    

                    <?php
                    for ($i = 1; $i <= 8; $i++) {
                    ?>
                        <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-4">
                            <div class="custom-block-wrap">
                                <img src="/images/productos/1.jpg" class="custom-block-image img-fluid" alt="">

                                <div class="custom-block">
                                    <div class="custom-block-body">
                                        <h5 class="mb-3">Producto N</h5>
                                        <p>Lorem Ipsum dolor sit amet, consectetur adipsicing kengan omeg kohm tokito</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php
                    }
                    ?>
                </div>
            </div>
        </section>



    </main>

    <?php



    ?>