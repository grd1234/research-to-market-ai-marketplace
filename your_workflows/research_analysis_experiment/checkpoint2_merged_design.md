# Checkpoint 2: Analysis Review + Validation Checklist (MERGED DESIGN)

**Version:** 2.0 - Merged and Enhanced
**Date:** 2025-10-23
**Status:** CANONICAL - Use this version for implementation

---

## Purpose

Checkpoint 2 serves two critical functions:
1. **Human validation** of AI-generated technical and commercial analyses
2. **Validation checklist completion** based on partner's interest level (from Checkpoint 1)

This checkpoint ensures analysis accuracy while gathering structured validation data required for marketplace listing.

---

## Design Overview

**Input from Checkpoint 1:**
- `interest_level`: monitoring | exploring | pilot_ready | seeking_funding
- `approved_papers`: Array of papers to analyze

**Input from Analysis Pipeline:**
- `technical_analysis`: For each paper (methodology, results, feasibility, etc.)
- `commercial_analysis`: For each paper (TAM/SAM/SOM, costs, viability score, etc.)

**Output to Checkpoint 3:**
- `validated_analyses`: Array of approved analyses
- `validation_checklist_data`: Structured data from completed checklist items
- `checklist_complete`: Boolean (all required items filled)

---

## User Interface Structure

### Section 1: Analysis Review (Top)
Display AI-generated analyses for human validation

### Section 2: Validation Checklist (Middle)
Tiered checklist based on interest level (3/8/12/14 items)

### Section 3: Progress & Decision (Bottom)
Progress indicator and decision controls

---

