# zLMS-prod 

Legacy ASP.NET Web Forms learning management system (LMS) for police training workflows.

## Project deep-dive (quick map)

### Core platform
- **Framework:** ASP.NET Web Forms on **.NET Framework 4.6.1**.
- **Main project file:** `app/lms.csproj`.
- **Language mix:** C# backend (`.cs`), Web Forms pages (`.aspx`), JavaScript, CSS, and SQL Server DB backups.

### Major app areas
- `app/Admin/` – administration pages.
- `app/Course/`, `app/Course_user/` – course management and user course views.
- `app/QA/`, `app/QA_NEW/`, `app/USER_QA/` – question/answer and assessment modules.
- `app/ebook/` – ebook upload and metadata persistence.
- `app/knowledge/` – knowledge content modules.
- `app/Police_service/` – service-oriented pages/endpoints.

### Third-party/vendor content to treat as external
- `app/phpMyAdmin/` – embedded phpMyAdmin distribution (do not mass-edit spelling here).
- `app/assets/` and many minified JS/CSS files – vendor/static bundles.
- `app/obj/`, `app/bin/` – build outputs.

## Spellcheck pass status

A full-repo spellcheck was performed with a conservative approach:
- Scanned for common misspellings across project files.
- Ignored binary/build/vendor-heavy paths where corrections would be unsafe or overwritten.
- Applied only a safe first-party typo correction in LMS source code.

### Corrected typo
- `app/ebook/add.aspx.cs`
  - Updated user-facing error text by correcting a misspelling in the upload error message.


## Full project update

For a one-command maintenance run across readiness checks, duplicate scanning, and structure verification:

```bash
./scripts/update_full_project.sh
```

Optional flags:

- `--apply-duplicates` removes duplicate backup/copy files.
- `--rebuild-installer` regenerates installer artifacts in `dist/`.

## Live readiness proof checks

Run the repository readiness check script before going live:

```bash
./scripts/live_readiness_check.sh
```

It verifies production-safe Web.config debug settings and runs a scoped first-party typo scan.

For a broader non-mutating project dry run, use:

```bash
./scripts/dryrun_full_project.sh
```

This runs live readiness checks and duplicate cleanup scanning in dry-run mode.


## Release upgrades applied

- `app/Web.config` now runs with `debug="false"` and `customErrors mode="On"` for production-safe behavior.
- Added `app/Web.Release.config` to enforce release transform defaults during publish.
- Extended `scripts/live_readiness_check.sh` to verify release transform presence and `customErrors` release posture.

## Maintenance automation

- `./scripts/clean_duplicate_files.sh` scans for backup/copy/tmp files with identical content and removes redundant duplicates with `--apply`.
- `./scripts/generate_installer.sh` packages the project into `dist/zlms-payload.tar.gz` and generates `dist/zlms-installer.sh` for repeatable installs.

