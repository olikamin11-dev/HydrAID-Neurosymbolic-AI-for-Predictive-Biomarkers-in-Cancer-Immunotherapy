# HydrAID – Neurosymbolic AI for Predictive Biomarkers in Cancer Immunotherapy

**HydrAID** is a neurosymbolic AI proof of concept developed in collaboration
with **Roche Information Solutions** to support the discovery of
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
- **SPARQL and semantic constraints** for data quality and consistency,
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
- Custom ontology designed in **OWL**, with semantic constraints
- Modeled with domain-expert input
- Aligned with public biomedical vocabularies:
  **NCIt** and **MeSH**

### ETL: CSV → RDF
- CSV to RDF pipeline implemented using **YARRRML + RMLMapper**
- ETL grounded in the ontology to enforce semantic consistency

![ETL pipeline](assets/etl_pipeline.png)

---

## B) Neurosymbolic RAG Layer

### LLM Integration
The Knowledge Graph is integrated with a Large Language Model through
the **Metaphactory / Metis AI framework**, enabling controlled and
semantically grounded access to structured biomedical knowledge.

![LLM integration](assets/llm_integration.png)

---

### Discovery Agent (Natural Language → SPARQL)
A **Discovery Agent** translates natural-language clinical questions into
ontology-aware SPARQL queries.

- Natural language input
- Ontology-guided query construction
- Deterministic retrieval from the Knowledge Graph

![Discovery Agent – NL to SPARQL](assets/discovery_agent_nl2sparql.png)

---

### KG-RAG Reasoning and Outputs
SPARQL results retrieved from the Knowledge Graph are interpreted and
synthesized by the LLM.  
Each answer is **explicitly grounded in graph evidence**, ensuring
traceability and explainability.

Below are representative examples of **GraphRAG outputs** generated
from different clinical and biomarker-related queries:

**GraphRAG Output 1**  
![GraphRAG output 1](assets/graphrag_output_1.png)

**GraphRAG Output 2**  
![GraphRAG output 2](assets/graphrag_output_2.png)

**GraphRAG Output 3**  
![GraphRAG output 3](assets/graphrag_output_3.png)

**GraphRAG Output 4**  
![GraphRAG output 4](assets/graphrag_output_4.png)

**GraphRAG Output 5**  
![GraphRAG output 5](assets/graphrag_output_5.png)

**GraphRAG Output 6**  
![GraphRAG output 6](assets/graphrag_output_6.png)

**GraphRAG Output 7**  
![GraphRAG output 7](assets/graphrag_output_7.png)

---

## Example Questions
HydrAID supports questions such as:
- *What evidence supports the association between these biomarkers and Pembrolizumab in NSCLC?*
- *Sort the biomarkers of the list by a Quality Score that considers the evidence study design and the number of negative evidence. At the end, explain the quality score you created*
- *Please propose a multimodal biomarker set ( a group of biomarkers form same and different caegories) to predict a positive response to Pembrolizumab in NSCL*

All answers are **traceable to KG entities and relations**.

---

## Technology Stack
- **Graph database:** GraphDB 11.1
- **Semantic platform:** Metaphactory 5.0
- **ETL:** YARRRML, RML, RMLMapper
- **Querying & semantics:** SPARQL, OWL
- **Neurosymbolic RAG:** Metis AI (Metaphactory AI framework)
- **LLM:** OpenAI GPT-5
- **Deployment:** Docker

---

## Reproducibility
This repository provides:
- Ontology and semantic constraints
- ETL mappings and full dataset
- Example SPARQL queries
- Prompt templates and NL to SPARQL examples

---

## Status and Scope
HydrAID was developed as a **proof of concept**, demonstrating how
semantic technologies and LLMs can be combined to enable
**explainable and trustworthy multimodal biomarker discovery**.

The architecture is extensible to:
- real-world data (RWD)
- EHR
- clinical trial repositories

---

## Author
Developed by **Oliver Kaminski**  
PharmD, MSc Big Data & Artificial Intelligence  
In collaboration with **Roche Information Solutions**

---

## Portfolio
This project is part of my professional portfolio:  
🔗 https://github.com/olikamin11-dev/Oliver-Kaminsi-Portfolio


## Quickstart (Local Environment)

HydrAID provides a minimal local environment to run the **Semantic Database layer**
(GraphDB + ETL tooling). Repository creation is performed **manually** in the GraphDB UI.

### 1) Start GraphDB

cd environment
docker compose up -d graphdb

GraphDB UI will be available at:

http://localhost:7200

### 2) Create a GraphDB repository (manual)

In the GraphDB UI:

1. Go to Setup → Repositories → Create new repository
2. Choose GraphDB repository
3. Set an ID (example): hydraid
4. Save

### 3) Load RDF data (manual)

After creating the repository:

1. Select the repository hydraid
2. Go to Import → RDF
3. Upload a Turtle file (example):

kg/sample_rdf/sample_graph.ttl

### 4) Run a demo SPARQL query

In GraphDB UI:

1. Go to SPARQL
2. Open and run queries from:

kg/sparql/demo_queries.sparql

