pipeline {
    agent {
        docker { image 'docker.iscinternal.com:5000/isc-cache:stable' }
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building'
                sh 'sudo ccontrol start CACHE && sudo ccontrol stop CACHE'
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
