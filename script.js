document.addEventListener('DOMContentLoaded', () => {
    const workGrid = document.getElementById('workGrid');
    const clientLogos = document.getElementById('clientLogos');
    const servicesGrid = document.getElementById('servicesGrid');
    const edgeCards = document.getElementById('edgeCards');
    const mobileToggle = document.getElementById('mobileToggle');
    const mobileMenu = document.getElementById('mobileMenu');

    const workItems = [
        {
            title: 'Corporate Gala',
            category: 'Event Experiences',
            image: 'https://images.unsplash.com/photo-1517048676732-d65bc937f952?w=800&q=80',
            desc: 'Annual corporate awards ceremony with immersive staging.'
        },
        {
            title: 'Brand Launch',
            category: 'Creative Activations',
            image: 'https://images.unsplash.com/photo-1492673271877-7b2568328184?w=800&q=80',
            desc: 'Product reveal experience for a lifestyle brand entering new markets.'
        },
        {
            title: 'Cultural Festival',
            category: 'Event Experiences',
            image: 'https://images.unsplash.com/photo-1533174072645-5b92b2b2c3d6?w=800&q=80',
            desc: 'Multi-day cultural activation with live performances and installations.'
        },
        {
            title: 'Brand Identity',
            category: 'Brand Identity',
            image: 'https://images.unsplash.com/photo-1611162617474-5b21e879e113?w=800&q=80',
            desc: 'Complete visual identity system for a growing enterprise brand.'
        },
        {
            title: 'Strategic Campaign',
            category: 'Brand Strategy',
            image: 'https://images.unsplash.com/photo-1556761175-5973dc0f32e7?w=800&q=80',
            desc: 'Market positioning and go-to-market strategy for tech startup.'
        },
        {
            title: 'Artist Activation',
            category: 'Creative Activations',
            image: 'https://images.unsplash.com/photo-1493224654547-799f8ce296ca?w=800&q=80',
            desc: 'Immersive art installation paired with live musical performance.'
        }
    ];

    const clientItems = [
        'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=200&q=80',
        'https://images.unsplash.com/photo-1557837545-42d5d4843b6f?w=200&q=80',
        'https://images.unsplash.com/photo-1592748771722-4c6b5322a3f0?w=200&q=80',
        'https://images.unsplash.com/photo-1549147512376-c4816686f260?w=200&q=80',
        'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=200&q=80',
        'https://images.unsplash.com/photo-1556157382-92edaa3452bc?w=200&q=80',
        'https://images.unsplash.com/photo-1556742502-ec7c0e9535bb?w=200&q=80',
        'https://images.unsplash.com/photo-1589998058972-94467e82cd9b?w=200&q=80',
        'https://images.unsplash.com/photo-1600857231328-9cb3259b3992?w=200&q=80',
        'https://images.unsplash.com/photo-1584813333537-bb6957e41ac5?w=200&q=80'
    ];

    const servicesItems = [
        {
            title: 'Event Planning',
            desc: 'Full-service planning for corporate and institutional events from concept to execution.'
        },
        {
            title: 'Production',
            desc: 'End-to-end production management including staging, lighting, and technical direction.'
        },
        {
            title: 'Artist Booking',
            desc: 'Talent sourcing and booking for performances, activations, and brand collaborations.'
        },
        {
            title: 'Sponsorship Support',
            desc: 'Sponsorship strategy, outreach, and partnership management for events and brands.'
        }
    ];

    const edgeItems = [
        {
            title: 'BOLD IDEAS',
            desc: 'Big thinking, brave moves.'
        },
        {
            title: 'HUMAN STORIES',
            desc: 'Stories people feel.'
        },
        {
            title: 'INSIGHT-LED STRATEGY',
            desc: 'Creativity with structure.'
        },
        {
            title: 'SEAMLESS PRESENCE',
            desc: 'One story, every channel.'
        },
        {
            title: 'EXPERIENTIAL ENGAGEMENT',
            desc: 'Experiences you step into.'
        }
    ];

    function populateWork() {
        workGrid.innerHTML = workItems.map(item => `
            <div class="work-card">
                <img src="${item.image}" alt="${item.title}" loading="lazy">
            </div>
        `).join('');
    }

    function populateClients() {
        clientLogos.innerHTML = clientItems.map(src => `
            <img src="${src}" alt="Client" loading="lazy">
        `).join('');
    }

    function populateServices() {
        servicesGrid.innerHTML = servicesItems.map(item => `
            <div class="service-card">
                <div class="service-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <line x1="12" y1="2" x2="12" y2="22"></line>
                        <path d="M12 22V4"></path>
                    </svg>
                </div>
                <h3>${item.title}</h3>
                <p>${item.desc}</p>
            </div>
        `).join('');
    }

    function populateEdge() {
        edgeCards.innerHTML = edgeItems.map(item => `
            <div class="edge-card">
                <h3>${item.title}</h3>
                <p>${item.desc}</p>
            </div>
        `).join('');
    }

    populateWork();
    populateClients();
    populateServices();
    populateEdge();

    // Header scroll effect
    const header = document.querySelector('.header');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });

    // Mobile menu toggle
    mobileToggle.addEventListener('click', () => {
        mobileToggle.classList.toggle('active');
        mobileMenu.classList.toggle('active');
    });

    // Close mobile menu on link click
    document.querySelectorAll('.mobile-nav-list a').forEach(link => {
        link.addEventListener('click', () => {
            mobileToggle.classList.remove('active');
            mobileMenu.classList.remove('active');
        });
    });

    // Smooth scroll for nav links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });

    // Intersection Observer for animations
    const observerOptions = { threshold: 0.1 };
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    document.querySelectorAll('.work-card, .service-card, .edge-card').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'all 0.6s ease';
        observer.observe(el);
    });
});