## Full HTML/JavaScript Implementation

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkpoint 2: Review Analysis & Complete Validation</title>
  <style>
    body { font-family: Arial, sans-serif; max-width: 1200px; margin: 0 auto; padding: 20px; }
    .section { margin: 30px 0; padding: 20px; border: 1px solid #ddd; border-radius: 8px; }
    .analysis-card { border: 1px solid #ccc; padding: 15px; margin: 15px 0; background: #f9f9f9; }
    .progress-bar-container { background: #e0e0e0; height: 30px; border-radius: 15px; overflow: hidden; margin: 15px 0; }
    .progress-bar-fill { background: linear-gradient(90deg, #2C66BD, #4a90e2); height: 100%; transition: width 0.3s; }
    .progress-text { text-align: center; font-weight: bold; line-height: 30px; color: white; }
    fieldset { margin: 20px 0; padding: 15px; border: 2px solid #2C66BD; border-radius: 8px; }
    legend { font-weight: bold; color: #2C66BD; padding: 0 10px; }
    label { display: block; margin: 10px 0; }
    textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
    input[type="text"], select { padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
    .required-indicator { color: red; font-weight: bold; }
    .ai-prefilled { background: #e8f5e9; border-left: 4px solid #4caf50; padding: 10px; margin: 10px 0; }
    .help-text { font-size: 0.9em; color: #666; margin-top: 5px; }
    button { padding: 12px 24px; font-size: 16px; border: none; border-radius: 4px; cursor: pointer; }
    .btn-primary { background: #2C66BD; color: white; }
    .btn-secondary { background: #6c757d; color: white; }
    .alert { padding: 15px; margin: 15px 0; border-radius: 4px; }
    .alert-warning { background: #fff3cd; border: 1px solid #ffc107; }
    .alert-success { background: #d4edda; border: 1px solid #28a745; }
  </style>
</head>
<body>

<h1>Checkpoint 2: Review Analysis & Complete Validation Checklist</h1>

<div class="alert alert-success">
  <strong>Interest Level Selected:</strong> <span id="interest_level_display"></span><br>
  <strong>Required Validation Items:</strong> <span id="required_items_count"></span>
</div>

<!-- ==================== SECTION 1: ANALYSIS REVIEW ==================== -->

<div class="section">
  <h2>📄 Section 1: Review AI-Generated Analyses</h2>
  <p>Please review the technical and commercial analyses below. The AI has analyzed the research papers you approved at Checkpoint 1.</p>

  <div id="analyses_display"></div>

  <label>
    <input type="checkbox" id="analyses_accurate_check" required>
    <strong>I confirm the analyses accurately represent the research papers</strong>
  </label>

  <label>
    <strong>Papers to re-analyze (optional):</strong>
    <input type="text" id="reanalyze_ids" placeholder="e.g., 1, 3">
    <div class="help-text">Enter paper numbers if you want the AI to re-analyze them</div>
  </label>

  <label>
    <strong>Additional context to add (optional):</strong>
    <textarea id="additional_context" rows="3" placeholder="Add any context the AI missed or corrections needed"></textarea>
  </label>
</div>

<!-- ==================== SECTION 2: VALIDATION CHECKLIST ==================== -->

<div class="section">
  <h2>✅ Section 2: Complete Validation Checklist</h2>

  <div class="alert alert-warning">
    <strong>Important:</strong> Based on your <span id="interest_level_name"></span> interest level, you must complete <strong><span id="required_items_count2"></span> validation items</strong> before proceeding.
  </div>

  <!-- Progress Indicator -->
  <div class="progress-bar-container">
    <div class="progress-bar-fill" id="progress_bar">
      <div class="progress-text" id="progress_text">0 / 0 items complete (0%)</div>
    </div>
  </div>

  <!-- Dynamic Checklist (populated by JavaScript based on interest_level) -->
  <form id="checkpoint2_form" action="[WEBHOOK_URL]" method="POST">

    <input type="hidden" name="interest_level" id="interest_level_hidden">
    <input type="hidden" name="analyses_data" id="analyses_data_hidden">
    <input type="hidden" name="checklist_complete" id="checklist_complete_hidden" value="false">

    <div id="validation_checklist">
      <!-- JavaScript will populate this based on interest level -->
    </div>

    <!-- ==================== SECTION 3: DECISION ==================== -->

    <div class="section">
      <h2>🎯 Section 3: Final Decision</h2>

      <div id="completion_status" class="alert" style="display:none;">
        <!-- Populated by JavaScript -->
      </div>

      <fieldset>
        <legend>Choose Action:</legend>

        <label>
          <input type="radio" name="decision" value="approved" required>
          <strong>✓ Complete and Continue</strong> - All items are filled, proceed to Checkpoint 3
        </label><br>

        <label>
          <input type="radio" name="decision" value="save_draft">
          <strong>💾 Save Draft</strong> - Save progress and return later
        </label><br>

        <label>
          <input type="radio" name="decision" value="refine">
          <strong>🔄 Request Refinements</strong> - Re-run analysis with additional context
        </label>
      </fieldset>

      <div style="margin-top: 20px;">
        <button type="button" class="btn-secondary" onclick="validateForm()">Check Completion Status</button>
        <button type="submit" class="btn-primary" onclick="return finalValidation()">Submit Decision</button>
      </div>
    </div>

  </form>
</div>

<script>
// ==================== DATA INITIALIZATION ====================

// Get data from previous checkpoints (passed via n8n state)
const interestLevel = '[INTEREST_LEVEL_FROM_CP1]'; // e.g., 'monitoring', 'exploring', 'pilot_ready', 'seeking_funding'
const analysesData = [ANALYSES_JSON_FROM_PIPELINE]; // Array of analysis objects

// Interest level configuration
const interestLevelConfig = {
  monitoring: {
    name: 'MONITORING',
    description: 'Just bookmarking, no action planned',
    requiredItems: 3,
    color: '#6c757d'
  },
  exploring: {
    name: 'EXPLORING',
    description: 'Serious evaluation, building business case',
    requiredItems: 8,
    color: '#ffc107'
  },
  pilot_ready: {
    name: 'PILOT-READY',
    description: 'Ready to test, resources committed',
    requiredItems: 12,
    color: '#17a2b8'
  },
  seeking_funding: {
    name: 'SEEKING FUNDING',
    description: 'Fully validated, investor-ready',
    requiredItems: 14,
    color: '#28a745'
  }
};

// ==================== DISPLAY INITIALIZATION ====================

window.onload = function() {
  // Set hidden form fields
  document.getElementById('interest_level_hidden').value = interestLevel;
  document.getElementById('analyses_data_hidden').value = JSON.stringify(analysesData);

  // Display interest level info
  const config = interestLevelConfig[interestLevel];
  document.getElementById('interest_level_display').textContent =
    `${config.name} (${config.requiredItems} items) - ${config.description}`;
  document.getElementById('interest_level_name').textContent = config.name;
  document.getElementById('required_items_count').textContent = config.requiredItems;
  document.getElementById('required_items_count2').textContent = config.requiredItems;

  // Display analyses
  displayAnalyses();

  // Generate validation checklist based on interest level
  generateValidationChecklist(interestLevel);

  // Initialize progress tracking
  updateProgress();

  // Add event listeners for all form fields
  attachFieldListeners();
};

// ==================== ANALYSES DISPLAY ====================

function displayAnalyses() {
  const container = document.getElementById('analyses_display');

  container.innerHTML = analysesData.map((analysis, idx) => `
    <div class="analysis-card">
      <h3>${idx + 1}. ${analysis.paper_title}</h3>
      <p><strong>Authors:</strong> ${analysis.authors || 'N/A'}</p>
      <p><strong>PDF:</strong> <a href="${analysis.pdf_url}" target="_blank">View Paper</a></p>

      <h4>Technical Analysis</h4>
      <ul>
        <li><strong>Problem Addressed:</strong> ${analysis.technical_analysis.problem_addressed}</li>
        <li><strong>Methodology:</strong> ${analysis.technical_analysis.methodology}</li>
        <li><strong>Key Results:</strong> ${analysis.technical_analysis.results}</li>
        <li><strong>Technical Feasibility:</strong> ${analysis.technical_analysis.technical_feasibility}</li>
        <li><strong>Scalability:</strong> ${analysis.technical_analysis.scalability}</li>
        <li><strong>Limitations:</strong> ${analysis.technical_analysis.limitations}</li>
      </ul>

      <h4>Commercial Analysis</h4>
      <ul>
        <li><strong>Problem-Solution Fit:</strong> ${analysis.commercial_analysis.problem_solution_fit}</li>
        <li><strong>Target Customers:</strong> ${analysis.commercial_analysis.target_customers || 'N/A'}</li>
        <li><strong>Market Opportunity (TAM/SAM/SOM):</strong> ${analysis.commercial_analysis.market_opportunity}</li>
        <li><strong>Development Cost Estimate:</strong> ${analysis.commercial_analysis.development_cost}</li>
        <li><strong>Regulatory Considerations:</strong> ${analysis.commercial_analysis.regulatory || 'None identified'}</li>
        <li><strong>Commercial Viability Score:</strong> ${analysis.commercial_analysis.commercial_viability_score}/10</li>
      </ul>
    </div>
  `).join('');
}

// ==================== VALIDATION CHECKLIST GENERATION ====================

function generateValidationChecklist(level) {
  const container = document.getElementById('validation_checklist');
  let html = '';

  // MONITORING (3 items)
  if (level === 'monitoring') {
    html += `
      <fieldset>
        <legend>Core Requirements (3 items)</legend>

        <div class="ai-prefilled">
          <label>
            <input type="checkbox" name="item_technical_approach" checked disabled>
            <strong>1. Technical approach clearly described</strong>
            <div class="help-text">✓ AI-generated - Review in Section 1 above</div>
          </label>
        </div>

        <label>
          <strong>2. Business problem identified <span class="required-indicator">*</span></strong>
          <textarea name="item_business_problem" rows="3" required
            placeholder="Describe the specific challenge this research could address (1-2 sentences)"
            onchange="updateProgress()"></textarea>
          <div class="help-text">What real-world problem would this solve?</div>
        </label>

        <div class="ai-prefilled">
          <label>
            <input type="checkbox" name="item_interest_level" checked disabled>
            <strong>3. Interest level declared: MONITORING</strong>
          </label>
        </div>
      </fieldset>
    `;
  }

  // EXPLORING (8 items = All 6 Core + 2 Business)
  else if (level === 'exploring') {
    html += `
      <fieldset>
        <legend>Core Requirements (6 items)</legend>

        <div class="ai-prefilled">
          <label>
            <input type="checkbox" checked disabled>
            <strong>1. Technical approach clearly described</strong>
            <div class="help-text">✓ AI-generated</div>
          </label>
        </div>

        <label>
          <strong>2. Business problem identified <span class="required-indicator">*</span></strong>
          <textarea name="item_business_problem" rows="3" required
            placeholder="Describe the specific challenge this research could address"
            onchange="updateProgress()"></textarea>
        </label>

        <label>
          <input type="checkbox" name="item_partner_confirms_relevance" required onchange="updateProgress()">
          <strong>3. Industry partner confirms relevance <span class="required-indicator">*</span></strong>
          <div class="help-text">Check to confirm: "This is relevant to our business"</div>
        </label>

        <div class="ai-prefilled">
          <label>
            <input type="checkbox" checked disabled>
            <strong>4. Interest level declared: EXPLORING</strong>
          </label>
        </div>

        <label>
          <input type="checkbox" name="item_document_reviewed" required onchange="updateProgress()">
          <strong>5. Document reviewed by partner <span class="required-indicator">*</span></strong>
          <div class="help-text">Check to confirm: "I have reviewed and edited the AI-generated content"</div>
        </label>

        <label>
          <strong>6. IP status documented <span class="required-indicator">*</span></strong>
          <select name="item_ip_status" required onchange="updateProgress()">
            <option value="">-- Select IP Status --</option>
            <option value="published">Published Patent</option>
            <option value="patent_pending">Patent Pending</option>
            <option value="no_patent">No Patent</option>
            <option value="open_source">Open Source</option>
            <option value="unknown">Unknown</option>
          </select>
          <div class="help-text">What is the intellectual property status of this research?</div>
        </label>
      </fieldset>

      <fieldset>
        <legend>Business Analysis (2 items)</legend>

        <label>
          <strong>7. Technical feasibility assessed (1-5 scale) <span class="required-indicator">*</span></strong>
          <select name="item_technical_feasibility" required onchange="updateProgress()">
            <option value="">-- Select Feasibility Level --</option>
            <option value="1">1 - Theoretical concept only</option>
            <option value="2">2 - Early research stage</option>
            <option value="3">3 - Prototype possible</option>
            <option value="4">4 - Near production-ready</option>
            <option value="5">5 - Production-ready</option>
          </select>
          <div class="help-text">How ready is this for implementation?</div>
        </label>

        <label>
          <strong>8. Risk factors documented (minimum 2) <span class="required-indicator">*</span></strong>
          <textarea name="item_risk_factors" rows="4" required
            placeholder="List at least 2 risks: technical, market, regulatory, or implementation risks"
            onchange="updateProgress()"></textarea>
          <div class="help-text">What could go wrong? What are the challenges?</div>
        </label>
      </fieldset>
    `;
  }

  // PILOT-READY (12 items = All 8 from Exploring + 4 more Business + 1 Strategic)
  else if (level === 'pilot_ready') {
    // Include all 8 from Exploring first
    html += generateValidationChecklist('exploring').replace('(6 items)', '(6 items - completed in Exploring level)')
                                                      .replace('(2 items)', '(2 items - completed in Exploring level)');

    html += `
      <fieldset>
        <legend>Additional Business Analysis (4 more items)</legend>

        <label>
          <strong>9. Market size/impact estimated <span class="required-indicator">*</span></strong><br>
          <select name="item_market_size_type" required onchange="updateProgress()">
            <option value="">-- Select Estimation Type --</option>
            <option value="qualitative">Qualitative (Small/Medium/Large)</option>
            <option value="quantitative">Quantitative (TAM/SAM/SOM)</option>
          </select>
          <textarea name="item_market_size" rows="3" required
            placeholder="Estimate potential revenue impact, cost savings, or market opportunity"
            onchange="updateProgress()"></textarea>
          <div class="help-text">What's the market potential?</div>
        </label>

        <label>
          <strong>10. Implementation timeline estimated <span class="required-indicator">*</span></strong><br>
          Pilot/POC: <input type="text" name="item_timeline_pilot" required placeholder="e.g., 3-6 months" onchange="updateProgress()"><br>
          MVP: <input type="text" name="item_timeline_mvp" required placeholder="e.g., 6-12 months" onchange="updateProgress()"><br>
          Production/Scale: <input type="text" name="item_timeline_production" required placeholder="e.g., 12-24 months" onchange="updateProgress()">
          <div class="help-text">Realistic timelines for each stage</div>
        </label>

        <label>
          <strong>11. Resource requirements & budget range estimated <span class="required-indicator">*</span></strong><br>
          Pilot budget: $<input type="text" name="item_budget_pilot" required placeholder="e.g., 50K-100K" onchange="updateProgress()"><br>
          MVP budget: $<input type="text" name="item_budget_mvp" required placeholder="e.g., 200K-500K" onchange="updateProgress()"><br>
          Production budget: $<input type="text" name="item_budget_production" required placeholder="e.g., 1M-3M" onchange="updateProgress()"><br>
          Team size needed: <input type="text" name="item_team_size" required placeholder="e.g., 5-8 people" onchange="updateProgress()">
          <div class="help-text">Budget ranges and resource needs</div>
        </label>

        <label>
          <strong>12. Resource requirements detailed <span class="required-indicator">*</span></strong>
          <textarea name="item_resource_details" rows="3" required
            placeholder="Team specializations (ML engineers, domain experts), infrastructure (compute, data), external dependencies"
            onchange="updateProgress()"></textarea>
          <div class="help-text">What specific resources are needed?</div>
        </label>
      </fieldset>

      <fieldset>
        <legend>Strategic Assessment (1 item)</legend>

        <label>
          <strong>13. Regulatory/compliance considerations noted <span class="required-indicator">*</span></strong>
          <textarea name="item_regulatory" rows="3" required
            placeholder="Any relevant regulations, certifications, or compliance requirements (e.g., FDA, GDPR, industry standards)"
            onchange="updateProgress()"></textarea>
          <div class="help-text">What regulatory hurdles exist?</div>
        </label>
      </fieldset>
    `;
  }

  // SEEKING FUNDING (14 items = All 12 from Pilot-Ready + 2 more Strategic)
  else if (level === 'seeking_funding') {
    // Include all 12 from Pilot-Ready
    html += generateValidationChecklist('pilot_ready').replace('Strategic Assessment (1 item)', 'Strategic Assessment (1 item - completed in Pilot-Ready level)');

    html += `
      <fieldset>
        <legend>Additional Strategic Assessment (2 more items) - INVESTOR-READY</legend>

        <div class="alert alert-success">
          <strong>🎯 INVESTOR MARKETPLACE READY:</strong> Completing all 14 items makes this use case visible to Phase 2 investors.
        </div>

        <label>
          <strong>14. Competitive alternatives evaluated (minimum 2) <span class="required-indicator">*</span></strong>
          <textarea name="item_competitive_alternatives" rows="4" required
            placeholder="List at least 2 existing solutions or approaches currently used. Explain why the research-based approach is better."
            onchange="updateProgress()"></textarea>
          <div class="help-text">What are users doing now? Why is this better?</div>
        </label>

        <label>
          <strong>15. Success metrics defined (minimum 3 KPIs) <span class="required-indicator">*</span></strong>
          <textarea name="item_success_metrics" rows="4" required
            placeholder="How would success be measured if implemented? List at least 3 KPIs (e.g., cost reduction %, time savings, accuracy improvement)"
            onchange="updateProgress()"></textarea>
          <div class="help-text">How will you measure success?</div>
        </label>
      </fieldset>
    `;
  }

  container.innerHTML = html;
}

// ==================== PROGRESS TRACKING ====================

function attachFieldListeners() {
  const form = document.getElementById('checkpoint2_form');
  const fields = form.querySelectorAll('input, select, textarea');
  fields.forEach(field => {
    if (!field.hasAttribute('disabled')) {
      field.addEventListener('change', updateProgress);
      field.addEventListener('input', updateProgress);
    }
  });
}

function updateProgress() {
  const config = interestLevelConfig[interestLevel];
  const requiredCount = config.requiredItems;

  // Count completed items
  const form = document.getElementById('checkpoint2_form');
  const requiredFields = form.querySelectorAll('[required]:not([disabled])');

  let completedCount = 0;
  requiredFields.forEach(field => {
    if (field.type === 'checkbox') {
      if (field.checked) completedCount++;
    } else if (field.type === 'radio') {
      const name = field.name;
      if (form.querySelector(`input[name="${name}"]:checked`)) {
        // Only count once per radio group
        const alreadyCounted = Array.from(requiredFields).slice(0, Array.from(requiredFields).indexOf(field))
          .some(f => f.type === 'radio' && f.name === name);
        if (!alreadyCounted) completedCount++;
      }
    } else if (field.value.trim() !== '') {
      completedCount++;
    }
  });

  // Add AI-prefilled items (always complete)
  const aiPrefilledCount = interestLevel === 'monitoring' ? 2 :
                          interestLevel === 'exploring' ? 2 :
                          interestLevel === 'pilot_ready' ? 2 :
                          2; // All levels have 2 AI-prefilled items

  const totalCompleted = completedCount + aiPrefilledCount;
  const percentage = Math.round((totalCompleted / requiredCount) * 100);

  // Update progress bar
  const progressBar = document.getElementById('progress_bar');
  const progressText = document.getElementById('progress_text');
  progressBar.style.width = percentage + '%';
  progressText.textContent = `${totalCompleted} / ${requiredCount} items complete (${percentage}%)`;

  // Update completion status
  const statusDiv = document.getElementById('completion_status');
  if (totalCompleted >= requiredCount) {
    statusDiv.className = 'alert alert-success';
    statusDiv.style.display = 'block';
    statusDiv.innerHTML = '<strong>✓ All required items complete!</strong> You can now proceed to Checkpoint 3.';
    document.getElementById('checklist_complete_hidden').value = 'true';
  } else {
    statusDiv.className = 'alert alert-warning';
    statusDiv.style.display = 'block';
    const remaining = requiredCount - totalCompleted;
    statusDiv.innerHTML = `<strong>⚠ ${remaining} more item(s) needed</strong> to complete ${interestLevelConfig[interestLevel].name} level validation.`;
    document.getElementById('checklist_complete_hidden').value = 'false';
  }
}

// ==================== VALIDATION ====================

function validateForm() {
  updateProgress();
  const config = interestLevelConfig[interestLevel];
  const complete = document.getElementById('checklist_complete_hidden').value === 'true';

  if (complete) {
    alert(`✓ All ${config.requiredItems} required items are complete!\n\nYou can proceed to Checkpoint 3.`);
  } else {
    alert(`⚠ Checklist incomplete\n\nYou still need to complete more items for ${config.name} level.\n\nCheck the progress bar above for details.`);
  }
}

function finalValidation() {
  const decision = document.querySelector('input[name="decision"]:checked');

  if (!decision) {
    alert('Please select a decision (Complete and Continue, Save Draft, or Request Refinements)');
    return false;
  }

  // Check analyses accuracy confirmation
  const analysesAccurate = document.getElementById('analyses_accurate_check').checked;
  if (!analysesAccurate && decision.value === 'approved') {
    alert('Please confirm that the analyses accurately represent the research papers before proceeding.');
    return false;
  }

  // If user selected "Complete and Continue", verify checklist is complete
  if (decision.value === 'approved') {
    const complete = document.getElementById('checklist_complete_hidden').value === 'true';
    if (!complete) {
      const config = interestLevelConfig[interestLevel];
      const confirmProceed = confirm(
        `⚠ Checklist Incomplete\n\n` +
        `You have not completed all ${config.requiredItems} required items for ${config.name} level.\n\n` +
        `You can:\n` +
        `- Select "Save Draft" to save progress and return later\n` +
        `- Complete the remaining items now\n\n` +
        `Do you want to save as draft instead?`
      );

      if (confirmProceed) {
        document.querySelector('input[name="decision"][value="save_draft"]').checked = true;
      } else {
        return false;
      }
    }
  }

  return true;
}

</script>

</body>
</html>
```

---

## n8n Workflow Implementation

### Workflow Nodes After Analysis Pipeline

**1. Set Node: Prepare Checkpoint 2 Data**
```javascript
{
  "checkpoint_name": "Checkpoint 2: Analysis Review & Validation Checklist",
  "interest_level": "{{ $('Checkpoint 1').item.json.interest_level }}",
  "analyses": "{{ JSON.stringify($json) }}",
  "webhook_url": "{{ $execution.webhookUrl }}"
}
```

**2. Wait Node: Block for User Input**
- Resume: "On webhook call"
- Options:
  - Limit: "Timeout after" → 7 days (allow draft saving)
  - Save webhook URL to state

**3. Code Node: Process Checkpoint 2 Response**
```javascript
// Get webhook response
const response = $input.all()[0].json;

const decision = response.decision;
const interest_level = response.interest_level;
const checklist_complete = response.checklist_complete === 'true';

// Validation checklist data
const validationData = {
  business_problem: response.item_business_problem || '',
  partner_confirms_relevance: response.item_partner_confirms_relevance === 'on',
  ip_status: response.item_ip_status || '',
  technical_feasibility: response.item_technical_feasibility || '',
  risk_factors: response.item_risk_factors || '',
  market_size: response.item_market_size || '',
  timeline: {
    pilot: response.item_timeline_pilot || '',
    mvp: response.item_timeline_mvp || '',
    production: response.item_timeline_production || ''
  },
  budget: {
    pilot: response.item_budget_pilot || '',
    mvp: response.item_budget_mvp || '',
    production: response.item_budget_production || ''
  },
  team_size: response.item_team_size || '',
  regulatory: response.item_regulatory || '',
  competitive_alternatives: response.item_competitive_alternatives || '',
  success_metrics: response.item_success_metrics || ''
};

return {
  decision: decision,
  interest_level: interest_level,
  checklist_complete: checklist_complete,
  validation_data: validationData,
  analyses: response.analyses_data,
  reanalyze_ids: response.reanalyze_ids || '',
  additional_context: response.additional_context || ''
};
```

**4. Switch Node: Route Based on Decision**
- Route 1: `decision === "approved"` → Continue to Checkpoint 3
- Route 2: `decision === "save_draft"` → Save state, end workflow
- Route 3: `decision === "refine"` → Loop back to analysis with additional_context

---

## Key Features

### ✅ Tiered Validation System
- 3 items (Monitoring)
- 8 items (Exploring)
- 12 items (Pilot-Ready)
- 14 items (Seeking Funding)

### ✅ AI Pre-filling
- Technical approach automatically marked complete
- Interest level automatically set from Checkpoint 1
- Reduces manual data entry

### ✅ Progress Tracking
- Real-time progress bar
- Shows X/Y items complete with percentage
- Visual feedback as user fills form

### ✅ Draft Saving
- Users can save incomplete forms
- Return later to complete
- Reduces pressure to finish in one session

### ✅ Validation Logic
- Blocks "Complete and Continue" if items incomplete
- Prompts user to save draft instead
- Ensures data quality

### ✅ Help Text
- Every field has explanatory help text
- Examples provided for complex fields
- Reduces confusion

---

## Testing Checklist

Before moving to production, test:

- [ ] All 4 interest levels display correct number of items
- [ ] Progress bar updates in real-time as fields are filled
- [ ] "Check Completion Status" button shows accurate feedback
- [ ] Cannot submit "Complete and Continue" without all required fields
- [ ] "Save Draft" works at any completion level
- [ ] Webhook receives all form data correctly
- [ ] State persists after checkpoint (interest_level, validation_data available in next step)
- [ ] Analyses display correctly in Section 1
- [ ] AI-prefilled items are marked and disabled
- [ ] Help text is clear and useful

---

## Next Steps

After Checkpoint 2:
1. **If decision = "approved":** Proceed to Checkpoint 3 with validated analyses and checklist data
2. **If decision = "save_draft":** Save workflow state, send notification email with resume link
3. **If decision = "refine":** Re-run analysis pipeline with `additional_context`, loop back to Checkpoint 2

---

**Status:** Ready for implementation in Step 5 of experiment workflow ✅
