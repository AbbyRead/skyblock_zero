#!/usr/bin/env bash
set -e

# ---------------------------------------------------------------------------
# extract_pot.sh — Generate/update .pot templates for Skyblock: Zero.
# Run from the repo root (alongside game.conf).
# ---------------------------------------------------------------------------

if [ ! -f game.conf ]; then
    echo "Error: game.conf not found. Run from the repo root." >&2
    exit 1
fi

if ! command -v xgettext &>/dev/null; then
    echo "Error: 'xgettext' not found. Please install gettext." >&2
    exit 1
fi

# Metadata for POT headers
GAME_TITLE=$(grep '^title' game.conf | sed 's/^title *= *//')
GAME_VERSION=$(git describe --tags --abbrev=0 2>/dev/null || echo "unversioned")
BUG_ADDRESS="https://codeberg.org/skyblock_zero/skyblock_zero/issues"
SUBMODULES=$(grep 'path = mods/' .gitmodules 2>/dev/null | sed 's|.*mods/||' || true)
CURRENT_YEAR=$(date +%Y)

# Only overwrite the file if the content (ignoring the POT-Creation-Date) has changed.
write_if_changed() {
    local dest="$1" tmp="$2"
    local filter='grep -v "^\"POT-Creation-Date:"'

    if [ ! -f "$dest" ] || ! diff -q <(eval "$filter" < "$dest") <(eval "$filter" < "$tmp") >/dev/null 2>&1; then
        mv "$tmp" "$dest"
        echo "  Updated: $dest"
    else
        rm "$tmp"
        echo "  No change: $dest"
    fi
}

echo "=== Extracting strings to .pot templates ==="

for mod in mods/*; do
    [ -d "$mod" ] || continue
    modname="$(basename "$mod")"

    # Skip submodules and mods without translatable strings
    if echo "$SUBMODULES" | grep -qx "$modname" || ! grep -qr "get_translator" "$mod"; then
        continue
    fi

    echo "Processing: $modname"
    outdir="$mod/locale"
    mkdir -p "$outdir"
    
    tmp_pot=$(mktemp)
    
    # Find relevant Lua files
    find "$mod" -type f -name "*.lua" \
        -not -path "*/.git/*" -not -path "*/vendor/*" \
        | xgettext \
            --from-code=UTF-8 -L lua \
            -kS -kPS:1,2 -kcore.translate:1c,2 -kcore.translate_n:1c,2,3 \
            --package-name="${GAME_TITLE}" \
            --msgid-bugs-address="${BUG_ADDRESS}" \
            --copyright-holder="chefzander, Skyblock Zero translations team" \
            --no-wrap -o "$tmp_pot" -f -

    if [ -s "$tmp_pot" ]; then
        # 1. Fix the charset
        sed -i 's/charset=CHARSET/charset=UTF-8/' "$tmp_pot"
        
        # 2. Privacy Fix: Replace the personal info placeholder
        #      Use | instead of / so the URL slashes don't break sed
        sed -i "s|FIRST AUTHOR <EMAIL@ADDRESS>, YEAR\.|<Your Name> [Contact Info], <YEAR>|" "$tmp_pot"
        sed -i "s|^\"Last-Translator: .*\"$|\"Last-Translator: Skyblock: Zero Translation Team <${BUG_ADDRESS}>\\\\n\"|" "$tmp_pot"

        # 3. Custom Header: MOD NAME TRANSLATION TEMPLATE
        MOD_UPPER=$(echo "$modname" | tr '[:lower:]' '[:upper:]')
        sed -i "s/SOME DESCRIPTIVE TITLE./${MOD_UPPER} MOD TRANSLATION TEMPLATE/" "$tmp_pot"

        # 4. Remove Version
        sed -i '/^"Project-Id-Version:/d' "$tmp_pot"

        # 5. Update Copyright Year
        CURRENT_YEAR=$(date +%Y)
        sed -i "s/Copyright (C) YEAR/Copyright (C) $CURRENT_YEAR/" "$tmp_pot"

        # 6. Set a generic Language-Team contact (also using |)
        sed -i "s|LANGUAGE <LL@li.org>|Skyblock: Zero Translation Team <${BUG_ADDRESS}>|" "$tmp_pot"

        # 7. Remove any "fuzzy" markers (not needed in templates)
        sed -i '/^#, fuzzy/d' "$tmp_pot"

        write_if_changed "$outdir/$modname.pot" "$tmp_pot"
    else
        rm -f "$tmp_pot"
    fi
done

echo "Done."