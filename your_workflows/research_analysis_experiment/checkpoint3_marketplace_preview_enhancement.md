# Checkpoint 3 Enhancement: Marketplace Listing Preview

## IMPORTANT UPDATE

This file supplements `step6_build_output_final_checkpoint_prompt.txt` with the **marketplace listing preview** based on the partner's interest level.

**When building Checkpoint 3, include this marketplace preview to show how the use case will be listed based on interest level.**

---

## Enhanced Checkpoint 3 Form

Add this marketplace listing preview section to Checkpoint 3:

```html
<h2>Checkpoint 3: Final Approval & Marketplace Preview</h2>

<!-- Display generated use case document (keep existing from step6) -->
<div id="use_case_document"></div>

<hr>

<!-- NEW: Marketplace Listing Preview -->
<h3>📍 Marketplace Listing Preview</h3>
<p>Based on your interest level (<strong id="interest_level_display"></strong>), here's how this use case will be listed:</p>

<div id="marketplace_preview" style="border: 2px solid #2C66BD; padding: 20px; margin: 20px 0; background-color: #f0f8ff;">
  <!-- JavaScript will populate this based on interest level -->
</div>

<div id="validation_status" style="padding: 15px; margin: 15px 0;">
  <!-- Shows checklist completion status -->
</div>

<hr>

<form action="[webhook-url]" method="POST">
  <h3>Final Decision</h3>

  <fieldset>
    <legend>Use Case Document:</legend>
    <label>
      <input type="checkbox" name="document_approved" value="yes" required>
      I have reviewed the use case document and it accurately represents the research
    </label>
  </fieldset>

  <fieldset>
    <legend>Validation Checklist:</legend>
    <label>
      <input type="checkbox" name="checklist_complete" id="checklist_complete_checkbox" required>
      All required validation items are complete
    </label>
  </fieldset>

  <fieldset>
    <legend>Marketplace Listing:</legend>
    <label>
      <input type="checkbox" name="marketplace_listing_approved" required>
      I approve listing this use case as shown in the preview above
    </label>
  </fieldset>

  <label>
    <strong>Optional: Change interest level before listing</strong><br>
    <select name="change_interest_level">
      <option value="">-- Keep current level --</option>
      <option value="monitoring">Change to MONITORING</option>
      <option value="exploring">Change to EXPLORING</option>
      <option value="pilot_ready">Change to PILOT-READY</option>
      <option value="seeking_funding">Change to SEEKING FUNDING</option>
    </select>
    <br><small>Note: Changing to a higher level may require additional validation items</small>
  </label>

  <hr>

  <fieldset>
    <legend>Decision:</legend>
    <label>
      <input type="radio" name="decision" value="approved" required> Approve and list in marketplace
    </label><br>
    <label>
      <input type="radio" name="decision" value="edit"> Edit document
    </label><br>
    <label>
      <input type="radio" name="decision" value="regenerate"> Regenerate sections
    </label>
  </fieldset>

  <button type="submit" style="padding: 10px 20px; background-color: #2C66BD; color: white; font-size: 16px;">Submit Final Approval</button>
</form>

<script>
  // Get interest level and validation data from previous checkpoints
  const interestLevel = '[INTEREST_LEVEL_FROM_CP1]';
  const validationData = [VALIDATION_DATA_FROM_CP2];
  const useCaseDocument = [USE_CASE_DOCUMENT_JSON];

  // Display interest level
  const levelNames = {
    monitoring: 'MONITORING (3 items)',
    exploring: 'EXPLORING (8 items)',
    pilot_ready: 'PILOT-READY (12 items)',
    seeking_funding: 'SEEKING FUNDING (14 items - investor-ready)'
  };
  document.getElementById('interest_level_display').textContent = levelNames[interestLevel];

  // Display use case document (keep existing logic from step6)
  document.getElementById('use_case_document').innerHTML = `
    <div style="border: 1px solid #ccc; padding: 20px; background-color: white;">
      <h3>${useCaseDocument.title}</h3>
      <h4>Technical Approach</h4>
      <p>${useCaseDocument.technical_approach}</p>
      <h4>Business Problem</h4>
      <p>${useCaseDocument.business_problem}</p>
      <h4>Commercial Feasibility</h4>
      <p>${useCaseDocument.commercial_feasibility}</p>
      <!-- ... rest of document sections ... -->
    </div>
  `;

  // Generate marketplace preview based on interest level
  const marketplacePreviewHTML = generateMarketplacePreview(interestLevel, validationData);
  document.getElementById('marketplace_preview').innerHTML = marketplacePreviewHTML;

  // Generate validation status
  const validationStatusHTML = generateValidationStatus(interestLevel, validationData);
  document.getElementById('validation_status').innerHTML = validationStatusHTML;

  function generateMarketplacePreview(level, data) {
    if (level === 'monitoring') {
      return `
        <h4 style="color: #666;">🔒 Private Workspace</h4>
        <p><strong>Visibility:</strong> Partner only (you)</p>
        <p><strong>Status:</strong> Saved to your private workspace</p>
        <p><strong>Not listed in marketplace</strong></p>
        <p><strong>Researcher notification:</strong> None (private)</p>
        <hr>
        <p><em>This use case is bookmarked for your reference. It will not be visible to researchers or investors.</em></p>
      `;
    }

    else if (level === 'exploring') {
      return `
        <h4 style="color: #2C66BD;">📊 Internal Listing</h4>
        <p><strong>Visibility:</strong> Partner workspace + Researchers (aggregated signal)</p>
        <p><strong>Status:</strong> Listed internally</p>
        <p><strong>Researcher notification:</strong> "X partners are exploring research in this area"</p>
        <p><strong>NOT visible to investors</strong></p>
        <hr>
        <p><em>Researchers will see aggregated interest signals but not your specific company details. Investors cannot see this listing.</em></p>
      `;
    }

    else if (level === 'pilot_ready') {
      return `
        <h4 style="color: #2C66BD;">🚀 Pilot-Ready Badge</h4>
        <p><strong>Visibility:</strong> Partner workspace + Researchers (direct notification)</p>
        <p><strong>Status:</strong> Listed with "Pilot-Ready" badge</p>
        <p><strong>Researcher notification:</strong> Direct notification with your company profile</p>
        <p><strong>NOT visible to investors</strong> (not seeking external funding)</p>
        <hr>
        <p><em>Original researchers will be directly notified about your pilot interest. Investors cannot see this listing since you're not seeking external funding.</em></p>
      `;
    }

    else if (level === 'seeking_funding') {
      return `
        <div style="background-color: #ffffcc; padding: 15px; border: 3px solid #ffcc00; margin-bottom: 15px;">
          <h4 style="color: #cc6600; margin-top: 0;">💰 INVESTOR-READY LISTING</h4>
          <p><strong>⚠️ This use case will be visible to Phase 2 investors</strong></p>
        </div>

        <p><strong>Visibility:</strong> Partner workspace + Researchers + <strong>INVESTORS</strong></p>
        <p><strong>Status:</strong> Listed in Phase 2 investor marketplace</p>
        <p><strong>Researcher notification:</strong> Direct notification with full opportunity details</p>
        <p><strong>Investor discovery:</strong> Investors can discover, view, and signal interest</p>

        <hr>

        <h5>What investors will see:</h5>
        <ul>
          <li>✅ Complete use case validation document (all 14 items)</li>
          <li>✅ Industry partner profile and interest level</li>
          <li>✅ Commercial feasibility analysis</li>
          <li>✅ Market opportunity and budget estimates</li>
          <li>✅ Technical and strategic assessments</li>
        </ul>

        <p><em><strong>By approving, you confirm this use case is fully validated and ready for investor review.</strong></em></p>
      `;
    }

    return '<p>Unknown interest level</p>';
  }

  function generateValidationStatus(level, data) {
    const requiredItems = {
      monitoring: 3,
      exploring: 8,
      pilot_ready: 12,
      seeking_funding: 14
    };

    const required = requiredItems[level];
    const completed = data.items_completed || 0; // From Checkpoint 2

    const isComplete = completed >= required;
    const statusColor = isComplete ? '#28a745' : '#dc3545';
    const statusText = isComplete ? '✅ Complete' : '❌ Incomplete';

    return `
      <div style="background-color: ${isComplete ? '#d4edda' : '#f8d7da'}; padding: 15px; border: 2px solid ${statusColor};">
        <h4 style="margin-top: 0;">Validation Checklist Status: ${statusText}</h4>
        <p><strong>Required items:</strong> ${required}</p>
        <p><strong>Completed items:</strong> ${completed}</p>
        ${isComplete
          ? '<p style="color: #28a745;"><strong>✅ All required items complete - ready to list</strong></p>'
          : `<p style="color: #dc3545;"><strong>❌ Missing ${required - completed} required items - cannot list until complete</strong></p>`
        }
      </div>
    `;
  }

  // Automatically disable/enable final approval based on validation status
  const validationComplete = validationData.items_completed >= ${getRequiredItems(interestLevel)};
  document.getElementById('checklist_complete_checkbox').disabled = !validationComplete;
  if (!validationComplete) {
    alert('⚠️ Cannot approve - validation checklist is incomplete. Please complete all required items at Checkpoint 2.');
  }

  function getRequiredItems(level) {
    return {
      monitoring: 3,
      exploring: 8,
      pilot_ready: 12,
      seeking_funding: 14
    }[level];
  }
</script>
```

