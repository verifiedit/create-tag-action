# Create Tag Action

Create a tag on the current repository.

#### Inputs

Use these inputs to customise the action.

| Input Name | Default | Required? | Description                     |
|------------|---------|-----------|---------------------------------|
| tag        | N/A     | Y         | The tag to create on repository |
| message    | N/A     | Y         | The message for the tag         |

#### Example

```yaml
on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: verifiedit/create-tag-action@v1
        with:
          tag: ${{ github.run_number }}
          message: Build ${{ github.run_number }}
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
