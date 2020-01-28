pipeline {
    agent any
    environment {
 	   registry = "anjurose/udacity-webapp"
    	   registryCredential = 'dockerhubID'
	}	
    stages {
        stage ('Build') {
		steps {
			sh 'echo "Hello World"'
		}
	}
	stage ('Linting') {
		steps {
			sh 'echo "Linting Dockerfile with Hadolint"'
			sh '/bin/hadolint Dockerfile'
		}
	
	}
	stage('Building image') {
      		steps{
                  script {
          		dockerImage = docker.build registry + ":$BUILD_NUMBER"
    		    }	 
     	      }
   	 }
    	stage('Deploy Image') {
      		steps{
        	 script {
          		docker.withRegistry( '', registryCredential ) {
            		dockerImage.push()
			}
		    }	
		}	
           }
	stage('Deploying to k8 cluster'){
	      steps {
       		echo 'Deploying to AWS...'
		dir ('AppDeployment') {
        		withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
            		sh "/var/lib/jenkins/.local/bin/aws eks --region us-west-2 update-kubeconfig --name eksCluster-3gXSF6B73TlS "
            		sh "kubectl apply -f AppDeployment/udacity-capstone.yaml"
            		sh "kubectl get nodes"
            		sh "kubectl get pods"
       			}
	 	     }	
     		 }
    	   }
     }
}	
