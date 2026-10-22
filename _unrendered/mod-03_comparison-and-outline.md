# Methods & Results (Module 3): Comparison of Related Trainings and Draft Outline

_Draft for working-group review (revision 5, 2026-10-22: Module 3 split into 3a and 3b; designed for unequal access to AI resources in both facilitated and self-study delivery). Scope excludes literature review (Mod 2), disclosure and writing (Mod 4), and ethics (Mod 5)._

_Tool and model details marked † change month to month. They were checked on 2026-10-22, but some come from secondary sources only. Re-verify all † items before each workshop delivery._

_**How the time estimates were derived.** These are planning estimates. They have not yet been piloted._
- _**Block times** are judgment-based allocations, informed by the source trainings where they give times. For example, coding-with-llms-novice allots 25–30 min to comparable prompting and code-review exercises. Elsewhere they are scaled to the number of concepts and hands-on steps in each block. Each block's time includes its exercise and debrief._
- _**Part totals** are simple sums of the block minutes: 3a = 190 min (about 3.2 h); 3b = 160 min (about 2.7 h)._
- _**Core times** are the sums of the blocks marked Core: 3a = 150 min (2.5 h); 3b = 115 min (about 2 h)._
- _**Self-study times** use a rule-of-thumb multiplier of about 1.5× the facilitated time. Self-study has no instructor to troubleshoot, but learners set their own pace. E3 is the exception: it is a 20 min demo when facilitated, but about 60 min when done hands-on._
- _**Not included:** breaks, pre-workshop setup (accounts, installs, model downloads), and transitions between blocks. Add roughly 10–15% for these when building an agenda._
- _**Next step:** time a pilot run of each block and replace these estimates with observed times._

## Part 1: Synopsis of the three trainings

| | coding-with-llms-novice | intro-gpt (UA "GPT 101") | AI-Ecology-2026 (Imageomics) |
|---|---|---|---|
| Format | Carpentries lesson in pre-alpha. Seven episodes, about 4–5 h. R with chatbots. | Self-paced MkDocs reference site, 8–12 h. Mostly Python. Three hands-on tutorials. | Year-long graduate course on AI and ecology, mostly computer vision. AI-assisted coding is one extra-credit session. |
| Key strengths | **Verification (ep 06):** a planted bug that still produces plausible output, hand-calculated test data, "allocate your rigour", domain plausibility checks, slopsquatting. **Ep 05:** a review → plan → apply loop, one change at a time. Grounded in how people learn ("illusion of competence"). | Concrete safety guidance for agents (`vibe.md`). Guardrailed agent context files with prompt logging (`tutorials/publichealth/gis.md`). Bad → better → best prompt progression. Sandbox and secrets hygiene. Reference pages on MCP and Ollama. Tool-neutral agent lab. | Truly ecological (NEON, camera traps, bioacoustics). Criteria for judging AI output. A smoke-test-first habit. Reflection on failures. FAIR principles and dataset/model cards. Cites King et al. 2026, "Ten simple rules… environmental science". |
| Key weaknesses | Unfinished (ep 07, setup, glossary). Chat only, no agents. Almost nothing on data governance or reproducibility. Statistical validity not taught. Gapminder data, not ecological. | A tool tour rather than a lesson sequence. MCP and open models are described but never practised in an analysis. No checking of analysis results or testing. Little on reproducibility. R and Posit tooling out of date. No ecological data. | Little hands-on coding. No testing or validation. No guidance on what data is safe to put into AI tools. Agents and plugins are listed but not taught. Broad but shallow, and partly unfinished. |

**Gaps all three share, which Modules 3a and 3b should fill:**
1. Checking the **statistical validity** of AI-proposed analyses: model family, assumptions, pseudoreplication, spatial and temporal autocorrelation.
2. **Formal tests** for analysis code (testthat/pytest), with a human specifying what the tests check.
3. **Reproducibility and provenance** of AI-assisted work: lockfiles, session info, model and harness version, prompt logs, git.
4. **Supervised agentic workflows** applied to a real *data-analysis* pipeline, not toy apps.
5. Practical **"what can I share with this tool?"** guidance for ecological data: sensitive species locations, CARE and Indigenous data, unpublished or permitted data. This is the operational checklist only; the broader ethics stay in Mod 5.
6. **Ecology-relevant datasets and failure modes**, with R and Python on an equal footing.
7. **Harness configuration as a skill in its own right.** None of the three teaches learners to write instruction files (AGENTS.md and the like), Agent Skills (SKILL.md) or MCP configuration, or how these carry over between harnesses.
8. **Choosing a model and where it runs.** None compares frontier and open-weight models side by side, or explains how to reach open-weight models through institutional, national (Jetstream2, NAIRR) or local resources, or what trade-offs each choice brings for data residency, capability and reproducibility.
9. **The range of interfaces.** None shows learners that the same models can be reached through web chat, vendor agent apps (Claude Cowork, the Codex app), IDE assistants, or directly in a terminal. It also doesn't explain what each interface shows, what it controls, and where code runs and data goes.
10. **Unequal access to AI resources.** Two of the trainings acknowledge cost, but none designs for it. AI-Ecology's tool table rates free tiers and points to the GitHub Student Pack. intro-gpt has pricing pages and CyVerse sandboxes. Neither offers a guaranteed no-cost path through every exercise, a plan for learners without capable hardware or software-install rights, or a take-home plan for continuing after the workshop at each level of access.

---

## Part 2: Draft outlines for Modules 3a and 3b

Module 3 is split into two parts:
- **3a, "Working with Models and Code"** (about 3.2 h; 2.5 h core): choosing a model, reaching it through the right interface, and the plan → generate → evaluate → revise loop with verification at its centre.
- **3b, "Configuring and Supervising Agents"** (about 2.7 h; 2 h core; plus optional extensions): configuring harnesses with AGENTS.md, skills and MCP, then running a supervised, reproducible agentic analysis.

3a is a prerequisite for 3b. The two can run on the same day or on different days.

### Organizing ideas (both parts)

1. **One loop, increasing autonomy.** A running ecological case study goes through Plan → Generate → Evaluate → Revise in chat (3a), then an IDE (3a), then an agent (3b). You remain the analyst throughout.
2. **Model ≠ interface ≠ harness ≠ configuration.** Four layers that learners keep separate:
   - The **model**, frontier or open-weight.
   - The **interface** you use to reach it:
     - web or desktop chat
     - vendor agent apps such as **Claude Cowork** and the **Codex app**
     - an IDE
     - a **terminal**
   - The **harness** that runs the model and gives it tools (Claude Code, Codex, Copilot, opencode, Posit Assistant, …).
   - The **portable configuration** that learners own: AGENTS.md, skills and MCP servers.

   One model can be reached through many interfaces, and one harness often has several front ends. Claude Code, for example, runs in the terminal, IDE, desktop app and web, and Codex runs as a CLI, IDE extension, desktop app and cloud service†.
