# CLAUDE.md — renovate-config

Gedeelde Forgejo Renovate-preset (`default.json`) en self-hosted runner op claude.

- Cron: 05:30 via `/claude/bin/renovate-forgejo-run`, symlink naar `scripts/run.sh`.
- Beheerconfig: `config.js` in deze repository; bestaande discoveryfilter `cafun/*`.
- Image: `renovate/renovate:44.198.3-full` met npm/pnpm/composer en binarySource=global.
- Secrets blijven buiten Git: Forgejo-token in `~/.config/forgejo-sync/env`,
  healthcheck in `~/.config/renovate-forgejo/runtime.env` (mode 600).
- Een script/config-wijziging is direct actief voor de volgende cronrun.
- Valideer met `bash -n scripts/run.sh` en een dry-run vóór live onderhoud.
- Gerichte runs beperken tot repositories en automerge uitzetten; managers/dependencies
  uitschakelen kan andere PR’s automatisch sluiten. Nooit volledige vlootruns starten
  alleen om een test uit te voeren.

## Herverwerking
Als een ongerelateerde branch met `lockfile-error` de repository-run afbreekt,
mag een gerichte vervolg-run de gewenste pakketten een hogere `prPriority` geven.
Schakel daarvoor geen managers/dependencies uit. Controleer de nieuwe commit,
lockfile-diff en actuele CI-status; geen CI-status betekent geen geslaagde test.
