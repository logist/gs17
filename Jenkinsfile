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
                sh 'cp cache.key /usr/cachesys/mgr/'
                sh '''
                	# add login and password for csession in our installer script
 					echo _SYSTEM >install.scr  && \
 					echo SYS >install.scr  && \
 					echo do \\$system.OBJ.Load\\(\\"$PWD/gs17/gs17/Build.cls\\",\\"ck\\"\\) >>install.scr  && \
                	ccontrol start CACHE && \
                	csession CACHE < install.scr && \
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
