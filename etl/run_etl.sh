yarrrml-parser -i csv_to_rdf.yml -o csv_to_rdf.yml.rml.ttl
java -jar rmlmapper.jar -m csv_to_rdf.yml.rml.ttl > HydraAIDKG.ttl
