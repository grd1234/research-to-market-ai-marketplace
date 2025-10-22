---
name: Phase 3 - Researcher Submission & Matching Workflow
description: Enable researchers to submit innovations and get matched with industry partners and investors
initial_state: researcher_onboarding
states:
  researcher_onboarding:
    description: |
      Goal: Create researcher profile with publication history, research focus, and commercialization goals
      Input: Researcher registration, publication links (ORCID, Google Scholar)
      Output: Validated researcher profile with research portfolio
    prompt_file: "step1_researcher_onboarding_prompt.txt"
    on_success: innovation_submission

  innovation_submission:
    description: |
      Goal: Submit research innovation with commercial potential
      Input: Research paper/innovation description, target applications, IP status
      Output: Structured innovation submission ready for marketplace
    prompt_file: "step2_innovation_submission_prompt.txt"
    on_success: automated_analysis

  automated_analysis:
    description: |
      Goal: AI analyzes research for commercial potential and market fit
      Input: Submitted research paper and metadata
      Output: Commercial viability assessment, potential applications, market opportunity
    prompt_file: "step3_automated_analysis_prompt.txt"
    on_success: researcher_validation

  researcher_validation:
    description: |
      Goal: Researcher reviews and validates AI analysis, adds context
      Input: AI-generated analysis
      Output: Researcher-validated innovation profile
    prompt_file: "step4_researcher_validation_prompt.txt"
    on_success: marketplace_listing

  marketplace_listing:
    description: |
      Goal: Publish innovation to marketplace for partner/investor discovery
      Input: Validated innovation profile
      Output: Active marketplace listing with visibility controls
    prompt_file: "step5_marketplace_listing_prompt.txt"
    on_success: proactive_matching

  proactive_matching:
    description: |
      Goal: AI proactively identifies and suggests matching partners/investors
      Input: Innovation profile, partner/investor database
      Output: Ranked list of potential matches with contact suggestions
    prompt_file: "step6_proactive_matching_prompt.txt"
    on_success: match_outreach

  match_outreach:
    description: |
      Goal: Facilitate outreach to matched partners/investors
      Input: Selected matches, outreach preferences
      Output: Introduction messages sent, interest tracking initiated
    prompt_file: "step7_match_outreach_prompt.txt"
    on_success: partnership_formation

  partnership_formation:
    description: |
      Goal: Support researcher through partnership discussions and agreements
      Input: Partner/investor interest signals
      Output: Partnership agreement with commercialization terms
    prompt_file: "step8_partnership_formation_prompt.txt"
    on_success: commercialization_tracking

  commercialization_tracking:
    description: |
      Goal: Track commercialization progress and measure impact
      Input: Partnership milestones, progress updates
      Output: Impact dashboard showing research-to-market journey
    prompt_file: "step9_commercialization_tracking_prompt.txt"
    on_success: done

  done:
    description: "Phase 3 workflow complete. Researcher innovation is successfully matched and progressing toward commercialization."
---
