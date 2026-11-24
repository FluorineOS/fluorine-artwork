#!/usr/bin/env bash
set -euo pipefail

# Renders the committed 4K wallpaper vectors into lossless PNGs.
#
# The repository carries SVG sources only; the package carries the rendered
# 3840x2160 PNGs. debian/rules calls this before dh_install, so every build
# produces the wallpapers from the same vectors instead of shipping binaries in
# git. rsvg-convert is deterministic here: same input, same output bytes.

readonly program="generate-wallpapers"
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
readonly script_dir
repo_root=$(dirname -- "${script_dir}")
readonly repo_root
readonly src_dir="${repo_root}/wallpapers"
readonly out_dir="${src_dir}/out"
readonly width=3840
readonly height=2160
readonly names=(grid hex topo void)

die() {
    printf '%s: %s\n' "${program}" "$*" >&2
    exit 1
}

command -v rsvg-convert >/dev/null 2>&1 || die "rsvg-convert is required (librsvg2-bin)"

mkdir -p "${out_dir}"

for name in "${names[@]}"; do
    source_file="${src_dir}/fluorine-${name}.svg"
    [ -f "${source_file}" ] || die "missing wallpaper source: ${source_file}"
    rsvg-convert \
        --width "${width}" \
        --height "${height}" \
        --output "${out_dir}/fluorine-${name}.png" \
        "${source_file}"
    printf 'rendered %s\n' "${out_dir}/fluorine-${name}.png"
done
