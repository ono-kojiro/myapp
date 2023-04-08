/*
  If environment variable 'CUSTOMWORKSPACE' is defined,
  change directory to 'CUSTOMWORKSPACE'.
 */

def CUSTOMWORKSPACE = ''

if (env.CUSTOMWORKSPACE != '' ) {
  CUSTOMWORKSPACE = env.CUSTOMWORKSPACE
}

pipeline {
    agent {
        node {
            // any label
            label params.AGENT == "any" ? "" : params.AGENT
            customWorkspace CUSTOMWORKSPACE
        }
    }

    stages {
        stage('configure'){
            steps {
                script {
                    if(isUnix()) {
                        sh  'sh   build.sh  configure'
                    }
                    else {
                        bat 'call build.bat configure'
                    }
                }
            }
        }
        stage('build'){
            steps {
                script {
                    if(isUnix()) {
                        sh  'sh   build.sh  build'
                    }
                    else {
                        bat 'call build.bat build'
                    }
                }
            }
        }
        stage('check'){
            steps {
                script {
                    if(isUnix()) {
                        sh  'sh   build.sh  check'
                    }
                    else {
                        bat 'call build.bat check'
                    }
                }
            }
        }
        stage('install'){
            steps {
                script {
                    if(isUnix()) {
                        sh  'sh   build.sh  install'
                    }
                    else {
                        bat 'call build.bat install'
                    }
                }
            }
        }
        stage('package'){
            steps {
                script {
                    if(isUnix()) {
                        sh  'sh   build.sh  package'
                    }
                    else {
                        bat 'call build.bat package'
                    }
                }
            }
        }
        stage('publish'){
            steps {
                script {
                    if(isUnix()) {
                        sh  'sh   build.sh  publish'
                    }
                    else {
                        bat 'call build.bat publish'
                    }
                }
            }
        }
        stage('upload'){
            steps {
                script {
                    if(isUnix()) {
                        sh  'sh   build.sh  upload'
                    }
                    else {
                        bat 'call build.bat upload'
                    }
                }
            }
        }
    }
}

