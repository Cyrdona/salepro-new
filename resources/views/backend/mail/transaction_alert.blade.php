<!DOCTYPE html>
<html>
<head>
    <title>Rapport des Transactions Récentes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #333;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #4CAF50;
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        h2 {
            color: #4CAF50;
            font-size: 20px;
            margin-top: 20px;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 5px;
        }

        ul {
            list-style-type: none;
            padding-left: 0;
        }

        li {
            background-color: #fff;
            margin: 10px 0;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        strong {
            color: #4CAF50;
        }

        .transaction-details {
            margin-top: 10px;
        }

        .modified-fields ul {
            padding-left: 20px;
            color: #d9534f;
        }

        .modified-fields li {
            font-style: italic;
        }

        .no-modifications {
            color: #5bc0de;
        }

        em {
            color: #aaa;
        }

        p {
            text-align: center;
            font-size: 14px;
            color: #777;
        }

        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #777;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Rapport des Transactions Récentes</h1>

    <h2>Transactions Récentes</h2>
    <ul>
        @foreach ($reportData['recent_transactions'] as $transaction)
            <li>
                <strong>Référence :</strong> {{ $transaction->reference_no }},
                <strong>Total :</strong> {{ $transaction->grand_total }},
                <strong>Date :</strong> {{ $transaction->created_at }},
                <strong>Caissier :</strong> {{ $transaction->cashier_name }}
            </li>
        @endforeach
    </ul>

    <h2>Transactions Mises à Jour</h2>
    <ul>
        @foreach ($reportData['updated_transactions'] as $item)
            <li>
                <strong>Référence :</strong> {{ $item['transaction']->reference_no }},
                <strong>Total :</strong> {{ $item['transaction']->grand_total }},
                <strong>Date Création :</strong> {{ $item['transaction']->created_at }},
                <strong>Dernière Modification :</strong> {{ $item['transaction']->updated_at }},
                <strong>Caissier :</strong> {{ $item['transaction']->cashier_name }},

                <div class="transaction-details">
                    @if(count($item['modified_fields']) > 0)
                        <div class="modified-fields">
                            <strong>Modifications :</strong>
                            <ul>
                                @foreach ($item['modified_fields'] as $field)
                                    <li>{{ $field }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @else
                        <div class="no-modifications">
                            <em>Aucune modification</em>
                        </div>
                    @endif
                </div>
            </li>
        @endforeach
    </ul>

    <h2>Transactions Supprimées</h2>
    <ul>
        @foreach ($reportData['deleted_transactions'] as $transaction)
            <li>
                <strong>Référence :</strong> {{ $transaction->reference_no }},
                <strong>Total :</strong> {{ $transaction->grand_total }},
                <strong>Date Suppression :</strong> {{ $transaction->deleted_at }},
                <strong>Caissier :</strong> {{ $transaction->cashier_name }}
            </li>
        @endforeach
    </ul>

    <p>Cordialement,</p>
    <p>Bardos Africa SARL</p>

    <div class="footer">
        <p>&copy; {{ \Carbon\Carbon::now()->year }} Bardos Africa SARL. Tous droits réservés.</p>
    </div>
</body>
</html>
