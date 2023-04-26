Run Query 1
```
java -cp ../jars/HeFQUIN-0.0.1-SNAPSHOT-ServiceClauseBasedSourcePlannerImpl-QueryOptimizerWithoutOptimization.jar se.liu.ida.hefquin.cli.RunQueryWithoutSrcSel --federationDescription=Federation.ttl --query=Query1.rq
```

Run Query 1 by relying on the vocabulary mapping
```
java -cp ../jars/HeFQUIN-0.0.1-SNAPSHOT-ServiceClauseBasedSourcePlannerImpl-QueryOptimizerWithoutOptimization-VocabularyRewriting.jar se.liu.ida.hefquin.cli.RunQueryWithoutSrcSel --federationDescription=FederationWithVocabularyMapping.ttl --query=Query1-VocabularyRewriting.rq
```

To run Query 1 by using the [Bioregistry service](https://bioregistry.io/sparql) to resolve the change of the IRIs of the genes, HeFQUIN (as well as any other federation engine) needs to use the VALUES-based variant of a bind join. By default, however, HeFQUIN uses the FILTER-based variant (in order to be able to work with older versions of Virtuoso-based SPARQL endpoints that do not support VALUES). This FILTER-based variant cannot be used with the Bioregistry service because that service does not support FILTER clauses (issue filed: https://github.com/biopragmatics/bioregistry/issues/804, and see also https://github.com/MaastrichtU-IDS/federatedQueryKG/issues/10).  I have created another JAR of HeFQUIN in which the VALUES-based variant is used instead of the FILTER-based one. With this JAR, the query can be executed and produces the expected non-empty result. Here is the command to execute the version of the query with that JAR:
```
java -cp ../jars/HeFQUIN-0.0.1-SNAPSHOT-ServiceClauseBasedSourcePlannerImpl-QueryOptimizerWithoutOptimization-ValuesBasedBindJoin.jar se.liu.ida.hefquin.cli.RunQueryWithoutSrcSel --federationDescription=Federation.ttl --query=Query1-SameAsService.rq
```
