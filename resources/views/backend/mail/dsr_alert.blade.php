<!-- resources/views/backend/mail/dsr_alert.blade.php -->
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rapport Quotidien des Ventes</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }

        .container {
            width: 90%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header img {
            max-width: 150px;
            height: auto;
        }

        h1 {
            color: #5f6368;
            font-size: 24px;
            margin: 20px 0;
        }

        h2 {
            color: #4CAF50;
            font-size: 20px;
            margin: 15px 0 10px;
        }

        .section {
            margin-bottom: 20px;
        }

        .section p {
            font-size: 16px;
            color: #555;
        }

        .section ul {
            list-style: none;
            padding: 0;
        }

        .section li {
            background-color: #f0f0f0;
            padding: 8px;
            margin-bottom: 8px;
            border-radius: 4px;
            font-size: 16px;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            font-size: 14px;
            color: #888;
        }

        .footer a {
            color: #4CAF50;
            text-decoration: none;
        }

        .total {
            font-weight: bold;
            font-size: 18px;
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Section du logo -->
        <div class="header">
            <img src="https://yourdomain.com/path/to/logo.png" alt="Logo de l'entreprise">
        </div>

        <!-- Titre principal -->
        <h1>Rapport Quotidien des Ventes et Mouvements</h1>

        <!-- Ventes Totales -->
        <div class="section">
            <h2>Ventes Totales</h2>
            <p><strong>Total des ventes :</strong> <span class="total"><?php echo e(number_format($total_sales, 2)); ?> FCFA</span></p>
        </div>

        <!-- Paiements en Espèces -->
        <div class="section">
            <h2>Paiements en Espèces</h2>
            <p><strong>Total des paiements en espèces :</strong> <span class="total"><?php echo e(number_format($total_cash, 2)); ?> FCFA</span></p>
        </div>

        <!-- Dépenses Totales -->
        <div class="section">
            <h2>Dépenses Totales</h2>
            <p><strong>Total des dépenses :</strong> <span class="total"><?php echo e(number_format($total_expenses, 2)); ?> FCFA</span></p>
        </div>

        <!-- Produits Créés -->
        <div class="section">
            <h2>Produits Créés Aujourd'hui</h2>
            <ul>
                @foreach ($created_products as $product)
                    <li>{{ $product->name }}</li>
                @endforeach
            </ul>
        </div>

        <!-- Produits Mis à Jour -->
        <div class="section">
            <h2>Produits Mis à Jour Aujourd'hui</h2>
            <ul>
                @foreach ($updated_products as $product)
                    <li>{{ $product->name }}</li>
                @endforeach
            </ul>
        </div>

        <!-- Footer -->
        <div class="footer">
            <p>Merci d'utiliser notre système de gestion. <a href="https://yourwebsite.com">Visitez notre site web</a> pour plus d'informations.</p>
        </div>
    </div>
</body>
</html>
