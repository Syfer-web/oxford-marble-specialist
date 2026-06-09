# Oxford Marble Specialist — Website

**Live URL:** https://syfer-client-test.dplooy.com (Dplooy hosting)
**Custom domain (planned):** oxfordmarblespecialist.co.uk
**Last deploy:** 2026-06-09

## Contents

### Deployed files (root)
- `index.html` — main page (with OMS monogram in nav + footer)
- `privacy.html`, `terms.html`, `404.html` — supporting pages
- `sitemap.xml`, `robots.txt` — SEO
- `favicon.ico`, `favicon-16.png`, `favicon-32.png`, `apple-touch-icon.png` — favicons
- `og-image.png` — 1200×630 Open Graph social-share image
- `logo-monogram-nav.png` / `@2x.png` / `.webp` — gold OMS monogram, 36px nav size
- `logo-monogram-footer.png` / `@2x.png` / `.webp` — gold monogram, 64px footer size
- `logo-oms-full.png` / `@2x.png` / `.webp` — full logo with monogram + wordmark, for white backgrounds

### source-originals/ (reference, NOT deployed)
- `oms-logo-black-text.jpg` — primary source logo you sent (1280×731, gold monogram + black wordmark)
- `oms-logo-watermark.jpg`, `oms-logo-watermark-dup.jpg` — second/third versions (pale gray wordmark)
- `index.original.html`, `privacy.original.html`, `terms.original.html`, `404.original.html` — site HTML before logo integration (with inline base64 favicons)

## Asset sizes
- Total: ~1.1 MB (deploy zip is 481 KB after compression)
- Logo assets: ~600 KB across 13 files (PNG + WebP variants at 1x and 2x)

## Reproducing the deploy

```bash
# 1. Zip the deploy dir
cd ~/oms-website
zip -r /tmp/oms-deploy.zip . -x "*.md" "source-originals/*" README.md

# 2. Push to Dplooy (must pass projectName, NOT projectId)
curl -X POST "https://api.dplooy.com/api/v1/deploy/zip" \
  -H "Authorization: Bearer $DPLOOY_API_KEY" \
  -F "file=@/tmp/oms-deploy.zip" \
  -F "projectName=syfer-client-test"
```

## Hosting
This is a static site on **Dplooy.com** (not Vercel — Dplooy is the platform for Syfer's static client sites). The custom domain `oxfordmarblespecialist.co.uk` is referenced in JSON-LD and meta tags but not yet pointed at the Dplooy URL (requires Cloudflare DNS access + Dplooy custom-domain setup).
