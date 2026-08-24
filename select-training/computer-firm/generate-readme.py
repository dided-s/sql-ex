from pathlib import Path
import subprocess
import sys

NOTEBOOK = Path("tasks.ipynb")
OUTPUT_MD = Path("README.md")

def main():
    if not NOTEBOOK.exists():
        raise FileNotFoundError(f"{NOTEBOOK} not found")

    subprocess.run(
        [
            sys.executable,
            "-m",
            "jupyter",
            "nbconvert",
            "--to",
            "markdown",
            str(NOTEBOOK),
        ],
        check=True,
    )

    generated_md = NOTEBOOK.with_suffix(".md")
    if not generated_md.exists():
        raise FileNotFoundError(f"{generated_md} was not created")

    if OUTPUT_MD.exists():
        OUTPUT_MD.unlink()

    generated_md.rename(OUTPUT_MD)
    print(f"Generated {OUTPUT_MD}")

if __name__ == "__main__":
    main()