# 🩸 Life Science use-case for federated queries

In these use-cases, participants are requested to efficiently re-write and execute the queries listed below, which uses many data sources, in a federated manner.

The participants will need to answer the queries by retrieving and joining informations from multiple SPARQL endpoints among this **list of endpoints**:

* **WikiPathways**: hosted on Virtuoso at https://sparql.wikipathways.org/sparql
* **KG-hub Covid-kg**: hosted on Blazegraph at http://kg-hub-rdf.berkeleybop.io/blazegraph/sparql
* **Wikidata**: hosted on Blazegraph at https://query.wikidata.org
* **Bioregistry**: hosted using rdflib-endpoint at https://bioregistry.io/sparql
* **Bio2RDF**: datasets available as whole in a Virtuoso at https://bio2rdf.org/sparql

## WikiPathways x BioLink 

*Question:* "For each gene present in the kg-covid-19 endpoint, retrieve the pathways each gene is part of in the WikiPathways endpoint"

In other words: "Get pathways from WikiPathways for Genes in the kg-covid-19 knowledge graph"

Here is an example of a query to run on the WikiPathway endpoint that will retrieve informations about genes in the KG-hub covid KG:

* Retrieve gene labels from WikiPathways (https://www.wikipathways.org/)
* Map gene URIs (note that http is used in WikiPathways, https is used in KG-hub)
* Retrieve pathways in which those genes are present from the KG-hub endpoint (https://github.com/Knowledge-Graph-Hub/kg-covid-19)

The query should look a bit like this when running through the federation engines:

```SPARQL
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX wp:      <http://vocabularies.wikipathways.org/wp#>
PREFIX dc:      <http://purl.org/dc/elements/1.1/>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX foaf:    <http://xmlns.com/foaf/0.1/>
PREFIX xsd:     <http://www.w3.org/2001/XMLSchema#>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX up: <http://purl.uniprot.org/core/>
SELECT DISTINCT ?gene ?geneLabel ?pathway ?pathwayLabel
WHERE {
    ?gene bl:category bl:Gene ;
          rdfs:label ?geneLabel ;
          dct:isPartOf ?pathway .
    ?pathway dc:title ?pathwayLabel .
}
```

It should return ~94 results. 

Genes URI are in the format `http://identifiers.org/ensembl/ENSG00000008710`

Pathways URI are in the format `https://identifiers.org/wikipathways/WP4790_r116413`

<details><summary>Click here to see the solution with regular SPARQL using a <code>SERVICE</code> call</summary>

Run the query below on https://sparql.wikipathways.org/sparql


```SPARQL
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX wp:      <http://vocabularies.wikipathways.org/wp#>
PREFIX dc:      <http://purl.org/dc/elements/1.1/>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX foaf:    <http://xmlns.com/foaf/0.1/>
PREFIX xsd:     <http://www.w3.org/2001/XMLSchema#>
PREFIX bl: <https://w3id.org/biolink/vocab/>
PREFIX up: <http://purl.uniprot.org/core/>
SELECT DISTINCT ?gene ?geneLabel ?pathway ?pathwayLabel
WHERE {
    SERVICE <http://kg-hub-rdf.berkeleybop.io/blazegraph/sparql> {
        SELECT * WHERE {
            ?gene bl:category bl:Gene ;
                rdfs:label ?geneLabel .
        } LIMIT 100
    } 
    BIND(uri(replace(str(?gene), "http://identifiers.org/", "https://identifiers.org/")) as ?geneHttps)
    ?geneHttps dct:isPartOf ?pathway .
    ?pathway dc:title ?pathwayLabel .
}
```

</details>

## WikiPathways x Wikidata

*Question:* From WikiPathways retrieve all genes that are part of the "GPR40 pathway" (https://identifiers.org/wikipathways/WP3958_r117148), and for each of these genes find all known orthologs, and in which taxon those orthologs can be found.

The SPARQL query to WikiPathways should start like this (we let you figure out the rest for Wikidata!):

```SPARQL
PREFIX wp: <http://vocabularies.wikipathways.org/wp#>
SELECT DISTINCT *
WHERE {
  	?ensemblGene a wp:GeneProduct ;
  		dct:isPartOf <https://identifiers.org/wikipathways/WP3958_r117148> .
}
```

You can find an example of a matching gene product with orthologs in this wikidata page: https://www.wikidata.org/wiki/Q14914567

## WikiPathways x Bioregistry x Bio2RDF

*Question:* Get genes from WikiPathways (which have [identifiers.org/ncbigene](http://identifiers.org/ncbigene) URIs), and map them to their HGNC external references in Bio2RDF. Doing so will require to use the Bioregistry SPARQL endpoint to convert the WikiPathways NCBIGene ID to its Bio2RDF equivalent.

<details><summary>Potential example answer here</summary>

Here is an example of a start of a regular federated query to run on https://sparql.wikipathways.org/sparql:

```SPARQL
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wp: <http://vocabularies.wikipathways.org/wp#>
select distinct ?geneProduct ?label ?bio2rdf_ncbigene ?bio2rdf_hgnc where {
  {
    select * where {
      ?miriam_ncbigene a wp:GeneProduct . 
      ?miriam_ncbigene rdfs:label ?label .
    } limit 1
  }
    
  SERVICE <https://bioregistry.io/sparql> {
    ?miriam_ncbigene owl:sameAs ?bio2rdf_ncbigene .
  }
  
  SERVICE <https://bio2rdf.org/sparql> {
    FILTER contains(str(?bio2rdf_ncbigene), "bio2rdf")
    ?bio2rdf_hgnc <http://bio2rdf.org/hgnc_vocabulary:x-ncbigene> ?bio2rdf_ncbigene 
                  
  }
}
```

</details>


## Bio2RDF query

```SPARQL
PREFIX dv: <http://bio2rdf.org/drugbank_vocabulary:>
PREFIX hv: <http://bio2rdf.org/hgnc_vocabulary:>
PREFIX goa: <http://bio2rdf.org/goa_vocabulary:>

SELECT DISTINCT ?drug ?go
{
    ?drug a dv:Drug .
    ?drug dv:target ?t .
    ?t dv:x-hgnc ?x .
    ?x hv:x-uniprot ?uniprot .
    ?uniprot ?p ?go .
    FILTER (?p = goa:process || ?p = goa:component || ?p = goa:function)
}
```
This query retrieves information about drugs and their gene ontology (GO) terms by following the relationships between drugs, targets, and proteins in the different data sources, and using the specified properties and classes to identify and filter the relevant concepts and entities.
This SPARQL query returns results from three Bio2RDF data sources located in a centeralized repository: DrugBank, HGNC (HUGO Gene Nomenclature Committee), and GOA (Gene Ontology Annotation). 

> RDF data sources can be downloaded from Zenodo link: https://zenodo.org/record/3770918#.Y71gq-zMJA1 
