# Digital Garden

My personal digital garden — a public collection of technical notes, project write-ups, and learnings as a software engineer.

Built with [Quartz](https://quartz.jzhao.xyz/) and powered by an [Obsidian](https://obsidian.md/) vault.

## What's here

- **Project write-ups** — architecture decisions, learnings, and code walkthroughs
- **Technical notes** — Go, TypeScript, AWS, Kubernetes, Docker, IaC
- **Book & lecture summaries** — distilled insights from what I'm reading and studying

## How it works

Notes live in a private Obsidian vault. A sync script selects only notes marked with `stage: public` and copies them into Quartz's content directory. On push, GitHub Actions builds and deploys the site.

```
Obsidian vault (private) → sync-content.sh → Quartz build → GitHub Pages
```

## Local development

```bash
# Install dependencies
npm ci

# Sync public notes from Obsidian vault
./sync-content.sh

# Preview locally
npx quartz build --serve
```

## License

Content is mine. Quartz is licensed under the [MIT License](./LICENSE.txt).
