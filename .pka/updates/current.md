
## 2026-04-23 22:25 — windows2025-bare winrm timeout fix  [batch]

**Type:** status

Diagnosed WinRM timeout on run 24848303553: bare got guest IP (Tools was running) but port 5985 never answered — WS2025 classifies fresh NICs as Public, and `winrm quickconfig -q` refuses to create a listener on a Public profile. Replaced six FirstLogonCommands with a first-logon `bootstrap.ps1` that forces profile=Private, installs VMware Tools from the attached CD with breadcrumbs in `C:\Windows\Temp\`, runs `Enable-PSRemoting -Force -SkipNetworkProfileCheck`, opens firewall on 5985 profile=any, and restarts WinRM. Switched `cd_content` → `cd_files` to ship bootstrap.ps1 on the PACKER CD. Dropped parked cbinit from `build.sources` (still pinned to pre-remaster ISO, was poisoning CI). `10-install-vmtools.ps1` now short-circuits if VMTools service exists. Commit `f9c54e6` pushed; CI run 24861870270 in progress (~1h+). No local packer binary, so `packer validate` wasn't run — CI is the syntax gate.

## 2026-04-23 08:15 — ci-retrigger-aborted

**Type:** status
**Needs Scott:** true

### What I did
- Scott asked me to push an empty commit to retrigger CI and validate the f9c54e6 WinRM fix on a fresh VM (prior run 24861870270 was invalidated by manual VMware Tools install mid-build).
- Stopped at step 1: working tree is not clean. `.pka/updates/` has a deleted rollup, a modified `current.md`, and untracked `2026-04-23-0757-rollup.md` + `archive/`. Did not commit, push, or touch anything.

### What I learned
- Nothing new about the build. The `.pka/` churn looks like rollup/archive activity from a prior session that didn't get tidied.

### What's next or blocked
- Blocked on Scott deciding how to handle the `.pka/` state before the retrigger. Options offered: (1) stash/commit `.pka/` first, (2) he cleans it up, (3) proceed anyway (not recommended — retrigger commit would sweep in `.pka/` changes).
