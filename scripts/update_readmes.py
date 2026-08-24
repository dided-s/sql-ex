from pathlib import Path
import subprocess
import sys

def main():
    for nb in Path(".").rglob("tasks.ipynb"):
        folder = nb.parent
        base = nb.stem

        subprocess.run(
            [
                sys.executable, "-m", "jupyter", "nbconvert",
                "--to", "markdown",
                "--output", base,
                "--output-dir", str(folder),
                str(nb),
            ],
            check=True,
        )

        md = folder / f"{base}.md"
        readme = folder / "README.md"
        if md.exists():
            if readme.exists():
                readme.unlink()
            md.rename(readme)

if __name__ == "__main__":
    main()