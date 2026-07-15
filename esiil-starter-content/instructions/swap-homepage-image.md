# Swapping homepage images

The site uses semantic image slots so Working Group members do not need to edit Markdown links every time an image changes.

1. Open the relevant folder in `docs/assets/images/slots/`.
2. Delete the old image file.
3. Add one new `.png`, `.jpg`, `.jpeg`, `.webp`, or `.svg` file.
4. Run `python scripts/generate_image_slots.py`.
5. Commit the image change and the regenerated slot references.

If a slot folder contains multiple images, the generator uses the first image alphabetically and the site health report will warn you to clean it up. The cleanest workflow is still one image per slot folder.
