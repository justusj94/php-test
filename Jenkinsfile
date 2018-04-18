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
        sh '''#run image and remove after completing command in bash
docker run --rm php-test /bin/bash -c "phpunit --bootstrap Email.php tests/EmailTest"


rm -r $WORKSPACE/app/*'''
      }
    }
    stage('Deploy') {
      steps {
        sh '''#deploy to remote server with ssh
ssh root@stage.boomerweb.nl \'rm -r -f /var/www/stage.boomerweb.nl/justus/pipeline-test/*\'
scp -r $WORKSPACE/app/* root@stage.boomerweb.nl:/var/www/stage.boomerweb.nl/justus/pipeline-test
'''
      }
    }
  }
}