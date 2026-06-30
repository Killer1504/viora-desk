(function () {
  const config = window.siteConfig || {};

  function getValueByPath(object, path) {
    return path.split('.').reduce(function (current, key) {
      return current && Object.prototype.hasOwnProperty.call(current, key) ? current[key] : '';
    }, object);
  }

  function applyConfigBindings() {
    document.querySelectorAll('[data-config-key]').forEach(function (element) {
      const key = element.getAttribute('data-config-key');
      const target = element.getAttribute('data-config-attr');
      const value = getValueByPath(config, key);

      if (!value) {
        return;
      }

      if (!target) {
        element.textContent = value;
        return;
      }

      const parts = target.split(':');
      const attributeName = parts[0];
      const prefix = parts[1] || '';
      element.setAttribute(attributeName, prefix + value);

      if (attributeName === 'href' && element.textContent.includes('@') === false && prefix === 'mailto:') {
        element.textContent = value;
      }
    });
  }

  function applySeoConfig() {
    if (config.seo && config.seo.title) {
      document.title = config.seo.title;
    }

    const selectors = {
      'meta[name="description"]': config.seo && config.seo.description,
      'meta[property="og:title"]': config.seo && config.seo.title,
      'meta[property="og:description"]': config.seo && config.seo.description,
      'meta[property="og:image"]': config.seo && config.seo.ogImage,
      'meta[property="og:url"]': config.links && config.links.canonical,
      'meta[name="twitter:title"]': config.seo && config.seo.title,
      'meta[name="twitter:description"]': config.seo && config.seo.description,
      'meta[name="twitter:image"]': config.seo && config.seo.ogImage,
      'link[rel="canonical"]': config.links && config.links.canonical
    };

    Object.keys(selectors).forEach(function (selector) {
      const value = selectors[selector];
      const element = document.querySelector(selector);

      if (!element || !value) {
        return;
      }

      if (element.tagName.toLowerCase() === 'link') {
        element.setAttribute('href', value);
      } else {
        element.setAttribute('content', value);
      }
    });
  }

  function setupNav() {
    const nav = document.querySelector('.site-nav');
    const toggle = document.querySelector('.nav-toggle');
    const navLinks = document.querySelectorAll('.nav-menu a');

    function syncScrollState() {
      if (!nav) {
        return;
      }

      nav.classList.toggle('is-scrolled', window.scrollY > 12);
    }

    if (toggle && nav) {
      toggle.addEventListener('click', function () {
        const isOpen = nav.classList.toggle('is-menu-open');
        toggle.setAttribute('aria-expanded', String(isOpen));
      });

      navLinks.forEach(function (link) {
        link.addEventListener('click', function () {
          nav.classList.remove('is-menu-open');
          toggle.setAttribute('aria-expanded', 'false');
        });
      });
    }

    syncScrollState();
    window.addEventListener('scroll', syncScrollState, { passive: true });
  }

  function setupFaq() {
    document.querySelectorAll('.faq-trigger').forEach(function (button) {
      button.addEventListener('click', function () {
        const item = button.closest('.faq-item');
        const isOpen = item.classList.toggle('is-open');
        button.setAttribute('aria-expanded', String(isOpen));
      });
    });
  }

  function setupLightbox() {
    const lightbox = document.querySelector('.lightbox');
    const image = document.querySelector('.lightbox-image');
    const closeControls = document.querySelectorAll('[data-lightbox-close]');
    const cards = document.querySelectorAll('[data-lightbox-src]');
    let lastTrigger = null;

    function closeLightbox() {
      if (!lightbox || !image) {
        return;
      }

      lightbox.hidden = true;
      lightbox.setAttribute('aria-hidden', 'true');
      image.setAttribute('src', '');
      image.setAttribute('alt', '');

      if (lastTrigger) {
        lastTrigger.focus();
      }
    }

    cards.forEach(function (card) {
      card.addEventListener('click', function () {
        if (!lightbox || !image) {
          return;
        }

        lastTrigger = card;
        image.setAttribute('src', card.getAttribute('data-lightbox-src'));
        image.setAttribute('alt', card.getAttribute('data-lightbox-alt') || '');
        lightbox.hidden = false;
        lightbox.setAttribute('aria-hidden', 'false');
        const closeButton = lightbox.querySelector('.lightbox-close');

        if (closeButton) {
          closeButton.focus();
        }
      });
    });

    closeControls.forEach(function (control) {
      control.addEventListener('click', closeLightbox);
    });

    document.addEventListener('keydown', function (event) {
      if (event.key === 'Escape' && lightbox && lightbox.hidden === false) {
        closeLightbox();
      }
    });
  }

  document.addEventListener('DOMContentLoaded', function () {
    applyConfigBindings();
    applySeoConfig();
    setupNav();
    setupFaq();
    setupLightbox();
  });
}());
