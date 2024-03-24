pipeline{
    agent any

    tools{
        maven "maven"
    }

    environment{
       APP_NAME="jenkinscicd-app"
       RELEASE_NO="1.0.0"
       DOCKER_USER="oliver273"
       IMAGE_NAME="${DOCKER_USER}"+"/"+"${APP_NAME}"
       IMAGE_TAG="${RELEASE_NO}-${BUILD_NUMBER}"
    }

    stages{
        stage("SCM checkout"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins-ci-cd-main', url: 'https://github.com/hoa-tat/jenkins-ci-cd-main.git']])
            }
        }

        stage("Build Process"){
            steps{
                script{
                    bat 'mvn clean install'
                }
            }
        }

        stage("build Image"){
            steps{
                script{
                    bat 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
                }
            }
        }

        stage("Deploy Image to Hub"){
            steps{
                bat 'docker login -u oliver273 -p dckr_pat_nRZkDk5R61hK8m_uqZu1mt0Jm8k'
                bat 'docker push ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }
    }

    post{
        always{
            emailext attachLog: true,
            body: '''<html>
                        <body>
                            <p>Build Status: ${BUILD_STATUS}</p>
                            <p>Build Number: ${BUILD_NUMBER}</p>
                            <p>Check the <a href="${BUILD_URL}">console output</a>.</p>
                        </body>
                    </html>''',
            mimeType: 'text/html',
            replyTo: 'hoatq@htpgroup.com.vn',
            subject: 'Pipeline Status: ${PROJECT_NAME} - Build ${BUILD_NUMBER}',
            to: 'hoatq@htpgroup.com.vn'
        }
    }
}

// SCM checkout
// Build process
// Deploy WAR
// Email
