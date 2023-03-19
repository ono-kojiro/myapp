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
        stage('test'){
            steps {
                sh  'sh build.sh test'
            }
        }
        stage('install'){
            steps {
                sh  'sh build.sh install'
            }
        }
        stage('publish'){
            steps {
                sh 'sh build.sh publish'
            }
        }
    }
}

