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
        sh '''docker run php-test --rm /bin/bash -c "phpunit --help ;phpunit --bootstrap Email.php tests/EmailTest"
'''
      }
    }
  }
}