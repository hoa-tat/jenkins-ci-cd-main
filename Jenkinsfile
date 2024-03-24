// pipeline{
//     agent any
//
//     tools{
//         maven "maven"
//     }
//
//     stages{
//         stage("SCM checkout"){
//             steps{
//                 checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins-ci-cd-main', url: 'https://github.com/hoa-tat/jenkins-ci-cd-main.git']])
//             }
//         }
//
//         stage("Build Process"){
//             steps{
//                 script{
//                     bat 'mvn clean install'
//                 }
//             }
//         }
//
//         stage("Deploy to Container"){
//             steps{
//                 deploy adapters: [tomcat9(credentialsId: 'tomcat-pwd', path: '', url: 'http://localhost:9090/')], contextPath: 'jenkinsCiCd', war: '**/*.war'
//             }
//         }
//     }
//
//     post{
//         always{
//             emailext attachLog: true,
//             body: '''<html>
//                         <body>
//                             <p>Build Status: ${BUILD_STATUS}</p>
//                             <p>Build Number: ${BUILD_NUMBER}</p>
//                             <p>Check the <a href="${BUILD_URL}">console output</a>.</p>
//                         </body>
//                     </html>''',
//             mimeType: 'text/html',
//             replyTo: 'hoatq@htpgroup.com.vn',
//             subject: 'Pipeline Status: ${PROJECT_NAME} - Build ${BUILD_NUMBER}',
//             to: 'hoatq@htpgroup.com.vn'
//         }
//     }
// }
//
// // SCM checkout
// // Build process
// // Deploy WAR
// // Email