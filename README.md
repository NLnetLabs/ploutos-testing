# Ploutos Test Suite

## Welcome

This repository:

1. Is used by **NLnet Labs** to test proposed changes to the [NLnet Labs Rust Cargo Packaging workflow](https://github.com/NLnetLabs/.github/blob/main/docs/README.md#the-rust-cargo-packaging-starter-workflow) prior to release. To fully test both "development" and "release" specific behaviours of the NLnet Labs Rust Cargo Packaging workflow, proposed changes are tested by creating a branch in this repository which invokes the not-yet-released-branch of the NLnet Labs Rust Cargo Packaging workflow, then the branch is merged to `main` and tagged as would happen in normal use by a client repository making use of the NLnet Labs Rust Cargo Packaging workflow.

2. Can be used by **YOU** as a template when creating a new GitHub repository to create a repository that is (almost) ready out-of-the-box to package a Rust application using the [NLnet Labs Rust Cargo Packaging workflow](https://github.com/NLnetLabs/.github/blob/main/docs/README.md#the-rust-cargo-packaging-starter-workflow). _**Tip:** Click the "Use this template" button at the top of the index page of this repository. Leave the "Include all branches" box UNTICKED!_

3. Can be used by **YOU** as a reference when configuring an existing GitHub Rust repository to package the existing Rust application using the [NLnet Labs Rust Cargo Packaging workflow](https://github.com/NLnetLabs/.github/blob/main/docs/README.md#the-rust-cargo-packaging-starter-workflow).

## Building your own Rust application using this template

To create a new GitHub repository based on this one as a template:

1. Click the "Use this template" button at the top of the index page of this repository.

2. Fill in the form that appears and watch the new repository being created.

NOTE: A GitHub Actions `pkg` workflow will be run automatically in the new repository and **WILL FAIL**. This is because it expects but lacks two special secrets to be defined in the GitHub repository settings: `DOCKER_HUB_ID` and `DOCKER_HUB_TOKEN`. You only have to create those secrets if you want to package and publish your application to Docker Hub.

3. Edit (in your new repository!) `.github/workflow/pkg.yml`. The multiple `jobs` defined within each invoke the [NLnet Labs Rust Cargo Packaging workflow](https://github.com/NLnetLabs/.github/blob/main/docs/README.md#the-rust-cargo-packaging-starter-workflow) with various different inputs showcasing and testing different use cases supported by the workflow. Choose the example that best matches your use case and comemnt out or delete the others.

4. If you choose an example that publishes to Docker Hub you will need to replace:

```yaml
secrets: inherit
with:
  docker_org: ximoneighteen
  docker_repo: ximontest
```

With:

```yaml
secrets:
  DOCKER_HUB_ID: your_Docker_Hub_id
  DOCKER_HUB_TOKEN: ${{ secrets.YOUR_DOCKER_HUB_TOKEN_SECRET_NAME }}
with:
  docker_org: your_docker_org_name
  docker_repo: your_docker_repo_name
```

NOTE: To create a Docker Hub access token see https://docs.docker.com/docker-hub/access-tokens/#create-an-access-token.

5. Replace the sample `Cargo.toml` file and `src` directory with your own Rust application. Refer to the `Cargo.toml` in this repository for examples on how to configure the packaging process.

6. Edit the various files referenced by your `pkg.yml` and your `Cargo.toml`, which are mostly under the `pkg` directory. Refer to the `pkg/` files in this repository to see what sort of content these files should contain.
