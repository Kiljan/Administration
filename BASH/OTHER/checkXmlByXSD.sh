#!/bin/bash

# xmllint == program for xml walidation 
# schema.xsd == xsd schame is treated like a base. Thanks to that xsd file I can check if file lol.xml is correct 
#              (compatible with the xsd template)

xmllint --noout --schema schema.xsd ~/Pobrane/lol.xml
