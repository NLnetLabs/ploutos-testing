# Ploutos Test Suite

This repository is used by **NLnet Labs** to test proposed changes to [Ploutos](https://github.com/NLnetLabs/ploutos/) prior to release.

To fully test both "development" and "release" specific behaviours of Ploutos, proposed changes are tested by creating a branch in this repository which invokes the not-yet-released Ploutos branch, then the test branch is merged to `main` and then tagged as would happen in normal use by a client repository making use Ploutos.
