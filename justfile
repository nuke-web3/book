# Use with https://github.com/casey/just
# https://just.systems/man/en/chapter_42.html#safer-bash-shebang-recipes

alias s := serve
alias ss := serve-slides
alias sb := serve-book
alias b := build
alias f := fmt
alias c := clean
alias i := install
alias l := links

default: serve-slides

# -----------------------------------------------------------------------------
# Installation

# Install required tools (bun, mdbook, dprint, ...)
install:
    #!/usr/bin/env bash
    set -euxo pipefail
    if ! $(echo "type bun" | sh > /dev/null ); then
        echo "🥟 Installing https://bun.sh ..."
        curl -fsSL https://bun.sh/install | bash
        # FIXME - only works on linux 🙈
        source ~/.bashrc
    fi
    echo "💽 Bun installed. NOTE: you may need to update your shell to include this, see above output."

    echo "🥟 Install slides tooling with Bun..."
    bun install
    echo "✅ Slides instalation complete!"

    # Install book engine.
    if ! $(echo "type mdbook" | sh > /dev/null ); then
        cargo install --locked mdbook
    fi

    # install deps for web
    bun i

# Wipeout build and dependancy artifacts, then install.
reinstall: clean
    rm -rf node_modules/ && just install

# Wipeout build and dependancy artifacts, then install (including dev tooling).
reinstall-dev: reinstall install-dev

# Install base deps and dev tools.
install-dev: install
    #!/usr/bin/env bash
    set -euxo pipefail
    # Install markup link checker (mlc).
    if ! $(echo "type mlc" | sh > /dev/null ); then
        cargo install --locked mlc
    fi

    # Install formatter (dprint).
    if ! $(echo "type dprint" | sh > /dev/null ); then
        cargo install dprint
    fi

# First *build* the embedded slides, then serve book.

# We must build static HTML for slides that is embedded into the book
serve: build-slides build-book
    #!/usr/bin/env bash
    set -euxo pipefail
    # FIXME - want some way to have a watching server for slides AND the book. Likely some hooks in mdBook and/or reveal-md could be used.
    # copy files from slides build to book build
    rsync -av html-slides/content/ html-book/ --ignore-existing  > /dev/null
    rsync -av html-slides/ --exclude "content" html-book/ --ignore-existing  > /dev/null

    # The reveal tooling uses a one-too-deep path for the book
    # "./../../../" in ALL CASES within the html flies should be "../../" so we fix those:
    find html-book/ -regex .*\.html | xargs sed -i'' -e 's#./../../../#../../#g' > /dev/null

    # serve the book with embedded slides
    # FIXME non-watching server becuase mdBook clobbers the rsync we did above 😭
    just serve-embedded

# Serve book for local viewing, auto-updates for book file changes
serve-book:
    mdbook serve -o

# Serve slides only for local viewing, auto-updates for slides-source file changes
serve-slides:
    bun s

# Serve book with embedded slides for local viewing, NO updates for slides-source file changes
serve-embedded:
    bun serve-book 2> /dev/null

# -----------------------------------------------------------------------------
# Build, staging for and/or publishing for production

# Build the embedded slides, then the static site for the book.
build: build-slides build-book

# Build the static site for the book.
build-book:
    mdbook build

# Build the static slides only, local developmet.
build-slides:
    bun build-slides-local > /dev/null

# -----------------------------------------------------------------------------
# Dev tools for style, convention, and formatting

# Cleanup build artifacts
clean: clean-book clean-slides
    #!/usr/bin/env bash
    set -euxo pipefail
    # cargo clean

# Clean the book static build files
clean-book:
    #!/usr/bin/env bash
    set -euxo pipefail
    # Wipeout build artifacts 
    rm -rf html-book/

# Clean the slides static build files
clean-slides:
    #!/usr/bin/env bash
    set -euxo pipefail
    rm -rf html-slides

# Scan for image issues througout content.
img:
    ./tools/scripts/orphan-image-scan.sh content/

# Check included links for all markup (.md|.html) files.
links:
    mlc

# Check links for specific file(s). Example: `just links-for ./content/contribute/**/*.md`
links-for file-glob:
    mlc {{ file-glob }}

# Format .rs (with cargo) and .ts, .md,... (config in .dprint)
fmt:
    #!/usr/bin/env bash
    set -euxo pipefail
    # cargo fmt
    dprint fmt
    just --unstable --fmt
