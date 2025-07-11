pipeline {
  agent any

  environment {
    IMAGE_NAME = 'testing_jenkin'
  }

  stages {
    stage('Install Dependencies') {
      steps {
        sh 'npm install'
      }
    }

    stage('Build Angular') {
      steps {
        sh 'npm run build --prod'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Run Docker Container') {
      steps {
        sh 'docker rm -f $IMAGE_NAME || true'
        sh 'docker run -d --name $IMAGE_NAME -p 8080:80 $IMAGE_NAME'
      }
    }
  }
}
