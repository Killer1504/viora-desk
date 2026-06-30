# Viora Desktop Landing Page

Static landing page for an internal desktop application. The page is designed to feel premium like a modern SaaS site while staying easy to host on GitHub Pages and easy for non-developers to update.

## Project structure

```text
/
├── index.html
├── css/
│   ├── styles.css
│   ├── components.css
│   └── animations.css
├── js/
│   ├── site-config.js
│   ├── main.js
│   ├── animations.js
│   └── detect-platform.js
├── assets/
│   ├── logo/
│   ├── icons/
│   ├── screenshots/
│   ├── images/
│   └── videos/
├── favicon.ico
└── README.md
```

## Local preview

No installation is required.

1. Clone or download the repository.
2. Open `index.html` directly in your browser.

Because the project uses only relative paths, it also works when served from a GitHub Pages project site.

## Editing product information

Open `js/site-config.js` to update the values that usually change between releases:

- product name
- slogan
- current version
- release date
- GitHub link
- support email
- privacy and terms links
- download URLs
- file sizes

`main.js` reads this config and injects the values into the page. You should not need to edit `main.js` for normal content updates.

## Replacing screenshots and visual assets

- Replace `assets/screenshots/*.svg` with real screenshots. Keep filenames the same if you do not want to update HTML.
- Replace `assets/images/demo-poster.svg` when you have a real demo thumbnail.
- Replace `assets/logo/logo.svg` with the product logo.
- Replace the icon SVG files in `assets/icons/` if you want a different visual language.

For best results:

- keep screenshots compressed
- prefer SVG for icons and logo
- use consistent aspect ratios for gallery images

## Changing download links

Update the URLs in `js/site-config.js`:

- `downloads.windows.url`
- `downloads.macosUniversal.url`

You can also update each build’s version, file size, and release date in the same file.

## GitHub Pages deployment

This project is ready for GitHub Pages because it is fully static and uses no build process.

1. Push the repository to GitHub.
2. Open repository settings.
3. Go to **Pages**.
4. Set the source branch to the branch that contains this project.
5. Save and wait for GitHub Pages to publish.

After deployment:

- update `links.canonical` in `js/site-config.js`
- update `links.github` if needed
- update the placeholder support email and legal links

## License

Add your company’s preferred license or internal usage notice here.
