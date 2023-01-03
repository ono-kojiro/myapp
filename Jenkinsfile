pipeline {
    agent any

    stages {
        stage('configure'){
            steps {
                sh  'autoreconf -vi'
                sh  'sh configure --prefix=/usr'
            }
        }
        stage('build'){
            steps {
                sh  'make -j `nproc`'
            }
        }
        stage('test'){
            steps {
                sh  'make check'
            }
        }
        stage('install'){
            steps {
                sh  'make install DESTDIR=`pwd`/dest'
            }
        }
    }
}

