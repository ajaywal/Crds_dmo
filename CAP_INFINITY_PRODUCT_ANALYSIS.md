# CAP Infinity — Product Analysis: Gaps, Architecture & UI Concepts

> Mainframe Modernization Platform · Deep-Dive Review

---

## 1. What CAP Infinity Does Today

CAP Infinity is an AI-powered mainframe modernization workbench. It ingests COBOL/CICS codebases (via ZIP or GitHub URL), runs Anthropic Claude analysis, and surfaces the results across specialised analytical views.

### Current Feature Set (as-built)

| Category | Features |
|---|---|
| **Import** | GitHub URL clone, ZIP upload, file-tree scan (up to 2,000 files) |
| **Technical Analysis** | Program docs, CRUD matrix, business rules, impact/call graph, tech debt, DDD bounded-context advisor |
| **Process** | Auto-generated swimlane diagrams, functional decomposition, process querying |
| **BA Canvas** | Stakeholder interview workflows, BA reengineering canvas, version snapshots |
| **Migration Packager** | Target platform selection (Guidewire, Salesforce FSC, SAP S/4HANA, Temenos, Oracle FlexCube), field mappings, gap analysis, effort estimates, JSON export |
| **Agent Playground** | Visual DAG flow builder, 20+ agent node types, streaming execution, flow run history |
| **Customer Journey / BIAN Journey** | Journey mapping views |
| **Settings** | API key, model selection, log format |
| **Integrations** | VS Code extension, PowerPoint export, Docker, Electron desktop app |
| **AI** | Streaming SSE responses, cost estimation, chunked analysis for large repos |

See the full product analysis document in the repository for gaps and architecture options.
