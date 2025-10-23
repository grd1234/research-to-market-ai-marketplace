# Blocking Checkpoint Pattern for n8n

## Pattern Structure

1. **Pre-Checkpoint Node:** Prepare data to show user
2. **Wait Node:** Configure with "On webhook call"
   - This generates unique webhook URL
   - Workflow pauses here
3. **User Action:** User calls webhook with their input (URL params or JSON body)
4. **Post-Checkpoint Node:** Process user's input AND access pre-checkpoint data
5. **Continue:** Workflow proceeds to next steps

---

## Example Configuration

### Wait Node Settings
- **Resume:** "On webhook call"
- **Limit wait time:** Optional (can set to 1 hour or leave unlimited)

### Accessing User Input (after Wait node)
**For URL parameters:**
```
{{ $json.query.decision || $json.decision || $json.body.decision }}
```

**For JSON body:**
```
{{ $json.decision }}
```

### Accessing Pre-Checkpoint State
**Reference previous nodes by name:**
```
{{ $node["Node Name"].json.field_name }}
```

**Example:**
```
{{ $node["Paper Data"].json.paper_id }}
```

---

## Calling Webhooks

### Method 1: Browser URL (Simple)
```
https://your-webhook-url?decision=approved&comments=looks+good
```

### Method 2: curl (Recommended)
```bash
curl -X POST "https://your-webhook-url" \
  -H "Content-Type: application/json" \
  -d '{"decision": "approved", "comments": "Looks good"}'
```

### Method 3: Browser Console (JavaScript)
```javascript
fetch('https://your-webhook-url', {
  method: 'POST',
  headers: {'Content-Type': 'application/json'},
  body: JSON.stringify({decision: 'approved', comments: 'Looks good'})
})
```

---

## State Persistence Tips

- ✅ Use `Set` nodes to explicitly capture important state before checkpoints
- ✅ Name your nodes clearly (e.g., "Paper Data", "Analysis Results")
- ✅ Reference nodes using: `{{ $node["Exact Node Name"].json.field }}`
- ✅ Test state accessibility after checkpoint before building complex workflows
- ✅ Use multiple fallback options for webhook data: `{{ $json.query.field || $json.field || $json.body.field }}`

---

## Tested and Working ✅

- [x] Basic wait behavior (time-based)
- [x] Webhook-based resume
- [x] URL parameter input (`?decision=approved`)
- [x] State persistence across checkpoint
- [x] Accessing pre-checkpoint data in post-checkpoint nodes

**Date Mastered:** 2025-10-22
**Time Spent:** ~1 hour
**Key Learning:** State persists across Wait nodes - can reference any previous node data after resuming

---

## Ready for Production Use

This pattern is ready to use in the research analysis workflow for all 3 checkpoints:
1. **Checkpoint 1:** Review retrieved papers → approve/reject/refine search
2. **Checkpoint 2:** Review analysis results → approve/request changes
3. **Checkpoint 3:** Review final markdown output → approve/regenerate
