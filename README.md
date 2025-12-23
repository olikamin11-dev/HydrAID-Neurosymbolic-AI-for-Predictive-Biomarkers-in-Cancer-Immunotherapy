# HydrAID – Neurosymbolic AI for Predictive Biomarkers in Cancer Immunotherapy

**HydrAID** is a neurosymbolic AI proof of concept developed in collaboration
with **Roche Information Solutions (RIS)** to support the discovery of
**predictive biomarkers for cancer immunotherapy**, with a strong focus on
**explainability, traceability, and clinical trust**.

The project addresses a key limitation in lung-cancer immunotherapy:
the **low predictive power of isolated biomarkers** and the **fragmentation
of multimodal clinical evidence** across publications, assays, and real-world data.

---

## Motivation
Current biomarker discovery approaches often rely on:
- isolated signals,
- black-box statistical models,
- and limited traceability of supporting evidence.

HydrAID explores an alternative approach by combining:
- **Knowledge Graphs and ontologies** for semantic grounding,
- **SHACL and SPARQL** for data quality and validation,
- **LLMs** for natural-language interaction and synthesis,
resulting in a **neurosymbolic Graph-RAG architecture**.

---

## High-Level Architecture
The HydrAID architecture consists of two tightly integrated layers:

![Architecture overview](assets/architecture_overview.png)

### A) Semantic Database
A semantically grounded biomedical Knowledge Graph built from heterogeneous sources.

### B) Neurosymbolic RAG
An LLM-powered reasoning layer that queries and interprets the KG in a
fully traceable way.

---

## A) Semantic Database Layer

### Ontology-Driven Knowledge Graph
- Custom ontology designed in **OWL**, with **SHACL constraints**
- Modeled with domain-expert input
- Aligned with public biomedical vocabularies:
  **NCIt** and **MeSH**

### ETL: CSV → RDF
- CSV to RDF pipeline implemented using **YARRRML + RMLMapper**
- ETL grounded in the ontology to enforce semantic consistency

![ETL pipeline](assets/etl_pipeline.png)

### Data Quality & Validation
- SHACL shapes used to validate:
  - structural consistency
  - semantic completeness
- SPARQL queries for quality checks and diagnostics

![SHACL validation](assets/shacl_validation.png)

---

## B) Neurosymbolic RAG Layer

### Discovery Agent (NL → SPARQL)
A **Discovery Agent** translates natural-language clinical questions into
ontology-aware SPARQL queries.

- Natural language input
- Ontology-guided query construction
- Deterministic retrieval from the KG

![Discovery Agent – NL to SPARQL](assets/discovery_agent_nl2sparql.png)

### KG-RAG Reasoning
- SPARQL results retrieved from the KG
- LLM interprets and synthesizes results
- Every answer is grounded in explicit graph evidence

![GraphRAG output](assets/graphrag_output.png)

---

## Example Questions
HydrAID supports questions such as:
- *Which multimodal biomarkers are associated with response to immunotherapy in NSCLC?*
- *What evidence supports biomarker X across clinical trials and real-world studies?*
- *Which assays and patient subgroups are involved in reported responses?*

All answers are **traceable to KG entities and relations**.

---

## Technology Stack
- **Graph database:** GraphDB 11.1
- **Semantic platform:** Metaphactory 5.0
- **ETL:** YARRRML, RML, RMLMapper
- **Quality:** SHACL, SPARQL
- **Neurosymbolic RAG:** Metis AI (Metaphactory AI framework)
- **LLM:** OpenAI GPT-5
- **Deployment:** Docker

---

## Reproducibility
This repository provides:
- Ontology and SHACL shapes
- ETL mappings and sample data
- Example SPARQL queries
- Prompt templates and NL→SPARQL examples

Sensitive or proprietary data has been replaced with **minimal illustrative samples**.

---

## Status and Scope
HydrAID was developed as a **proof of concept**, demonstrating how
semantic technologies and LLMs can be combined to enable
**explainable and trustworthy biomarker discovery**.

The architecture is extensible to:
- real-world data (RWD)
- EHR
- clinical trial repositories

---

## Author
Developed by **Oliver Kaminski**  
PharmD, MSc Big Data & Artificial Intelligence  
In collaboration with **Roche Information Solutions**



## Portfolio

This project is part of my professional portfolio:
🔗 https://github.com/olikamin11-dev/Oliver-Kaminsi-Portfolio
