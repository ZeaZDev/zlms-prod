# Project Installer

This repository now includes an automated installer script:

```bash
./installer.sh
```

## What it does

1. Installs Linux dependencies for this legacy ASP.NET WebForms project (`mono`, `xsp4`, etc.) and adapts to distro package availability.
2. Restores NuGet packages.
3. Checks for required DevExpress 14.2 vendor DLLs.
4. Builds `app/lms.csproj` in `Release` configuration.

## Notes

- On newer Ubuntu releases where `msbuild` / `nuget` packages are unavailable, the installer falls back to `xbuild` and a bootstrapped local `nuget.exe` automatically.
- If those files are not present, build/runtime may be limited even if installer runs.
- The script targets Debian/Ubuntu systems.
