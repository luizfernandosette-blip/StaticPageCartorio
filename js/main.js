/* ================================================
   CARTÓRIO RTDPJ SABARÁ – main.js
   ================================================ */

(function () {
  'use strict';

  /* ──────────────────────────────────────────────
     1. NAVBAR – scroll effect & active link
  ────────────────────────────────────────────── */
  const navbar  = document.getElementById('navbar');
  const backTop = document.getElementById('backTop');

  function onScroll() {
    const scrolled = window.scrollY > 80;
    navbar.classList.toggle('scrolled', scrolled);
    backTop.classList.toggle('visible', scrolled);
    updateActiveLink();
  }

  window.addEventListener('scroll', onScroll, { passive: true });

  /* ──────────────────────────────────────────────
     2. BACK TO TOP
  ────────────────────────────────────────────── */
  backTop.addEventListener('click', () =>
    window.scrollTo({ top: 0, behavior: 'smooth' })
  );

  /* ──────────────────────────────────────────────
     3. MOBILE MENU
  ────────────────────────────────────────────── */
  const navToggle = document.getElementById('navToggle');
  const navMenu   = document.getElementById('navMenu');

  navToggle.addEventListener('click', () => {
    const open = navMenu.classList.toggle('open');
    navToggle.classList.toggle('open', open);
    navToggle.setAttribute('aria-expanded', open);
    navToggle.setAttribute('aria-label', open ? 'Fechar menu' : 'Abrir menu');
    document.body.style.overflow = open ? 'hidden' : '';
  });

  // Close when tapping on the overlay background (outside the links)
  navMenu.addEventListener('click', (e) => {
    if (e.target === navMenu) closeMenu();
  });

  // Close on link click
  navMenu.querySelectorAll('a').forEach(link =>
    link.addEventListener('click', closeMenu)
  );

  function closeMenu() {
    navMenu.classList.remove('open');
    navToggle.classList.remove('open');
    navToggle.setAttribute('aria-expanded', 'false');
    navToggle.setAttribute('aria-label', 'Abrir menu');
    document.body.style.overflow = '';
  }

  // Close on ESC
  document.addEventListener('keydown', e => {
    if (e.key === 'Escape') closeMenu();
  });

  /* ──────────────────────────────────────────────
     4. ACTIVE NAV LINK
  ────────────────────────────────────────────── */
  function updateActiveLink() {
    const offset   = 120;
    const scrollY  = window.scrollY + offset;
    const sections = document.querySelectorAll('section[id]');
    let   current  = '';

    sections.forEach(sec => {
      if (scrollY >= sec.offsetTop) current = sec.getAttribute('id');
    });

    document.querySelectorAll('.nav-menu a').forEach(a => {
      const href = a.getAttribute('href');
      a.classList.toggle('active', href === `#${current}`);
    });
  }

  /* ──────────────────────────────────────────────
     5. TABS – Atribuições
  ────────────────────────────────────────────── */
  document.querySelectorAll('.tab-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      const target = btn.dataset.tab;

      document.querySelectorAll('.tab-btn').forEach(b =>
        b.classList.remove('active')
      );
      document.querySelectorAll('.tab-pane').forEach(p =>
        p.classList.remove('active')
      );

      btn.classList.add('active');
      const pane = document.getElementById(`tab-${target}`);
      if (pane) pane.classList.add('active');
    });
  });

  /* ──────────────────────────────────────────────
     6. SMOOTH SCROLL for anchor links
  ────────────────────────────────────────────── */
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      const href   = this.getAttribute('href');
      if (href === '#' || href === '#!') return;
      const target = document.querySelector(href);
      if (!target) return;
      e.preventDefault();
      const top = target.getBoundingClientRect().top + window.scrollY - 80;
      window.scrollTo({ top, behavior: 'smooth' });
    });
  });

  /* ──────────────────────────────────────────────
     7. SCROLL REVEAL (Intersection Observer)
  ────────────────────────────────────────────── */
  const revealObserver = new IntersectionObserver(
    (entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible');
          revealObserver.unobserve(entry.target);
        }
      });
    },
    { threshold: 0.12, rootMargin: '0px 0px -40px 0px' }
  );

  document.querySelectorAll('.reveal').forEach(el =>
    revealObserver.observe(el)
  );

  /* ──────────────────────────────────────────────
     8. FOOTER – dynamic year
  ────────────────────────────────────────────── */
  const yearEl = document.getElementById('year');
  if (yearEl) yearEl.textContent = new Date().getFullYear();

  /* ──────────────────────────────────────────────
     9. NAVBAR transparent on hero, dark elsewhere
  ────────────────────────────────────────────── */
  // Run once on load to set correct initial state
  onScroll();

})();
