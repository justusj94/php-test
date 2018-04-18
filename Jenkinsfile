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
        sh 'docker run --rm php-test /bin/bash -c "phpunit --bootstrap Email.php tests/EmailTest"'
      }
    }
  }
}