
<?php get_page("home"); ?>

<?php
function get_page($page)
{
    ob_start();
?>
    <!doctype html>
    <html lang="es">
    <?php
    include("./rf/head.php");
    include("./rf/header.php");
    include("./pages/$page.php");
    include("./rf/footer.php");
    ?>
    </body>

    </html>
<?php
    $output = ob_get_clean();
    echo $output;
}

?>

