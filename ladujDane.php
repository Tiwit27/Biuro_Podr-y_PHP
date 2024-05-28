<?php
$conn = mysqli_connect('localhost', 'root', '', 'biuro_podrozy') or die ("Błąd połączenia z bazą danych");
$result = mysqli_query($conn, "SELECT * from oferty") or die ("Błąd selecta");
while($row = mysqli_fetch_array($result))
{
    $picture = mysqli_query($conn, "SELECT adres_url from zdjecia where id_zdjecia = $row[0]") or die ("Błąd selecta");
    $photo = mysqli_fetch_array($picture);
    $miasto = $row[1];
    $kraj = $row[2];
    $opis = $row[3];
    $miejsca = $row[4];
    $cena = $row[5];
    $zdjecie = $photo[0];
    echo "<div class='oferta'>
    <img src='$zdjecie'>
    <div class='opis'>
        <h1>$miasto</h1>
        <h2>$kraj</h2>
        <p>$opis</p>
        <h3>ilosc miejsc: $miejsca</h3>
        <h1>$cena zł/os</h1>
    </div>
</div>";
};
?>