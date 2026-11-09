# renovate-config

Centrale Renovate preset configuratie voor alle Cafun repos.

## Gebruik

Voeg dit toe aan `renovate.json` in elke repo:

```json
{
  "$schema": "https://docs.renovatebot.com/renovate-schema.json",
  "extends": ["local>Cafun/renovate-config"]
}
```

## Wat doet deze preset?

- **Schedule:** maandagochtend voor 07:00 (Europe/Amsterdam)
- **Automerge:** minor, patch en digest updates worden automatisch gemerged
- **Major updates:** aparte PR, handmatig reviewen
- **Groepering:** Docker, Python en npm minor/patch updates worden gegroepeerd per type
- **Limieten:** max 5 PRs per uur, max 3 gelijktijdig open
- **upload/download-artifact:** blijft op v3; v4+ weigert Forgejo als GHES (`GHESNotSupportedError`)

## Self-hosted runner

Deployment: claude, dagelijks om 05:30 via `/claude/bin/renovate-forgejo-run`.
De launcher is een symlink naar `scripts/run.sh` in deze checkout. `config.js` beperkt
autodiscovery tot `cafun/*`; secrets worden niet in deze repository bewaard.

De runner gebruikt `renovate/renovate:44.198.3-full` met vooraf geïnstalleerde tools
(`binarySource=global`). De standaardimage mist npm en kan bij GitHub API-limieten
geen tools installeren; dan ontstaan onvolledige PR’s met `renovate/artifacts`.
De volledige image voorkomt deze tool-downloads.

Installatie: clone deze repo op `/claude/projects/renovate-config`, plaats de
healthcheck uit `runtime.env.example` in `~/.config/renovate-forgejo/runtime.env`
(mode 600), en maak de symlink naar `scripts/run.sh`. Het Forgejo-token wordt
gelezen uit `~/.config/forgejo-sync/env` (`FORGEJO_TOKEN`).

| Instelling | Locatie |
|---|---|
| Platform, endpoint, discoveryfilter | `config.js` |
| Forgejo-token | `~/.config/forgejo-sync/env` |
| `RENOVATE_HEALTHCHECK_URL` | `~/.config/renovate-forgejo/runtime.env` |
| Preset en PR-beleid | `default.json` |

Controleer wijzigingen met `bash -n scripts/run.sh` en eerst een gerichte Renovate
dry-run. Bij onderhoud automerge uitschakelen en alleen repositories beperken;
managers/dependencies uitschakelen kan andere bestaande PR’s automatisch sluiten.
Na een fix de rebase/retry-checkbox van mislukte PR’s aanvinken.