---

## n8n Implementation

### At Checkpoint 3 (Step 6):
1. Read `interest_level` from Checkpoint 1
2. Read `validation_data` from Checkpoint 2
3. Generate marketplace preview based on interest level
4. Validate all required items complete before allowing approval
5. If changing interest level, re-check validation requirements

### After Checkpoint 3:
- If approved: "List" use case with appropriate visibility
- Log marketplace listing with:
  - Interest level
  - Visibility settings
  - Validation items completed
  - Timestamp

---

## Testing Different Interest Levels

### Test 1: Monitoring Level
**Expected:**
- Preview shows "Private Workspace"
- No marketplace visibility
- No researcher/investor notifications
- Quick approval (minimal validation)

### Test 2: Exploring Level
**Expected:**
- Preview shows "Internal Listing"
- Researchers notified (aggregated)
- NOT visible to investors
- Clear messaging about privacy

### Test 3: Pilot-Ready Level
**Expected:**
- Preview shows "Pilot-Ready Badge"
- Researchers directly notified
- NOT visible to investors
- Emphasis on internal funding

### Test 4: Seeking Funding Level
**Expected:**
- Preview shows "INVESTOR-READY" warning
- Lists what investors will see
- Clear investor visibility messaging
- All 14 items validation enforced

---

## Validation Testing

**Test Incomplete Validation:**
1. Select "Seeking Funding" at CP1
2. Skip some items at CP2
3. At CP3: Should block approval with error message
4. Should highlight missing items

**Test Interest Level Change:**
1. Start with "Monitoring" (3 items)
2. At CP3, change to "Seeking Funding"
3. Should warn: "Need 11 more items - return to CP2"
4. Should not allow approval without completion

**Test Successful Listing:**
1. Complete all required items for selected level
2. Approve at CP3
3. Should simulate marketplace listing
4. Should log listing with correct visibility settings

---

## Why This Enhancement Matters

**For Experiment:**
- Tests the marketplace listing logic (critical feature)
- Validates visibility controls work as designed
- Tests partner understanding of interest levels
- Validates that quality gates prevent incomplete listings

**For Problem Definition Alignment:**
- Tests the tiered visibility model
- Proves only "Seeking Funding" reaches investors
- Validates the progressive commitment model

**For User Experience:**
- Partners see exactly what will happen before approving
- Clear visibility into who sees what
- Reduces surprises and builds trust
- Enables informed decision-making

---

**Created:** 2025-10-22
**Purpose:** Enhance Checkpoint 3 with marketplace listing preview
**References:** problem_definition.md (Tiered Validation by Interest Level section)
