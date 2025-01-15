<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rapport quotidien des ventes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }
        h1 {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        h2 {
            color: #4CAF50;
            margin-top: 20px;
        }
        p {
            font-size: 16px;
            margin: 10px 0;
        }
        ul {
            list-style-type: none;
            padding-left: 0;
        }
        li {
            background-color: #fff;
            margin: 5px 0;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .empty-message {
            color: #777;
            font-style: italic;
        }
    </style>
</head>
<body>
    <h1>Rapport quotidien des ventes</h1>
    <p><strong>Total des ventes :</strong> {{ $reportData['total_sales'] }} </p>
    <p><strong>Total des paiements en espèces :</strong> {{ $reportData['total_cash'] }} </p>
    <p><strong>Total des dépenses :</strong> {{ $reportData['total_expenses'] }} </p>

    <h2>Produits créés aujourd'hui</h2>
    @if(count($reportData['created_products']) > 0)
        <ul>
            @foreach ($reportData['created_products'] as $product)
                <li>{{ $product->name }} (Code: {{ $product->code }})</li>
            @endforeach
        </ul>
    @else
        <p class="empty-message">Aucun produit créé aujourd'hui.</p>
    @endif

    <h2>Produits mis à jour aujourd'hui</h2>
    @if(count($reportData['updated_products']) > 0)
        <ul>
            @foreach ($reportData['updated_products'] as $product)
                <li>{{ $product->name }} (Code: {{ $product->code }})</li>
            @endforeach
        </ul>
    @else
        <p class="empty-message">Aucun produit mis à jour aujourd'hui.</p>
    @endif
</body>
</html>
