# Lockfile-herverwerking — 2026-11-09

Snapshot: 2026-11-09T16:42:26+00:00.

Alle 14 eerder geblokkeerde PR’s in 8 repositories opnieuw verwerkt met de full-image.
Automerge en platform-automerge waren voor deze onderhoudsrun uitgeschakeld.
Geen managers of dependencies uitgeschakeld; geen PR’s automatisch gesloten.

Resultaat: 10 PR’s hebben nu een bijgewerkte lockfile; 4 hebben een bevestigd peer-dependencyconflict.
CI op dit moment: één herstelde PR groen, zes nog in de wachtrij/actief, drie zonder CI-status.
Een herstelde lockfile betekent dus nog niet dat de majorupdate klaar is om te mergen.

| PR | Lockfile | CI bij snapshot | Resterende oorzaak |
|---|---|---|---|
| [yt-download-material #15](https://git.fun-cloud.nl/cafun/yt-download-material/pulls/15) | conflict | rood | Angular framework/compiler 22 tegenover @angular-devkit/build-angular 21; gecoördineerde Angular-buildtoolupdate vereist. |
| [typeheld #16](https://git.fun-cloud.nl/cafun/typeheld/pulls/16) | conflict | rood | @vitejs/plugin-react 6 vereist Vite ^8.0.0; project gebruikt Vite 7.3.8. |
| [kilometers-uren-app #21](https://git.fun-cloud.nl/cafun/kilometers-uren-app/pulls/21) | hersteld | wacht/lopend | — |
| [human-atlas-3d #27](https://git.fun-cloud.nl/cafun/human-atlas-3d/pulls/27) | conflict | rood | react-i18next 18.0.1 vereist i18next >=27.0.1; project gebruikt i18next 26.7.2. |
| [human-atlas-3d #26](https://git.fun-cloud.nl/cafun/human-atlas-3d/pulls/26) | hersteld | wacht/lopend | — |
| [human-atlas-3d #25](https://git.fun-cloud.nl/cafun/human-atlas-3d/pulls/25) | hersteld | wacht/lopend | — |
| [healthcare-security-learning #14](https://git.fun-cloud.nl/cafun/healthcare-security-learning/pulls/14) | hersteld | wacht/lopend | — |
| [hackbox #17](https://git.fun-cloud.nl/cafun/hackbox/pulls/17) | hersteld | geen CI | — |
| [hackbox #16](https://git.fun-cloud.nl/cafun/hackbox/pulls/16) | hersteld | geen CI | — |
| [family-hub #24](https://git.fun-cloud.nl/cafun/family-hub/pulls/24) | hersteld | groen | — |
| [zai-usage-widget #8](https://git.fun-cloud.nl/cafun/zai-usage-widget/pulls/8) | hersteld | geen CI | — |
| [yt-download-material #13](https://git.fun-cloud.nl/cafun/yt-download-material/pulls/13) | hersteld | wacht/lopend | — |
| [typeheld #14](https://git.fun-cloud.nl/cafun/typeheld/pulls/14) | hersteld | wacht/lopend | — |
| [healthcare-security-learning #11](https://git.fun-cloud.nl/cafun/healthcare-security-learning/pulls/11) | conflict | rood | ESLint 10 valt buiten de peer-range van eslint-plugin-react 7.37.5 (maximaal ESLint 9). |

## Afwijking bij yt-download-material

De eerste run brak af op een andere npm-groepsupdate (onder meer een ws-overrideconflict),
voordat de twee geselecteerde PR’s verwerkt waren. Een tweede run gaf `node` en `@angular/*`
alleen een hogere `prPriority`; er werden geen dependencies uitgeschakeld. Node-PR #13 kreeg
een lockfile; Angular-PR #15 bevestigde het framework/buildtoolconflict.

## Vervolg

Laat de nieuw gestarte CI-runs afronden vóór een mergebesluit. Beoordeel de vier conflicten
als gecoördineerde majorupgrades; omzeil ze niet met `--force` of `--legacy-peer-deps`.
Hackbox #16/#17 en zai-usage-widget #8 hebben eerst afzonderlijke build-/testvalidatie nodig.
De onderhoudsrun heeft ook reguliere nieuwe dependency-PR’s ontdekt; die zijn niet gemerged.
