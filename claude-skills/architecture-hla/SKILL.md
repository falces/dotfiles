---
name: architecture-hla
description: Create and manage High Level Architecture (HLA) documents. Use when the user wants to document the architecture of a system or project, create or update an HLA, define functional or non-functional requirements, model C4 diagrams (Context, Container), define data models, document deployment requirements, or register architecture decisions linked to an HLA.
---

# High Level Architecture (HLA)

Generate complete, structured HLA documents following the standard template. The goal is to provide a comprehensive architectural view that allows any engineer or stakeholder joining the project to understand the system context, constraints, design decisions, and deployment requirements without needing to read the full requirements document.

## Standard template

```markdown
---
title: "HLA - {Project or System Name}"
version: 1.0
status: Draft | In Review | Approved | Deprecated
date: {YYYY-MM-DD}
---

| VERSION | DATE       | AUTHOR      | REVIEWED BY | STATUS   | CHANGES                  |
| ------- | ---------- | ----------- | ----------- | -------- | ------------------------ |
| 0.1     | YYYY-MM-DD | {name/role} |             | Draft    | Initial version          |
| 1.0     | YYYY-MM-DD | {name/role} | {name/role} | Approved | Approved after review    |

# Introduction

## Overview

{General description of the project, which should at least include:
- High-level functional description (to put it in a functional context without the need to read the RF)
- The current status of the systems involved in the project and which are the target of the architecture
- The motivation behind the project
- The objectives to be achieved}

## Reference documentation

| TITLE | URL  | RELEVANCE | COMMENTS |
| ----- | ---- | --------- | -------- |
|       |      |           |          |

# Non-Functional Requirements

## Design constraints

{List the constraints identified by the architect that may impact the design of the architecture. The motivations for these constraints could arise from:
- Business impositions (indicated in the RF)
- Business policies/strategies
- IT policies/strategies
- Technical constraints with legacy or previous versions of the systems

Each identified constraint will be included in a sub-section (2.1.1, 2.1.2, etc.).}

## Non-Functional business requirements

{List the identified non-functional requirements to be met by the proposed architecture. Include each requirement in a different section, within the typology to which it corresponds (Business or Architecture).}

## Architecture Characteristics

| **CHARACTERISTICS**                    | **PRIORITY (H/M/L)** | **COMMENTS** |
| -------------------------------------- | -------------------- | ------------ |
| **Usability**                          |                      |              |
| **Reliability**                        |                      |              |
| **Availability**                       |                      |              |
| **Compatibility**                      |                      |              |
| **Deployability**                      |                      |              |
| **Elasticity**                         |                      |              |
| **Maintainability**                    |                      |              |
| **Interoperability**                   |                      |              |
| **Fault tolerance and recoverability** |                      |              |
| **Security**                           |                      |              |

# Data Model

## {Database Type (PostgreSQL, SQL Server, MongoDB, ...)}: {Table or View name}

{Describe tables and views involved in the process, including whether they are new, existing, or modified.}

| **NAME** | **TYPE** | **NULLABLE** | **NEW/EXISTING/MODIFIED** | **FUNCTIONALITY** |
| -------- | -------- | ------------ | ------------------------- | ----------------- |
|          |          |              |                           |                   |

{Include an entity-relationship diagram in Mermaid when there are relations between entities:}

erDiagram
    ENTITY_A ||--o{ ENTITY_B : "relationship"

# Static View

## Level 1: Context

### AS-IS

{High-level view of the current environment with interactions with users and external systems. All systems treated as black boxes.}

| SYSTEM | DESCRIPTION |
| ------ | ----------- |
|        |             |

### TO-BE

{High-level view of the future environment with interactions with users and external systems.}

| SYSTEM | DESCRIPTION |
| ------ | ----------- |
|        |             |

## Level 2: Container

### AS-IS

{Decomposition of current systems into containers (applications, data stores, processes). Only systems under analysis are expanded.}

| CONTAINER | TECHNOLOGY | NEW/EXISTING/MODIFIED | DESCRIPTION |
| --------- | ---------- | --------------------- | ----------- |
|           |            |                       |             |

### TO-BE

{Decomposition of future systems into containers.}

| CONTAINER | TECHNOLOGY | NEW/EXISTING/MODIFIED | DESCRIPTION |
| --------- | ---------- | --------------------- | ----------- |
|           |            |                       |             |

# Dynamic View

## {UC-XXX} - {Use case title}

### AS-IS

{UML sequence diagram in Mermaid representing the current flow}

### TO-BE

{UML sequence diagram in Mermaid representing the future flow}

# Technology And Deployment

## API Rest

The APIs in this system must follow the API Rest style guide standards defined in CREATE in this document [TO DO].

The requests should be made to this host, for each environment:

- DEV:
- PRE:
- PRO:

## JSON

All the responses given by any API in this system must be in JSON format. JSON best practices in CREATE are defined in this guide: [TO DO]

## Version Control

This system must have several repositories in Github, which is the version control system hub chosen in CREATE. It is mandatory to follow the CREATE Git convention document: [TO DO].

The repository can be found here: {Github repository URL}

## Confluence

Confluence is a tool that helps to manage documentation.

This system will be fully documented in Confluence. The HLA System document, describing the general architecture of the system, will be inside the Architecture space, with its domain inside it. The work projects will have an HLA Project document, inside each project in Confluence, and will be referenced from the general HLA document.

| NAME | DESCRIPTION |
| ---- | ----------- |
|      |             |

## Deployment Requirements

{Requirements that the architecture mandates for deployment, regardless of the final implementation decisions owned by DevOps.}

| **REQUIREMENT**          | **VALUE / DESCRIPTION**               | **COMMENTS**                      |
| ------------------------ | ------------------------------------- | --------------------------------- |
| High Availability        | Yes / No                              |                                   |
| Min. instances           | {N}                                   | Minimum running instances         |
| Max. instances           | {N}                                   | Upper limit for autoscaling       |
| Target environments      | DEV / PRE / PRO                       |                                   |
| Region / Zone            | {e.g. eu-west-1}                      |                                   |
| Deployment strategy      | Rolling / Blue-Green / Canary         |                                   |
| Expected avg. load       | {req/s or concurrent users}           |                                   |
| Expected peak load       | {req/s or concurrent users}           |                                   |
| Recovery Time Obj. (RTO) | {e.g. < 1h}                           |                                   |
| Recovery Point Obj. (RPO)| {e.g. < 15 min}                       |                                   |
| Data residency           | {country/region constraint if any}    |                                   |
| Network exposure         | Public / Internal / VPN-only          |                                   |
| Special dependencies     | {e.g. specific DB version, GPU, etc.} |                                   |

## Deployment Diagram

{Deployment diagram (C4 model extension or UML) showing components, scalability, and availability layout. Final implementation is owned by DevOps.}

# ADR - Design Decisions And Trade-Offs

{Architecture Decision Records linked to this HLA.}

| **CODE** | **TITLE** | **STATUS** |
| -------- | --------- | ---------- |
|          |           |            |
```

## Usage instructions

- Always start with the version table. If no version is given, start at 0.1 Draft.
- The Overview must answer: what the system does, why this project exists, and what the current state is. Never skip these three points.
- For the Architecture Characteristics table, always ask or infer the priority (H/M/L) — not all characteristics have the same weight on design decisions.
- Data model: always ask whether each table/entity is new, existing, or modified. Include the ER diagram when there are two or more related entities.
- Static View: always include both AS-IS and TO-BE. If the system is entirely new, mark AS-IS as "N/A — new system" and include only TO-BE.
- Level 3 (Component) is out of scope for HLA — it belongs to the LLA document.
- Dynamic View: one subsection per use case. Ask for the use case list if not provided.
- Deployment Requirements: fill in what is architecturally mandated. Mark as TBD any field that requires DevOps input.
- ADR section: reference existing ADRs by code. Do not duplicate ADR content here.
- Keep a technical, direct tone. No marketing language.

## Common HLA scenarios

- New system from scratch
- Extension or modification of an existing system
- System integration or migration
- API exposure of an existing backend
- Data pipeline or event-driven architecture