$ErrorActionPreference = 'Stop'

function Assert-True {
    param(
        [bool] $Condition,
        [string] $Message
    )

    if (-not $Condition) {
        throw $Message
    }
}

function Assert-Contains {
    param(
        [string] $Content,
        [string] $Expected,
        [string] $Message
    )

    if (-not $Content.Contains($Expected)) {
        throw $Message
    }
}

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$requiredFiles = @(
    'index.html',
    'css/styles.css',
    'css/components.css',
    'css/animations.css',
    'js/site-config.js',
    'js/main.js',
    'js/animations.js',
    'js/detect-platform.js',
    'README.md',
    'favicon.ico',
    'assets/logo/logo.svg',
    'assets/icons/icon-app-window.svg',
    'assets/images/demo-poster.svg',
    'assets/screenshots/screenshot-overview.svg',
    'assets/screenshots/screenshot-downloads.svg',
    'assets/screenshots/screenshot-support.svg'
)

foreach ($file in $requiredFiles) {
    Assert-True (Test-Path $file) "Missing required file: $file"
}

$index = Get-Content -Raw index.html
Assert-Contains $index '<meta name="description"' 'index.html should include a meta description.'
Assert-Contains $index '<meta property="og:title"' 'index.html should include Open Graph metadata.'
Assert-Contains $index '<nav class="site-nav"' 'index.html should include the site navigation.'
Assert-Contains $index '<section class="hero' 'index.html should include a hero section.'
Assert-Contains $index '<section class="features' 'index.html should include a features section.'
Assert-Contains $index '<section class="screenshots' 'index.html should include a screenshots section.'
Assert-Contains $index '<section class="downloads' 'index.html should include a download section.'
Assert-Contains $index '<section class="faq' 'index.html should include a FAQ section.'
Assert-Contains $index 'js/site-config.js' 'index.html should load site-config.js.'

$config = Get-Content -Raw js/site-config.js
Assert-Contains $config 'window.siteConfig' 'site-config.js should expose window.siteConfig.'
Assert-Contains $config 'downloads' 'site-config.js should define download metadata.'

$main = Get-Content -Raw js/main.js
Assert-Contains $main 'window.siteConfig' 'main.js should read from window.siteConfig.'
Assert-Contains $main 'data-config-key' 'main.js should bind config values into DOM.'

$components = Get-Content -Raw css/components.css
Assert-Contains $components '.lightbox[hidden]' 'components.css should explicitly hide the lightbox when the hidden attribute is present.'

$detectPlatform = Get-Content -Raw js/detect-platform.js
Assert-Contains $detectPlatform 'navigator.platform' 'detect-platform.js should inspect platform information.'
Assert-Contains $detectPlatform 'data-platform' 'detect-platform.js should target platform-marked elements.'

$readme = Get-Content -Raw README.md
Assert-Contains $readme 'GitHub Pages' 'README should document GitHub Pages deployment.'
Assert-Contains $readme 'site-config.js' 'README should explain how to edit site-config.js.'

Write-Host 'Validation passed.'
