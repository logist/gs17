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
                sh 'wget http://kitserver.iscinternal.com/license/cache.key'
                sh 'cp cache.key /usr/cachesys/mgr/"
                sh '''
                	ccontrol start CACHE && \
                	ccontrol stop CACHE quietly
                '''
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
