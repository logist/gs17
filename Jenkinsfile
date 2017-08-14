pipeline {
    agent {
        docker { image 'docker.iscinternal.com:5000/isc-cache:stable' }
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building'
                sh 'ccontrol start CACHE && ccontrol stop CACHE'
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
