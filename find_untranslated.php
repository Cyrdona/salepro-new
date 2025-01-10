<?php

function findUntranslatedStrings($viewPath, $langFilePath) {
    // Read the language file and get all keys
    if (!file_exists($langFilePath)) {
        echo "Language file not found: $langFilePath\n";
        return;
    }

    $langKeys = include $langFilePath;
    if (!is_array($langKeys)) {
        echo "Invalid language file format: $langFilePath\n";
        return;
    }

    // Flatten the language array keys
    $flattenLangKeys = flattenArrayKeys($langKeys);

    // Find all `{{ trans('file.*') }}` occurrences in view files
    $pattern = "/{{\s*trans\('file\.([^\']+)'\)\s*}}/";
    $viewFiles = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($viewPath));
    $missingTranslations = [];

    foreach ($viewFiles as $file) {
        if ($file->isFile() && $file->getExtension() === 'php') {
            $content = file_get_contents($file->getRealPath());
            preg_match_all($pattern, $content, $matches);

            foreach ($matches[1] as $key) {
                if (!in_array($key, $flattenLangKeys)) {
                    $missingTranslations[] = $key;
                }
            }
        }
    }

    // Display missing translations
    if (empty($missingTranslations)) {
        echo "All strings are translated.\n";
    } else {
        echo "Missing Translations:\n";
        foreach (array_unique($missingTranslations) as $missingKey) {
            echo "- $missingKey\n";
        }
    }
}

function flattenArrayKeys(array $array, string $prefix = ''): array {
    $keys = [];
    foreach ($array as $key => $value) {
        $fullKey = $prefix ? "$prefix.$key" : $key;
        if (is_array($value)) {
            $keys = array_merge($keys, flattenArrayKeys($value, $fullKey));
        } else {
            $keys[] = $fullKey;
        }
    }
    return $keys;
}

// Paths
$viewPath = __DIR__ . '/resources/views';
$langFilePath = __DIR__ . '/resources/lang/en/file.php';

// Run the script
findUntranslatedStrings($viewPath, $langFilePath);
