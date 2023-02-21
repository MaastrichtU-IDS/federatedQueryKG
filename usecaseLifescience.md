
In this use case, participants are requested to efficiently re-write and execute the query listed below, which uses many data sources, in federated manner.

```

PREFIX dv: <http://bio2rdf.org/drugbank_vocabulary:>
PREFIX hv: <http://bio2rdf.org/hgnc_vocabulary:>
PREFIX goa: <http://bio2rdf.org/goa_vocabulary:>

SELECT distinct ?drug ?go
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

RDF data sources can be downloaded from Zenodo link: https://zenodo.org/record/3770918#.Y71gq-zMJA1 
