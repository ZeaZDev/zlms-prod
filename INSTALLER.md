# Project Installer

This repository now includes an automated installer script:

```bash
./installer.sh
```

## What it does

1. Installs Linux dependencies for this legacy ASP.NET WebForms project (`mono`, etc.), treating `mono-xsp4`, `msbuild`, and `nuget` as optional packages when unavailable on newer distros.
2. Restores NuGet packages.
3. Checks for required DevExpress 14.2 vendor DLLs.
4. Builds `app/lms.csproj` in `Release` configuration.

## Notes

- `mono-complete`, `unzip`, and `curl` are required and the installer exits early if they are not available in apt repositories.
- On newer Ubuntu releases where `mono-xsp4` / `msbuild` / `nuget` packages are unavailable, the installer continues with warnings, falls back to `xbuild`, and bootstraps a local `nuget.exe` automatically.
- If those files are not present, build/runtime may be limited even if installer runs.
- The script targets Debian/Ubuntu systems.
