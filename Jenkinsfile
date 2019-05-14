node('master') {
 
 stage('SCM') {
     
     checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[name: 'online-maven', url: 'https://github.com/awsdevopsssp/online-maven-1.git']]])
     sh "ls -ltr"     
 }
 
  stage('Build & Deploy') {
    sh "sh deploy-webapp.sh ${JOB_NAME}:${BUILD_NUMBER}"
  } 

}
