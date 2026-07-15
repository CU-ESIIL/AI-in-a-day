# Using Process Galleries

Process galleries are folder-driven. Add files to a gallery folder, commit them, and the site updates automatically.

1. Open the relevant folder in `docs/assets/images/process/`.
2. Add images or supported deliverable files.
3. Optionally add a `captions.txt` file with lines like `filename.png | Caption text`.
4. Run `python scripts/generate_image_slots.py`.
5. Commit the new files and the regenerated gallery includes.

Supported image files:

- `.png`
- `.jpg`
- `.jpeg`
- `.webp`
- `.svg`

Supported linked deliverable files:

- `.pdf`
- `.html`
- `.csv`
- `.xlsx`
- `.docx`
- `.pptx`
