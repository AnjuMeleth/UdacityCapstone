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
            		sh 'echo $PATH'
			sh "aws eks --region us-west-2 update-kubeconfig --name  eksCluster-nIzp7AtrUcIw"
            		sh "pwd"
			sh "kubectl apply -f udacity-capstone.yaml"
       			}
	 	     }	
     		 }
    	   }
     }
}	
