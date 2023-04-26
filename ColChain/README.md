# Instructions to Run and test Colchain tool

### Download the zip file called 'colchain.zip' from the Google Drive and Unzip the file

### Change the directory
```cd  jetty-base```

### Run this command
```java -jar ../jetty-home/start.jar```

### On your local host submit the config file

### Create a community and upload the dataset

To upload dataset you should notice that a compressed version of dataset with .hdt frmat is needed. for our usecase we first downloaded BIO2RDF from Zenodo and then used HDT tool converter as follows: 

Bio2RDF dataset at Zenodo: https://zenodo.org/record/3770918#.Y71gq-zMJA1 
HDT tools and be downloaded from here: https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/hdt-java/hdt-java-rc2.tgz 

Command for converting file to HDT:

for mac: ```./rdf2hdt.sh <file.nq> <out.hdt>```

for windows: ```./rdf2hdt.bat <file.nq> <out.hdt>```


If you get memory Error, icrease the heap memory by changing from -Xmx1024M to a bigger number in the file “rdf2hdt.sh”


### To use other communities search Community by IP address (for example http://192.168.0.100:8080)


### Participate button will copy the triples and index, Observe will copy only indexes and forward relevant triple patterns to the node (community)
