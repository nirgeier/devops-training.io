/**
*** If we wish to set thenumber of executers we can also do it with Groovy
*** We will add this line to our Dockerfile 
    COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/

And it will use the following content:
*/
import jenkins.model.*

// Set the number of the desired executers
Jenkins.instance.setNumExecutors(0)
