<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rapport quotidien des ventes</title>
</head>
<body>
    <h1>Rapport quotidien des ventes</h1>
    <p><strong>Total des ventes :</strong> {{ $reportData['total_sales'] }} </p>
    <p><strong>Total des paiements en espèces :</strong> {{ $reportData['total_cash'] }} </p>
    <p><strong>Total des dépenses :</strong> {{ $reportData['total_expenses'] }} </p>

    <h2>Produits supprimés</h2>
    <ul>
        @foreach ($reportData['deleted_products'] as $product)
            <li>{{ $product->name }} (Code: {{ $product->code }})</li>
        @endforeach
    </ul>

    <h2>Produits mis à jour</h2>
    <ul>
        @foreach ($reportData['updated_products'] as $product)
            <li>{{ $product->name }} (Code: {{ $product->code }})</li>
        @endforeach
    </ul>
</body>
</html>
