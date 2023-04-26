## E-Learning Use Case ##
Use case description can be found [Here](https://github.com/MaastrichtU-IDS/federatedQueryKG/blob/main/usecaseE-learning.md)
Use case Colab notebook can be found [Here](https://colab.research.google.com/drive/1R9BmNzLidU00yhQVnfr2WF7jL-AaO-15?usp=sharing)

### Resources ###
1. Dataset 1: student-oulad dataset: Contains data about students' activities and demographic information. SPARQL Endpoint: https://student-oulad.khaos.uma.es/sparql
2. Dataset 2: module-oulad dataset: Contains information about courses and assessments. SPARQL Endpoint: https://module-oulad.khaos.uma.es/sparql
3. Ontology (for datasets 1&2): These two RDF repositories are built according to the same OWL ontology. Ontology: https://ontologies.khaos.uma.es/oulad
4. Dataset 3: user-mud dataset: Contains data about students, courses, and enrollments. SPARQL Enpoint: https://user-mud.khaos.uma.es/sparql
5. Dataset 4: assignment-mud dataset: Contains information about assignments and submissions. SPARQL Enpoint: https://assignment-mud.khaos.uma.es/sparql
6. Dataset 5: log-mud dataset: Contains information about the interactions carried out by students on the LMS platform. SPARQL Enpoint: https://log-mud.khaos.uma.es/sparql
7. Ontology for (dataset 3-4): These three RDF repositories are built according to the same OWL ontology. Ontology: https://ontologies.khaos.uma.es/e-lion


### Metaphactory setup

#### Installation in metaphactory

* Setup a metaphactory instance 
- Andreas created an instance from metaphactory AWS cloud directly. You can access the created instance [here](https://ec2-54-221-48-173.compute-1.amazonaws.com/resource/Hackathon) with user/password: user/user
- You can also request a trial from [MetaFacts](https://metaphacts.com/get-started): AWS Cloud version or local Docker container version. 

* Install the virtuoso-wrapper app (Admin -> Apps) and hackathon-results app (Admin -> Apps)
- The virtuoso-wrapper app file and hackathon-results app file are configured by Andreas which are uploaded in this repository 
- Log in to Metaphactory and go to Admin (right top on the page) and choose "App & Storages"
- Click "Upload & Deploy App" and upload the virtuoso-wrapper and hackathon-results files.
- Metaphactory will need to Restart and you can refresh your page after Restart and login again. 

* Import the OULAD ontology (Assets -> Ontologies)
- Go to Assets (Top right on page) and ontologies. Then Click Import.

* Import the E-Lion ontology (Assets -> Ontologies)
- Go to Assets (Top right on page) and ontologies. Then Click Import.

## Description of the setup

* 2 Virtuoso SPARQL endpoints for OULAD
* 3 Virtuoso SPARQL endpoints for MUD
* 1 federation for all endpoints
* ontologies in default repository