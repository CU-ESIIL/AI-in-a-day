# Analysis and Verification of Results (Module 3): Comparison of Related Trainings and Draft Outline

_Draft for working-group review (revision 6, 2026-10-27: updated after the Module 3 meeting. Renamed from "Methods & Results"; former 3a.0 and 3a.1 moved to Module 1; 3a reorganised into chat and IDE mini-modules; R in Positron as the focus. Earlier: 3a/3b split; designed for unequal access in both facilitated and self-study delivery). Scope excludes literature review (Mod 2), disclosure and writing (Mod 4), and ethics (Mod 5)._

_Tool and model details marked † change month to month. They were checked on 2026-10-22, but some come from secondary sources only. Re-verify all † items before each workshop delivery._

_**How the time estimates were derived.** These are planning estimates. They have not yet been piloted._
- _**Block times** are judgment-based allocations, informed by the source trainings where they give times. For example, coding-with-llms-novice allots 25–30 min to comparable prompting and code-review exercises. Elsewhere they are scaled to the number of concepts and hands-on steps in each block. Each block's time includes its exercise and debrief._
- _**Part totals** are simple sums of the block minutes: 3a = 175 min (about 2.9 h); 3b = 175 min (about 2.9 h)._
- _**Core times** are the sums of the blocks marked Core: 3a = 175 min (all of 3a is now core); 3b = 140 min (about 2.3 h)._
- _**Self-study times** use a rule-of-thumb multiplier of about 1.5× the facilitated time. Self-study has no instructor to troubleshoot, but learners set their own pace. E3 is the exception: it is a 20 min demo when facilitated, but about 60 min when done hands-on._
- _**Not included:** breaks, pre-workshop setup (accounts, installs, model downloads), and transitions between blocks. Add roughly 10–15% for these when building an agenda._
- _**Next step:** time a pilot run of each block and replace these estimates with observed times._

## Part 1: Synopsis of related trainings

| | coding-with-llms-novice | intro-gpt (UA "GPT 101") | AI-Ecology-2026 (Imageomics) |
|---|---|---|---|
| Format | Carpentries lesson in pre-alpha. Seven episodes, about 4–5 h. R with chatbots. | Self-paced MkDocs reference site, 8–12 h. Mostly Python. Three hands-on tutorials. | Year-long graduate course on AI and ecology, mostly computer vision. AI-assisted coding is one extra-credit session. |
| Key strengths | **Verification (ep 06):** a planted bug that still produces plausible output, hand-calculated test data, "allocate your rigour", domain plausibility checks, slopsquatting. **Ep 05:** a review → plan → apply loop, one change at a time. Grounded in how people learn ("illusion of competence"). | Concrete safety guidance for agents (`vibe.md`). Guardrailed agent context files with prompt logging (`tutorials/publichealth/gis.md`). Bad → better → best prompt progression. Sandbox and secrets hygiene. Reference pages on MCP and Ollama. Tool-neutral agent lab. | Truly ecological (NEON, camera traps, bioacoustics). Criteria for judging AI output. A smoke-test-first habit. Reflection on failures. FAIR principles and dataset/model cards. Cites King et al. 2026, "Ten simple rules… environmental science". |
| Key weaknesses | Unfinished (ep 07, setup, glossary). Chat only, no agents. Almost nothing on data governance or reproducibility. Statistical validity not taught. Gapminder data, not ecological. | A tool tour rather than a lesson sequence. MCP and open models are described but never practised in an analysis. No checking of analysis results or testing. Little on reproducibility. R and Posit tooling out of date. No ecological data. | Little hands-on coding. No testing or validation. No guidance on what data is safe to put into AI tools. Agents and plugins are listed but not taught. Broad but shallow, and partly unfinished. |

### Added 2026-10-27: *AI Assistants for Scientific Coding* (Seascape Models)

<https://www.seascapemodels.org/AI-assistants-for-scientific-coding/> — an online book by Chris Brown (University of Tasmania, fisheries science), published 25 August 2026 and updated periodically. It is reference material for a one-day workshop. _Reviewed from the summary page and seven chapters (setup; selecting a statistical approach; specification sheets; tests and checks; known answers; keeping data secure; section introductions), read through a web-fetch summariser rather than in full. The other ~40 pages were not read._

