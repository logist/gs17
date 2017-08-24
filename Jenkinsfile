node {
    stage "Prepare environment"
        checkout scm
        def environment  = docker.build("gs17")

        environment.inside {

            stage "Test and validate"
                sh "echo Testing..."
                //junit 'reports/**/*.xml'
        }

    stage "Cleanup"
        deleteDir()
}