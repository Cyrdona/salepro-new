<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alerte Objectif de Vente Quotidien Non Atteint</title>
</head>
<body>
    <h2>Alerta de Vente Quotidienne Non Atteinte</h2>
    <p>Il y a {{ $number_of_products }} produits qui n'ont pas atteint leur objectif de vente quotidien.</p>
    <table border="1">
        <thead>
            <tr>
                <th>Nom du produit</th>
                <th>Code du produit</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($products as $product)
                <tr>
                    <td>{{ $product->name }}</td>
                    <td>{{ $product->code }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