| | AI Assistants for Scientific Coding |
|---|---|
| Format | Online book of short, self-paced modules in eight sections: line-by-line completion; agents; AI in workflows; security and cloud agents; customising agents (skills, sub-agents); "agentic engineering" for data analysis (verification); LLM access via API (`ellmer`, building a chatbot and an agent by hand); local models (Ollama). Audience: R users who can already read data and make plots. **Licence not stated.** |
| Key strengths | **Closest match to our audience and our new scope:** R, Positron recommended first ("easier to set up for R users than VS Code"), marine-ecology data (reef fish and benthic cover surveys, loaded by URL). **Separates deciding *what* to do from *how* to code it** (select approach → plan → write code), and warns that models are "noticeably less reliable" at choosing statistical methods and default to the most familiar one. **Strong, specific verification:** red-green test-first prompting, fail-loudly checks, a "source of truth" table (sample counts, unique sites, variable ranges, residual counts), known-answer tests by simulation (including CI coverage), shuffle and permutation tests, comparing implementations (`lmer` / `lme` / `glmmTMB`), and a fake "known-answer species" hidden in batch runs. **Evidence-based:** draws on the author's controlled studies — e.g. the best model produced a fully correct report in only 2 of 10 runs, agents silently substituted methods and claimed to have finished work that had failed. **Specification sheets** as durable, project-level prompts. **Practical data-security advice:** keep sensitive data outside the project folder, ignore files, no-retention routing, local models. Demystifies agents by building one by hand with `ellmer`. |
| Key weaknesses (for our purposes) | **Assumes paid access** (Copilot, Claude Code subscriptions, API credits via OpenRouter); little on free, institutional or national routes, and no self-study vs. facilitated design. **Version control not mentioned** in the pages reviewed. **Tool-specific** agent customisation (Claude Code skills and sub-agents); no AGENTS.md, cross-harness portability or MCP. Subgroup checks absent; sensitivity checks only indirectly (multi-agent "robustness" runs). Reference-book format: exercises are sparse "challenges", with no assessments. No ecology-specific data-governance content (species locations, CARE). Licence unknown, so content cannot be reused without permission. |

### Bearing on our approach

This resource matters more than the other three: it overlaps substantially with Module 3 as rescoped on 2026-10-27.
- **It validates our direction.** Its core workflow (decide the method yourself, then let AI implement it) is the scope the team agreed on. Its emphasis that verification, not code generation, is now the hard part matches 3a.5 as the centerpiece. Its choice of R and Positron matches ours.
- **It sharpens 3a.4, 3a.5, 3b.1, 3b.2 and 3b.5** (as ideas, cited, not copied — the licence is unknown). _Incorporated 2026-10-27; each use is marked "⇐ Seascape (idea)" in the blocks, and E5 was added:_
  - *3a.4:* method selection as its own step, with "use the most capable model you can reach for method selection, cheaper ones for code" — which also feeds the access ladder.
  - *3a.5:* add the source-of-truth table, shuffle/permutation tests, comparing implementations, and the hidden known-answer case for batch runs; cite the controlled-study findings to motivate why checks matter.
  - *3b.2:* treat a project specification sheet as the long form of AGENTS.md plus the task brief.
  - *3b.1:* "keep sensitive data outside the project folder" is a simple, teachable access rule.
  - *E1 / 3b.1:* building a tiny agent by hand with `ellmer` is a good way to show what a harness does.
- **It lets us avoid duplicating effort.** Where it already teaches something well (R-centred agent verification for ecologists), Module 3 can point learners to it as further reading or a self-study companion rather than re-create it.
- **It sharpens what is distinctive about AI-in-a-day:** equitable access and no-cost paths; facilitated *and* self-study delivery; open standards and portability across harnesses (AGENTS.md, Agent Skills, MCP); version control as a required habit; explicit access tiers and ecology-specific data governance; subgroup, sensitivity and non-statistical checks; a chat mini-module for learners not yet ready for agents; terrestrial and LTER examples alongside its marine ones.
- **Possible collaboration.** Since the licence isn't stated, ask the author whether materials can be adapted with attribution, or whether a joint or cross-linked effort makes sense.

