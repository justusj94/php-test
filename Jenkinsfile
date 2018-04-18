pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''echo $WORKSPACE
docker build -t php-test .'''
      }
    }
    stage('PHPUnit test') {
      steps {
        sh '''docker run php-test /bin/bash -c "phpunit --version ; ls -lh ; phpunit --bootstrap Email.php tests/EmailTest"

docker rm php-test'''
      }
    }
  }
}