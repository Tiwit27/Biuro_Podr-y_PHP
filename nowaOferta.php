<?php
if(!empty($_POST['miasto']) && !empty($_POST['kraj']) && !empty($_POST['opis']) && !empty($_POST['miejsca']) && !empty($_POST['cena']) && !empty($_POST['zdjecia']))
{
    $conn = mysqli_connect('localhost', 'root', '', 'biuro_podrozy') or die ("Błąd połączenia z bazą danych");
    $countryExist = mysqli_query($conn,"SELECT panstwa.id, panstwa.nazwa_panstwa FROM panstwa");
    $exist = 0;
    while($row = mysqli_fetch_array($countryExist))
    {
        if(strtolower($row[1]) == strtolower($_POST['kraj']))
        {
            $exist = $row[0];
            break;
        }
    }
    if($exist != 0)
    {
        $miasto = $_POST['miasto'];
        $opis = $_POST['opis'];
        $miejsca = $_POST['miejsca'];
        $cena = $_POST['cena'];
        $zdjecia = explode(',', $_POST['zdjecia']);
        $result = mysqli_query($conn, "INSERT INTO `oferty`(`Miasto`, `Kraj`, `opis`, `miejsca`, `cena`) VALUES ('$miasto','$exist','$opis','$miejsca','$cena')");
        $lastIndex = mysqli_query($conn, "SELECT oferty.id FROM `oferty` ORDER BY oferty.id DESC LIMIT 1;");
        if($row = mysqli_fetch_array($lastIndex))
        {
            $idOferty = $row[0];
        }
        for ($i=0; $i < count($zdjecia); $i++) 
        { 
            $photo = $zdjecia[$i];
            $addPhotos = mysqli_query($conn, "INSERT INTO `zdjecia`(`id_oferty`, `adres_url`) VALUES ('$idOferty','$photo')");
        }
        header("Location: stronaAdmina.php");
    }
    else
    {
        $miasto = $_POST['miasto'];
        $panstwo = $_POST['kraj'];
        $opis = $_POST['opis'];
        $miejsca = $_POST['miejsca'];
        $cena = $_POST['cena'];
        $countryAdd = mysqli_query($conn, "INSERT INTO `panstwa`(`nazwa_panstwa`) VALUES ('$panstwo')");
        $lastIndex = mysqli_query($conn, "SELECT panstwa.id FROM `panstwa` ORDER BY panstwa.id DESC LIMIT 1;");
        if($row = mysqli_fetch_array($lastIndex))
        {
            $idPanstwa = $row[0];
        }
        $zdjecia = explode(',', $_POST['zdjecia']);
        $result = mysqli_query($conn, "INSERT INTO `oferty`(`Miasto`, `Kraj`, `opis`, `miejsca`, `cena`) VALUES ('$miasto','$idPanstwa','$opis','$miejsca','$cena')");
        $lastIndex = mysqli_query($conn, "SELECT oferty.id FROM `oferty` ORDER BY oferty.id DESC LIMIT 1;");
        if($row = mysqli_fetch_array($lastIndex))
        {
            $idOferty = $row[0];
        }
        for ($i=0; $i < count($zdjecia); $i++) 
        { 
            $photo = $zdjecia[$i];
            $addPhotos = mysqli_query($conn, "INSERT INTO `zdjecia`(`id_oferty`, `adres_url`) VALUES ('$idOferty','$photo')");
        }
        echo "Dodaj zdjęcie państwa:";
        echo "<form action='dodajZdjeciePanstwa.php' method='post'>
        <div><span>Zdjęcia </span><textarea name='zdjecie_panstwa'; cols='30' rows='3'></textarea></div>
        <input type='submit' value='Zatwierdź'>
    </form>";
    }
}
?>