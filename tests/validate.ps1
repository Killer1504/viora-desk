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
Assert-True ([regex]::Matches($index, '<article class="feature-card reveal"').Count -eq 4) 'index.html should render exactly four feature cards.'
Assert-Contains $index '<section class="screenshots' 'index.html should include a screenshots section.'
Assert-Contains $index '<section class="downloads' 'index.html should include a download section.'
Assert-Contains $index '<section class="faq' 'index.html should include a FAQ section.'
Assert-Contains $index 'js/site-config.js' 'index.html should load site-config.js.'
Assert-Contains $index 'macOS Universal' 'index.html should present a macOS Universal download option.'
Assert-Contains $index 'download-grid download-grid-balanced' 'index.html should mark the download grid as balanced.'
Assert-Contains $index 'Turn Performance Reviews into Clear Growth Signals' 'index.html should present the updated slogan.'
Assert-Contains $index 'Viora helps teams manage KPI cycles, evaluate employees with confidence, and turn performance data into actionable insights through a clean, focused desktop experience.' 'index.html should present the updated product description.'
Assert-Contains $index 'KPI Cycle Management' 'index.html should present the KPI Cycle Management feature.'
Assert-Contains $index 'Employee Performance Reviews' 'index.html should present the Employee Performance Reviews feature.'
Assert-Contains $index 'Performance Dashboard' 'index.html should present the Performance Dashboard feature.'
Assert-Contains $index 'Employee Data Sync' 'index.html should present the Employee Data Sync feature.'

$config = Get-Content -Raw js/site-config.js
Assert-Contains $config 'window.siteConfig' 'site-config.js should expose window.siteConfig.'
Assert-Contains $config 'downloads' 'site-config.js should define download metadata.'
Assert-Contains $config 'macosUniversal' 'site-config.js should define a macOS Universal download entry.'
Assert-Contains $config 'Turn Performance Reviews into Clear Growth Signals' 'site-config.js should define the updated slogan.'
Assert-Contains $config 'Viora helps teams manage KPI cycles, evaluate employees with confidence, and turn performance data into actionable insights through a clean, focused desktop experience.' 'site-config.js should define the updated product description.'
Assert-True (-not $config.Contains('macosIntel')) 'site-config.js should not keep a separate macOS Intel entry.'
Assert-True (-not $config.Contains('macosAppleSilicon')) 'site-config.js should not keep a separate macOS Apple Silicon entry.'

$main = Get-Content -Raw js/main.js
Assert-Contains $main 'window.siteConfig' 'main.js should read from window.siteConfig.'
Assert-Contains $main 'data-config-key' 'main.js should bind config values into DOM.'

$components = Get-Content -Raw css/components.css
Assert-Contains $components '.lightbox[hidden]' 'components.css should explicitly hide the lightbox when the hidden attribute is present.'

$styles = Get-Content -Raw css/styles.css
Assert-Contains $styles '.download-grid-balanced' 'styles.css should define a dedicated balanced download grid layout.'
Assert-Contains $styles 'grid-template-columns: repeat(2, minmax(0, 1fr));' 'styles.css should keep the balanced download grid at two columns on larger screens.'

$detectPlatform = Get-Content -Raw js/detect-platform.js
Assert-Contains $detectPlatform 'navigator.platform' 'detect-platform.js should inspect platform information.'
Assert-Contains $detectPlatform 'data-platform' 'detect-platform.js should target platform-marked elements.'

$readme = Get-Content -Raw README.md
Assert-Contains $readme 'Viora Desk is a desktop application for KPI and employee performance reviews.' 'README should introduce the app.'
Assert-Contains $readme 'KPI Cycle Management' 'README should describe KPI Cycle Management.'
Assert-Contains $readme 'Employee Performance Reviews' 'README should describe Employee Performance Reviews.'
Assert-Contains $readme 'Performance Dashboard' 'README should describe the Performance Dashboard.'
Assert-Contains $readme 'Employee Data Sync' 'README should describe Employee Data Sync.'

Write-Host 'Validation passed.'
