# HydrAID Methodology

This document describes the **methodological approach** used in HydrAID to
construct, validate, and query a semantic Knowledge Graph and to integrate it
with a neurosymbolic Retrieval-Augmented Generation (GraphRAG) pipeline.

The methodology is structured along the main stages of the system lifecycle:
ontology design, data transformation, quality assurance, querying, and
neurosymbolic reasoning.

---

## 1. Ontology Design

### 1.1 Domain Modeling
HydrAID is grounded in a **custom biomedical ontology (Biomarker Evidence Ontology)** designed to
represent multimodal evidence relevant to predictive biomarkers in cancer
immunotherapy.


Ontology development was performed iteratively, following the LOT methodology, incorporating **domain expert
feedback** to ensure conceptual validity and clinical relevance.

### 1.2 Semantic Alignment
To ensure interoperability, BEO concepts were semantically aligned with
established biomedical vocabularies, including:
- **NCIt (National Cancer Institute Thesaurus)**
- **MeSH (Medical Subject Headings)**

Alignment enables reuse, semantic interoperability, and future integration
with external biomedical Knowledge Graphs.

---

## 2. Data Transformation (CSV → RDF)

### 2.1 Mapping Strategy
Structured biomedical data initially available in CSV format was transformed
into RDF using an **ontology-driven mapping approach**.

Key technologies:
- **YARRRML** for human-readable mapping definitions
- **RML** as the executable mapping language
- **RMLMapper** for execution

Mappings explicitly reference ontology classes and properties, ensuring that
semantic constraints are enforced during transformation.

### 2.2 Execution Pipeline
The transformation pipeline:
1. Reads source CSV files
2. Applies YARRRML/RML mappings
3. Generates RDF triples compliant with the ontology
4. Loads RDF into the triplestore

This process converts heterogeneous tabular data into a **uniform semantic
representation** suitable for graph-based querying and reasoning.

---

## 3. Data Quality and Validation

### 3.1 SHACL Constraints
Semantic data quality is enforced using **SHACL shapes**, which define
constraints over RDF graphs.

SHACL is used to validate:
- required properties
- cardinality constraints
- class membership
- semantic completeness

Validation ensures that only **ontology-compliant data** is loaded into the
Knowledge Graph.

### 3.2 SPARQL-Based Diagnostics
In addition to SHACL, **SPARQL queries** are used for:
- diagnostic checks
- consistency verification
- exploratory inspection of the graph

This dual approach combines declarative constraints with flexible analytical
queries.

---

## 4. Knowledge Graph Storage and Querying

### 4.1 Triplestore
Validated RDF data is stored in a **GraphDB triplestore**, providing:
- efficient storage of RDF triples
- SPARQL query execution
- reasoning support

The Knowledge Graph serves as the **single source of truth** for structured
biomedical knowledge in HydrAID.

### 4.2 Competency Questions
SPARQL queries are designed around **competency questions**, such as:
- identification of biomarkers linked to treatment response
- aggregation of evidence across studies

Competency questions guide both ontology design and query formulation.

---

## 5. Neurosymbolic RAG (GraphRAG)

### 5.1 Discovery Agent (NL to SPARQL)
HydrAID includes a **Discovery Agent** that translates natural-language questions
into ontology-aware SPARQL queries.

The agent:
- interprets user intent
- leverages ontology structure and vocabulary
- generates deterministic SPARQL queries

This step ensures that retrieval is **symbolic and explainable**.

### 5.2 KG-Grounded Retrieval
SPARQL queries are executed against the Knowledge Graph to retrieve
structured evidence.

Unlike text-based RAG approaches, retrieval is performed over **explicit graph
structures**, eliminating ambiguity and reducing hallucination risk.

### 5.3 LLM-Based Synthesis
Retrieved SPARQL results are passed to a Large Language Model (LLM) for
interpretation and synthesis.

The LLM:
- does not invent new facts,
- operates only on retrieved evidence,
- produces natural-language summaries grounded in the graph.

This combination constitutes a **neurosymbolic reasoning pipeline**, where
symbolic retrieval constrains statistical generation.

---

## 6. Traceability and Explainability

A core methodological principle of HydrAID is **end-to-end traceability**.

For every generated answer:
- the originating SPARQL query is known,
- graph entities and relationships are identifiable,
- supporting evidence can be inspected.

This design supports explainability, auditing, and clinical trust, which are
critical requirements in biomedical and healthcare applications.

---

## 7. Methodological Significance

The HydrAID methodology demonstrates that:
- semantic modeling can structure heterogeneous biomedical evidence,
- symbolic constraints improve data quality and reliability,
- neurosymbolic RAG enables trustworthy AI-assisted reasoning.

The approach is extensible to additional data sources, ontologies, and
clinical decision support scenarios.
