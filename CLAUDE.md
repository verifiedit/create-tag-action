# CLAUDE.md

Guidance for Claude Code when working in this repository. This file is self-contained (primary reference), but keep `README.md` usage examples in sync for consumers.


## Project

Reusable GitHub composite Action that creates and force-pushes an annotated git tag on the calling repository. Consumed via `uses: verifiedit/create-tag-action@v2`.

## Stack

- **Type:** Composite action — see `runs.using: composite` in `action.yml`.
- **Language:** Bash (inline `run:` steps).
- **Entrypoint:** `action.yml`.
- **Inputs:** `tag` (required), `message` (required).
- **Side effects:** runs `git config`, `git fetch --tags`, `git tag -a -f`, `git push --tags -f`.

## Commands

There is no build step. The action is `action.yml` plus the bash steps it invokes. To exercise it locally use [`act`](https://github.com/nektos/act) or trigger it from a sandbox workflow against a throwaway repo.

## Before declaring a task complete

- `action.yml` `inputs` and `runs.steps` are consistent.
- A consumer workflow (or `act` run) successfully creates and pushes the expected tag against a sandbox repo.
- The README usage example matches the current input names and `@vX` reference.

## Layout

```
action.yml         # Action manifest — single source of truth for inputs and steps
README.md          # Usage example for consumers
```

## Conventions

- **Commits** must include the Jira ticket: `[ITS-123] description` or `[PH-1234] description`.
- **PR reviewers**: `verifiedit/dev`.
- **Tag versions explicitly.** Consumers pin via `@vX` or commit SHA — moving a major tag (`v2`) requires care.
- **Inputs documented.** Every `inputs.*` entry has a `description` and, where useful, a `default`.
- **No org-specific secrets baked in.** The action relies on git authentication provided by the calling workflow (typically via `actions/checkout` using `GITHUB_TOKEN`, with `permissions: contents: write`).
- **Force-push semantics.** This action force-pushes tags by design (`-f`). Consumers must accept that re-running clobbers existing tags of the same name.

## Releasing

- Tag with semver (`vX.Y.Z`) and move the major alias (`vX`) to the new tag.
- Update `README.md` usage example if inputs change.

## Things to avoid

- Switching from composite to a JS or Docker action without updating consumers.
- Logging input values that may contain secrets — the action currently echoes `tag`/`message` for debugging; if those inputs could ever contain sensitive data, remove/redact that logging.
- Logging input values that may contain secrets — `tag` and `message` are not secrets today, but treat them carefully if that changes.
- Removing the `safe.directory` git config — it's required when running on self-hosted runners with mounted workspaces.

## Skills

- `/code-review`, `/review`, `/security-review`, `/simplify`, `/init`.
