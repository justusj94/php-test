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
        sh '''docker run --name="php-test" php-test /bin/bash -c "phpunit --bootstrap Email.php tests/EmailTest"

#copy test results from container
docker cp test:/app/results $WORKSPACE

#remove container
docker rm php-test'''
      }
    }
    stage('Deploy') {
      steps {
        sh '''#copy test results from container
#docker cp php-test:/app $WORKSPACE

#deploy to remote server with ssh
ssh root@stage.boomerweb.nl \'rm -r -f /var/www/stage.boomerweb.nl/justus/pipeline-test/*\'
scp -r $WORKSPACE/app/* root@stage.boomerweb.nl:/var/www/stage.boomerweb.nl/justus/pipeline-test

#remove container
docker rm test'''
      }
    }
  }
}