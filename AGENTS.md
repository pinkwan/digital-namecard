# digital-namecard

## Cursor Cloud specific instructions

This repo is a dependency-free **static HTML/CSS "digital namecard"** (single-page digital business card). There is no package manager, build system, backend, database, or test/lint config — just static files (`index.html`, `main.css`, images, `assets/*.svg`, and the downloadable `user.vcf`).

### Running it
- Serve the files with any static HTTP server from the repo root, e.g. `python3 -m http.server 8000`, then open `http://localhost:8000/`.
- Prefer serving over HTTP (rather than opening `index.html` via `file://`) so the `user.vcf` download and relative asset paths behave correctly.

### Build / test / lint
- **Build:** none required — files are served as-is.
- **Test:** no automated tests exist; verify manually (page renders with logo/name/contact rows, and the "Download" button downloads `user.vcf`).
- **Lint:** no linter is configured in the repo.

### Notes
- Google Fonts are loaded from a CDN; the page still renders with fallback fonts if offline.
