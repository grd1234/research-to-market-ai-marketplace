# Research-to-Market AI Marketplace

An AI-powered marketplace that accelerates the transformation of academic and tech research into market-ready innovations by connecting researchers, investors, and industry partners.

## 🎯 Project Overview

This project addresses a critical market gap: **70%+ of high-impact academic research never reaches commercialization**. The Research-to-Market AI Marketplace creates intelligent pathways from research to market by:

- **Automating research analysis** - AI-powered deep analysis of academic papers (technical + commercial feasibility)
- **Tiered validation system** - 4 interest levels (Monitoring → Exploring → Pilot-Ready → Seeking Funding)
- **Marketplace matching** - Connect industry partners, researchers, and investors with quality gates
- **Explainable trust** - Transparent AI reasoning, citations, and validation chains

## 🏗️ Architecture

### Phase 1: Industry Partner Workflow (Current Sprint)
**Goal:** Validate research papers for commercial viability with AI-assisted analysis

**Multi-Agent System:**
- **Agent 1:** Research Retrieval (arXiv, Semantic Scholar)
- **Agent 2:** Deep Analysis (technical + commercial feasibility)
- **Agent 3:** Synthesis & Documentation (use case generation)

**Human-in-the-Loop Checkpoints:**
1. **Checkpoint 1:** Paper selection + Interest level declaration
2. **Checkpoint 2:** Analysis validation + Checklist completion (3/8/12/14 items)
3. **Checkpoint 3:** Final approval + Marketplace listing preview

### Phase 2: Investor Discovery (Future)
Investors browse validated opportunities pre-vetted by industry partners

### Phase 3: Researcher Submission (Future)
Researchers submit innovations directly to marketplace for matching

## 📁 Project Structure

```
bootcamp2510/
├── bootcamp_workflows/         # Bootcamp workflow templates
│   ├── building/              # 10-phase building workflows
│   ├── logistics/             # Program info, deliverables
│   └── util/                  # Utility scripts
├── your_workspace/            # Participant workspace
│   ├── profile/              # Participant profile
│   ├── reports/              # Problem definition, analyses
│   │   └── problem_definition.md  # Complete problem framing
│   ├── logs/                 # Activity logs, task tracking
│   └── your_workflows/       # Project workflows
│       └── research_analysis_experiment/  # Current experiment
│           ├── step1-8 prompts           # 8-step experiment workflow
│           ├── checkpoint*_*.md          # Checkpoint designs
│           └── outputs/                  # Generated use cases
└── README.md
```

## 🚀 Current Status

**Sprint 1 (Weeks 1-2): Ideation & Validation**
- ✅ Problem definition complete
- ✅ 5 solution hypotheses generated
- ✅ Hypothesis 5 selected (Multi-Agent System with Configurable Checkpoints)
- ✅ Experiment plan designed (1-week n8n validation)
- ✅ YAML workflow with 8 steps created
- ✅ Checkpoint designs completed and reviewed
- ⏳ **Current:** Ready to start experiment (Step 1: Environment setup)

## 🛠️ Tech Stack

**Orchestration:** n8n (workflow automation platform)
**LLMs:** Claude (Anthropic) with vision, GPT-4V (comparison testing)
**APIs:** arXiv API, Semantic Scholar API
**Data Sources:** Academic research papers (PDF processing)
**Output Formats:** Markdown + JSON

## 📊 Tiered Validation System

The marketplace uses a 4-level validation system matching partner commitment:

| Level | Items | Visibility | Investor Access |
|-------|-------|-----------|----------------|
| **Monitoring** | 3 items | Private workspace | ❌ No |
| **Exploring** | 8 items | Internal + Researchers | ❌ No |
| **Pilot-Ready** | 12 items | Researchers (direct) | ❌ No |
| **Seeking Funding** | 14 items | **INVESTOR MARKETPLACE** | ✅ YES |

**Quality Gate:** Only "Seeking Funding" level (all 14 validation items complete) reaches Phase 2 investors.

## 🧪 Experiment Workflow

**Goal:** Validate n8n can handle multi-agent research analysis with blocking checkpoints

**8-Step Process:**
1. Environment & API setup (Claude, arXiv, Semantic Scholar)
2. Learn blocking checkpoints (Wait nodes + webhooks)
3. Build paper retrieval with Checkpoint 1 (interest level selection)
4. Test PDF processing (Claude vision vs GPT-4V comparison)
5. Build analysis pipeline with Checkpoint 2 (validation checklist)
6. Build output generation with Checkpoint 3 (marketplace preview)
7. Run end-to-end tests (3 different queries)
8. Evaluate & decide (Go/No-Go for Phase 1 MVP)

**Success Criteria:** All 4 validation questions = YES → Proceed to MVP

## 📝 Key Documents

- **Problem Definition:** [`your_workspace/reports/problem_definition.md`](your_workspace/reports/problem_definition.md)
- **Participant Profile:** [`your_workspace/profile/participant_profile.md`](your_workspace/profile/participant_profile.md)
- **Experiment Workflow:** [`your_workspace/your_workflows/research_analysis_experiment/`](your_workspace/your_workflows/research_analysis_experiment/)
- **Checkpoint Review:** [`CHECKPOINT_REVIEW_SUMMARY.md`](your_workspace/your_workflows/research_analysis_experiment/CHECKPOINT_REVIEW_SUMMARY.md)

## 🎓 Bootcamp Context

**Program:** AI Agent Building Bootcamp (October 2025 Cohort)
**Duration:** 7 weeks (Oct 20 - Dec 5, 2025)
**Sprint Structure:**
- Sprint 1 (Weeks 1-2): Ideation & Evaluation → Demo Oct 27
- Sprint 2 (Weeks 3-4): Implementation → Demo Nov 10
- Sprint 3 (Weeks 5-6): Refinement → Demo Nov 24
- Final (Week 7): Demo Dec 5

## 🚦 Next Steps

**Immediate (This Week):**
1. Run experiment workflow (1 week, 8 steps)
2. Validate n8n + Claude PDF processing
3. Test blocking checkpoints with tiered validation
4. Make Go/No-Go decision for MVP

**Sprint 2 (If Experiment Succeeds):**
1. Build Phase 1 MVP (Single Collaborative Agent)
2. Process 1-3 papers with full commercial analysis
3. Generate investor-ready use case documents
4. Test with real research papers

**Sprint 3:**
1. Evolve to 3-agent system
2. Scale to 10-15 papers
3. Add performance optimization
4. Prepare for Phase 2 (investor matching)

## 🤝 Contributing

This is a bootcamp project. Feedback and suggestions welcome via Slack: `#agents-bootcamp-2510`

## 📄 License

This project is developed as part of the AI Agent Building Bootcamp.

## 👤 Author

**Geeta Desaraju**
- Background: Product Management + Development
- Experience: RAG systems, semantic search, multi-tool agents
- Bootcamp Goal: Build full research-to-commercialization platform

---

**Status:** Sprint 1 - Experiment Ready 🚀

*Generated with [Claude Code](https://claude.com/claude-code)*
