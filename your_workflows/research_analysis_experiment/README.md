# Research Analysis Experiment - n8n Validation Workflow

## Purpose

This workflow guides you through a 1-week experiment to validate whether n8n can handle a multi-agent research analysis system for your Research-to-Market AI Marketplace.

**What it tests:**
- Can n8n retrieve and rank research papers from arXiv/Semantic Scholar?
- Can multimodal LLMs (Claude/GPT-4V) process research PDFs with images, tables, and equations?
- Can n8n implement blocking checkpoints (human-in-the-loop validation)?
- **Can the tiered validation system work?** (Monitoring/Exploring/Pilot-Ready/Seeking Funding)
- **Can partners complete validation checklist items?** (3/8/12/14 items based on interest level)
- **Does marketplace listing preview clarify visibility?** (who sees what)
- Can the workflow generate investor-ready use case documents?

**Who it's for:**
Industry partners, researchers, and commercialization teams who need to rapidly assess the commercial viability of academic research.

---

## How It Works

This workflow has **8 steps** organized into **3 phases**:

### Phase 1: Setup & n8n Learning (Days 1-2)
1. **Environment & API Setup** - Verify tools, obtain API keys, test basic connectivity
2. **Learn Blocking Checkpoints** - Master Wait nodes + webhooks for human-in-the-loop

### Phase 2: Build Core Workflow (Days 3-5)
3. **Build Paper Retrieval** - Search arXiv/Semantic Scholar, implement Checkpoint 1
4. **Test PDF Processing Options** - Compare Claude vision vs GPT-4V for multimodal content
5. **Build Analysis Pipeline** - Create technical + commercial analysis, implement Checkpoint 2
6. **Build Output & Final Checkpoint** - Generate markdown documents, implement Checkpoint 3

### Phase 3: Testing & Decision (Days 6-7)
7. **Run End-to-End Tests** - Test with 3 different search queries
8. **Evaluate & Decide** - Measure metrics, make Go/No-Go decision for Phase 1 MVP

---

## How to Use

### Prerequisites
- n8n instance (cloud or self-hosted)
- API keys: Anthropic (Claude), OpenAI (GPT-4V - optional), Semantic Scholar (optional)
- Basic understanding of research papers and commercialization

### Execution Instructions

**In Claude Code (or similar LLM CLI):**

Start the workflow by running:
```
Execute workflow: your_workspace/your_workflows/research_analysis_experiment/research_analysis_experiment_workflow.md
```

Claude will guide you through each step, reading from the workflow YAML and corresponding prompt files.

**In ChatGPT/Claude Web (or other chat interface):**

Work through the steps manually by copying and pasting prompt files:

1. **Step 1:** Copy contents of `step1_environment_api_setup_prompt.txt` into chat
   - Follow the prompts to set up your environment
   - Complete the setup checklist

2. **Step 2:** Copy contents of `step2_learn_blocking_checkpoints_prompt.txt`
   - Learn and test the blocking checkpoint pattern in n8n
   - Create test workflows to validate understanding

3. **Step 3:** Copy contents of `step3_build_paper_retrieval_prompt.txt`
   - Build paper retrieval workflow with Checkpoint 1
   - Test with sample queries

4. **Step 4:** Copy contents of `step4_test_pdf_processing_prompt.txt`
   - Test Claude and/or GPT-4V for PDF processing
   - Choose the best LLM based on quality comparison

5. **Step 5:** Copy contents of `step5_build_analysis_pipeline_prompt.txt`
   - Build technical and commercial analysis prompts
   - Implement Checkpoint 2

6. **Step 6:** Copy contents of `step6_build_output_final_checkpoint_prompt.txt`
   - Generate markdown use case documents
   - Implement Checkpoint 3

7. **Step 7:** Copy contents of `step7_run_end_to_end_tests_prompt.txt`
   - Run 3 complete workflow tests
   - Document results and patterns

8. **Step 8:** Copy contents of `step8_evaluate_decide_prompt.txt`
   - Evaluate against success criteria
   - Make Go/No-Go decision for Phase 1 MVP

---

## Expected Outputs

By the end of this experiment, you will have:

### Documentation
- `setup_checklist.md` - Environment setup validation
- `blocking_checkpoint_pattern.md` - Reusable checkpoint pattern reference
- `retrieval_test_results.md` - Paper retrieval quality assessment
- `pdf_processing_comparison.md` - Claude vs GPT-4V comparison and decision
- `analysis_prompts.md` - Tested prompts for technical/commercial analysis
- `analysis_test_results.md` - Analysis quality assessment
- `workflow_test_results.md` - Complete workflow validation
- `test_1_results.md`, `test_2_results.md`, `test_3_results.md` - Individual test run data
- `consolidated_test_analysis.md` - Pattern analysis across all tests
- `final_experiment_report.md` - Complete experiment summary with decision
- `phase1_mvp_plan.md` OR `pivot_plan.md` - Next steps based on decision

### n8n Workflows Created
- Paper Retrieval with Checkpoint 1
- PDF Processing workflow (Claude or GPT-4V)
- Analysis Pipeline with Checkpoint 2
- Complete Research Analysis Workflow (all 3 checkpoints)

### Sample Outputs
- 3 use case analysis documents (markdown format)
- Demonstrates output quality and consistency

---

## Success Metrics

**Primary Metric:**
- Workflow completes end-to-end successfully for 3 different queries

**Secondary Metrics:**
- Checkpoint quality (1-10 rating)
- PDF processing quality (1-10 rating)
- Analysis usefulness (1-10 rating)
- Learning curve (hours spent)
- Confidence to scale (1-10 rating)

