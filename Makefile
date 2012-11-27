#Makefile for wfdb-java-applications

#Output Settings (defined in build.xml)
JAR_DIR := ./build/jar/
JAR_NAME :=  $(JAR_DIR)wfdbapp.jar

#Java Tools
JAVA := /usr/bin/java
BUILDFILE_DIR := /home/ikaro/workspace/wfdb-java-app/build.xml
ECLIPSEPATH := /lib64/eclipse/plugins/
ANTPATH := org.eclipse.ant.core.antRunner
EQUINOXPATH := $(ECLIPSEPATH)org.eclipse.equinox.launcher_1.3.0.v20120522-1813.jar
JARFLAGS := -jar		\
		  $(EQUINOXPATH)		\
		  -application $(ANTPATH)	\
		  -buildfile $(BUILDFILE_DIR)


#Tests 
JTEST := java -cp $(JAR_NAME)
TEST_PHYSIONETDB := $(JTEST) org.physionet.wfdb.physiobank.PhysioNetDB
TEST_RDSAMP := $(JTEST) org.physionet.wfdb.examples.RdsampEx1

#compile the source
.PHONY: jar
jar: 
	$(JAVA) $(JARFLAGS) 	
	
test: jar
	$(TEST_RDSAMP) 
	
		