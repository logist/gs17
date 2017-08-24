node {
	def app
    stage "Prepare environment"
        checkout scm
        app  = docker.build("gs17")

    stage "Test and validate"
        app.inside {
            sh "echo Testing..."
            //junit 'reports/**/*.xml'
        }

    stage "Cleanup"
        deleteDir()
}