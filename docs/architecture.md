# HydrAID Architecture

This document describes the **logical and technical architecture** of HydrAID.

The architecture is designed to ensure:
- semantic consistency,
- explainability and traceability,
- modularity and extensibility,
- controlled integration with Large Language Models (LLMs).

---

## Architectural Overview

HydrAID follows a **layered architecture** composed of six main layers,
each with a well-defined responsibility.

The layers are loosely coupled and communicate through explicit semantic
interfaces, enabling independent evolution and reuse.

---

## Layer 1 – Data Sources

The data source layer consists of structured datasets in **CSV format**,
representing curated biomedical evidence relevant to biomarker discovery.

At this stage, the data is **syntactic and heterogeneous**, without
explicit semantic meaning.

---

## Layer 2 – Semantic Layer (Ontology)

The semantic layer is defined by a **custom domain ontology (BEO)**,
modeled in **OWL** and designed with domain expert input.

The ontology:
- defines core biomedical concepts 
- formalizes relationships between these concepts,
- enforces a shared conceptual model across all data sources.

This layer acts as the **semantic contract** of the system.

---

## Layer 3 – Processing Layer (CSV → RDF)

In the processing layer, raw CSV data is transformed into **RDF triples**
according to the ontology.

Key characteristics:
- Mapping definitions implemented using **YARRRML**, compiled to **RML**
- Execution performed via **RMLMapper**
- Ontology-driven mappings ensure semantic consistency by construction

This layer converts heterogeneous tabular data into a **uniform,
machine-interpretable knowledge representation**.

---

## Layer 4 – Storage Layer (Knowledge Graph)

The transformed RDF data is stored in a **triplestore (graph database)**,
implemented using **GraphDB**.

The Knowledge Graph:
- persists ontology-compliant RDF data,
- supports reasoning and inference,
- enables efficient graph traversal and querying.

This layer represents the **single source of truth** for structured
biomedical knowledge within HydrAID.

---

## Layer 5 – Analysis Layer (SPARQL)

The analysis layer provides structured access to the Knowledge Graph
through **SPARQL queries**.

SPARQL is used to:
- retrieve entities and relationships,
- answer competency questions,
- validate semantic constraints,
- and extract evidence for downstream reasoning.

All analytical results remain **explicit, inspectable, and auditable**.

---

## Layer 6 – Access Layer (Neurosymbolic RAG)

The access layer exposes the Knowledge Graph through a
**neurosymbolic Retrieval-Augmented Generation (GraphRAG)** approach.

This layer integrates:
- a **Discovery Agent** that translates natural language questions into
  ontology-aware SPARQL queries,
- a controlled interface between the Knowledge Graph and an LLM,
- an interpretation and synthesis step performed by the LLM.

Crucially:
- the LLM does not hallucinate data,
- all responses are grounded in SPARQL query results,
- traceability to graph entities and relations is preserved.

This layer enables **natural-language access** to structured biomedical
knowledge while maintaining trust and explainability.

---

## Architectural Properties

The HydrAID architecture exhibits the following properties:

- **Explainability:** Every output can be traced back to graph entities
  and explicit evidence.
- **Modularity:** Ontology, ETL, storage, and RAG components can evolve
  independently.
- **Extensibility:** New data sources, ontologies, or reasoning layers
  can be added without redesign.
- **Clinical alignment:** The architecture supports future integration
  with RWD, EHR, and clinical decision support systems.

---

## Architectural Significance

HydrAID demonstrates that a **validated semantic Knowledge Graph** can
transform heterogeneous biomedical literature into **queryable and
auditable knowledge**, enabling explainable biomarker discovery.

The architecture provides a solid foundation for:
- multimodal evidence integration,
- trustworthy AI-assisted reasoning,
- and scalable clinical knowledge applications.
