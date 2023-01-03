pipeline {
    agent any

    stages {
        stage('configure'){
            steps {
                sh '''#!/bin/sh
                autoreconf -vi
                sh configure --prefix=/usr \
                    --with-libmylib-include=${JENKINS_HOME}/workspace/libmylib/src \
                    --with-libmylib-lib=${JENKINS_HOME}/workspace/libmylib/src
                '''
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
        stage('publish'){
            steps {
                sh '''#!/bin/sh
                  jf rt build-clean
                  jf rt build-add-git
                  jf rt build-collect-env ${JOB_NAME} ${BUILD_NUMBER}
                  jf rt build-publish ${JOB_NAME} ${BUILD_NUMBER}
                '''
            }
        }
    }
}

