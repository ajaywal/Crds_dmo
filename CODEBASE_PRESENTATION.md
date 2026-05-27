# CAP Infinity — Codebase Presentation
### COBOL/CICS Analysis & Packager · Mainframe Modernization Platform

---

## What Is This Project?

**AWSCards** hosts two tightly coupled products:

| Product | Role |
|---------|------|
| **CardDemo** | A realistic COBOL/CICS credit-card management system that simulates mainframe operations |
| **CAP Infinity** | An AI-powered analysis & transformation platform that reads that (or any) mainframe code and produces modernization artefacts |

The platform bridges **legacy mainframe systems** with **modern cloud-native architectures** (Spring Boot, Kubernetes, microservices) through Domain-Driven Design (DDD) bounded-context analysis.

---

## Repository Layout

```
AWSCards/
├── server.js                    ← Express backend (~1,300 lines)
├── routes/                      ← API route handlers
├── cap-infinity-react/          ← React 18 + TypeScript SPA
├── db/                          ← Database layer
├── electron/                    ← Desktop app wrapper
├── app/                         ← CardDemo mainframe source
├── scripts/                     ← Analysis & utility scripts
├── vscode-extension/            ← VS Code plugin
├── docs/                        ← Architecture & cost guides
└── Dockerfile / docker-compose.yml
```

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────┐
│                    User Interface                    │
│         React 18 + TypeScript + Vite SPA            │
└───────────────────┬─────────────────────────────────┘
                     │ REST + Server-Sent Events
┌───────────────────▼─────────────────────────────────┐
│                Express.js Backend                    │
│   Upload → Scan → Analyze (Claude API) → Store      │
└──────┬──────────────────────────┬───────────────────┘
       │                          │
┌──────▼──────┐          ┌────────▼───────┐
│ PostgreSQL  │          │  Claude (AI)   │
│  (server)   │          │  Streaming LLM │
└─────────────┘          └────────────────┘
```

---

## Core User Workflow

1. **LOGIN** → Authenticate with JWT (roles: admin, architect, analyst, developer)
2. **IMPORT** → Upload ZIP or paste GitHub URL
3. **SCAN** → Backend walks file tree (up to 2,000 files)
4. **ANALYZE** → User selects analysis type → Claude API streams response
5. **VISUALIZE** → Results rendered across specialised views
6. **MIGRATE** → Select target platform → map fields → gap analysis
7. **EXPORT** → JSON package or generated Java artefacts

---

## Frontend Views

| View | What It Does |
|------|-------------|
| **Login** | JWT authentication with role-based redirect |
| **Dashboard** | App stats, quick-start wizard, recent sessions |
| **Technical** | Program docs, CRUD matrix, business rules, impact graph, tech debt, DDD transform |
| **Process** | Auto-generated swimlane diagrams, functional decomposition |
| **BA Canvas** | Full reengineering workflow |
| **BIAN Journey** | BIAN process journey view with hierarchy |
| **Migration** | Target platform selection, field-level mappings, gap analysis |
| **TCO Calculator** | Mainframe vs AWS cloud total-cost-of-ownership analysis |
| **Agents** | Visual flow builder for custom agentic pipelines |

See the full codebase presentation document in the repository for complete details.
