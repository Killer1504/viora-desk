(function () {
  function detectPlatform() {
    const platform = (navigator.platform || '').toLowerCase();
    const userAgent = (navigator.userAgent || '').toLowerCase();

    if (platform.includes('win')) {
      return 'windows';
    }

    if (platform.includes('mac')) {
      return userAgent.includes('arm') || userAgent.includes('apple silicon') ? 'macos-apple-silicon' : 'macos';
    }

    return 'unknown';
  }

  function highlightPlatform(platform) {
    const cards = document.querySelectorAll('[data-platform]');
    const primaryButtons = document.querySelectorAll('[data-platform-primary]');

    cards.forEach(function (element) {
      const key = element.getAttribute('data-platform');
      const isMatch = platform === key || (platform === 'macos' && key.indexOf('macos') === 0);
      element.classList.toggle('is-highlighted', isMatch);
    });

    primaryButtons.forEach(function (element) {
      const key = element.getAttribute('data-platform-primary');
      const isMatch = (platform === 'windows' && key === 'windows') || (platform.indexOf('macos') === 0 && key === 'macos');
      element.classList.toggle('is-highlighted', isMatch);
    });
  }

  document.addEventListener('DOMContentLoaded', function () {
    highlightPlatform(detectPlatform());
  });
}());
