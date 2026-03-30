import os
import re
import json
import argparse

def parse_md_file(filepath, source_name=None):
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    # Remove HTML comments
    content = re.sub(r"<!--.*?-->", "", content, flags=re.DOTALL)

    results = []

    # Split by questlines
    questline_blocks = re.split(r"\n(?=# Questline:)", content)

    for block in questline_blocks:
        block = block.strip()
        if not block.startswith("# Questline:"):
            continue

        # Questline name
        questline_match = re.search(r"# Questline:\s*(.+)", block)
        questline_name = questline_match.group(1).strip() if questline_match else "Unknown"

        # Extract description (before first ##)
        split_after_header = re.split(r"# Questline:.*\n", block, maxsplit=1)
        description = ""

        if len(split_after_header) > 1:
            after_header = split_after_header[1]
            desc_split = re.split(r"\n## ", after_header, maxsplit=1)
            description = desc_split[0].strip()

        # Extract quests
        quests_raw = re.split(r"\n## ", block)[1:]

        quests = []

        for raw in quests_raw:
            title = raw.strip().splitlines()[0].strip()

            id_match = re.search(r"### ID:\s*(.+)", raw)
            quest_id = id_match.group(1).strip() if id_match else None

            text_match = re.search(r"### Text\s*(.*?)\s*### Meta", raw, re.DOTALL)
            text = text_match.group(1).strip() if text_match else ""

            requires_match = re.search(r"Requires:\s*(.*)", raw)
            requires = []
            if requires_match:
                requires_raw = requires_match.group(1).strip()
                if requires_raw:
                    requires = [r.strip() for r in requires_raw.split(",") if r.strip()]

            quests.append({
                "title": title,
                "id": quest_id,
                "text": text,
                "requires": requires
            })

        results.append({
            "source_file": source_name or os.path.basename(filepath),
            "questline": questline_name,
            "description": description,
            "quests": quests
        })

    return results


def process_input(input_path):
    results = []

    if os.path.isfile(input_path):
        results.extend(parse_md_file(
            input_path,
            source_name=os.path.basename(input_path)
        ))

    elif os.path.isdir(input_path):
        for filename in os.listdir(input_path):
            if filename.endswith(".md"):
                full_path = os.path.join(input_path, filename)
                results.extend(parse_md_file(full_path, source_name=filename))
    else:
        raise ValueError(f"Invalid path: {input_path}")

    return results


def main():
    parser = argparse.ArgumentParser(
        description="Convert quest-style Markdown files into structured JSON."
    )

    parser.add_argument(
        "input",
        help="Path to a .md file or a folder containing .md files"
    )

    parser.add_argument(
        "-o", "--output",
        default="quests.json",
        help="Output JSON file (default: quests.json)"
    )

    parser.add_argument(
        "--pretty",
        action="store_true",
        help="Pretty-print JSON output"
    )

    args = parser.parse_args()

    try:
        data = process_input(args.input)

        with open(args.output, "w", encoding="utf-8") as f:
            if args.pretty:
                json.dump(data, f, indent=2, ensure_ascii=False)
            else:
                json.dump(data, f, ensure_ascii=False)

        print(f"✅ Successfully wrote {len(data)} questline(s) to {args.output}")

    except Exception as e:
        print(f"❌ Error: {e}")


if __name__ == "__main__":
    main()