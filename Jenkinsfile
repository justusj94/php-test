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
        sh 'docker run --name="php-test" php-test /bin/bash -c "phpunit --bootstrap Email.php tests/EmailTest"'
      }
    }
    stage('Deploy') {
      steps {
        sh '''#copy app from container and remove container
docker cp php-test:/app $WORKSPACE
docker rm php-test

#deploy to remote server with ssh
ssh root@stage.boomerweb.nl \'rm -r -f /var/www/stage.boomerweb.nl/justus/pipeline-test/*\'
scp -r $WORKSPACE/app/* root@stage.boomerweb.nl:/var/www/stage.boomerweb.nl/justus/pipeline-test
'''
      }
    }
  }
}