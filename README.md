# PardeepKumar816.github.io

Personal portfolio and résumé site for **Pardeep Kumar**, built with Flutter and
deployed to GitHub Pages.

Live at <https://pardeepkumar816.github.io> — intentionally **recruiter-only**
(see [Visibility](#visibility)).

---

## Stack

| | |
|---|---|
| Framework | Flutter 3.32.5 (pinned in `.fvmrc`) |
| State | `provider` + `shared_preferences` for persisted light/dark theme |
| Icons | `flutter_svg` 1.1.6 |
| Links | `url_launcher` |

Only four runtime dependencies. All content is plain Dart data — there is no CMS,
no network layer, and no backend.

## Sections

`Home · About · Experience · Tech · Projects · Education · Contact`

The whole page is **one `SingleChildScrollView`**, with each section holding a
mounted `GlobalKey` in `lib/core/section_keys.dart`. That is what lets the nav bar
track the active section and lets reveal animations fire against real viewport
coordinates instead of guessed offsets.

## Getting started

```bash
fvm install          # reads .fvmrc -> Flutter 3.32.5
fvm flutter pub get
fvm flutter run -d chrome
```

Without `fvm`, any Flutter 3.32.x on the stable channel works:

```bash
flutter pub get
flutter run -d chrome
```

## Editing content

**All copy, projects, experience and skills live in one file:**

```
lib/data/portfolio_data.dart
```

You should not need to touch any widget to change what's on the page.

### Project statuses

`lib/models/project_model.dart` defines four states, each with its own chip and
fallback text:

| Status | Shows |
|---|---|
| `live` | no chip |
| `launchingSoon` | "Launching soon" |
| `privateClient` | "Private client" + "not publicly launched" |
| `inDevelopment` | "In development" |

A project link may omit its URL. When `url` is `null`, `ProjectLink.isLive` is
false and the button renders with `pendingMessage` and shows a toast on tap —
this is how store buttons ship before a listing exists. `Project.hasLinks` counts
only live URLs, and `hasPendingLinks` keeps the row from rendering a misleading
"no public link" note next to a pending button.

### Tools vs Concepts

The Tech section splits skills into two tiers so the list stays honest:

- **Tools** — things with a real, verifiable logo. Rendered as tinted icons.
- **Concepts** — practice areas with no meaningful brand mark (RAG, CI/CD,
  TDD). Rendered as running muted text rather than fake icon tiles.

`Skill.tool` marks a genuine tool that has no available logo, so it stays in the
Tools tier without a tile. **Don't invent icons for concepts** — if it has no
brand, it belongs in Concepts.

## Adding images

⚠️ **Flutter asset directory entries are not recursive.**

Declaring `assets/images/` picks up files sitting *directly* in it. It does
**not** pick up subfolders. Every new folder needs its own entry:

```yaml
assets:
  - assets/icons/
  - assets/images/projects/mynewproject/   # required, one line per folder
```

Miss it and `flutter analyze`, `flutter test` and `flutter build web` all pass,
then the image 404s in the browser. This has bitten this repo twice, so two
tests in `test/design_test.dart` now fail the build if a referenced asset is
missing or its folder is undeclared, and the deploy workflow re-checks the built
artifact before publishing.

Set `portraitImage: true` on a project whose screenshot is taller than it is
wide; the card then uses a portrait box instead of centre-cropping your screen
in half.

## Tests

```bash
fvm flutter test
```

23 tests covering asset declarations, the Tools/Concepts split, project link and
status behaviour, `RevealOnScroll`, theme-dependent colours, and the nav brand.

The suite runs in `flutter test` only — no integration or golden tests.

## Deployment

`.github/workflows/pages.yml` builds and publishes to GitHub Pages.

It is **`workflow_dispatch` only**: nothing deploys on push, by design, so a
merged branch can never publish by accident.

```bash
git push origin main
```

Then trigger it: **Actions → Deploy portfolio to GitHub Pages → Run workflow →
Branch: `main`.**

The workflow runs format, analyze, test, release build, and an artifact
assertion before deploying. Pages is configured with `build_type: workflow`
(source: GitHub Actions, not a branch).

> **One-time setup:** Settings → Pages → Source → **GitHub Actions**. Until this is
> set, the workflow completes but Pages keeps serving whatever branch it had.

## Visibility

This site is **recruiter-only, not for search engines**:

- `noindex, nofollow, noarchive, nosnippet, noimageindex` in `web/index.html`
- `web/robots.txt` disallows all crawlers

It is meant to be linked directly in an application or email. If you want it
findable by name, remove both.

## Architecture notes

- **`RevealOnScroll`** (`lib/widgets/reveal_on_scroll.dart`) animates sections in
  on the shared `ScrollController`. It uses no `Timer`, detaches its listener once
  a section has played, and renders everything immediately when
  `MediaQuery.disableAnimations` is set.
- **Theme-aware icons.** `flutter_svg` 1.1.6 has no `colorFilter` argument, so
  tinting goes through `ColorFiltered` with `lib/core/icon_tint.dart`. App Store
  and Google Play badges recolour with the theme; this is deliberate, since the
  upstream marks are solid black.
- **Reduced motion** is honoured throughout — navigation underlines, reveals and
  hover states all collapse to instant when animations are disabled.

## Credits

- Icons from [Simple Icons](https://simpleicons.org) (brand marks belong to their
  owners).
- Fonts: Agustina (signature wordmark), Montserrat, Poppins.

## Licence

No licence has been granted for this repository — it is a personal portfolio and
is not open source. Simple Icons brand marks and the bundled fonts remain under
their own licences and are not covered by anything here.