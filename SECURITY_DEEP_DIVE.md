# Security Deep Dive (Source Code)

## Scope

Manual secure-code review focused on first-party ASP.NET Web Forms source under `app/` (excluding build output/vendor trees such as `app/obj`, `app/bin`, `app/assets`, and `app/phpMyAdmin`).

## High-Risk Findings

1. **SQL injection in Question module (fixed in this change)**
   - Previously, dynamic SQL concatenated request/input values directly in:
     - `Questiondetail.addGroup(...)`
     - `Questiondetail.addUser(...)`
   - Risk: attacker-controlled query/body values could alter SQL semantics.
   - Remediation applied: strict integer parsing and parameterized `SqlCommand` for inserts.

2. **Stored/DOM XSS risk in message rendering (fixed in this change)**
   - `ShowMessage(...)` inserted raw message text inside JavaScript string context.
   - Risk: quotes/script payload in message content could break out of JS string.
   - Remediation applied: `HttpUtility.JavaScriptStringEncode(...)` before injection.

3. **Unrestricted file upload in ebook module (fixed in this change)**
   - Upload flow accepted unvalidated file types and persisted user file names to disk.
   - Risk: malicious file upload, overwrite attempts, and dangerous extension handling.
   - Remediation applied:
     - allowlist extensions (`.pdf` for document, `.jpg/.jpeg/.png` for covers)
     - max size checks
     - generated random server-side file names (GUID + extension)

## Additional Critical Issues Still Present (not yet remediated)

1. **Hardcoded SQL Server credentials in source config**
   - `app/Web.config` includes `User ID=sa;Password=...` in plaintext connection string.
   - Recommendation: move secrets to environment/protected secret store and rotate immediately.

2. **Legacy pages with request validation disabled**
   - `knowledge*/forum/digest.aspx` sets `ValidateRequest="false"`.
   - Recommendation: re-enable request validation and implement explicit HTML sanitization where rich text is required.

3. **Broad request body size limits**
   - `maxRequestLength` / `maxAllowedContentLength` are set near 1 GB.
   - Recommendation: reduce to minimum required values to lower upload abuse/DoS risk.

## Suggested Next Actions

1. Replace all string-concatenated SQL occurrences with parameterized statements/repository helpers.
2. Add centralized input validation helpers for ID/query/form parsing.
3. Add upload malware scanning + storage isolation (non-executable location + content-type verification).
4. Implement authz checks on high-impact admin actions and add anti-CSRF checks on mutation endpoints.
5. Add secure-configuration gate in CI (secret scanning, dangerous Web.config settings, request validation checks).
