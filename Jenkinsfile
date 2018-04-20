pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t php-test .'
      }
    }
    stage('PHPUnit test') {
      steps {
        sh '''#run image and remove after completing command in bash
docker run --rm php-test /bin/bash -c "phpunit --bootstrap Email.php tests/EmailTest"'''
      }
    }
    stage('Deploy') {
      steps {
        sh '''#remove old in directory
ssh root@stage.boomerweb.nl \'rm -r -f /var/www/stage.boomerweb.nl/justus/pipeline-test/*\'

#remove working directory to not copy it 
rm -r -f $WORKSPACE/app

#deploy to remote server with ssh
scp -r $WORKSPACE/* root@stage.boomerweb.nl:/var/www/stage.boomerweb.nl/justus/pipeline-test
'''
      }
    }
  }
}