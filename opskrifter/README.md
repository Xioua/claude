# Min Kogebog

Opskriftsapp til mobilen.

- **Sæt et link ind**: appen henter opskriften fra siden (titel, antal, tid, billede, ingredienser og fremgangsmåde) og sætter den op i det faste format. Den læser de opskriftsdata (schema.org), som næsten alle opskriftssider har. På Android kan du også trykke *Del* i browseren og vælge Kogebog.
- **Engelsk bliver til dansk**: engelske opskrifter oversættes automatisk. Cups, oz, lb og °F omregnes til dl, g og °C.
- **Kategorier**: Morgenmad, Middagsmad, Aftensmad, Desserter og Drinks. Appen gætter kategorien, og du kan rette den.
- **Skriv selv**: én ingrediens pr. linje, mængden først.
- **Skalér**: vælg hvor mange du laver mad til, så regnes alle mængder om.
- **Backup**: opskrifterne gemmes på telefonen. Gem en backup-fil en gang imellem.

## Filer

- `app.html` er kilden. Den kører også som artifact på claude.ai, hvor link-import er slået fra.
- `./build.sh` laver `index.html` (den selvstændige app).
- `manifest.webmanifest`, `sw.js` og ikonerne gør, at appen kan lægges på hjemmeskærmen og virker offline.

## Sådan kommer appen på nettet (GitHub Pages)

1. Gør repoet offentligt: *Settings → General → Danger Zone → Change visibility*.
2. Slå Pages til: *Settings → Pages → Source: GitHub Actions*.
3. Flet branchen ind i `main`. Workflowet *Udgiv Min Kogebog* lægger appen ud.
4. Åbn `https://<brugernavn>.github.io/claude/` på mobilen og vælg *Føj til hjemmeskærm*.

## Om link-import og oversættelse

Browsere må ikke læse andre hjemmesider direkte, så siderne hentes gennem en offentlig CORS-proxy (allorigins, corsproxy.io eller codetabs; den næste prøves, hvis én fejler). Oversættelsen bruger Google Oversæt. Begge er gratis tjenester uden garanti, så hvis en side ikke kan hentes, kan du kopiere opskriftens tekst og bruge fanen *Tekst*.
