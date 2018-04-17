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
        sh '''ls -lh
docker run --name=test --rm test /bin/bash -c phpunit --bootstrap Email.php tests/EmailTest'''
      }
    }
  }
}