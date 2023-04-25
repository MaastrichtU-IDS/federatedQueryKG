Run Query 1
```
java -cp ../jars/HeFQUIN-0.0.1-SNAPSHOT-ServiceClauseBasedSourcePlannerImpl-QueryOptimizerWithoutOptimization.jar se.liu.ida.hefquin.cli.RunQueryWithoutSrcSel --federationDescription=Federation.ttl --query=Query1.rq
```

Run Query 1 by relying on the vocabulary mapping
```
java -cp ../jars/HeFQUIN-0.0.1-SNAPSHOT-ServiceClauseBasedSourcePlannerImpl-QueryOptimizerWithoutOptimization-VocabularyRewriting.jar se.liu.ida.hefquin.cli.RunQueryWithoutSrcSel --federationDescription=FederationWithVocabularyMapping.ttl --query=Query1-VocabularyRewriting.rq
```