**Experiment succeeds if:**
- All 6 success criteria met (see experiment plan in problem_definition.md)
- Go/No-Go decision is "GO" (4/4 YES) or "PROCEED WITH CAUTION" (3/4 YES)

---

## Tips for Best Results

### Before Starting
- Ensure you have all API keys ready
- Set aside dedicated time blocks for each phase
- Have a test list of research topics you're interested in

### During Execution
- Don't skip validation steps - they catch issues early
- Document blockers and solutions as you encounter them
- Test with papers that have images, tables, and equations (not just text)
- Be honest in quality assessments - inflated ratings lead to bad decisions

### At Checkpoints
- Actually review the content - don't just click "approve"
- Look for errors in PDF processing (missing tables, garbled text)
- Verify commercial analysis is realistic (not wildly optimistic)

### When Testing (Step 7)
- Choose diverse queries to stress-test the workflow
- Look for patterns across the 3 tests - not just individual success/failure
- Pay attention to edge cases and failure modes

### Making the Decision (Step 8)
- Use the Decision Matrix objectively
- A "PIVOT" decision is valuable learning, not failure
- Don't commit to Phase 1 MVP if confidence is below 7/10

---

## Common Issues & Solutions

### Issue: n8n Wait node doesn't pause workflow
**Solution:** Ensure "Resume: On webhook call" is selected, not "After time interval"

### Issue: State lost after checkpoint
**Solution:** Reference previous nodes explicitly using `{{ $('NodeName').item.json.field }}`

### Issue: PDF processing fails
**Solution:** Check PDF URL is accessible, try downloading PDF first then processing

### Issue: LLM analysis is superficial
**Solution:** Refine prompts to be more specific, add examples of desired output

### Issue: Workflow takes too long
**Solution:** Limit to 1-2 papers for experiment, optimize in Phase 1 MVP

### Issue: arXiv/Semantic Scholar API errors
**Solution:** Check rate limits, verify API endpoints, add retry logic

---

## Next Steps After Experiment

### If Decision = GO
1. Proceed to Phase 1 MVP implementation (2 weeks)
2. Use `phase1_mvp_plan.md` as your guide
3. Scale from 1-2 papers to 1-3 papers
4. Add market research integration
5. Polish for production use

### If Decision = PROCEED WITH CAUTION
1. Address identified concerns first
2. Run focused follow-up tests on problem areas
3. Then proceed to Phase 1 MVP with mitigations

### If Decision = PIVOT
1. Review `pivot_plan.md` for alternative approaches
2. Design a second experiment to test the alternative
3. Example pivots: Try LangGraph, simplify workflow, use different LLM

### If Decision = STOP
1. Document learnings in retrospective
2. Re-evaluate the problem (was it the right problem to solve?)
3. Consider returning to Step 1 of the ideation workflow

---

## Related Files

- **Problem Definition:** `your_workspace/reports/problem_definition.md`
  - Complete problem framing, assumptions analysis, solution design, experiment plan
- **Participant Profile:** `your_workspace/profile/participant_profile.md`
  - Your background, goals, and project context

---

## Support

If you encounter issues or need guidance:
- Slack: #agents-bootcamp-2510
- Tag: @amir for workflow issues
- This experiment is part of the October 2025 Agents Bootcamp

---

## Acknowledgments

This experiment workflow was designed through the AI Agent Ideation Workflow (6-step process):
1. Problem Framing
2. Assumption Challenging
3. Solution Generation
4. Solution Selection
5. Experiment Design
6. Workflow Generation ← You are here!

**Date Created:** {{ date }}
**Sprint:** 1 (Ideation and Evaluation)
**Goal:** Validate n8n capability before committing to Phase 1 MVP implementation

Good luck with your experiment! 🚀


---

## 🆕 IMPORTANT: Tiered Validation Enhancements (Added 2025-10-22)

The experiment workflow has been enhanced to test the **tiered validation system** from the updated problem definition:

### Enhanced Checkpoints:

**Checkpoint 1 (Step 3):**
- **Added:** Interest level selection (Monitoring/Exploring/Pilot-Ready/Seeking Funding)
- **Purpose:** Partner declares commitment level, determines validation requirements
- **See:** Updated step3_build_paper_retrieval_prompt.txt

**Checkpoint 2 (Step 5):**
- **Added:** Validation checklist based on interest level (3/8/12/14 items)
- **Purpose:** Test if partners can complete validation items, validate AI pre-filling
- **See:** checkpoint2_validation_checklist_enhancement.md for full implementation

**Checkpoint 3 (Step 6):**
- **Added:** Marketplace listing preview based on interest level
- **Purpose:** Test visibility controls, ensure partners understand who sees what
- **See:** checkpoint3_marketplace_preview_enhancement.md for full implementation

### Why These Enhancements Matter:

✅ Tests the core marketplace feature (tiered validation)
✅ Validates the 4-level interest system works in practice
✅ Tests quality gates (only "Seeking Funding" reaches investors)
✅ Ensures experiment aligns with updated problem definition

### How to Use:

1. Follow step1-step2 as normal (environment setup, checkpoint patterns)
2. At step3: Implement enhanced Checkpoint 1 with interest level selection
3. At step5: Reference checkpoint2_validation_checklist_enhancement.md for full checklist form
4. At step6: Reference checkpoint3_marketplace_preview_enhancement.md for marketplace preview
5. Test all 4 interest levels to validate the tiered system

---

