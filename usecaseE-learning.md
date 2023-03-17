
# Managing Learning Data through Federated Queries on Knowledge Graphs

## Introduction

In recent years, Learning Management Systems (LMSs) have become increasingly important in online education due to their flexible integration platforms for organizing vast learning resources and establishing effective communication channels between teachers and learners. These online platforms are attracting a growing number of users who continually access, download/upload resources, and interact with each other during their teaching/learning processes. This trend has been accelerated by the outbreak of COVID-19.

In this context, academic institutions are generating large volumes of learning-related data that can be analyzed to support teachers in lesson planning, course and faculty degree planning, and university strategic level administration. However, managing such a significant amount of data, which often comes from multiple heterogeneous sources and with attributes that sometimes reflect semantic inconsistencies, poses an emerging challenge.

## Challenge

The primary aim of this use case is to provide artificial intelligence algorithms with the ability to analyze implicit interaction patterns within LMSs registered by a specific e-learning community. To achieve this, we require federated SPARQL queries to obtain data on student interactions and academic performance efficiently, which can be used to feed predictive models and visualizations.

## Datasets

 1. **Open University dataset**
The anonymised Open University Learning Analytics Dataset (OULAD) contains data about courses, students and their interactions with Virtual Learning Environment (VLE) for seven selected courses (called modules). Presentations of courses start in February and October - they are marked by “B” and “J” respectively. This dataset contains data of the interactions of 32,593 students in 22 courses, 10,655,280 log records, 173,913 submissions and 206 assignments. It also considers demographic information, as well as interaction records of the students with the materials and grades, both of the assignments and of the final grade of the course.
**Ontology**: https://khaos.uma.es/movilidad/oulad/oulad.owl
**SPARQL Endpoint**: https://oulad.khaos.uma.es/sparql
**Source files**: https://khaos.uma.es/movilidad/oulad/

2. **Malaga University Dataset (MUD)**
The MUD dataset consists of data from the Moodle source dataset of the University of Malaga, specifically regarding the Software Engineering degree. These anonymized data are used for the first time in this study and include information on the interactions carried out by users on this LMS platform. The dataset includes data from 8524 students across 93 courses, with 1,235,063 log records, 1342 assignments, and 28,270 submissions. These data will be used to support the study's objectives.
**Ontology**: https://ontologies.khaos.uma.es/e-lion
**SPARQL Enpoint**: https://mud.khaos.uma.es/sparql
**Source files**: https://khaos.uma.es/movilidad/mud/

## Queries to be solve

1.  Number of clicks by couseid and userid.
    
2.  Courses and number of students.
    
3.  Calculate number of submissions by couseid and userid.
    
## Analytics case study

The main objective of this study is to train a machine learning algorithm capable of predicting student grades. To do this, we need to generate a dataframe that includes the following features: `userid`, `courseid`, `diff_days`, `weight_score`, `count_sub`, and `sum_click`. While all students in the OULAD dataset contain this information, only a select number of students in the MUD dataset have information on their grades. The algorithm must predict the final grade for these students based on the available data.