**Gaps the first three trainings share, which Modules 3a and 3b should fill.** _Annotations in brackets note where the fourth resource, *AI Assistants for Scientific Coding* (added 2026-10-27; see below), already covers a gap._
1. Checking the **statistical validity** of AI-proposed analyses: model family, assumptions, pseudoreplication, spatial and temporal autocorrelation. [*Seascape: largely covered* — method selection kept separate from coding, known-answer tests, comparing implementations.]
2. **Formal tests** for analysis code (testthat/pytest), with a human specifying what the tests check. [*Seascape: covered* — `testthat`, red-green test-first prompting, fail-loudly checks, a "source of truth" table.]
3. **Reproducibility and provenance** of AI-assisted work: lockfiles, session info, model and harness version, prompt logs, git. [*Seascape: partly* — specification sheets and project structure; version control not mentioned in the pages reviewed.]
4. **Supervised agentic workflows** applied to a real *data-analysis* pipeline, not toy apps. [*Seascape: covered* — agents on a reef-survey GLM analysis, with review strategies.]
5. Practical **"what can I share with this tool?"** guidance for ecological data: sensitive species locations, CARE and Indigenous data, unpublished or permitted data. This is the operational checklist only; the broader ethics stay in Mod 5. [*Seascape: partly* — keep sensitive data outside the project folder, ignore files, no-retention providers, local models; nothing ecology-specific such as species locations or CARE.]
6. **Ecology-relevant datasets and failure modes.** (Module 3 now leads with R in Positron; see "Language and tool focus".) [*Seascape: covered for marine ecology* — reef fish and benthic survey data, in R.]
7. **Harness configuration as a skill in its own right.** [*Seascape: partly* — skills and sub-agents, but Claude Code–specific; no AGENTS.md or MCP.] None of the three teaches learners to write instruction files (AGENTS.md and the like), Agent Skills (SKILL.md) or MCP configuration, or how these carry over between harnesses.
8. **Choosing a model and where it runs.** [*Seascape: partly* — local models with Ollama, API access via `ellmer` and OpenRouter; no institutional or national routes.] None compares frontier and open-weight models side by side, or explains how to reach open-weight models through institutional, national (Jetstream2, NAIRR) or local resources, or what trade-offs each choice brings for data residency, capability and reproducibility.
9. **The range of interfaces.** [*Seascape: partly* — covers inline completion, IDE and terminal agents, and cloud agents, but doesn't compare them side by side.] None shows learners that the same models can be reached through web chat, vendor agent apps (Claude Cowork, the Codex app), IDE assistants, or directly in a terminal. It also doesn't explain what each interface shows, what it controls, and where code runs and data goes.
10. **Unequal access to AI resources.** [*Seascape: not covered* — assumes paid subscriptions or API credits.] Two of the trainings acknowledge cost, but none designs for it. AI-Ecology's tool table rates free tiers and points to the GitHub Student Pack. intro-gpt has pricing pages and CyVerse sandboxes. Neither offers a guaranteed no-cost path through every exercise, a plan for learners without capable hardware or software-install rights, or a take-home plan for continuing after the workshop at each level of access.

---

## Part 2: Draft outlines for Modules 3a and 3b

Module 3 is split into two parts:
- **3a, "Working with Models and Code"** (about 2.9 h, all core): choosing a model and interface, then a chat mini-module and an IDE mini-module built on the plan → generate → evaluate → revise loop, with verification at the centre.
- **3b, "Configuring and Supervising Agents"** (about 2.9 h; 2.3 h core; plus optional extensions): configuring harnesses with AGENTS.md, skills and MCP, then running a supervised, reproducible agentic analysis.

3a is a prerequisite for 3b. The split reflects both time and skill level: 3b is the more advanced, comprehensive introduction to agentic work. The two can run on the same day or on different days.

### Scope (agreed 2026-10-27)

Module 3 is now **"Analysis and Verification of Results"**. It assumes learners arrive with a defined research question, data, and an analysis approach. It teaches how to use AI to **draft code, compare candidate methods, and suggest and run checks**. It does not cover choosing research methods, field work or data collection (handled elsewhere), or open-ended "let the AI analyse my data" exploration.

### Decisions from the 2026-10-27 Module 3 meeting
- **Rename** the module to "Analysis and Verification of Results" (scope above).
- **Former 3a.0 (orientation) and 3a.1 (data-science fundamentals) move to Module 1.** They are listed below as hand-offs that Module 3 assumes. Other overlap with Module 1 (e.g. 3a.2, models and where they run) is labelled and revisited once Module 1 is drafted.
- **Prioritise technical content** that doesn't duplicate other modules; label prerequisites.
- **3a is two mini-modules**, chat then IDE with inline completion; **3b** is the full agentic treatment.
- **Reproducibility:** in chat, ask for code you run yourself, not results computed by the chatbot.
- **Verification** includes framing the question first, truth checks, subgroup checks and sensitivity checks, plus non-statistical validation.
- **R in Positron is the focus** for demos and exercises (see "Language and tool focus"). An optional set-up module points to Positron's own documentation, with Codex noted as an alternative. This is pending input from the wider team.
- **Process:** the outline moves to Google Docs for tracked-change review. The team focuses on 3a.4–3a.7 and adds specific learning activities. Next meeting: 10 November 2026, 2 pm Mountain.

### Language and tool focus

Demos and exercises use **R in Positron**, with Posit Assistant as the IDE assistant. Using one language and one IDE reduces cognitive load and support burden across modules. The concepts are language- and tool-agnostic, so the workflows and examples **could later be duplicated** for other languages (e.g. Python) and tools (VS Code, RStudio, Jupyter) if there is demand and capacity. Where this outline mentions Python or other IDEs, read it as that possible future duplication.

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
5. **Three habits that run through every block.** They are introduced in Module 1 (hand-off from former 3a.0) and reinforced wherever an activity calls for them, rather than taught once and forgotten:
   - **Checkpoint:** put the project under version control *before* AI changes anything, review the diff afterwards, and know how to roll back. (See "Version control: required habit, not taught" below.)
   - **Brief:** write each request as a self-contained task brief that someone without the conversation history could act on. (Taught in 3a.4; reused for AGENTS.md in 3b.2.)
   - **Scope access:** decide deliberately what the AI can see and do: which data, files, credentials, tools and network. Grant the minimum the task needs. (Introduced in Module 1 and 3a.3, practised in 3a.4 and 3a.6, made concrete *before* any agent work in 3b.1.)

_Note on sources of ideas: the working group has pointed to materials from other, non-open courses to illustrate these ideas. None of that content is reused. The activities here are written fresh, with ecological examples._

### Version control: required habit, not taught

Teaching Git is out of scope, but an AI workflow without checkpoints is unsafe: agents edit many files at once, and chat-generated code overwrites work. The module treats version control as a **prerequisite habit**, supported just enough to be usable:
- **What learners must be able to do** (stated on the setup page): put a project under version control, commit, view a diff, and revert a change. Nothing else (branches, merges, remotes) is required.
- **On-ramp, not lesson:**
  - The setup page links to established open lessons for learners who need them (e.g. the Software Carpentry Git novice lesson; *Happy Git and GitHub for the useR*).
  - A one-page "version control for AI work" cheat sheet, written for this module, covers the four actions above and when to use them.
- **Lowest-friction tools:** learners can use the Git panes built into RStudio, Positron and VS Code, or GitHub Desktop. No command line is required for these four actions.
- **Removing setup barriers:**
  - *Facilitated:* the exercise project is already a Git repository in the provisioned environment.
  - *Self-study:* learners start from a template repository; a Codespace opens it ready to use.
- **How it shows up in the lessons:** a short "Checkpoint" step in each activity: commit before asking the AI to change code, read the diff after, revert if it is wrong. It appears in 3a.4–3a.6 and every stage of 3b.5. Agents can run Git commands themselves, but the learner reviews and approves the commit.
- **Why it matters for AI work** (stated in Module 1 and recalled at the start of 3a.4): version control does not prove the AI's code is right. It gives you restore points, keeps each AI task separate and reviewable, and leaves a record of what changed. That record also supports provenance in 3b.6.
- **Fallback for learners without Git:** harness checkpoints or "rewind" features, or copying the project folder before each AI task. Say plainly that these are weaker: no lasting history, and easy to forget.

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
5. **Free is not the same as private.** Free consumer tiers and free hosted model services may use your inputs for training by default, and they have tighter rate limits. Teach learners to check data-use settings and opt-outs. Contrast these with institutional agreements and with local or national open-weight routes. This links to the share-safe checklist (now in Module 1) and the "what does this tool see?" steps in 3a.3–3a.6. In self-study, where no instructor is vetting tools, this matters even more.
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

**Running dataset (proposal):** an LTER dataset from `lterdatasampler`, for example `and_vertebrates` (counts and lengths) or `ntl_icecover` (a time series). It is an R package, so it fits the R-in-Positron focus; a CSV export would support any later duplication in other languages. It involves count data, NAs and nested sampling, which create realistic traps for AI-written code. Alternative: a NEON subset.

Each block lists its estimated time, the LOs it serves, and which source training it borrows from (⇐). ★ marks blocks that are new or substantially expanded.

_**Attribution rule for *AI Assistants for Scientific Coding*** (Brown 2026, "Seascape" below): its licence is unknown, so "⇐ Seascape (idea)" marks a general idea that we have re-expressed in our own words, with our own examples and data. No text, examples, figures, templates or code are taken from it. Cite it as further reading wherever an idea is used. Ask the author before adapting anything more closely._

---

## Module 3a: Working with Models and Code

**Assumed from Module 1** (hand-offs; coordinate with the Module 1 team as both drafts develop). The former blocks 3a.0 and 3a.1 now belong to Module 1:
- **Former 3a.0, Orientation:** where this module fits in the research workflow; the plan → generate → evaluate → revise (PGER) loop; the four layers (model, interface, harness, configuration); "you are accountable for every line"; the three habits (checkpoint, brief, scope access).
- **Former 3a.1, Data-science fundamentals:** project structure; tidy data; version control and literate analysis as the basis for checkable AI output; the share-safe checklist (share schema and metadata, not raw data; sensitive species locations, CARE data, permits; institutional data classifications); secrets hygiene; writing a data card.

Until Module 1 is drafted, 3a opens each mini-module with a one-minute reminder of the relevant habit, so the module still works on its own (e.g. in self-study).

**Structure.** 3a has a short "getting set" part, then two mini-modules, as agreed on 2026-10-27:
- **Getting set:** 3a.2 Models and where they run; 3a.3 Interfaces.
- **Chat mini-module:** 3a.4 Brief the AI and generate code; 3a.5 Verify before you trust.
- **IDE and inline-completion mini-module:** 3a.6 in Positron.
- 3a.7 wrap-up and hand-off to 3b, which is the full agentic treatment.

**Learning objectives (Bloom verbs):**
1. *Compare* frontier and open-weight models, and *select* an appropriate model and access route for a given analysis and data sensitivity.
2. *Distinguish* the interfaces for working with models (chat, vendor agent apps such as Claude Cowork and Codex, IDE assistants, terminal), including what each one can see and do with your code and data.
3. *Apply* a plan → generate → evaluate → revise loop, using task briefs, to have AI draft reproducible analysis code (not results) for an analysis you have already designed.
4. *Verify* AI-drafted analyses with truth checks, subgroup and sensitivity checks, tests, and statistical and non-statistical validation.
5. *Limit* what you share with chat and IDE assistants (data, files, credentials) to what the task needs.

**★3a.2 Models and where they run (35 min, LO1)**
_Possible overlap with Module 1 (raised 2026-10-27). Keep here for now; revisit when Module 1's content is drafted._
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

- **The OpenAI-compatible API is the common connector.** The same `base_url` + `api_key` + `model` triple works from R (`ellmer`), from Positron's assistant settings, the terminal, and most harnesses (and from Python via `openai` or `chatlas`).
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

**★3a.3 Interfaces: chat, vendor agent apps, IDE, and terminal (30 min, LO2, LO5)**
- **The interface spectrum.** Moving down the list, you gain control and transparency but need more setup and skill:

  | Interface | Examples† | Where code runs and files live | Good for | Watch out for |
  |---|---|---|---|---|
  | Web/desktop chat | claude.ai, ChatGPT, Gemini, institutional chat; built-in code-execution sandboxes | Vendor sandbox; files you upload | Quick questions, explanations, drafting code | Uploading data sends it to the vendor; copy-paste loses provenance |
  | Vendor agent desktop apps | **Claude Cowork** (in the Claude desktop app; works on a folder you grant it); **Codex app** (manages several coding agents, each in its own git worktree); Claude Code desktop | Your machine, in the folder or repo you grant | Agentic work without a terminal; a good on-ramp for novices | Actions are less visible than in a terminal. Know which folders it can touch. Check which configuration (skills, connectors/MCP, AGENTS.md) it honours |
  | Cloud agents | Codex cloud, Claude Code on the web, Copilot coding agent | Vendor VM running against a GitHub repo | Background tasks that produce reviewable pull requests | Repo contents and any data go to the vendor; needs GitHub |
  | IDE assistants | **Posit Assistant in Positron (module default)**; also Copilot (VS Code, RStudio), Jupyter AI, Claude Code / Codex IDE extensions | Your machine, in the editor | Working inside your existing analysis environment | Inline suggestions are easy to accept without reading; the assistant may see open files and session objects |
  | **Terminal** | **Model directly:** `ollama run <model>`, the `llm` CLI, `curl` to an OpenAI-compatible endpoint. **Agent CLIs:** Claude Code, Codex CLI, Gemini/Antigravity CLI, opencode, goose, aider | Your machine, an HPC node over SSH, or the workshop's browser-based environment | Full control and visibility; the most direct route to open-weight models; scriptable; works on HPC. Open-source CLIs (opencode, goose, aider) cost nothing beyond the model endpoint | Unfamiliar to many ecologists; an agent here can run any shell command you approve |

- **What does this tool see?** For each interface, learners list what it can read (what you paste or upload, open files, the whole project folder, session objects, environment variables) and where that goes. This is the 3a counterpart to the access tiers in 3b.1.
- **Access note.** Vendor agent apps and cloud agents generally need a paid plan and a supported desktop operating system†. The terminal path is the no-cost path that everyone can follow. It runs in a browser environment (provisioned, or Codespaces/Posit Cloud in self-study) against your endpoint. Paid apps are shown in live or recorded demos, or used by learners who already have them.
- **Terminal on-ramp for novices** (10 min within this block):
  - Open the terminal built into Positron, either locally or in a browser environment (provisioned or self-started), which needs no installs.
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

### Chat mini-module

**3a.4 Brief the AI and generate code (30 min, LO3, LO5)**
- **Start from your analysis plan, not from the AI.** Learners arrive with a research question, data and an intended analysis. Before opening a chat, they write these down in two or three sentences. The AI helps *implement* and *check* that plan: drafting code, comparing candidate methods, suggesting checks. It does not choose the research design.
- **Code, not results.** Ask the chat for code you run yourself in Positron. Don't upload data and accept numbers the chatbot computed. Results computed inside a chat can't be rerun, inspected or versioned, and uploading data may breach its governance.
- **The task brief.** A good prompt reads like a brief you could hand to a capable colleague who has *not* seen your conversation. It covers:
  - **Goal:** what you want and why. One or two sentences, tied to your analysis plan.
  - **Context:** your data card (Module 1), relevant files, R packages, data structure.
  - **Limits:** what must not change, what to avoid, which data the AI may and may not use.
  - **Inputs:** the specific files, objects or error messages to work from.
  - **Output:** the form you want back (a function, a plan, a diff, a short explanation).
  - **Example:** one small worked case, when the expected behaviour is easy to get wrong (e.g. NA vs. zero counts).
  - **Done when:** how you'll check it, ideally a known value or a test you can run. This ties prompting directly to 3a.5.
- **Procedures for analysis requests** (the analysis-specific part of prompting). Work in three separate steps, each in its own request, so the decisions that need a researcher stay with the researcher (⇐ Seascape (idea)):
  1. **Decide the method.** This is your call. If you consult AI here, do it in a separate conversation before any code is written. Describe the study design and paste a short data summary, then ask for two or three candidate approaches (e.g. Poisson GLM, negative binomial GLM, mixed model with site as a random effect), each with its assumptions and what would rule it out. Expect it to lean towards the most familiar method, and ask for alternatives. Use the most capable model you can reach for this step; a smaller or open-weight model is often enough for the coding steps (links to the access ladder).
  2. **Plan the implementation.** Ask for a plan and pseudocode first. Ask the model to state its assumptions about the data and the method.
  3. **Write the code.** Only now ask for code, one step of the plan at a time.
  - **Ask it to suggest checks:** "what would tell us this code is wrong?" Learners then pick which checks to run in 3a.5.
- **What does the chat see? (Scope access.)** Only what you paste or upload. Paste the schema and a few toy or synthetic rows, never raw sensitive data or keys. Check the chat's data-use settings first.
- Use the bad → better → best progression to show how the brief changes the answer (⇐ intro-gpt casestudy; novice ep 02 template).
- **Cold-read test:** paste the brief into a fresh session, or swap briefs with a partner (self-study: compare against a published example brief). If the reader has to ask what you meant, the brief is missing something.
- *Exercise (R in Positron):* rewrite a vague request ("make a plot of the salamander data") as a full task brief based on a stated analysis plan. Use it to get code that produces a summary and figure of the case-study data, then run that code yourself. **Checkpoint** before and after.
- The brief carries forward: the durable parts (context, limits) become AGENTS.md in 3b.2; the per-task parts stay in each request.

**3a.5 Verify before you trust (50 min, LO4). The centerpiece.**
- _Pacing: this block lists more checks than 50 minutes allows. Facilitated sessions do the framing step plus three or four checks chosen to fit the case study; the full list is the self-study reference and the take-home checklist._
- **Frame before you run.** Write down what you expect (direction, rough magnitude, sample sizes), and what result would surprise you. Checks are only meaningful against expectations stated in advance.
- **Truth checks: known answers.**
  - *Predict, then run:* hand-compute results on a 4–6-row toy table (⇐ novice ep 06 "Testland").
  - *Recover known parameters:* simulate data with known effects and check that the AI-drafted code recovers them.
  - *Independent values:* compare against a published or independently computed number where one exists.
- **Planted, plausible bug** with an ecological flavour, e.g. NA vs. zero counts, grouping at the wrong level, unit conversion, or an off-by-one in a time series.
- **Subgroup checks.** Does the result hold within each site, year or species? Do group-level counts add up to the totals? Is one group driving the whole result?
- **Sensitivity checks.** Vary choices that should not matter much: outlier handling, NA treatment, model family, covariate set, time window. Do the conclusions change? Report which choices they are sensitive to.
- **Non-statistical validation** (as important as the statistics):
  - *Data integrity:* row counts before and after each filter and join; duplicates; units; dates within the field season; coordinates inside the study area; valid taxonomic names.
  - *Visual checks:* does the figure match the numbers, and does it look like the system you know?
  - *Domain plausibility:* biologically feasible ranges; agreement with the literature or a colleague's judgment.
- **Statistical validity:** learners critique the method chosen in 3a.4 for distribution family (counts → Poisson/NB), random effects or pseudoreplication, autocorrelation, and assumption diagnostics.
- **Expected-values checkpoint** (⇐ Seascape (idea)). Before any model is fitted, write down what the cleaned data *must* look like: number of records, sites, years and taxa; allowed range of each variable given its units; no negative counts. After fitting, confirm the model used the number of observations you expected. Ask the AI to turn this list into checks that **stop the script with a clear error** when something is off, rather than printing a warning that is easy to miss.
- **Turn checks into tests:** the human specifies what to test, the AI drafts `testthat` tests, and the human reviews them. Ask for the test *before* the fix and confirm it fails on the broken code, so you know the test can actually detect the problem. The agent reuses these tests in 3b.
- **Checks that need no known answer** (⇐ Seascape (idea)):
  - *Order shouldn't matter:* shuffle the order of rows; results must be identical.
  - *Break the relationship:* randomly permute the response relative to the predictors many times; the estimated effect should centre on zero. If it doesn't, the code is finding structure that isn't there.
  - *Same model, different software:* fit the same model with two packages (e.g. `lme4` and `glmmTMB`); estimates should agree closely.
  - *Decoy group:* when code loops over many sites or taxa, add one synthetic group with a known effect, confirm the loop recovers it, then drop it from the results.
- **Why bother: evidence.** Controlled tests of AI agents on ecological analyses report that even the strongest models rarely produce a fully correct analysis, sometimes swap methods without saying so, and sometimes report success on steps that failed (cite Brown 2026 and the companion papers it lists). Use this to motivate the block, not to discourage AI use.
- **Cross-checking:** a fresh session or a *different model* reviews the code; a frontier/open-weight pairing works well here. A clean review is not proof of correctness (⇐ novice ep 06).
- **Supply chain:** check that suggested packages exist on CRAN (slopsquatting).
- **Troubleshooting your own code:** use error messages and minimal reproducible examples (`reprex`) with AI, and require an explanation rather than just a fix.

### IDE and inline-completion mini-module

**3a.6 Revise in the IDE: Positron (25 min, LO3, LO5)**
- **Setup is a prerequisite, not a lesson.** Learners set up Positron and its assistant beforehand, following Positron's own documentation, through an optional set-up module. That module also notes Codex as an alternative assistant. (Proposal from 2026-10-27, pending input from the wider team.)
- **Inline completion vs. the assistant panel.** Accept suggestions line by line, reading each one; use the assistant to explain, refactor and draft tests. Compare with what the chat produced in 3a.4.
- **What does the assistant see? (Scope access.)** Open files, possibly the whole project and objects in the R session. Close sensitive files, keep secrets in `.Renviron`, and check the assistant's context settings before working with sensitive data†.
- Review a script against good-enough practices, plan 3–5 fixes, apply them one at a time, and commit after each (⇐ novice ep 05). **Checkpoint:** read every diff before accepting.
- Re-run the 3a.5 checks and tests after each change.
- **No-cost paths†:**
  - GitHub Copilot Free, or Copilot Pro through GitHub Education, for inline completions;
  - Posit Assistant pointed at your own OpenAI-compatible endpoint, where supported.
- *Other IDEs:* VS Code, RStudio and Jupyter work similarly. Duplicating this mini-module for them is possible later but not planned (see "Language and tool focus").

**3a.7 Wrap-up (5 min)**
- A one-page **AI-assisted analysis checklist** as a take-home.
- Reflection: "What did the AI get wrong, and how did you catch it?"
- Preview of 3b, plus a setup check for 3b:
  - your endpoint answers a test call (provisioned key, or your own endpoint in self-study);
  - your browser environment or local CLI opens;
  - an agent app is logged in, if one is used.

**3a timing:** about 2.9 h in full (175 min); all blocks are core.
- **Could shrink if Module 1 covers them:** 3a.2 (models and access) and 3a.3 (interfaces).

---

## Module 3b: Configuring and Supervising Agents

**Prerequisite:** Module 3a. This part uses the 3a case study, its tests and its interface setup.

**Learning objectives (Bloom verbs):**
1. *Classify* agent actions by risk and *configure* least-privilege access (permissions, sandboxing, hooks) before giving an agent a task.
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

**★3b.1 Safe setup before power: access, permissions and trust (20 min, LO1). Core.**
_Moved to the start of 3b and expanded so that learners decide what an agent may touch before they give it any capability. This answers the working group's "safety first" concern._
- **How an agent works:** the loop model → tool call → result → model, and what it can reach: files, shell, network, environment variables (including secrets).
- **Decide access by risk, before the task.** Learners sort the case study's likely agent actions into four tiers and set permissions to match:

  | Tier | Ecological examples (written for this module) |
  |---|---|
  | Allow without asking | Read files in `data/clean/`; run the test suite |
  | Ask me first | Install a package; create new files outside `R/` or `src/` |
  | Only I do this | Change anything in `data/raw/`; push to a shared repository |
  | Never | Send sensitive species locations or unpublished data to an external model; read `.Renviron` / `.env` |

- **Turn the tiers into settings:**
  - permission modes (ask, auto-approve edits, plan-only);
  - folder scope in agent apps; working-directory scope and OS sandbox in CLIs; dev container or Docker (⇐ intro-gpt `vibe.md`, `ai_sandboxes.md`);
  - a first **hook** that blocks writes to `data/raw/`, shown as a demo. Writing hooks in full stays in E4.
- **Keep sensitive data out of the agent's reach.** Store sensitive raw data in a folder *outside* the project the agent works in, and develop against a synthetic stand-in with the same columns and types. Use the harness's ignore settings as a second line of defence, knowing they are instructions the model may not always follow (⇐ Seascape (idea)).
- **Trust before you install.** Treat third-party skills, MCP servers and plugins as code that runs with your permissions: check who publishes it, read what it does, prefer read-only credentials, and start from a short vetted list. Details follow in 3b.3 and 3b.4.
- **Checkpoint:** commit before the agent's first task, so every later change is reviewable and reversible.
- Contrast interfaces: an agent app summarises its actions, while a terminal CLI shows every command. Both should be configured with least privilege.
- *Activity (both interface tabs):* fill in the four-tier table for your own project, then configure your chosen harness to match and test it by asking the agent to do one "Only I do this" action.

**★3b.2 Project instruction files: AGENTS.md and the analysis plan (20 min, LO2)**
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
- **The project analysis plan** (⇐ Seascape (idea)). AGENTS.md holds *how we work* (conventions, guardrails). The analysis itself belongs in a separate plan file that AGENTS.md points to. It is the long form of the 3a.4 task brief, written once per project: aims and questions; how the data were collected; the chosen analysis and its diagnostics; R packages and conventions; an ordered list of steps; expected outputs; folder layout. Anything that matters must be written down: an agent will not add a step (e.g. a collinearity check) just because it is standard practice in the field. Instruct the agent to **flag, never silently make**, any change to the planned method.
- *Exercise:* write an AGENTS.md for the case-study project, plus the aims and analysis-method sections of its plan. Give both to the agent in plan mode and compare its proposed plan with what you intended.

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
- *Exercise:* write an `eco-data-qc` skill. It holds a QC checklist (ranges, NA vs. zero, duplicate site-dates, unit checks) and calls a small R script. Trigger it in your chosen interface and watch it load.

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
- **Review the agent's work against the plan:**
  - *Check "done" claims:* confirm each claimed output exists and was produced by the code that ran, not just reported.
  - *Check for silent substitutions:* compare the methods actually used with the project analysis plan from 3b.2.
  - *Prefer short, simple steps:* agents are more reliable on one well-specified step than on a long multi-step request (⇐ Seascape (idea)).
  - *Robustness, not cherry-picking:* if you run several independent agent attempts, report them as a robustness check on the main result. Never pick one because its result looks best.
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

**3b timing:** about 2.9 h in full (175 min).
- **Core (about 2.3 h, 140 min):** 3b.0, 3b.1, 3b.2, 3b.3, 3b.5 and 3b.7.
- **Can be shortened if needed:** 3b.4 (could be a live or recorded demo) and 3b.6.

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
- **Activity (R in Positron):**
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
- **Activity (R in Positron):**
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

**E5. Build a minimal agent by hand (30 min; self-study about 45 min)**
- **Learning objective:** *Explain* what an agent harness does by building the smallest working version of one.
- **Why it matters.** Harnesses can feel like magic. Building a tiny one shows that an agent is a loop: send a request, let the model ask to use a tool, run the tool, send back the result, repeat. Permissions, hooks and sandboxes (3b.1) then make obvious sense (⇐ Seascape (idea)).
- **Activity (R in Positron):**
  1. With `ellmer`, open a chat against your endpoint (`LLM_BASE_URL` / `LLM_API_KEY` / `LLM_MODEL`).
  2. Register one safe tool: an R function that returns summary statistics for a named, already-loaded data frame.
  3. Ask a question that needs the tool and watch the model request it, receive the result, and answer.
  4. Add a second tool that *writes* a file, and add a confirmation step before it runs. This is a hand-made permission prompt.
  5. Discuss: what would a harness add (file access, shell, memory, many tools), and where would each 3b.1 access tier be enforced?
- **No-cost path:** any OpenAI-compatible endpoint from the access ladder; the tool calls are tiny. Small open-weight models may be unreliable at tool calling, which is itself a useful observation.
- *Error callout:* the model never calls the tool (unsupported, or the description is unclear); tool errors surface as model confusion.
- *Ethics callout:* a hand-built agent has *no* guardrails except those you write.
- *Source:* idea re-expressed from Seascape (it builds a chatbot and an agent with `ellmer`); our activity, tools and examples are new.

**Extension timing:** E1, E2, E4 and E5 take about 30 min each when facilitated (about 45 min self-study). E3 is a 20 min demo, or about 60 min hands-on.

---

## Part 3: Presenting 3a and 3b in the AI-in-a-day Quarto template

**Site structure** (changes to make when the outline is accepted; not yet applied):
- Replace `mod-03.qmd` with **`mod-03a.qmd`** ("3a. Working with Models and Code") and **`mod-03b.qmd`** ("3b. Configuring and Supervising Agents"). Each keeps the template's Roadmap and Learning Objectives callouts. Put a prerequisite note at the top of 3b.
- Update the `_quarto.yml` sidebar: replace the "3. Methods & Results" item with a nested section "3. Analysis & Verification of Results" containing the 3a and 3b pages.
- Bibliographies: either `references/mod-03a_refs.bib` and `references/mod-03b_refs.bib`, or both pages share the existing `mod-03_refs.bib`.
- Topic files follow the `topics/mod-0#_<slug>.qmd` convention, with the part letter included:
  - **3a:** `mod-03a_models-access`, `mod-03a_interfaces`, `mod-03a_chat-prompting`, `mod-03a_verification`, `mod-03a_ide`
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
- **Markers for the three habits.** Use a small, consistent inline label (e.g. a Checkpoint / Brief / Access tag at the start of the step) rather than a new callout type, so the habits are visible in every activity without cluttering the template.
- **Synchronised tabsets.**
  - `group="interface"` (Terminal / Agent app, with the no-cost Terminal tab first), so a learner's choice carries across the page. A `group="language"` tabset (R / Python) is added only if examples are later duplicated in other languages.
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
  - `exercises/mod-03a/` holds toy tables, the broken scripts and test files, in R (a `python/` copy only if duplicated later).
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
- **Version control on-ramp:** choose which open Git lesson(s) the setup page links to, and who writes the one-page "version control for AI work" cheat sheet.
- **Ideas from non-open courses:** keep a short record of which ideas were inspired by outside materials, so the team can confirm nothing was reused in substance.
- **Module 1 hand-offs:** confirm with the Module 1 team that former 3a.0 (orientation, the three habits) and 3a.1 (fundamentals, share-safe checklist, data card) are covered there, and whether 3a.2 (models and access) and 3a.3 (interfaces) overlap.
- **Positron in browser environments:** check that the provisioned and self-study browser environments (hosted Workbench, Codespaces, Posit Cloud) can run Positron with its assistant†. If not, decide on the fallback for learners without a capable laptop.
- **Positron set-up module:** confirm with the wider team the optional set-up module that points to Positron's documentation, with Codex as an alternative.
- **Other languages and tools:** decide later whether to duplicate workflows and examples for Python or other IDEs.
- **Seascape resource:** decide how to use *AI Assistants for Scientific Coding* (cite as further reading, self-study companion, or seek permission to adapt), and whether to contact the author.
- Re-verify every † item close to delivery.

---

## References cited for ideas

- Brown, C. (2026). *AI Assistants for Scientific Coding*. Seascape Models. https://www.seascapemodels.org/AI-assistants-for-scientific-coding/ (accessed 2026-10-27; licence not stated, so it is used for ideas only and cited, not reused). The book also asks readers to cite its companion papers; add those references once the team has confirmed them.

