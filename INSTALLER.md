# Project Installer

This repository now includes an automated installer script:

```bash
./installer.sh
```

## What it does

1. Installs Linux dependencies for this legacy ASP.NET WebForms project (`mono`, `xsp4`, `msbuild`, `nuget`).
2. Restores NuGet packages.
3. Checks for required DevExpress 14.2 vendor DLLs.
4. Builds `app/lms.csproj` in `Release` configuration.

## Notes

- The project references proprietary DevExpress DLLs from a relative path (`../../lms-library`).
- If those files are not present, build/runtime may be limited even if installer runs.
- The script targets Debian/Ubuntu systems.
