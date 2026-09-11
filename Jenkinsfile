pipeline {
    agent any

    parameters {
        string(name: 'NEXUS_URL', defaultValue: 'http://YOUR_NEXUS_SERVER:8081',
               description: 'Nexus server URL')
        string(name: 'TOMCAT_URL', defaultValue: 'http://YOUR_TOMCAT_SERVER:8080',
               description: 'Tomcat server URL')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Publish to Nexus') {
            steps {
                sh 'mvn deploy -DskipTests -Dnexus.url=${NEXUS_URL}'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                echo 'Artifact published to Nexus.'
                echo 'Deploy the carhub.war from Nexus to Tomcat using your preferred deployment method.'
                echo "Tomcat target: ${params.TOMCAT_URL}"
            }
        }
    }

    post {
        success {
            echo 'CarHub pipeline completed successfully.'
        }
        failure {
            echo 'CarHub pipeline failed. Check the console log.'
        }
    }
}

