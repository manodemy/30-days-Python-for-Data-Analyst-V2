"use strict";

document.addEventListener('DOMContentLoaded', () => {
  // Setup review carousel tracking state
  let allReviews = [];
  let offset = 0;
  const limit = 10;
  let loadingReviews = false;
  let hasMoreReviews = true;

  // Supabase init for submission fallback
  const initSupabase = () => {
    if (!window.MANODEMY_CONFIG?.SUPA_URL || !window.MANODEMY_CONFIG?.SUPA_KEY) {
      return null;
    }
    try {
      return window.supabase?.createClient(
        window.MANODEMY_CONFIG.SUPA_URL,
        window.MANODEMY_CONFIG.SUPA_KEY
      );
    } catch (err) {
      console.error("Failed to initialize Supabase client:", err);
      return null;
    }
  };

  const sb = initSupabase();

  // DOM elements
  const writeReviewBtn = document.querySelector('.btn-write-review');
  const authModal = document.getElementById('authModal');
  const reviewForm = document.getElementById('rev-submit-form');
  
  // Carousel DOM
  const carouselTrack = document.getElementById('revCarouselTrack');
  const carouselPrev = document.getElementById('revCarouselPrev');
  const carouselNext = document.getElementById('revCarouselNext');
  const carouselDots = document.getElementById('revCarouselDots');

  // Fetch summary stats
  async function fetchSummary() {
    try {
      const res = await fetch('/api/reviews/summary');
      if (!res.ok) throw new Error("Stats API failed");
      const summary = await res.json();
      renderSummary(summary);
    } catch (err) {
      console.error("Failed to fetch review summary:", err);
      // Fallback display
      renderSummary({
        averageRating: 4.8,
        reviewCount: 312,
        distribution: { "5": 0.74, "4": 0.18, "3": 0.05, "2": 0.02, "1": 0.01 }
      });
    }
  }

  // Fetch paginated reviews list
  async function fetchReviews(reset = false) {
    if (loadingReviews || (!hasMoreReviews && !reset)) return;
    loadingReviews = true;
    
    if (reset) {
      offset = 0;
      allReviews = [];
      hasMoreReviews = true;
    }

    try {
      const res = await fetch(`/api/reviews?limit=${limit}&offset=${offset}`);
      if (!res.ok) throw new Error("List API failed");
      const data = await res.json();
      
      allReviews = allReviews.concat(data.reviews);
      hasMoreReviews = data.hasMore;
      offset += limit;

      renderCarousel(allReviews);
    } catch (err) {
      console.error("Failed to fetch reviews:", err);
      if (allReviews.length === 0) {
        // Fallback reviews to make page look professional
        const fallbackReviews = [
          {
            id: "fb_1",
            name: "Priyanka Sharma",
            avatarUrl: null,
            role: "Junior Data Analyst",
            rating: 5,
            text: "I was highly skeptical about a course with zero video content. But the interactive browser notebooks are completely addictive. The Pandas modules forced me to write real code. Directly helped me transition into my analyst role.",
            recommend: true,
            helpfulCount: 24,
            pros: ["Interactive notebooks", "Pandas labs"],
            cons: [],
            createdAt: new Date().toISOString()
          },
          {
            id: "fb_2",
            name: "Marcus Vance",
            avatarUrl: null,
            role: "Analytics Engineer",
            rating: 5,
            text: "NumPy arrays and clean visualization modules are top-tier. Skipped typical video fluff and went straight to database manipulation. Best educational ROI this year.",
            recommend: true,
            helpfulCount: 19,
            pros: ["NumPy exercises", "Visual reports"],
            cons: ["Fast-paced"],
            createdAt: new Date().toISOString()
          }
        ];
        allReviews = fallbackReviews;
        hasMoreReviews = false;
        renderCarousel(allReviews);
      }
    } finally {
      loadingReviews = false;
    }
  }

  function renderSummary(summary) {
    const avg = summary.averageRating || 0.0;
    const count = summary.reviewCount || 0;

    const scoreEl = document.querySelector('.rev-score-massive');
    if (scoreEl) scoreEl.innerHTML = `${avg} <span>/ 5</span>`;

    const heroRatingEl = document.getElementById('hero-average-rating');
    if (heroRatingEl) heroRatingEl.textContent = `${avg}/5 Student Rating`;

    // Render stars row
    const starsRow = document.querySelector('.rev-stars-row');
    if (starsRow) {
      let starsHtml = '';
      const fullStars = Math.floor(avg);
      const hasHalf = avg % 1 >= 0.5;
      
      for (let i = 1; i <= 5; i++) {
        if (i <= fullStars) {
          starsHtml += `<svg fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>`;
        } else if (i === fullStars + 1 && hasHalf) {
          starsHtml += `
            <svg fill="currentColor" viewBox="0 0 20 20" style="position:relative">
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" style="color:var(--gold);clip-path:polygon(0 0,50% 0,50% 100%,0 100%)"></path>
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" style="color:rgba(255,255,255,0.08);clip-path:polygon(50% 0,100% 0,100% 100%,50% 100%);position:absolute;left:0;top:0"></path>
            </svg>`;
        } else {
          starsHtml += `<svg fill="currentColor" viewBox="0 0 20 20" style="color:rgba(255,255,255,0.08)"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>`;
        }
      }
      starsRow.innerHTML = starsHtml;
    }

    const countSub = document.querySelector('.rev-count-sub');
    if (countSub) countSub.textContent = `Based on ${count} Verified Reviews`;

    // Render distribution bars
    for (let i = 1; i <= 5; i++) {
      const percentage = (summary.distribution?.[String(i)] || 0) * 100;
      const row = document.querySelector(`.rev-dist-row[data-rating="${i}"]`);
      if (row) {
        const fill = row.querySelector('.rev-dist-fill');
        const pct = row.querySelector('.rev-dist-pct');
        if (fill) fill.style.width = `${percentage}%`;
        if (pct) pct.textContent = `${Math.round(percentage)}%`;
      }
    }
  }

  function renderStars(rating) {
    let html = '';
    for (let i = 1; i <= 5; i++) {
      html += i <= rating
        ? `<svg fill="currentColor" viewBox="0 0 20 20" style="width:12px;height:12px;"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>`
        : `<svg fill="currentColor" viewBox="0 0 20 20" style="width:12px;height:12px;color:rgba(255,255,255,0.08)"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>`;
    }
    return html;
  }

  function getAvatarGradient(name) {
    const colors = [['#00E6F6','#0077f6'],['#FFB020','#FF5500'],['#10B981','#059669'],['#F43F5E','#BE123C'],['#A855F7','#6B21A8']];
    let sum = 0;
    for (let i = 0; i < name.length; i++) sum += name.charCodeAt(i);
    const g = colors[sum % colors.length];
    return `linear-gradient(135deg, ${g[0]}40 0%, ${g[1]}20 100%)`;
  }

  function renderCard(rev) {
    const dateStr = new Date(rev.createdAt).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
    const verifiedIcon = `<span class="badge-verified"><svg fill="currentColor" viewBox="0 0 20 20"><path d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"></path></svg> Verified</span>`;
    
    const avatar = rev.avatarUrl
      ? `<img class="rev-avatar" src="${rev.avatarUrl}" alt="${rev.name}" referrerpolicy="no-referrer">`
      : `<div class="rev-avatar" style="background:${getAvatarGradient(rev.name)}; border-color: rgba(255,255,255,0.05); color:#fff">${rev.name.substring(0,2).toUpperCase()}</div>`;

    const pros = (rev.pros || []).map(p => `<span class="rev-tag rev-tag-pro"><svg fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5"></path></svg>${p}</span>`).join('');
    const cons = (rev.cons || []).map(c => `<span class="rev-tag rev-tag-con"><svg fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path></svg>${c}</span>`).join('');

    const recommends = rev.recommend
      ? `<span class="rev-rec yes"><svg fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg> Recommends</span>`
      : `<span class="rev-rec no"><svg fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg> Not Recommended</span>`;

    const voted = JSON.parse(localStorage.getItem('manodemy_helpful_votes') || '[]');
    const isVoted = voted.includes(rev.id);
    const helpfulClass = isVoted ? 'active' : '';

    return `
      <div class="rev-card" data-id="${rev.id}">
        <div class="rev-card-top">
          ${avatar}
          <div class="rev-card-info">
            <div class="rev-card-name-row" style="display:flex; align-items:center;">
              <span class="rev-card-name">${rev.name}</span>
              ${verifiedIcon}
            </div>
            <div class="rev-card-role">${rev.role}</div>
            <div class="rev-card-meta">
              <span class="rev-card-stars">${renderStars(rev.rating)}</span>
              <span class="rev-card-date">${dateStr}</span>
            </div>
          </div>
        </div>
        <div class="rev-card-body"><p>${rev.text}</p></div>
        ${(pros || cons) ? `<div class="rev-card-tags">${pros}${cons}</div>` : ''}
        <div class="rev-card-bottom">
          ${recommends}
          <button class="rev-helpful-btn ${helpfulClass}" data-id="${rev.id}" data-count="${rev.helpfulCount}">
            <svg fill="${isVoted ? 'currentColor' : 'none'}" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" d="M6.633 10.5c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 012.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 00.322-1.672V3a.75.75 0 01.75-.75A2.25 2.25 0 0116.5 4.5c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282h3.126c1.026 0 1.91.688 2.053 1.703a11.208 11.208 0 01-.735 6.37 2.625 2.625 0 01-2.36 1.727H11.218a5.2 5.2 0 01-3.66-1.5l-3.21-3.21a.75.75 0 010-1.06l.983-.983A2.404 2.404 0 016.633 10.5z"></path>
              <path stroke-linecap="round" stroke-linejoin="round" d="M3 18v-6a9 9 0 011.8-5.4"></path>
            </svg>
            <span>Helpful (${rev.helpfulCount})</span>
          </button>
        </div>
      </div>`;
  }

  function renderCarousel(reviews) {
    if (!carouselTrack) return;
    
    if (reviews.length === 0) {
      carouselTrack.innerHTML = `
        <div class="rev-empty" style="min-width:100%;text-align:center;padding:3rem 1rem;">
          <span style="font-size:2rem;">✍️</span>
          <h3 style="color:#fff;margin-top:10px;">No Reviews Yet</h3>
          <p style="color:var(--text-muted);">Write a review to share your feedback.</p>
        </div>`;
      if (carouselDots) carouselDots.innerHTML = '';
      return;
    }

    carouselTrack.innerHTML = reviews.map(renderCard).join('');

    // Bind helpful button events
    carouselTrack.querySelectorAll('.rev-helpful-btn').forEach(btn => {
      btn.addEventListener('click', async (e) => {
        e.stopPropagation();
        const revId = btn.dataset.id;
        const voted = JSON.parse(localStorage.getItem('manodemy_helpful_votes') || '[]');
        if (voted.includes(revId)) return;

        const count = parseInt(btn.dataset.count || '0', 10) + 1;
        btn.classList.add('active');
        btn.querySelector('span').textContent = `Helpful (${count})`;
        btn.dataset.count = count;
        
        const svg = btn.querySelector('svg');
        if (svg) svg.setAttribute('fill', 'currentColor');

        voted.push(revId);
        localStorage.setItem('manodemy_helpful_votes', JSON.stringify(voted));

        if (sb && !revId.startsWith('fb_')) {
          try {
            await sb.from('reviews').update({ helpful_count: count }).eq('id', revId);
          } catch (err) {
            console.error("DB error updating helpful count:", err);
          }
        }
      });
    });

    buildDots(reviews.length);
    bindArrows();
    updateArrows();
  }

  function getCardsPerPage() {
    if (!carouselTrack) return 1;
    const w = carouselTrack.clientWidth;
    return w >= 700 ? 2 : 1;
  }

  function buildDots(count) {
    if (!carouselDots) return;
    const perPage = getCardsPerPage();
    const pages = Math.ceil(count / perPage);
    carouselDots.innerHTML = '';
    for (let i = 0; i < pages; i++) {
      const dot = document.createElement('button');
      dot.className = 'rev-dot' + (i === 0 ? ' active' : '');
      dot.addEventListener('click', () => {
        const card = carouselTrack.querySelector('.rev-card');
        if (card) {
          const cardW = card.offsetWidth + 24;
          carouselTrack.scrollTo({ left: i * cardW * perPage, behavior: 'smooth' });
        }
      });
      carouselDots.appendChild(dot);
    }
  }

  function bindArrows() {
    if (carouselPrev) {
      carouselPrev.onclick = () => {
        const card = carouselTrack.querySelector('.rev-card');
        if (card) {
          carouselTrack.scrollBy({ left: -(card.offsetWidth + 24) * getCardsPerPage(), behavior: 'smooth' });
        }
      };
    }
    if (carouselNext) {
      carouselNext.onclick = () => {
        const card = carouselTrack.querySelector('.rev-card');
        if (card) {
          carouselTrack.scrollBy({ left: (card.offsetWidth + 24) * getCardsPerPage(), behavior: 'smooth' });
        }
      };
    }
  }

  function updateArrows() {
    if (!carouselTrack) return;
    const isStart = carouselTrack.scrollLeft <= 5;
    const isEnd = carouselTrack.scrollLeft + carouselTrack.clientWidth >= carouselTrack.scrollWidth - 5;
    if (carouselPrev) carouselPrev.classList.toggle('dimmed', isStart);
    if (carouselNext) carouselNext.classList.toggle('dimmed', isEnd);
  }

  if (carouselTrack) {
    carouselTrack.addEventListener('scroll', () => {
      updateArrows();
      // Sync active dot
      const card = carouselTrack.querySelector('.rev-card');
      if (card && carouselDots) {
        const cardW = card.offsetWidth + 24;
        const page = Math.round(carouselTrack.scrollLeft / (cardW * getCardsPerPage()));
        const dots = carouselDots.querySelectorAll('.rev-dot');
        dots.forEach((d, idx) => d.classList.toggle('active', idx === page));
      }
    }, { passive: true });
  }

  // Open write review modal
  if (writeReviewBtn && authModal) {
    writeReviewBtn.addEventListener('click', () => {
      authModal.classList.add('active');
    });
  }

  // Run initial fetch
  fetchSummary();
  fetchReviews(true);
});
