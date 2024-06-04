<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="script.js" defer></script>
    <link rel="stylesheet" href="style1.css">
</head>
<body>
<div id="top">NAZWA BIURA PODRÓŻY - Panel Admina</div>
    <div id="main">
        <div id="oferta">
            <h1>Kreator Nowej Oferty</h1>
            <form action="nowaOferta.php" method="post">
                <div><span>Miasto </span><input type="text" name="miasto" id=""></div>
                <div><span>Kraj </span><input type="text" name="kraj" id=""></div>
                <div><span>Opis </span><textarea name="opis" id=""></textarea></div>
                <div><span>Wolne Miejsca </span><input type="number" name="miejsca" id=""></div>
                <div><span>Cena </span><input type="number" name="cena" id=""></div>
                <div><span>Zdjęcia </span><textarea name="zdjecia" cols="30" rows="5" placeholder="(umieść linki do zdjęć odzielając je przecinkiem)"></textarea></div>
                <input type="submit" value="Zatwierdź">
            </form>
            
        </div>
</body>
</html>