<html>
<head><title>WooCommerce Development Docker</title></head>
  <body>
    <h1>WooCommerce Development Docker</h1>
    <h2>WordPress installs:</h2>
    <p>
      <ul>
      <?php
        $dirs = array_diff(scandir('wp'), array('..', '.'));
        foreach ($dirs as $dir):
          echo '<li><a href="wp/'. $dir .'">'. $dir .'</a></li>';
        endforeach;
      ?>
      </ul>
    </p>
    <h2>Tools:</h2>
    <ul>
      <li><a href="http://localhost:8092">phpmyadmin</a></li>
      <li><a href="http://localhost:8025">mailhog</a></li>
    </ul>
    <h2>PHP Info:</h2>
    <?php phpinfo(); ?>
  </body>
</html>