3. **Teach the open standards, show the tool-specific details.** The core lesson uses AGENTS.md, Agent Skills and MCP. Harness- and interface-specific details go in a single dated tool matrix.
4. **Equitable access by design, in two delivery modes.** Every learning objective can be met at no personal cost, both in a **facilitated workshop** (where the teaching team may supply resources) and in **self-study** (where learners rely on resources they can get themselves). Paid tools are shown, never required. See the next section.

### Designing for unequal access and two delivery modes

Learners will be academics with very different access to AI. Some have institution-provided enterprise tools or gateways. Some pay for personal subscriptions. Some have only free tiers, an older or locked-down laptop, or limited bandwidth. The materials will also be used in two ways:
- **facilitated**, in a controlled setting where the teaching team may provision resources;
- **self-study**, where learners work alone with whatever they can access.

The module should treat all of these situations as normal and design around them.

**Principles**
1. **A no-cost path for every activity, in both modes.** Each exercise names a path that meets the same LO without a paid subscription, a GPU or admin rights, *and without depending on teaching-team resources*. Provisioned resources make the facilitated path smoother but are never the only way through. Paid tools (Claude Cowork, the Codex app, premium models) appear as alternatives or recorded demos.
2. **Endpoint-agnostic materials.** Every exercise script, starter project and agent configuration reads three settings from environment variables: `LLM_BASE_URL`, `LLM_API_KEY` and `LLM_MODEL`, plus the harness-specific equivalents. Learners set these in `.Renviron` / `.env`, which is git-ignored. The same materials then run unchanged against:
   - a gateway provisioned by the teaching team;
   - an institutional gateway;
   - Jetstream2;
   - a vendor API;
   - a local Ollama server.

   Delivery mode only changes *which endpoint you plug in*, never the lesson.
3. **Reproducible environment definition.** A single `devcontainer.json` (plus `renv.lock` / `uv.lock`) defines the analysis environment: R, Python, Quarto, git and the terminal agent CLIs. It can be instantiated in three ways:
   - a teaching-team-hosted environment (facilitated);
   - GitHub Codespaces' free monthly allowance† (self-study);
   - locally with Docker or a plain install (any mode).
4. **Free and open routes are first-class, not consolation prizes.** Present open-weight, institutional and national routes on their merits: data residency, reproducibility (pinnable weights) and portability. Avoid "if you can afford it" framing.
5. **Free is not the same as private.** Free consumer tiers and free hosted model services may use your inputs for training by default, and they have tighter rate limits. Teach learners to check data-use settings and opt-outs. Contrast these with institutional agreements and with local or national open-weight routes. This links to the share-safe checklist in 3a.1. In self-study, where no instructor is vetting tools, this matters even more.
6. **Cost literacy.** Explain the difference between a subscription and pay-per-token API pricing, and show how to estimate a task's token cost. Teach learners to set spending caps, use smaller models for simple tasks, and recognise rate limits. Learners on tight budgets should be able to predict what something will cost before they run it.
7. **Hardware-agnostic.** Never require local models. Running a model locally is an optional extra for machines with about 16 GB or more of memory. Many institutional laptops block software installs, so a browser-based environment must cover everything.
8. **Bandwidth-aware.** Model weights are several gigabytes. Downloads happen before a session or not at all, and browser-based environments remove the need for them.
9. **Comparison without a cohort.** In facilitated sessions, pair or group learners with different access levels so they can compare interfaces and models; discussions compare tools, never people. Self-study learners get the same comparisons from **published reference runs**: dated, captured transcripts and outputs of each key exercise across several models (frontier, open-weight hosted, small local) and interfaces (chat, agent app, terminal).

**The two delivery modes compared**

