# Use of HeFQUIN during the Hackathon

This directory and its subdirectories contain descriptions, artifacts, and reflections related to our achievements with [HeFQUIN](https://github.com/LiUSemWeb/HeFQUIN/) during the hackathon.

## About HeFQUIN
__Aims.__ HeFQUIN is a query federation engine designed to execute SPARQL queries over _heterogeneous federations_ of knowledge graphs. More precisely, the federations considered by HeFQUIN may be heterogeneous in terms of
1. data access interfaces (i.e., going beyond federations of only SPARQL endpoints),
2. vocabularies/ontologies being used in the knowledge graphs of the federation members, and
3. even the graph data models being used for the knowledge graphs (i.e., going beyond federations of only RDF-based knowledge graphs).

__Code and License.__ HeFQUIN is free and open source software under the Apache 2 license. The source code of HeFQUIN is written in Java based on the [Apache Jena](https://jena.apache.org/) framework, and it is available in the following github repository: https://github.com/LiUSemWeb/HeFQUIN/

__Status.__ HeFQUIN is still under development. At the point of the hackathon, HeFQUIN supports heterogeneous federations with federation members that provide either a [SPARQL endpoint interface](http://www.w3.org/TR/sparql11-protocol/), a [TPF interface](https://linkeddatafragments.org/specification/triple-pattern-fragments/), or a [brTPF interface](http://olafhartig.de/brTPF-ODBASE2016/). Additionally, support for [GraphQL endpoints](https://graphql.org/) and [openCypher Property Graphs](https://opencypher.org/) is already implemented, but not yet properly integrated into the query optimization component of HeFQUIN. Similarly, support for vocabulary mappings is already implemented but also not yet considered properly during query optimization. HeFQUIN supports all features of the SPARQL query language, where the fragment of SPARQL consisting of basic graph patterns (BGPs), FILTER, UNION, and OPTIONAL is supported natively by the query engine itself and the rest of SPARQL is supported through the integration of HeFQUIN with Apache Jena. HeFQUIN does not yet have a proper source selection component, which means that queries given to HeFQUIN need to use SERVICE clauses to assign the various subqueries to the relevant federation members. 

# Achievements
During the hackathon we worked on two of the three use cases, namely the [life-science use case](https://github.com/MaastrichtU-IDS/federatedQueryKG/blob/main/usecaseLifescience.md) and the [e-learning use case](https://github.com/MaastrichtU-IDS/federatedQueryKG/blob/main/usecaseE-learning.md). The respective artifacts created in this context and instructions on how to run the tested use case queries can be found in the corresponding subdirectories ([./LifeScienceUseCase](https://github.com/MaastrichtU-IDS/federatedQueryKG/tree/main/HeFQUIN/LifeScienceUseCase) and [./ELearningUseCase](https://github.com/MaastrichtU-IDS/federatedQueryKG/tree/main/HeFQUIN/ELearningUseCase)).

While working on the use cases, we discovered the following bugs in HeFQUIN and managed to fix most of them right away.
* Error in merging multiple endpoints for filter ([issue #6](https://github.com/MaastrichtU-IDS/federatedQueryKG/issues/6)) - status: fixed by PR [HeFQUIN#290](https://github.com/LiUSemWeb/HeFQUIN/pull/290)
* Error in filter on merging results ([issue #7](https://github.com/MaastrichtU-IDS/federatedQueryKG/issues/7)) - status: fixed by PR [HeFQUIN#290](https://github.com/LiUSemWeb/HeFQUIN/pull/290)
* Error due to property path pattern within SERVICE clause ([issue #8](https://github.com/MaastrichtU-IDS/federatedQueryKG/issues/8)) - status: fixed by PR [HeFQUIN#290](https://github.com/LiUSemWeb/HeFQUIN/pull/290)
* No support for BIND in between SERVICE clauses ([issue #9](https://github.com/MaastrichtU-IDS/federatedQueryKG/issues/9)) - status: PR ready for review ([HeFQUIN#291](https://github.com/LiUSemWeb/HeFQUIN/pull/291))
* Issue with calling mapping service ([issue #10](https://github.com/MaastrichtU-IDS/federatedQueryKG/issues/10)) - status: identified as an [issue of the mapping service](https://github.com/biopragmatics/bioregistry/issues/804) and not of HeFQUIN
* Vocabulary mapping based rewriting of query patterns with FILTER fails - status: fixed (see [commit](https://github.com/LiUSemWeb/HeFQUIN/commit/8efde463ed672dc12c2565541ad468b155a47361))
