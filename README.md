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
