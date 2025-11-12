# Create Tag Action

Create a tag on the current repository.

#### Inputs

Use these inputs to customise the action.

| Input Name | Default | Required? | Description                     |
|------------|---------|-----------|---------------------------------|
| tag        | N/A     | Y         | The tag to create on repository |
| message    | N/A     | Y         | The message for the tag         |

## Usage

This action is implemented as a composite action (runs directly on the runner). Because it pushes tags back to the repository, make sure the workflow grants the job write permission to repository contents.

### Main example

A minimal example that runs on pushes to `main` and creates a tag using the run number. It sets `fetch-depth: 0` so the repository history and SHA are available for tagging.

```yaml
on:
  push:
    branches:
      - main

permissions:
  contents: write

jobs:
  tag:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
        with:
          fetch-depth: 0

      - name: Create tag
        uses: verifiedit/create-tag-action@v2
        with:
          tag: v${{ github.run_number }}
          message: "Build ${{ github.run_number }}"
```

### Notes

- The workflow above sets `permissions: contents: write` so the action can push tags back to the repository.
