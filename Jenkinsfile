pipeline {
  agent {
        label "docker-slave"
  }
  stages {
    stage('Build') {
      steps {
        sh "git clone 'https://github.com/sivakit/POC1.git'"
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'cd POC1/go-docker;docker build -t myapp:latest -f Dockerfile.multistage .'
        sh 'docker images'
      }
    }
    stage('Push Image to Harbor') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'harbor-credentials', usernameVariable: 'HARBOR_USERNAME', passwordVariable: 'HARBOR_PASSWORD')]) {
          sh 'docker login -u $HARBOR_USERNAME -p $HARBOR_PASSWORD core.harbor.domain'
          sh 'docker tag myapp:latest core.harbor.domain/minikube/myapp:latest'
          sh 'docker push core.harbor.domain/minikube/myapp:latest'
        }
      }
    }
  }
  post {
    always {
      sh 'docker system prune -af'
    }
  }
}

