<?php
ReadOffers();
function ReadOffers()
{
    $conn = mysqli_connect('localhost', 'root', '', 'biuro_podrozy') or die ("Błąd połączenia z bazą danych");
    $result = mysqli_query($conn, "SELECT oferty.id, miasto, panstwa.nazwa_panstwa, opis, miejsca, cena from oferty INNER JOIN panstwa on oferty.Kraj=panstwa.id") or die ("Błąd selecta");
    while($row = mysqli_fetch_array($result))
    {
        $picture = mysqli_query($conn, "SELECT adres_url from zdjecia where id_oferty = $row[0] limit 1") or die ("Błąd selecta");
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
}
ReadPhotos();
function ReadPhotos()
{
    $conn = mysqli_connect('localhost', 'root', '', 'biuro_podrozy') or die ("Błąd połączenia z bazą danych");
    $result = mysqli_query($conn,"SELECT panstwa.nazwa_panstwa, COUNT(oferty.id), SUM(oferty.miejsca), panstwa.zdjecie_panstwa FROM panstwa INNER JOIN oferty on panstwa.id = oferty.Kraj GROUP BY panstwa.id ORDER BY COUNT(oferty.id) DESC limit 10");
    while($row = mysqli_fetch_array($result))
    {
        $x = $row[3];
        echo "<script>
        var photos = $x
        var bestPhoto = document.querySelector('#bestPhoto')
        bestPhoto.src = photos";
    }
}

?>