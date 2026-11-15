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

## Fælles kogebog med din kæreste (Firebase)

Opskrifterne gemmes gratis i jeres eget Firebase-projekt hos Google. Det skal kun sættes op én gang, af den ene af jer. Det er nemmest på en computer.

1. **Opret projekt:** Gå til https://console.firebase.google.com, log ind med din Google-konto, tryk *Create a project* (Opret projekt), kald det fx `vores-kogebog`. Google Analytics kan du slå fra.
2. **Tilføj en web-app:** Tryk på *</>*-ikonet (Web) på projektets forside, giv den navnet `Kogebog`, og tryk *Register app*. Kopiér den blok, der starter med `const firebaseConfig = {`.
3. **Opret databasen:** I menuen til venstre: *Build → Firestore Database → Create database*. Vælg placeringen `eur3 (europe-west)` og *Start in production mode*.
4. **Sæt reglerne:** Gå til fanen *Rules* i Firestore, erstat alt med teksten herunder og tryk *Publish*:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /kogeboeger/{bog}/opskrifter/{id} {
      allow read, write: if bog.matches('kb-[A-Za-z0-9_-]{20,}');
    }
  }
}
```

5. **I appen:** Åbn Kogebog fra hjemmeskærmen, tryk på personikonet øverst, sæt `firebaseConfig`-blokken ind og tryk *Opret fælles kogebog*. Dine opskrifter bliver lagt op.
6. **Inviter din kæreste:** Tryk *Inviter din kæreste* og send linket. Din kæreste åbner det i Safari, føjer appen til hjemmeskærmen, åbner appen, trykker på personikonet og sætter linket ind under *Har du fået et invitationslink?*.

Kogebogen har en lang, tilfældig kode, som ligger i invitationslinket. Alle med linket kan se og ændre opskrifterne, så send det kun til dem, der skal være med. Firebases gratis plan rækker langt til to personer.
