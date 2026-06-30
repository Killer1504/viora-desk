# Task

Build a modern landing page for my desktop application.

## Goal

The landing page should look like a premium SaaS product similar to Raycast, Cursor, Linear, Warp, or Obsidian.

The objective is to maximize downloads of the desktop application.

The website must be completely static so it can be deployed directly to GitHub Pages without any build process.

---

# Tech Stack

Build using only:

* HTML5
* CSS3
* Vanilla JavaScript (ES6+)

Do NOT use:

* React
* Next.js
* Vue
* Angular
* Svelte
* TailwindCSS
* Bootstrap
* jQuery
* Node.js
* npm packages
* Any CSS framework
* Any JavaScript framework
* Any build tools

The project must run by simply opening `index.html` in a browser.

---

# Project Structure

```
/
│── index.html
│── css/
│     ├── styles.css
│     ├── components.css
│     └── animations.css
│
│── js/
│     ├── main.js
│     ├── animations.js
│     └── detect-platform.js
│
│── assets/
│     ├── logo/
│     ├── icons/
│     ├── screenshots/
│     ├── videos/
│     └── images/
│
│── favicon.ico
│── README.md
```

Use a clean and maintainable folder structure.

---

# Design Style

Design should be inspired by:

* Raycast
* Cursor
* Linear
* Warp
* Notion
* Arc Browser

Do NOT copy their UI directly.

Design principles:

* Premium
* Modern
* Minimal
* Apple-inspired
* Elegant
* Clean
* Large typography
* Rounded corners
* Soft shadows
* Smooth gradients
* Plenty of whitespace
* Responsive
* Accessible

Support both desktop and mobile.

Dark mode should be the default appearance.

---

# Navigation

Sticky navigation bar.

Include:

* Logo
* Features
* Screenshots
* Download
* FAQ
* GitHub

Smooth scrolling.

Navbar should become slightly blurred while scrolling.

---

# Hero Section

Include:

* Product logo
* Product name
* One-line slogan
* Short product description
* Hero screenshot
* Background gradient
* Animated floating elements

Buttons:

Primary

* Download for Windows

Secondary

* Download for macOS

Display current version.

Display supported platforms.

---

# Features

Create six feature cards.

Each card includes:

* SVG icon
* Title
* Description

Hover effects.

Responsive grid layout.

---

# Screenshots

Responsive gallery.

Large screenshots inside realistic desktop frames.

Clicking a screenshot opens a lightbox preview.

---

# Demo

Video preview section.

If no video exists, create a placeholder component with a play button.

---

# Download Section

Create download cards for:

* Windows
* macOS Intel
* macOS Apple Silicon

Each card includes:

* Platform icon
* Version
* File size
* Release date
* Download button

Buttons should be easy to replace with real download URLs later.

---

# Platform Detection

Use JavaScript to detect the visitor's operating system.

If Windows:

* Highlight "Download for Windows"

If macOS:

* Highlight "Download for macOS"

Do NOT automatically download files.

---

# FAQ

Accordion component.

Include questions like:

* Is it free?
* Does it support Windows?
* Does it support macOS?
* How do updates work?
* Where can I report bugs?
* Is there a portable version?

---

# Footer

Include:

* Copyright
* Privacy Policy
* Terms of Service
* GitHub
* Contact Email
* Version

---

# Animations

Use pure CSS animations and JavaScript only.

Include:

* Fade in
* Slide up
* Hover scale
* Floating hero image
* Smooth scrolling
* Button hover animation
* Card hover animation

Animations should be smooth and subtle.

Avoid excessive effects.

---

# Responsive Design

Support:

* Mobile
* Tablet
* Laptop
* Desktop
* Ultra-wide monitors

No horizontal scrolling.

---

# Performance

Optimize for:

* Fast loading
* Semantic HTML
* Accessibility (ARIA where appropriate)
* Lazy loading images
* Optimized image sizes
* Clean CSS
* Minimal JavaScript

Target Lighthouse scores:

* Performance >95
* Accessibility >95
* Best Practices >95
* SEO >95

---

# SEO

Include:

* Meta title
* Meta description
* Open Graph tags
* Twitter Card tags
* Favicon
* Canonical URL
* Structured headings (H1, H2, H3)

---

# Code Quality

Write:

* Semantic HTML
* Reusable CSS classes
* Well-organized CSS
* Modern JavaScript (ES6+)
* Clear comments where necessary
* Consistent naming conventions

Avoid duplicated code.

---

# Assets

Use placeholder assets for:

* Logo
* Screenshots
* Icons
* Demo video

Organize assets clearly so they can be easily replaced later.

---

# README

Generate a professional README including:

* Project description
* Folder structure
* Local preview instructions
* GitHub Pages deployment instructions
* How to replace screenshots
* How to change download links
* License

---

# Deliverables

Generate a complete production-ready project including:

* index.html
* All CSS files
* All JavaScript files
* Placeholder assets
* README.md

The project must work immediately after cloning the repository.

No installation.

No npm.

No build.

No dependencies.

Simply open `index.html` locally or publish the repository to GitHub Pages.