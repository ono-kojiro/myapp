pipeline {
    agent any

    stages {
        stage('configure'){
            steps {
                sh 'sh build.sh configure'
            }
        }
        stage('build'){
            steps {
                sh  'sh build.sh build'
            }
        }
        stage('check'){
            steps {
                sh  'sh build.sh check'
            }
        }
        stage('install'){
            steps {
                sh  'sh build.sh install'
            }
        }
        stage('package'){
            steps {
                sh  'sh build.sh package'
            }
        }
        stage('publish'){
            steps {
                sh 'sh build.sh publish'
            }
        }
        stage('upload'){
            steps {
                sh  'sh build.sh upload'
            }
        }
    }
}

