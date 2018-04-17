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
        sh 'docker run --name=test --rm test /bin/bash -c php phpunit --bootstrap Email.php tests/EmailTest'
      }
    }
  }
}