| | Facilitated (teaching team can allocate resources) | Self-study (learner's own resources) |
|---|---|---|
| Model access | Provisioned **LLM gateway**, e.g. a LiteLLM proxy with a per-learner key and budget cap. It serves at least one frontier model through grant-funded credit and open-weight models (e.g. relayed from Jetstream2). Keys expire after the session | Learner chooses a no-cost endpoint from the **self-study access ladder** below, or uses institutional or paid access they already have |
| Compute environment | Teaching-team-hosted browser environment (JupyterHub or RStudio Server on Jetstream2 or CyVerse, or org-sponsored Codespaces) built from the shared devcontainer | Same devcontainer in Codespaces' free allowance†, Posit Cloud or Google Colab free tiers† (each with limitations; documented in the tool matrix), or a local install |
| Paid-only interfaces (Cowork, Codex app, cloud agents) | Live instructor demo; learners with subscriptions follow along | Recorded demo plus dated screenshots; learners with subscriptions follow the "Agent app" tabs |
| Comparing models and interfaces | Pairs or groups across access levels; everyone has a frontier and an open-weight model through the gateway | Published reference runs; learners compare their own run against them. A frontier model may be limited to a free tier |
| Answers and feedback | Instructor debrief; planted-bug answers hidden in the learner materials | Self-check questions on judgment, not recall; collapsible worked solutions and answer keys; "if you got X, check Y" troubleshooting notes |
| Pacing | Timed blocks as in this outline | Self-paced; each block lists an estimated self-study time (typically 1.5× facilitated) and a clear stopping point |
| Support | Instructors and helpers; a live channel | Troubleshooting FAQ per block; known failure modes in Error callouts; a link to raise issues on the repo (already enabled through `repo-actions: [issue]`) |
| Setup | Teaching team sends keys and an environment link; the learner completes the access survey | **Self-assessment "choose your path" page:** the learner answers about five questions and gets their recommended endpoint, environment and interface |

**Self-study access ladder.** These are no-cost options that need nothing from a teaching team. Learners pick the highest rung they qualify for that's appropriate for their data.
1. **Institutional resources first:** enterprise chat, a campus LLM gateway, an HPC allocation. These are often the best data-governance option. The materials explain how to ask research computing whether a gateway exists and whether it's OpenAI-compatible.
2. **National open-weight inference:** the Jetstream2 Inference Service (free with an ACCESS account; US-based researchers†); NAIRR allocations†.
3. **Local open-weight models:** Ollama or LM Studio on machines with about 16 GB or more of memory; smaller models† for about 8 GB machines, for demonstration only.
4. **Free vendor and developer tiers†:**
   - vendor chat free tiers;
   - GitHub Copilot Free, or free Copilot Pro through GitHub Education for verified students and teachers;
   - free API tiers and free hosted open-weight models.

   Check the data-use terms first; use these for public or toy data only.
5. **Paid, by choice:** a subscription or pay-as-you-go API with a spending cap. Cost-literacy guidance helps learners decide.

**Access profiles.** The profiles are not exclusive, and learners will often combine paths. "Provisioned" applies only in facilitated delivery.

| Profile | Typical situation | 3a path | 3b path | Ongoing path (and self-study path)† |
|---|---|---|---|---|
| A. Free tiers only, modest or locked-down laptop | No institutional AI licence; 8 GB laptop, Chromebook, or no admin rights | **Facilitated:** provisioned environment + gateway. **Self-study:** Codespaces or Posit Cloud + Jetstream2 or a free tier; vendor free chat tiers | Terminal agent CLI in a browser environment against your endpoint | Jetstream2 inference (US); Copilot Free or GitHub Education; free tiers for non-sensitive data |
| B. Institutional access | University enterprise chat, Copilot through Microsoft 365, or a campus LLM gateway | Institutional tools for chat and IDE, where policy allows | Institutional gateway with a CLI, if permitted; otherwise the provisioned gateway or ladder rung 2 | Institutional tools, within your data classification |
| C. Personal paid subscription | Claude or ChatGPT paid plan, Copilot Pro | Any interface, including Cowork or the Codex app | Agent app or terminal; the terminal for the model swap | Own subscription, plus open-weight routes for sensitive data |
| D. Capable hardware or HPC | 16 GB or more of memory, or a GPU allocation | Adds local models (Ollama, LM Studio) | Adds local or HPC (vLLM) open-weight agents | Local or HPC models; NAIRR or ACCESS allocations† |

- **Learners outside the US.** ACCESS and Jetstream2 eligibility is limited†. Their paths lean on institutional resources, regional research infrastructure, local models and free tiers (check data-use settings). This matters most in self-study, where no gateway is provided.
- **Pre-session access survey (facilitated).** A short survey with no identifying questions should ask about institutional tools, subscriptions, laptop memory and operating system, install rights and bandwidth. The results set the gateway budget and the mix of profiles to plan for. Check whether the working group's existing perspective survey already covers any of this. In self-study, the same questions drive the "choose your path" page.

**Running dataset (proposal):** an LTER dataset from `lterdatasampler`, for example `and_vertebrates` (counts and lengths) or `ntl_icecover` (a time series). It would be exported to CSV for Python users; I haven't yet checked whether the package ships CSVs. It involves count data, NAs and nested sampling, which create realistic traps for AI-written code. Alternative: a NEON subset.

Each block lists its estimated time, the LOs it serves, and which source training it borrows from (⇐). ★ marks blocks that are new or substantially expanded.

---

## Module 3a: Working with Models and Code

**Learning objectives (Bloom verbs):**
1. *Explain* how AI tools intersect with core data-science principles: reproducibility, version control, data governance.
2. *Compare* frontier and open-weight models, and *select* an appropriate model and access route for a given analysis and data sensitivity.
3. *Distinguish* the interfaces for working with models (chat, vendor agent apps such as Claude Cowork and Codex, IDE assistants, terminal) and *choose* one that fits the task and your comfort level.
4. *Apply* a plan → generate → evaluate → revise loop to write, review and troubleshoot analysis code.
5. *Verify* AI-generated analyses using hand-computed checks, tests, and assessments of statistical validity.

**3a.0 Orientation (10 min, all LOs)**
- Where Methods & Results fits in the research workflow (roadmap diagram).
- The PGER loop (Plan → Generate → Evaluate → Revise) and the four layers: model, interface, harness, configuration.
- Two principles: "You are accountable for every line" and "Allocate your rigour" (⇐ novice ep 06).

**3a.1 AI meets data-science fundamentals (20 min, LO1)**
- Project structure, tidy data, version control and literate analysis (Quarto) give the AI good context and make its output checkable.
- **Share-safe pre-flight checklist:**
  - Share the schema and metadata, not the raw data.
  - Use synthetic or toy subsets.
  - Know your institution's approved tools and data classifications.
  - Flag sensitive species locations, CARE data and permit restrictions.
  - *The data's sensitivity should drive the model choice in 3a.2 and the interface choice in 3a.3.*
- **Secrets hygiene.** Keep API keys in `.Renviron` / `.env` and git-ignored. Never paste them into prompts. Agents can read environment variables and files (⇐ intro-gpt `claude-code.md` §8.3, `posit.md`).
- *Exercise:* write a short data card describing the dataset, to give the AI as context (⇐ AI-Ecology dataset cards).

**★3a.2 Models and where they run (35 min, LO2)**
- **Concepts.** What a model is versus a product. Frontier models (closed weights, served by the vendor) versus open-weight models (downloadable; run anywhere).
- **Vocabulary:**
  - tokens and context window
  - reasoning or "thinking" effort
  - tool calling
  - quantization (why a 120B model can fit in about 65 GB†)
  - model cards and licences (Apache-2.0 versus custom licences)
- **The four access routes**, compared on cost, capability, data residency and reproducibility:

  | Route | Examples† | Data leaves your machine? | Notes |
  |---|---|---|---|
  | Vendor app or API | Claude, ChatGPT, Gemini, Copilot | Yes; check the terms and any enterprise agreement | Most capable; versions change silently |
  | Institutional gateway | University-licensed enterprise chat; university LLM gateways (often LiteLLM, OpenAI-compatible) | Stays within the institution's contract | Check what your data classification allows |
  | National cyberinfrastructure | **Jetstream2 Inference Service**: free with an ACCESS account, OpenAI-compatible API, models such as gpt-oss-120b, Qwen3.8-27B and Gemma 4 31B†; **NAIRR** allocations† | Stays at the provider (IU for Jetstream2); not used for training | Open-weight models at scale without owning GPUs |
  | Local or HPC | Laptop: Ollama, LM Studio. HPC or server: vLLM, llama.cpp | No | Pinnable weights make this the most reproducible route; capability is limited by hardware |

- **The OpenAI-compatible API is the common connector.** The same `base_url` + `api_key` + `model` triple works from R (`ellmer`), Python (`openai`, `chatlas`), the terminal, and most harnesses.
- **Hardware rules of thumb†:**
  - About 16 GB of memory: 20–30B-class models (gpt-oss-20b, Devstral Small, Qwen 27B).
  - About 80 GB GPU: gpt-oss-120b.
  - Frontier-scale open models (GLM, Kimi, DeepSeek): multi-GPU HPC, or hosted.
- **Data governance link.** Sensitive data should go to local or institution-hosted open-weight models.
- **Cost and access literacy** (see "Designing for unequal access"):
  - subscription vs. pay-per-token pricing; estimating a task's token cost; spending caps; rate limits;
  - free tiers vs. privacy (data-use defaults and opt-outs);
  - where to find no-cost routes: institutional tools, Jetstream2, education programs, local models.
- *Activity:* send the same coding prompt to a frontier model and an open-weight model, then compare the plans, the code, and the assumptions each states. Reflect: which would you use for this dataset?
  - **No-cost path:** both models through the provisioned gateway (facilitated). In self-study, use an open-weight model from the access ladder (e.g. Jetstream2) plus a frontier free tier, and compare against the published reference runs.
  - **Optional:** a local Ollama model on capable laptops.
- *Error callout:* local model runs are slow or out of memory; endpoint authentication fails.
- *Ethics/environment callout:* energy and cost of model size, with a link to Mod 5.

**★3a.3 Interfaces: chat, vendor agent apps, IDE, and terminal (30 min, LO3)**
- **The interface spectrum.** Moving down the list, you gain control and transparency but need more setup and skill:

  | Interface | Examples† | Where code runs and files live | Good for | Watch out for |
  |---|---|---|---|---|
  | Web/desktop chat | claude.ai, ChatGPT, Gemini, institutional chat; built-in code-execution sandboxes | Vendor sandbox; files you upload | Quick questions, explanations, one-off scripts | Uploading data sends it to the vendor; copy-paste loses provenance |
  | Vendor agent desktop apps | **Claude Cowork** (in the Claude desktop app; works on a folder you grant it); **Codex app** (manages several coding agents, each in its own git worktree); Claude Code desktop | Your machine, in the folder or repo you grant | Agentic work without a terminal; a good on-ramp for novices | Actions are less visible than in a terminal. Know which folders it can touch. Check which configuration (skills, connectors/MCP, AGENTS.md) it honours |
  | Cloud agents | Codex cloud, Claude Code on the web, Copilot coding agent | Vendor VM running against a GitHub repo | Background tasks that produce reviewable pull requests | Repo contents and any data go to the vendor; needs GitHub |
  | IDE assistants | Copilot (VS Code, RStudio), Posit Assistant (Positron), Jupyter AI, Claude Code / Codex IDE extensions | Your machine, in the editor | Working inside your existing analysis environment | Inline suggestions are easy to accept without reading |
  | **Terminal** | **Model directly:** `ollama run <model>`, the `llm` CLI, `curl` to an OpenAI-compatible endpoint. **Agent CLIs:** Claude Code, Codex CLI, Gemini/Antigravity CLI, opencode, goose, aider | Your machine, an HPC node over SSH, or the workshop's browser-based environment | Full control and visibility; the most direct route to open-weight models; scriptable; works on HPC. Open-source CLIs (opencode, goose, aider) cost nothing beyond the model endpoint | Unfamiliar to many ecologists; an agent here can run any shell command you approve |

- **Access note.** Vendor agent apps and cloud agents generally need a paid plan and a supported desktop operating system†. The terminal path is the no-cost path that everyone can follow. It runs in a browser environment (provisioned, or Codespaces/Posit Cloud in self-study) against your endpoint. Paid apps are shown in live or recorded demos, or used by learners who already have them.

- **Terminal on-ramp for novices** (10 min within this block):
  - Open the built-in terminal in RStudio, Positron or VS Code, either locally or in a browser environment (provisioned or self-started), which needs no installs.
  - `pwd`, `ls`, `cd` into the project.
  - Talk to a model directly: a single `curl` or `llm` call to your endpoint (the provisioned gateway, Jetstream2, or an institutional gateway); `ollama run gpt-oss:20b`† on capable laptops.
  - Start an agent CLI in the project folder and exit it again.
  - Point out that every command the agent proposes is visible before you approve it.
- **Same model, different interfaces.** Run the same request through two interfaces on a *copy* of the project folder, then compare what you could see, what you had to approve, and what ended up on disk.
  - **No-cost path:** a free chat tier vs. a terminal CLI.
  - **With a subscription:** a vendor agent app (Cowork or the Codex app) vs. a terminal CLI.
  - Facilitated: pairs with different access levels compare across both paths. Self-study: compare against the published reference runs.
- **Choosing an interface:** weigh data sensitivity, whether you need to see every action, whether you need open-weight models or HPC, and your own comfort level. Learners may do the 3b agent exercises in a vendor agent app or in a terminal; the exercises are written for both.
- *Error callout:* agent app granted the wrong folder; terminal command not found (PATH); CLI not logged in.
- *Ethics callout:* cloud agents and desktop apps may upload more context than you expect. Link to Mod 5.

**3a.4 Plan and generate with chat (25 min, LO4)**
- Context-rich prompts: language, packages, data structure, expected output, constraints. Use the bad → better → best progression (⇐ intro-gpt casestudy; novice ep 02 template).
- Ask for a *plan and pseudocode first*, then the code. Ask the model to state its assumptions.
- *Exercise (parallel R/Python):* produce a summary and figure of the case-study data.

**3a.5 Evaluate: verify before you trust (45 min, LO4, LO5). The centerpiece.**
- **Predict, then run.** Hand-compute results on a 4–6-row toy table (⇐ novice ep 06 "Testland").
- **Planted, plausible bug** with an ecological flavour, e.g. NA vs. zero counts, grouping at the wrong level, unit conversion, or an off-by-one in a time series.
- **Domain plausibility checks:** biologically feasible ranges, sample-size sanity, checking that the figure matches the numbers.
- **Turn checks into tests:** the human specifies what to test, the AI drafts testthat/pytest tests, and the human reviews them. The agent reuses these tests in 3b.
- **Statistical validity:** the AI proposes a model; learners critique it for distribution family (counts → Poisson/NB), random effects or pseudoreplication, autocorrelation, and assumption diagnostics.
- **Cross-checking:** a fresh session or a *different model* reviews the code; a frontier/open-weight pairing works well here. A clean review is not proof of correctness (⇐ novice ep 06).
- **Supply chain:** check that suggested packages exist on CRAN or PyPI (slopsquatting).
- **Troubleshooting your own code:** use error messages and minimal reproducible examples (reprex) with AI, and require an explanation rather than just a fix.

**3a.6 Revise in the IDE (20 min, LO4)**
- IDE assistants: Copilot in VS Code or RStudio; Posit Assistant in Positron (the default as of 2026.07†); Jupyter AI. Covers inline completion, explain, and refactor.
- **No-cost paths†:**
  - GitHub Copilot Free, or Copilot Pro through GitHub Education for verified students and teachers;
  - an IDE assistant that accepts a custom OpenAI-compatible provider, pointed at your endpoint (e.g. Jupyter AI or Continue).
- Review a script against good-enough practices, plan 3–5 fixes, apply them one at a time, and commit after each (⇐ novice ep 05).
- Read diffs before accepting them.

**3a.7 Wrap-up (5 min)**
- A one-page **AI-assisted analysis checklist** as a take-home.
- Reflection: "What did the AI get wrong, and how did you catch it?"
- Preview of 3b, plus a setup check for 3b:
  - your endpoint answers a test call (provisioned key, or your own endpoint in self-study);
  - your browser environment or local CLI opens;
  - an agent app is logged in, if one is used.

**3a timing:** about 3.2 h in full (190 min).
- **Core (about 2.5 h, 150 min):** 3a.0, 3a.2, 3a.3, 3a.4, 3a.5 and 3a.7.
- **Can be shortened if needed:** 3a.1 and 3a.6.

---

## Module 3b: Configuring and Supervising Agents

**Prerequisite:** Module 3a. This part uses the 3a case study, its tests and its interface setup.

**Learning objectives (Bloom verbs):**
1. *Explain* how an agent harness works, including its permissions, sandboxing and hooks.
2. *Configure* an agent with project instructions (AGENTS.md), skills (SKILL.md) and MCP servers, and *predict* how that configuration carries over between harnesses, interfaces and models.
3. *Construct* a supervised, multi-step analysis workflow with an agent, through either a vendor agent app or a terminal CLI.
4. *Evaluate* how swapping a frontier model for an open-weight one changes an agent's behaviour.
5. *Document* AI-assisted analyses so that they can be reproduced.

**3b.0 Recap and setup check (10 min)**
- Recap the four layers and the PGER loop.
- Each learner confirms that their chosen interface works:
  - a terminal CLI (opencode, Codex CLI, Claude Code, …) in a browser environment or locally, against your endpoint. This is the **default, no-cost path** in both delivery modes.
  - or a vendor agent app (Claude Cowork, the Codex app), for learners who have one.
- *Activity tabs:* use `group="interface"` so every 3b exercise shows "Terminal" (first, the default) and "Agent app" variants.

**★3b.1 Anatomy of an agent harness (10 min, LO1)**
- The agent loop: model → tool call → result → model.
- What an agent can touch: files, shell, network, environment variables.
- Permission modes: ask, auto-approve edits, plan-only.
- Sandboxing: folder scope in agent apps, working-directory scope and OS sandbox in CLIs, dev container or Docker (⇐ intro-gpt `vibe.md`, `ai_sandboxes.md`).
- Hooks: deterministic guardrails that run before or after tool calls (e.g. blocking writes to `data/raw/`).
- Contrast interfaces: an agent app summarises its actions, while a terminal CLI shows every command. Both should be configured with least privilege.

**★3b.2 Project instruction files: AGENTS.md (15 min, LO2)**
- **AGENTS.md** is the cross-tool standard (agents.md, stewarded by the Linux Foundation's Agentic AI Foundation†).
- What belongs in it:
  - project purpose
  - how to run and test
  - directory conventions (`data/raw` is read-only)
  - coding style
  - guardrails: never fabricate data; stop and report failures; confirm before destructive actions; log prompts (⇐ intro-gpt `gis.md`)
- What does not belong in it: secrets, raw data, and long prose (it consumes context on every turn).
- **Hierarchy:** global → repo → subdirectory files. The nearest file usually wins.
- **Harness differences**, summarised in the tool matrix†:
  - Claude Code reads CLAUDE.md and falls back to AGENTS.md.
  - Gemini CLI reads GEMINI.md, and AGENTS.md if configured.
  - Copilot reads `.github/copilot-instructions.md` and AGENTS.md.
  - Cursor reads `.cursor/rules/*.mdc` and AGENTS.md.
  - Codex reads AGENTS.md in the CLI, app and cloud.
  - Cowork uses folder and project instructions†.
- Portability pattern: keep the content in AGENTS.md, and make a one-line CLAUDE.md that imports `@AGENTS.md`.
- *Exercise:* write an AGENTS.md for the case-study project.

**★3b.3 Agent Skills: SKILL.md (20 min, LO2)**
- A skill is a folder containing `SKILL.md` (YAML frontmatter with `name` and `description`, then instructions), plus optional `scripts/`, `references/` and `assets/`.
- **Progressive disclosure:** only the name and description load at startup, so write the `description` as a trigger: "Use when…".
- Instruction files versus skills versus MCP:
  - AGENTS.md: always-on project facts.
  - Skills: reusable procedures loaded on demand.
  - MCP: live connections to external tools or data.
- **Where skills live†:**
  - `.agents/skills/` is emerging as the cross-tool path (Codex, Gemini CLI, Copilot, Cursor, opencode, goose).
  - Claude Code uses `.claude/skills/`.
  - The Claude desktop app and Cowork support uploaded skills and plugins†.
- Validate with `skills-ref validate`. Share skills through a lab git repo. Treat third-party skills as code: read the scripts before installing them.
- *Exercise:* write an `eco-data-qc` skill. It holds a QC checklist (ranges, NA vs. zero, duplicate site-dates, unit checks) and calls a small R or Python script. Trigger it in your chosen interface and watch it load.

**★3b.4 MCP servers and connectors (20 min, LO2)**
- What MCP is: a standard protocol connecting harnesses to tools and data. In vendor apps these appear as "connectors"†.
- Transports: **stdio** (a local subprocess) and **Streamable HTTP** (remote; stateless as of the 2026-07-28 spec†).
- Configuration differs by interface†:
  - Desktop apps: connector or extension settings.
  - CLIs and IDEs: `.mcp.json`, `.vscode/mcp.json`, `.cursor/mcp.json`, `~/.codex/config.toml`, `opencode.json`, and others.
- Examples for scientists:
  - **mcptools + btw** (R, CRAN): exposes a live R session, package docs and environment objects.
  - Jupyter MCP server (Python).
  - Filesystem and git servers.
  - Community GBIF servers†.
- **MCP security risks:**
  - tool poisoning (hidden instructions in a tool's description);
  - "rug pulls" (a server changes its tools after you approve it);
  - prompt injection through tool results;
  - over-permissioned tokens.
- **Mitigations:** least privilege, trusted sources only, human approval, read-only credentials.
- *Exercise:* connect the R session (mcptools) or Jupyter kernel to the agent. Ask it to inspect a data frame that's already loaded.

**3b.5 Agentic workflow, supervised (60 min, LO3, LO4)**
- Use the configuration from 3b.2–3b.4.
- **Workflow:**
  - plan mode first, with human review of the plan;
  - smoke test first, then scale up (⇐ AI-Ecology);
  - human checkpoints and a git commit at each stage;
  - the agent runs the 3a.5 tests.
- **Context management:** start fresh sessions for new tasks; know about compaction; use subagents or parallel agents (e.g. Codex app worktrees†) for independent review; use checkpoints or rewind.
- *Exercise (agent app and terminal variants):* the agent builds an ingest → clean → QC → analyse → figure → Quarto report pipeline.
- **★ Model swap (terminal):** re-run one stage with the same configuration but a different model. In facilitated delivery the provisioned gateway lets everyone switch between a frontier model and an open-weight one. In self-study, learners switch between whatever endpoints they have, e.g. Jetstream2 and a local model, or a paid model and Jetstream2, and compare against the reference runs. Options†:
  - opencode or goose with your endpoint (gateway, Jetstream2, institutional);
  - `codex --oss`;
  - Claude Code via Ollama's Anthropic-compatible API (capable laptops).

  Observe what carries over and what degrades. Vendor agent apps generally can't use open-weight models, which is one reason to learn the terminal route.
  - *Error callout:* Ollama's default context can be as small as 4k tokens; agents need at least 64k (`OLLAMA_CONTEXT_LENGTH`)†.
- **Fallback:** a browser environment covers learners without a capable laptop. The published reference run covers endpoint or network outages, and learners whose free tier runs out mid-exercise.

**3b.6 Reproducibility and provenance (15 min, LO5)**
- `renv` / `uv` (or conda) lockfiles and session info.
- Log the **model, version, provider/endpoint, interface/harness and version, and date**. For open-weight models, also log the weights' tag or hash and the quantization.
- Commit AGENTS.md, skills and MCP configuration files with the code, *without* secrets. Agent-app sessions need a manual prompt log, because the app's history isn't in your repo.
- Prompt log and git history as the audit trail. Hand off to Mod 4 for disclosure language.

**3b.7 Wrap-up (10 min)**
- **Starter project template** as a take-home: AGENTS.md, a skills folder, an MCP config example, `.gitignore` and a provenance log. It is pre-configured for a no-cost open-weight endpoint and easy to repoint at any OpenAI-compatible provider.
- **Personal take-home access plan.** Each learner identifies, using the access-profile table, the route they'll use from now on (in facilitated delivery, after the provisioned keys expire). They note which data that route is approved for, and its cost or limits.
- Reflection: "What changed when you swapped models or interfaces?" (⇐ AI-Ecology reflection on failure).

**3b timing:** about 2.7 h in full (160 min).
- **Core (about 2 h, 115 min):** 3b.0, 3b.2, 3b.3, 3b.5 and 3b.7.
- **Can be shortened if needed:** 3b.1 (fold it into 3b.0), 3b.4 (could be a live or recorded demo) and 3b.6.

---

## Optional extensions (after 3b, or as self-study)

These extend the module for groups with more time, or for learners who want to go further on their own. Each one:
- is self-contained, assuming only 3a and 3b;
- has its own learning objective and a no-cost path;
- follows the same Activity, Error and Ethics callout pattern as the main blocks.

In facilitated delivery, run one or two as electives in a follow-up session. In self-study, they appear as optional pages after 3b.

**E1. LLMs as part of the method (30 min; self-study about 45 min)**
- **Learning objective:** *Validate* an LLM used as a measurement instrument against human-labelled data, and *document* it so others can reproduce it.
- **Why it matters.** 3a and 3b use AI to *write* analysis code. E1 is about the case where a model *is part of* the analysis, e.g. extracting fields from text. Its outputs become data, so it needs the same validation as any instrument.
- **Ecological use case.** Extract structured fields from free-text field notes or citizen-science observation comments: species mentioned, count, behaviour, and an uncertainty flag. A small synthetic or redacted note set ships with the exercise materials.
- **Activity (parallel R/Python):**
  1. *Plan.* Define the output schema and write a short coding guide, the same one a human annotator would use.
  2. *Label.* Hand-label 20–30 notes. This is the reference set.
  3. *Generate.* Call a model from code with structured output, using the `ellmer` structured-output functions in R or `chatlas` / `openai` with a Pydantic schema in Python. Read the endpoint from `LLM_BASE_URL` / `LLM_API_KEY` / `LLM_MODEL`.
  4. *Evaluate.* Compute agreement with the reference set (per-field accuracy, Cohen's κ for categories). Run the same input twice to measure self-consistency. Inspect the disagreements to find systematic errors, such as misread counts or invented species.
  5. *Revise.* Improve the coding guide or prompt *once*, then re-score on held-out notes, not the notes you tuned on.
- **Provenance:** pin and log the model, version, endpoint, temperature, prompt version and date for every call, and store the raw responses. Hand off to Mod 4 for how to report an LLM-based measurement in a methods section.
- **No-cost path:** any open-weight endpoint from the access ladder (Jetstream2 or local). Thirty short notes cost little even on a paid API.
- *Error callout:* malformed structured output, rate limits during batch calls, inconsistent results at non-zero temperature.
- *Ethics callout:* field notes can contain sensitive species locations or landowner names. Use the redacted set, or a local model for real notes. Link to Mod 5.
- *Source:* new. None of the three trainings validates a model used as an instrument. intro-gpt's `casestudy.md` abstention and confidence exercise is a useful complement.

**E2. Evaluate models on *your* task (30 min; self-study about 45 min)**
- **Learning objective:** *Design* a small, task-specific evaluation and *use* it to choose between models.
- **Why it matters.** Public leaderboards rarely reflect ecological analysis tasks. Learners with different access levels need evidence that the model they *can* reach is good enough for what they need to do.
- **Activity (parallel R/Python):**
  1. *Build an evaluation set.* Write 10–15 items drawn from the module's tasks. Examples: "write code that computes mean count per site, excluding NA but keeping zeros"; "choose a model family for these count data". Each item has a known correct answer or check.
  2. *Choose scorers.* Prefer deterministic checks: run the generated code and compare to the known value within a tolerance. Use a model-graded rubric only where it's unavoidable, and spot-check it by hand.
  3. *Run.* Use `vitals` (R) or `inspect_ai` (Python) against two or three models the learner can reach, e.g. a frontier free tier, Jetstream2 and a local model. Repeat each item 3 times to see the variance.
  4. *Compare.* Look at accuracy, failure types, latency and cost. Decide which model is "good enough" for this task and this data's sensitivity.
- **Links:**
  - It reuses the 3a.5 tests and planted bugs as evaluation items.
  - Its results feed the take-home access plan in 3b.7.
- **No-cost path:** open-weight endpoints plus deterministic scorers, so no paid grader model is needed. Self-study learners compare their results against the published reference runs.
- *Error callout:* scorer bugs that mark everything correct, which should be caught by including a known-bad item; flaky results from too few repeats.
- *Ethics/environment callout:* evaluation runs multiply compute use, so keep sets small and repeats modest. Link to Mod 5.
- *Source:* new. intro-gpt and AI-Ecology list models but never evaluate them on the learner's own task.

**E3. Open-weight agents on HPC (20 min demo; self-study about 60 min hands-on)**
- **Learning objective:** *Describe* how to serve an open-weight model on institutional or national HPC and connect an agent harness to it, within site policy.
- **Why it matters.** It's the path to capable open-weight models for learners whose data can't leave institutional infrastructure and whose laptops can't run large models.
- **Demo / self-study walkthrough:**
  1. *Check policy first.* Find out whether the site allows inference servers on compute nodes, network access from them, and where large model weights may be cached (usually scratch, not home). Never run models on login nodes.
  2. *Request a GPU node.* Use a provided Slurm job template sized for a mid-size model (e.g. gpt-oss-120b on one 80 GB GPU†).
  3. *Serve.* Start vLLM's OpenAI-compatible server inside the job, keeping the session alive with tmux.
  4. *Connect.* Open an SSH tunnel from the laptop, or use the site's portal (Open OnDemand), and set `LLM_BASE_URL` to the tunnelled endpoint.
  5. *Run.* Repeat one 3b.5 stage with a terminal agent (opencode, goose or Codex) against the HPC endpoint. Compare it with the 3b.5 model swap.
  6. *Share and clean up.* Explain how a lab can share one served model, then end the job so the GPU is released.
- **No-cost path:**
  - **Facilitated:** the instructor demo.
  - **Self-study:** a recorded walkthrough plus the Slurm and tunnel templates.
  - **Running it yourself:** university HPC or ACCESS allocations. Learners without GPU access follow along, or use Jetstream2's hosted inference instead.
- *Error callout:* CUDA out of memory (wrong model size or quantization); tunnel or port conflicts; download quotas; the job ending mid-session.
- *Ethics/environment callout:* GPU-hours have real energy and allocation costs, so stop idle servers. Link to Mod 5.
- *Source:* new as a hands-on path. intro-gpt's `ollama.md` and `ai_sandboxes.md` cover local and sandboxed models but not HPC serving.

**E4. Hooks and shareable lab configuration (30 min; self-study about 45 min)**
- **Learning objective:** *Implement* deterministic guardrails with hooks, and *package* a lab's agent configuration so colleagues can reuse and review it.
- **Why it matters.**
  - Instructions in AGENTS.md are requests the model may ignore. Hooks are enforced by the harness every time.
  - A shared lab template spreads good practice, and it spreads risk too, unless it's reviewed like code.
- **Activity (terminal path):**
  1. *Write two hooks:*
     - one that blocks any write to `data/raw/`;
     - one that appends each prompt and the model or version to `prompts/log.md`, which automates the 3b.6 provenance log.
  2. *Test them.* Ask the agent to "clean up" a raw file and confirm the hook stops it.
  3. *Package.* Assemble AGENTS.md, the `eco-data-qc` skill, the MCP config example, the hooks, `.gitignore` and the provenance template into a lab template repo (GitHub template or similar). Where the harness supports it, also package them as a plugin†.
  4. *Review.* Swap templates with a partner, or read a provided third-party example. Check it for over-broad permissions, network calls and secrets before adopting it.
- **Portability note:** hook and plugin formats differ more across harnesses than AGENTS.md or skills do†. The tool matrix records each harness's mechanism. Teach the *concept*, using one harness as the worked example.
- **No-cost path:** fully free. It needs only a terminal harness and git.
- *Error callout:* a hook that fails silently; a hook so broad it blocks legitimate work.
- *Ethics callout:* a shared configuration can quietly grant broad permissions or exfiltrate data, so treat it like code. Link to Mod 5.
- *Source:* builds on intro-gpt `gis.md` (guardrails as instructions) and `claude-code.md` (custom commands). It turns the guardrails into enforced checks and makes them shareable.

**Extension timing:** E1, E2 and E4 take about 30 min each when facilitated (about 45 min self-study). E3 is a 20 min demo, or about 60 min hands-on.

---

## Part 3: Presenting 3a and 3b in the AI-in-a-day Quarto template

**Site structure** (changes to make when the outline is accepted; not yet applied):
- Replace `mod-03.qmd` with **`mod-03a.qmd`** ("3a. Working with Models and Code") and **`mod-03b.qmd`** ("3b. Configuring and Supervising Agents"). Each keeps the template's Roadmap and Learning Objectives callouts. Put a prerequisite note at the top of 3b.
- Update the `_quarto.yml` sidebar: replace the "3. Methods & Results" item with a nested section "3. Methods & Results" containing the 3a and 3b pages.
- Bibliographies: either `references/mod-03a_refs.bib` and `references/mod-03b_refs.bib`, or both pages share the existing `mod-03_refs.bib`.
- Topic files follow the `topics/mod-0#_<slug>.qmd` convention, with the part letter included:
  - **3a:** `mod-03a_fundamentals`, `mod-03a_models-access`, `mod-03a_interfaces`, `mod-03a_chat-prompting`, `mod-03a_verification`, `mod-03a_ide`
  - **3b:** `mod-03b_harness-anatomy`, `mod-03b_agents-md`, `mod-03b_skills`, `mod-03b_mcp`, `mod-03b_agentic-workflow`, `mod-03b_reproducibility`, `mod-03b_extensions`
  - **Shared:** `mod-03_tool-matrix` (included by both pages)

**Mapping content to the template's callouts:**

| Template callout | Use in Module 3a/3b |
|---|---|
| Activity (`callout-warning` with a phase `panel-tabset`) | Every exercise. Phases map to Plan / Generate / Evaluate / Revise, or setup / run / reflect |
| Error (`callout-important`) | Known failure modes: Ollama context limit, tool-call failures, authentication or PATH errors, agent app pointed at the wrong folder, a skill not triggering, an MCP server not starting |
| Ethics/Environment reminder | Data residency when choosing a model or interface; uploads from cloud agents and desktop apps; energy use of model size; MCP and skill supply-chain trust. Link each to Mod 5 |
| Reflection (`callout-tip`) | Model-swap and interface comparisons; "how did you catch it?" |
| Further Reading (`callout-note`) | agents.md, agentskills.io, modelcontextprotocol.io, vendor docs for Cowork and Codex, Jetstream2 docs, King et al. 2026 |

**Technical presentation patterns:**
- **Synchronised tabsets.**
  - `group="language"` (R / Python) and `group="interface"` (Terminal / Agent app, with the no-cost Terminal tab first), so a learner's choice carries across the page.
  - Each Activity callout opens with a one-line **"No-cost path"** note, so learners never have to hunt for an option that suits their access.
  - `group="harness"` (Claude Code / Codex / Copilot / opencode / Posit Assistant) only where commands differ.
  - Inside Activity callouts these tabsets sit within the phase tabsets, so keep them shallow.
- **Terminal and configuration files as labelled code blocks.**
  - Use `filename=` (e.g. `filename="AGENTS.md"`, `filename=".agents/skills/eco-data-qc/SKILL.md"`, `filename=".mcp.json"`).
  - Use ` ```bash ` blocks for terminal sessions.
  - Use `code-annotations: hover` to explain the SKILL.md fields.
- **Screenshots for agent apps.** Cowork and the Codex app are graphical, so use dated screenshots stored in `topics/images/mod-03/`, with alt text. Expect to refresh them before each delivery.
- **Don't execute AI calls during render.** Show prompts and responses as static, captured transcripts, dated and attributed to a model, version and interface. Executed analysis code is fine (`freeze: auto` is set). Quarto uses one engine per document, so mixing executed R and Python chunks needs knitr + reticulate. Alternatively, keep pages display-only (`eval: false`) and put runnable code in exercise folders.
- **Exercise materials outside the rendered site.**
  - `exercises/mod-03a/` holds toy tables, the broken scripts and test files, in `r/` and `python/` versions.
  - `exercises/mod-03b/` holds the starter AGENTS.md, the `eco-data-qc` skill and an MCP config example.
  - Keep both out of the render and offer them as zip downloads.
- **Volatile facts in one place.**
  - Model names and versions go in `_variables.yml` and are referenced with `{{< var >}}`.
  - Everything else goes in a shared `topics/mod-03_tool-matrix.qmd`, carrying a "last verified" date. It covers, for each interface and harness: the instruction file read, the skills path, MCP/connector configuration, open-weight support, where code runs, and **cost (free / free tier / paid / institutional) and OS requirements**.
- **One source, two delivery modes, via Quarto profiles.**
  - The **default (public) build is the self-study edition.** It contains:
    - the "choose your path" page;
    - the self-study access ladder;
    - collapsible worked solutions and answer keys (`callout` with `collapse="true"`);
    - self-check questions;
    - links to recorded demos and published reference runs;
    - estimated self-study times.
  - **A `workshop` profile** (`_quarto-workshop.yml`) builds the facilitated edition for a specific delivery. It adds:
    - the gateway and environment sign-in instructions;
    - the support channel;
    - timed agendas.

    It hides answer keys until the debrief, using `.content-visible unless-profile="workshop"`. Keep gateway URLs and other delivery-specific details out of the public build.
  - **An `instructor` profile** holds facilitation notes, fallback plans and planted-bug answers.
  - Where modes differ inside a page, use short "In a workshop" and "On your own" callouts rather than duplicating whole sections.
- **Published reference runs.** Store dated transcripts and outputs of each key exercise in `exercises/reference-runs/`, labelled by model, endpoint, interface and date. Link them from Reflection callouts. Refresh them alongside the tool matrix.
- **Shared environment definition.** Keep `.devcontainer/devcontainer.json`, `renv.lock` and `uv.lock` in the exercise materials. Add a "Open in Codespaces" badge for self-study, and use the same definition for the teaching team's hosted environment.
- **Setup pages, split by delivery mode.**
  - **Self-study setup ("choose your path"):**
    - answer about five questions (institutional tools? subscriptions? memory and OS? install rights? US-based for ACCESS?);
    - receive a recommended endpoint from the access ladder, an environment (Codespaces / Posit Cloud / local), and an interface;
    - set `LLM_BASE_URL`, `LLM_API_KEY` and `LLM_MODEL`;
    - run one test call.
  - **Workshop setup (workshop profile only):**
    - complete the access survey;
    - sign in to the provisioned environment;
    - test the provisioned key;
    - create an ACCESS account if eligible (for continuing afterwards).
  - **Optional in both modes:**
    - local: a terminal agent CLI, plus Ollama with a pre-pulled model (≥16 GB machines; download in advance);
    - paid: a vendor agent app (Cowork or the Codex app).

  State clearly which items are required in each mode.
- **Glossary.** Add these terms to `glossary.qmd`:
  - harness
  - agent
  - interface
  - agent app
  - cloud agent
  - terminal/CLI
  - open-weight
  - frontier model
  - quantization
  - context window
  - token
  - tool calling
  - AGENTS.md
  - skill
  - MCP/connector
  - OpenAI-compatible API
  - inference endpoint
  - hook
  - sandbox

---

## Open items for the working group
- Confirm which institutional gateways (CU Boulder, UCSB, ASU, others) offer **open-weight** models through an OpenAI-compatible API. I couldn't verify this for CU Boulder, UCSB or ASU CreateAI.
- **Facilitated-delivery resources.** Decide on funding and hosting for the provisioned LLM gateway and the browser-based environment:
  - grant-funded API credit for frontier models;
  - Jetstream2 or CyVerse allocation;
  - per-learner budget caps;
  - how long keys stay valid after the workshop;
  - the gateway's own data-use and logging terms, to disclose to learners.
- **Self-study support.** Who records the demos and produces and refreshes the reference runs, and how often (suggested: with each † re-verification). Who triages issues filed by self-study learners.
- Decide whether Jetstream2 (which needs an ACCESS account) is the shared open-weight endpoint, and how participants outside the US or otherwise ineligible will reach open-weight models.
- Design the pre-workshop access survey, or check whether the existing perspective survey already covers access.
- Confirm that the terminal path is the default for 3b exercises, with vendor agent apps (which need paid plans and desktop OS support†) as alternatives.
- Decide whether 3a and 3b run on the same day.
- Re-verify every † item close to delivery.
