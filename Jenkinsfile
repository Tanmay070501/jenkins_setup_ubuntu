pipeline {
    agent any

    stages {
        stage('List of docker containers') {
            steps {
                script {
                    sh 'docker ps -a'
                }
            }
        }
    }
}
