pipeline {
    agent any
 /*tools{
    maven 'maven'
   
    } */
  stages {
 
    stage('clean')
            {
                steps
                 { 
	          sh 'mvn clean package'
                 }
		 }
  stage('Build docker image')
		{
			steps
			{
			sh 'docker build -t vijayshegde/mybootapp:2.0.0 .'
		}
		}
	  
	 
	
	
	stage('Push Docker Image'){
       steps
       {
     withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
        sh "docker login -u vijayshegde -p ${dockerHubPwd}"
	     /* 
	     --password-stdin*/
     }
     sh 'docker push vijayshegde/mybootapp:2.0.0'
       }
   }
	  stage('Run Container on Dev Server'){
       steps
       {
     sh 'docker run -p 8091:8080 -d --name Tomcat-server vijayshegde/mybootapp:2.0.0'
     /* sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ec2-user@13.232.40.185 ${dockerRun}"
     } */
	       
   }
}
	    stage('deploy to tomcat')
              {
                  steps
                  {
                       
  withCredentials([usernamePassword(credentialsId: 'tomcat', passwordVariable: 'password', usernameVariable: 'username')])
                      {
   sh 'curl  http://15.206.149.195:8091/manager/text/undeploy?path=/cur -u ${username}:${password}'
   sh 'curl -v -u ${username}:${password} -T target/Spring-app-0.0.1-SNAPSHOT.war http://15.206.149.195:8091/manager/text/deploy?path=/cur'
                      }
		  }
	      }

}
}
