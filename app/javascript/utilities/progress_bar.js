document.addEventListener('turbolinks:load', function() {
  const progress = document.querySelector('.progress');

  if (!progress) {
    return;
  }

  const bar = progress.querySelector('.progress-bar');

  const value = Math.round(
    progress.dataset.progressNow / progress.dataset.progressTotal * 100
  );
  const percent = value + '%';

  progress.setAttribute('aria-valuenow', value);
  bar.textContent = percent;
  bar.style['width'] = percent;
});
