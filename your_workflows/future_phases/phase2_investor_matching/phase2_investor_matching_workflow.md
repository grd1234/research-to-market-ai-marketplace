---
name: Phase 2 - Investor Discovery & Matching Workflow
description: Enable investors to discover validated research opportunities and connect with industry partners
initial_state: investor_profile_setup
states:
  investor_profile_setup:
    description: |
      Goal: Create investor profile with investment thesis, portfolio focus, and matching criteria
      Input: Investor registration information, investment preferences, past portfolio
      Output: Structured investor profile ready for matching algorithms
    prompt_file: "step1_investor_profile_setup_prompt.txt"
    on_success: investor_discovery

  investor_discovery:
    description: |
      Goal: Browse marketplace of validated use cases from industry partners
      Input: Investor profile, search filters (industry, stage, funding range)
      Output: Ranked list of matching opportunities with compatibility scores
    prompt_file: "step2_investor_discovery_prompt.txt"
    on_success: opportunity_analysis

  opportunity_analysis:
    description: |
      Goal: Deep dive into selected opportunity with full due diligence data
      Input: Selected use case ID from industry partner workflow
      Output: Comprehensive analysis including research summary, commercial feasibility, partner profile
    prompt_file: "step3_opportunity_analysis_prompt.txt"
    on_success: interest_signal

  interest_signal:
    description: |
      Goal: Investor signals interest and provides investment terms/conditions
      Input: Opportunity ID, investment interest level, proposed terms
      Output: Interest signal sent to industry partner and researcher
    prompt_file: "step4_interest_signal_prompt.txt"
    on_success: connection_facilitation

  connection_facilitation:
    description: |
      Goal: Facilitate introduction between investor, industry partner, and researcher
      Input: All party confirmations, contact preferences
      Output: Scheduled meeting/call, shared workspace created
    prompt_file: "step5_connection_facilitation_prompt.txt"
    on_success: partnership_negotiation

  partnership_negotiation:
    description: |
      Goal: Support terms negotiation with templates and guidance
      Input: Initial terms from all parties
      Output: Draft partnership agreement
    prompt_file: "step6_partnership_negotiation_prompt.txt"
    on_success: deal_closure

  deal_closure:
    description: |
      Goal: Finalize partnership agreement with signatures and payment processing
      Input: Agreed terms, signatures
      Output: Active partnership with tracking dashboard
    prompt_file: "step7_deal_closure_prompt.txt"
    on_success: done

  done:
    description: "Phase 2 workflow complete. Investor has successfully connected with industry partner and researcher."
---
