# Use Case: The Federated Shop (FedShop)

This use case simulates an e-commerce scenario with multiple online shops and rating sites.

## Federation
The data of the shops and rating sites resembles the data of the [Berlin SPARQL Benchmark (BSBM)](http://wbsg.informatik.uni-mannheim.de/bizer/berlinsparqlbenchmark/). However, in contrast to BSBM, each shop and each rating site has its own SPARQL endpoint with shop-specific offers for products and site-specific reviews. Yet, the individual shops and rating sites share a standard catalog of products. This catalog consists of 200,000 products, where each federation member uses it own local URIs for these products. To connect these local URIs to the global ones, each federation member provides owl:sameAs statements for its respective local URIs.

We provide two such federations, one with 10 shops and 10 rating sites (FedShop10) and one with 50 shops and 50 rating sites (FedShop50). The addresses of the SPARQL endpoints of these federation members will be provided to the participants of the hackathon. The datasets of the federation members are also available for download in the form of N-Quads files where the graph component of each quad in these files corresponds to one of the federation members:

* ...


## Queries
Following the BSBM idea, the FedShop queries simulate a user navigating the federation of shops as if it was a single shop.

TODO
