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
During the hackathon we worked on use cases ...
