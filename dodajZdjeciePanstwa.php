<?php
    $conn = mysqli_connect('localhost', 'root', '', 'biuro_podrozy') or die ("Błąd połączenia z bazą danych");
    $zdjecie_panstwa = $_POST['zdjecie_panstwa'];
    $result = mysqli_query($conn, "UPDATE `panstwa` SET `zdjecie_panstwa`='$zdjecie_panstwa' Order By panstwa.id DESC limit 1");
    header("Location: stronaAdmina.php");
?>