# "AI in a Day" Workshop Series

This repository hosts the workshop materials developed by this ESIIL-funded synthesis working group.

## How this repository is organized

The repository has two connected layers. Top-level files configure the project and its automation. The `docs/` folder contains the website content. `mkdocs.yml` tells MkDocs how to turn that content into the public site. Analysis folders hold the working scientific materials that generate the results shown on the website.

```text
.
├── README.md              # Repository overview and setup notes
├── mkdocs.yml             # Website navigation, theme, plugins, and edit links
├── docs/                  # Markdown source for the public website
├── scripts/               # Build helpers and site health checks
├── templates/             # Reusable meeting-note templates
├── containers/            # Optional runtime and environment setup
└── other working folders  # Add data, notebooks, scripts, workflows, outputs, or figures here as the group's science grows
```

Use these rules of thumb when deciding where to put something:

- Top-level files and folders are for project configuration, automation, contribution guidance, licensing, environment setup, and repo-wide metadata.
- `docs/` is for public website pages and assets. Markdown files here become website pages through MkDocs.
- `mkdocs.yml` controls how the website is rendered, including navigation, theme settings, plugins, and GitHub edit links.
- Scientific working materials belong in working folders such as data, notebooks, scripts, workflows, outputs, and figure directories.
