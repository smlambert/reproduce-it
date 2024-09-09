# reproduce-it

This repository is a playground for experiments in reproducibility for Java applications and their dependencies and toolchain, including the underlying JDK binaries (Temurin by Adoptium) used to compile them.

repro1: Refers to the [Maven Guide to Reproducible Builds](https://maven.apache.org/guides/mini/guide-reproducible-builds.html) for checking that a simple "Hello Adoptium World" project is reproducible.

repro2: Refers to the [Adoptium Third-Party Reproducible Verification Builds documentation](https://adoptium.net/docs/reproducible-verification-builds/) to reproduce a Temurin JDK 21+ build.

To run each example, cd into the reproX directory and run `./repro.sh <yourGitProfileName>`.

