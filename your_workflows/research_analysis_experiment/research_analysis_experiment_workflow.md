---
name: Research Analysis Experiment - n8n Validation
description: A 1-week experiment to validate n8n capability for building a multi-agent research analysis system. Tests paper retrieval from arXiv/Semantic Scholar, multimodal PDF processing with Claude/GPT-4V, and blocking checkpoint implementation.
initial_state: step1_environment_api_setup
states:
  step1_environment_api_setup:
    description: |
      Goal: Verify n8n access, obtain API keys, test basic connectivity
      Input: n8n instance (cloud or self-hosted), knowledge of which API keys are needed
      Output: n8n ready, API keys configured and tested, basic HTTP and LLM nodes working
    prompt_file: "step1_environment_api_setup_prompt.txt"
    on_success: step2_learn_blocking_checkpoints

  step2_learn_blocking_checkpoints:
    description: |
      Goal: Master Wait nodes + webhook pattern for blocking checkpoints
      Input: Working n8n instance from Step 1
      Output: Simple test workflow that pauses and resumes on user input via webhook
    prompt_file: "step2_learn_blocking_checkpoints_prompt.txt"
    on_success: step3_build_paper_retrieval

  step3_build_paper_retrieval:
    description: |
      Goal: Create workflow to search arXiv + Semantic Scholar, return 1-2 papers with Checkpoint 1
      Input: Working n8n basics from Steps 1-2
      Output: Working retrieval workflow with blocking Checkpoint 1 (paper review/approval)
    prompt_file: "step3_build_paper_retrieval_prompt.txt"
    on_success: step4_test_pdf_processing

  step4_test_pdf_processing:
    description: |
      Goal: Test Claude vision AND GPT-4V with research papers (images, tables, math)
      Input: Retrieved papers from Step 3
      Output: Decision on which LLM to use, working PDF processing in n8n
    prompt_file: "step4_test_pdf_processing_prompt.txt"
    on_success: step5_build_analysis_pipeline

  step5_build_analysis_pipeline:
    description: |
      Goal: Create prompts for technical + commercial analysis with Checkpoint 2
      Input: Working PDF processing from Step 4, selected LLM
      Output: Working analysis pipeline with blocking Checkpoint 2 (analysis review/approval)
    prompt_file: "step5_build_analysis_pipeline_prompt.txt"
    on_success: step6_build_output_final_checkpoint

  step6_build_output_final_checkpoint:
    description: |
      Goal: Generate markdown output, implement Checkpoint 3
      Input: Working analysis from Step 5
      Output: Complete workflow with all 3 blocking checkpoints, markdown output generated
    prompt_file: "step6_build_output_final_checkpoint_prompt.txt"
    on_success: step7_run_end_to_end_tests

  step7_run_end_to_end_tests:
    description: |
      Goal: Test complete workflow with 3 search queries, document results
      Input: Complete workflow from Step 6
      Output: 3 completed workflow runs with quality assessment documented
    prompt_file: "step7_run_end_to_end_tests_prompt.txt"
    on_success: step8_evaluate_decide

  step8_evaluate_decide:
    description: |
      Goal: Measure metrics, make Go/No-Go decision, plan next steps
      Input: Test results from Step 7, success criteria from experiment plan
      Output: Experiment report, Phase 1 MVP plan OR pivot decision
    prompt_file: "step8_evaluate_decide_prompt.txt"
    on_success: done

  done:
    description: "The experiment is complete. You now have validation data on whether n8n can handle your research analysis workflow, and a clear decision on how to proceed with Phase 1 MVP implementation or pivot to an alternative approach."
---
