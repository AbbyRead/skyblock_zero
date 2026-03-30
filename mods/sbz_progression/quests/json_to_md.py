import os
import json
import argparse


def format_requires(requires, include_requires=True):
    if not include_requires:
        return ""

    if not requires:
        return "Requires: \n"

    return "Requires: " + ", ".join(requires) + "\n"


def quest_to_markdown(quest, include_requires=True):
    title = quest.get("title", "Untitled")
    quest_id = quest.get("id", "")
    text = quest.get("text", "").strip()
    requires = quest.get("requires", [])

    md = []
    md.append(f"## {title}")
    md.append(f"### ID: {quest_id}")
    md.append("")
    md.append("### Text")
    md.append("")
    md.append(text)
    md.append("")
    md.append("### Meta")
    md.append("")

    if include_requires:
        md.append(format_requires(requires, include_requires))

    return "\n".join(md).strip()


def questline_to_markdown(data, include_requires=True):
    questline_name = data.get("questline", "Unknown")
    questline_id = data.get("id")
    description = data.get("description", "").strip()
    quests = data.get("quests", [])

    md = [f"# Questline: {questline_name}"]

    if questline_id:
        md.append(f"### ID: {questline_id}")
        md.append("")

    if description:
        md.append("### Text")
        md.append("")
        md.append(description)
        md.append("")

    for quest in quests:
        md.append(quest_to_markdown(quest, include_requires))
        md.append("")  # spacing between quests

    return "\n".join(md).strip()


def process_input(input_path):
    with open(input_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    # Handle both:
    # - single object
    # - list of questlines
    if isinstance(data, dict):
        return [data]
    elif isinstance(data, list):
        return data
    else:
        raise ValueError("Invalid JSON format")


def write_output(data, output_path, include_requires=True, split_files=False):
    if split_files:
        os.makedirs(output_path, exist_ok=True)

        # Group questlines by source_file
        grouped = {}

        for entry in data:
            source = entry.get("source_file", "output.md")
            grouped.setdefault(source, []).append(entry)

        for source, entries in grouped.items():
            filename = os.path.splitext(source)[0] + ".md"
            full_path = os.path.join(output_path, filename)

            all_md = []

            for entry in entries:
                all_md.append(questline_to_markdown(entry, include_requires))
                all_md.append("")  # spacing between questlines

            with open(full_path, "w", encoding="utf-8") as f:
                f.write("\n".join(all_md).strip())

        print(f"✅ Wrote {len(grouped)} markdown file(s) to {output_path}")

    else:
        # single output file (unchanged behavior)
        all_md = []

        for entry in data:
            all_md.append(questline_to_markdown(entry, include_requires))
            all_md.append("\n\n")

        with open(output_path, "w", encoding="utf-8") as f:
            f.write("\n".join(all_md).strip())

        print(f"✅ Wrote combined markdown to {output_path}")


def main():
    parser = argparse.ArgumentParser(
        description="Convert quest JSON back into Markdown format."
    )

    parser.add_argument(
        "input",
        help="Path to JSON file"
    )

    parser.add_argument(
        "-o", "--output",
        default="output.md",
        help="Output file or folder (default: output.md)"
    )

    parser.add_argument(
        "-x", "--no-requires",
        action="store_true",
        help="Omit the 'Requires' field from output"
    )

    parser.add_argument(
        "-s", "--split",
        action="store_true",
        help="Output one .md file per questline (uses source_file name)"
    )

    args = parser.parse_args()

    try:
        data = process_input(args.input)

        write_output(
            data,
            args.output,
            include_requires=not args.no_requires,
            split_files=args.split
        )

    except Exception as e:
        print(f"❌ Error: {e}")


if __name__ == "__main__":
    main()