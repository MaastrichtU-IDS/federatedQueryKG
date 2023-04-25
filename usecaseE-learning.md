# Managing Learning Data through Federated Queries on Knowledge Graphs

## Introduction

In recent years, Learning Management Systems (LMSs) have become increasingly important in online education due to their flexible integration platforms for organizing vast learning resources and establishing effective communication channels between teachers and learners. These online platforms are attracting a growing number of users who continually access, download/upload resources, and interact with each other during their teaching/learning processes. This trend has been accelerated by the outbreak of COVID-19.

In this context, academic institutions are generating large volumes of learning-related data that can be analyzed to support teachers in lesson planning, course and faculty degree planning, and university strategic level administration. However, managing such a significant amount of data, which often comes from multiple heterogeneous sources and with attributes that sometimes reflect semantic inconsistencies, poses an emerging challenge.

## Challenge

The primary aim of this use case is to provide artificial intelligence algorithms with the ability to analyze implicit interaction patterns within LMSs registered by a specific e-learning community. To achieve this, we require federated SPARQL queries to obtain data on student interactions and academic performance efficiently, which can be used to feed predictive models and visualizations.

## Datasets

 - **Open University datasets**
The anonymised Open University Learning Analytics Datasets (OULAD) contain data about courses, students and their interactions with Virtual Learning Environment (VLE) for seven selected courses (called modules). Presentations of courses start in February and October - they are marked by “B” and “J” respectively. This datasets contain data of the interactions of 32,593 students in 22 courses, 10,655,280 log records, 173,913 submissions and 206 assignments. They also consider demographic information, as well as interaction records of the students with the materials and grades, both of the assignments and of the final grade of the course.
OULAD data are stored in two different RDF repositories. 
   1. student-oulad dataset: Contains data about students' activities and demographic information.

      SPARQL Endpoint: https://student-oulad.khaos.uma.es/sparql
   2. module-oulad dataset: Contains information about courses and assessments.

      SPARQL Endpoint: https://module-oulad.khaos.uma.es/sparql
     
  Source files: https://khaos.uma.es/movilidad/oulad/
     
  These two RDF repositories are built according to the same OWL ontology. 
  
  Ontology: https://ontologies.khaos.uma.es/oulad


 - **Malaga University Dataset (MUD)**
The MUD datasets consist of data from the Moodle source dataset of the University of Malaga, specifically regarding the Software Engineering degree. These anonymized data are used for the first time in this study and include information on the interactions carried out by users on this LMS platform. The datasets include data from 8524 students across 93 courses, with 1,235,063 log records, 1342 assignments, and 28,270 submissions. These data will be used to support the study's objectives.
MUD data are stored in three different RDF repositories. 

   1. user-mud dataset: Contains data about students, courses, and enrollments.

      SPARQL Enpoint: https://user-mud.khaos.uma.es/sparql
   2. assignment-mud dataset: Contains information about assignments and submissions. 

      SPARQL Enpoint: https://assignment-mud.khaos.uma.es/sparql
   3. log-mud dataset: Contains information about the interactions carried out by students on the LMS platform.

      SPARQL Enpoint: https://log-mud.khaos.uma.es/sparql
     
  Source files: https://khaos.uma.es/movilidad/mud/
     
  These three RDF repositories are built according to the same OWL ontology.

  Ontology: https://ontologies.khaos.uma.es/e-lion

[Backup of datasets and ontologies](https://uma365-my.sharepoint.com/:f:/g/personal/manuelpaneque_uma_es/ElqOzqf_8AlNpAW9owoo-_wB2o6LkEBvnJ3JnsLg5wwPfQ) 


   
## Analytics case study

The main objective of this study is to train a machine learning algorithm capable of predicting student grades. To do this, we need to generate a dataframe that includes the following features: `user_id`, `course_id`, `diff_days`, `weight_score`, `num_submissions`, and `sum_click`. All students in the OULAD datasets contain this information.  The algorithm must predict the grade of MUD students based on the available data.

## Federated Queries 

We need to define several SPARQL queries to achieve the proposed analytic use case. The following [link](https://colab.research.google.com/drive/1R9BmNzLidU00yhQVnfr2WF7jL-AaO-15?usp=sharing) describes the analytical process to predict the students' grades. You should specify the queries and write them in the corresponding cell.


## Hackathon Worklog 25 April ##
1. Explained the use case and went through the Colab notebook from the use case provider [Link](https://colab.research.google.com/drive/1R9BmNzLidU00yhQVnfr2WF7jL-AaO-15?usp=sharing)
2. Metaphactory temporary installation: https://ec2-54-221-48-173.compute-1.amazonaws.com/ (Login name and password: user / user)
