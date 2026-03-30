# Ubuntu 24.04 Migration & Operations Manual (zLMS-prod)

This manual explains how to run the legacy ASP.NET Web Forms project (`app/lms.csproj`) on **Ubuntu 24.04 LTS** using Mono compatibility mode.

---

## 1) What “converted to Ubuntu 24.04” means for this repo

This project targets **.NET Framework 4.6.1**, not modern .NET. On Ubuntu, it runs through **Mono** rather than IIS/.NET Framework runtime.

Key implications:
- Build and restore use Mono toolchain (`msbuild`/`xbuild`, `nuget`).
- Local hosting uses `xsp4` for compatibility testing.
- Licensed DevExpress DLLs must be available in the path used by `HintPath` entries in `app/lms.csproj`.

---

## 2) Quick start (automated installer)

From repository root:

```bash
chmod +x installer.sh
./installer.sh --yes
```

If you already have DevExpress binaries in a directory or zip:

```bash
DEVEXPRESS_SOURCE=/path/to/devexpress-16.2 ./installer.sh --yes
```

Then smoke-test locally:

```bash
cd app
xsp4 --port 8080
```

Open: `http://localhost:8080`.

---

## 3) Full manual setup (step-by-step)

### 3.1 Update apt metadata

```bash
sudo apt-get update
```

### 3.2 Install required runtime + build dependencies

```bash
sudo apt-get install -y mono-complete ca-certificates curl unzip
```

Optional but recommended:

```bash
sudo apt-get install -y msbuild mono-xsp4 nuget
```

### 3.3 Restore NuGet packages

If `nuget` command is present:

```bash
nuget restore app/packages.config -PackagesDirectory ./packages
```

If `nuget` command is absent, bootstrap `nuget.exe`:

```bash
mkdir -p .tools
curl -fsSL https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -o .tools/nuget.exe
mono .tools/nuget.exe restore app/packages.config -PackagesDirectory ./packages
```

### 3.4 Place licensed DevExpress assemblies

The project references DevExpress binaries from:

```text
app/../../lms-library  (resolved from app/lms.csproj HintPath entries)
```

Create/populate that folder with all DevExpress DLLs required by `app/lms.csproj`.

### 3.5 Build Release

```bash
msbuild app/lms.csproj /p:Configuration=Release
```

Fallback:

```bash
xbuild app/lms.csproj /p:Configuration=Release
```

### 3.6 Run local app process

```bash
cd app
xsp4 --port 8080
```

---

## 4) Operations checklist for Ubuntu 24.04

- [ ] `mono --version` works.
- [ ] `msbuild` (or `xbuild`) works.
- [ ] NuGet packages restored under `./packages`.
- [ ] DevExpress DLL warnings are gone.
- [ ] Release build succeeds.
- [ ] Local HTTP smoke test on `http://localhost:8080` succeeds.

---

## 5) Troubleshooting

### Missing DevExpress assemblies
Symptoms: build errors mentioning `DevExpress.*` not found.

Action:
- Copy matching 16.2 licensed binaries into `../../lms-library` relative to `app/`.
- Re-run `./installer.sh --yes` or rebuild manually.

### `msbuild` not available
Use `xbuild` fallback and keep `mono-complete` installed.

### `xsp4` not found
Install:

```bash
sudo apt-get install -y mono-xsp4
```

### NuGet TLS/download issues
Refresh certificates and retry:

```bash
sudo apt-get install -y ca-certificates
sudo update-ca-certificates
```

---

## 6) Recommended deployment posture

For production-like hosting on Ubuntu, prefer placing this app behind a reverse proxy and service manager instead of running `xsp4` in an interactive shell.

A pragmatic path is:
1. Build and verify with this manual.
2. Run the app under a supervised service user.
3. Front with NGINX and enforce TLS termination.
4. Keep this repo and external `lms-library` synchronized during releases.

