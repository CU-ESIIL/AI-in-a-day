# How This Repo Is Organized

The repository has two connected layers. Top-level files configure the project and its automation. The `docs/` folder contains the website content. `mkdocs.yml` tells MkDocs how to turn that content into the public site. Analysis folders hold the working scientific materials that generate the results shown on the website.

| Part of the repo | What it does | What usually belongs there |
| --- | --- | --- |
| Top-level files and folders | Configure the project and keep shared repository guidance in one place | `README.md`, `LICENSE`, workflows, containers, templates, environment setup, and repo-wide metadata |
| `docs/` | Stores the source content for the public website | Homepage text, summaries, methods, community-facing documentation, and website assets |
| `mkdocs.yml` | Controls how the site is rendered | Navigation, theme settings, plugins, and GitHub edit links |
| Working folders | Hold the science-in-progress | Data references, notebooks, scripts, workflows, figures, outputs, and reproducibility materials |
