Rust Windows Builder Action
========================

![GitHub](https://img.shields.io/github/license/sevco/rust-windows-cross-action)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/sevco/rust-windows-cross-action)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/sevco/rust-windows-cross-action/CI)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/sevcosec/rust-windows-cross-action)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/sevcosec/rust-windows-cross-action)


GitHub action for building windows targeted rust binaries (x86_64-pc-windows-gnu). 

```yaml
- uses: sevco/rust-windows-cross-action@1.73.0
  with:
    args: build --release --all-features
    git_credentials: ${{ secrets.GIT_CREDENTIALS }}
```
### Inputs
| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| args     | Arguments passed to cargo | true | `build --release` | 
| git_credentials | If provided git will be configured to use these credentials and https | false | |
| directory | Relative path under $GITHUB_WORKSPACE where Cargo project is located | false | |