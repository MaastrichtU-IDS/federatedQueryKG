# Use Case: The Federated Shop (FedShop)

This use case simulates an e-commerce scenario with multiple online shops and rating sites.

## Federation
The data of the shops and of the rating sites resembles the data of the [Berlin SPARQL Benchmark (BSBM)](http://wbsg.informatik.uni-mannheim.de/bizer/berlinsparqlbenchmark/). However, in contrast to BSBM, each shop and each rating site has its own SPARQL endpoint with shop-specific offers for products and with site-specific reviews. Yet, the individual shops and rating sites share a standard catalog of products. This catalog consists of 200,000 products, where each federation member uses it own local URIs for these products. To connect these local URIs to the global ones, each federation member provides owl:sameAs statements for its respective local URIs.

We provide two such federations, one with 10 shops and 10 rating sites (FedShop10) and one with 50 shops and 50 rating sites (FedShop50). The addresses of the live SPARQL endpoints of these federation members will be provided to the participants of the hackathon.

The datasets of the federation members are also available for download in the form of a zipped N-Quads file where the graph component of each quad in this file corresponds to one of the federation members. Additionally, we have already imported the data into a Virtuoso triple store and the resulting Virtuoso database file is available for download as well. All of these files can be downloaded from a [shared Google Drive folder](https://drive.google.com/drive/folders/1DCjKJ08SCae09LsrlWKT0n0iQ8DVru6H).

## Queries
Following the BSBM idea, we provide twelve FedShop queries that simulate a user navigating the federation of shops as if it was a single shop. These queries can also be downloaded from the aforementioned shared Google Drive folder. As an example, the first of these queries looks as follows.

```sparql
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX bsbm-inst: <http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/instances/>
PREFIX bsbm: <http://www4.wiwiss.fu-berlin.de/bizer/bsbm/v01/vocabulary/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>

SELECT DISTINCT ?product ?label WHERE {
    ?product rdfs:label ?label .

    ?product rdf:type ?localProductType .
    ?localProductType owl:sameAs bsbm:ProductType464 .

    ?product bsbm:productFeature ?localProductFeature1 .
    ?localProductFeature1 owl:sameAs bsbm:ProductFeature32006 .

    ?product bsbm:productFeature ?localProductFeature2 .
    ?localProductFeature2 owl:sameAs bsbm:ProductFeature23377 .
    ?product bsbm:productPropertyNumeric1 ?value1 .

    FILTER (?value1 > "775"^^xsd:integer)
}
ORDER BY ?product ?label
LIMIT 10
```

## Documentation (with edit right for the duration of Hackthon)
https://docs.google.com/document/d/1yjeehn40P01x4xZnw2UECPXmNxIAXZgrepx79YA6vBo/edit?usp=sharing
