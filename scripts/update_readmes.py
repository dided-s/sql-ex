#!/usr/bin/env python3

from pathlib import Path
import io
import nbformat
from nbconvert import MarkdownExporter

def convert_ipynb_to_md_skip_first_3(input_path: Path, output_path: Path) -> None:
    nb = nbformat.read(input_path, as_version=4)
    nb.cells = nb.cells[4:]

    exporter = MarkdownExporter()
    body, resources = exporter.from_notebook_node(nb)

    output_path.write_text(body, encoding="utf-8")

def main():
    for nb_path in Path(".").rglob("tasks.ipynb"):
        readme_path = nb_path.parent / "README.md"
        convert_ipynb_to_md_skip_first_3(nb_path, readme_path)
        print(f"Updated {readme_path}")

if __name__ == "__main__":
    main()