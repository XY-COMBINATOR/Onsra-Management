
<img width="1899" height="979" alt="image" src="https://github.com/user-attachments/assets/73dd43aa-a4a3-4f40-ab45-eac89d09f3e0" />

> Premier Event Planning, Brand Identity & Creative Activations Agency based in Dhaka, Bangladesh.

A high-performance, fully self-hosted static website engineered for maximum SEO visibility, strict security standards, and seamless deployment on **Cloudflare Pages**.

---

## 🚀 Key Features & Highlights

- **⚡ Cloudflare Pages Ready**: Zero-build static architecture with native support for Cloudflare Pages edge hosting.
- **🛡️ Enterprise-Grade Security**:
  - Pre-configured `_headers` featuring strict HTTP security policies (`X-Frame-Options`, `X-Content-Type-Options`, `Referrer-Policy`, `Permissions-Policy`, `HSTS`).
  - Completely sanitized: Zero third-party telemetry, tracking beacons, or cross-domain dependencies.
  - Interactive contact form with anti-bot honeypot and secure client-side asynchronous dispatch.
- **🔍 Advanced SEO & Social Sharing**:
  - Full Open Graph (`og:*`) & Twitter Card (`twitter:*`) metadata with rich preview images.
  - Valid Schema.org JSON-LD Structured Data (`Organization`, `ProfessionalService`, `WebSite`, `WebPage`).
  - Search engine directives (`robots.txt`) and auto-updating XML sitemap (`sitemap.xml`).
  - Descriptive, accessible image `alt` tags and keyword-optimized semantic hierarchy.
  - Dedicated, indexable `privacy-policy/` and `cookie-policy/` pages.
- **🎨 100% Self-Hosted Assets**:
  - All modern typography (Clash Display, Syne, Roboto) and media served locally without external CDN failure risks or CORS issues.
  - Custom branded `404.html` error experience.

---

## 📁 Repository Structure

```text
Onsra-Management/
├── 404.html                     # Custom branded 404 error page for Cloudflare Pages
├── _headers                     # Cloudflare Pages security & caching headers
├── _redirects                   # Cloudflare Pages URL rewrite & redirect rules
├── favicon.ico                  # Browser shortcut icon
├── index.html                   # Main landing page (fully optimized & cleaned)
├── logo.svg                     # Vector brand identity mark
├── robots.txt                   # Search crawler directives
├── sitemap.xml                  # XML sitemap for Google & Bing indexing
├── README.md                    # Documentation & deployment guide
├── .gitignore                   # Ignore rules for local development and build tools
├── cookie-policy/
│   └── index.html               # Dedicated Cookies Policy page
├── privacy-policy/
│   └── index.html               # Dedicated Privacy Policy page
├── css/                         # Minified styling sheets (css_1.css - css_20.css)
├── fonts/                       # Self-hosted Clash Display web fonts (TTF)
├── images/                      # Optimized image assets, logos, and showcase media
├── js/                          # Runtime scripts for animations & interactions
└── tools/                       # Archived migration scripts & legacy build utilities
```

---

## ☁️ Deployment Guide (Cloudflare Pages)

Deploying to Cloudflare Pages takes under 2 minutes:

### Method 1: Git Integration (Recommended)

1. Log into your [Cloudflare Dashboard](https://dash.cloudflare.com/).
2. Navigate to **Workers & Pages** > **Create application** > **Pages** > **Connect to Git**.
3. Select the repository: `XY-COMBINATOR/Onsra-Management`.
4. Configure the build settings:
   - **Framework preset**: `None`
   - **Build command**: *(Leave empty)*
   - **Build output directory**: `.` *(root)*
5. Click **Save and Deploy**.
6. (Optional) Under **Custom Domains**, connect your domain (e.g. `onsra-management.com`) and Cloudflare will automatically provision free SSL/TLS certificates and global CDN caching.

### Method 2: Direct Upload via Wrangler CLI

If deploying from your terminal:

```bash
npx wrangler pages deploy . --project-name onsra-management
```

---

## 🧪 Local Preview & Testing

To test the website locally, you can use any static HTTP file server:

### Using Python:
```bash
python -m http.server 8000
```

### Using Node.js:
```bash
npx serve .
```

Visit `http://localhost:8000` in your web browser.

---

## ✉️ Contact Form Configuration

The contact form is pre-wired in `index.html` with client-side async submission and anti-bot protection.
To route inquiries to your email inbox:
1. Register a free form endpoint at [Formspree](https://formspree.io/) (or your preferred form backend, such as Cloudflare Turnstile / Workers).
2. In `index.html`, update the `action` attribute on `<form id="onsraContactForm">`:
   ```html
   <form class="onsra-contact-form" id="onsraContactForm" action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
   ```

---

## 📄 License & Credits

&copy; 2026 **inventislink.org workers.org**. All rights reserved.
