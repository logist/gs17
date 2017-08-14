pipeline {
    agent {
        docker { 
           image 'docker.iscinternal.com:5000/isc-cache:stable'
           args  '--user root'
        }
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building'
                sh 'whoami'
                sh 'ccontrol start CACHE && ccontrol stop CACHE quietly'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying'
            }
        }
    }
}
