pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "faelsouz/todo-list-reactjs-app:1.1"
        KUBERNETES_DEPLOYMENT = "todo-list-deployment"
        KUBERNETES_NAMESPACE = "tl-dev"
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Clona o repositório com o código React.js e manifestos YAML
                    checkout scm
                }
            }
        }
//        stage('Install Docker') {
//            steps {
//                script {
//                   sh '''
//                    set -e
//                    # Atualizar pacotes e instalar pré-requisitos
//                    apt-get update -y
//                    apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
//
//                    # Adicionar chave GPG do Docker e repositório oficial para Debian
//                    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
//                    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
//
//                    # Atualizar repositórios e instalar Docker
//                    apt-get update -y
//                    apt-get install -y docker-ce docker-ce-cli containerd.io
//
//                    # Verificar instalação
//                    docker --version
//                    '''
//                }
//            }
//        }
//        stage('Install Docker') {
//            steps {
//                script {
//                    sh '''
//                    docker run --name jenkins-docker --rm -d \
//                    -u root \
//                    -p 8080:8080 \
//                    -p 50000:50000 \
//                    -v jenkins_home:/var/jenkins_home \
//                    -v /var/run/docker.sock:/var/run/docker.sock \
//                    jenkins/jenkins:lts
//                    '''
//                }
//            }
//        }
//        stage('Verify Docker Installation') {
//            steps {
//                script {
//                    sh '''
//                    # Exibir versão do Docker
//                    docker --version
//                    '''
//                }
//            }
//        }
    
        stage('Build Docker Image') {
            steps {
                script {
                   // Constrói a imagem Docker localmente
                    sh """
                    'docker build -t faelsouz/todo-list-reactjs-app:1.1 .'
                    """
                }
            }
        }

//        stage('Push Docker Image') {
  //          steps {
    //            script {
      //              // Faz o push da imagem para um repositório remoto (ex: DockerHub)
        //            sh """
          //          docker login -u faelsouz -p 061603F@tim@
            //        docker push ${DOCKER_IMAGE}
              //      """
                //}
           // }
       // }

//        stage('Deploy to Minikube') {
  //          steps {
    //            script {
      //              // Aplica os manifestos Kubernetes
        //            sh """
          //          kubectl apply -f k8s/dev/todo-list-deployment.yaml -n ${KUBERNETES_NAMESPACE}
            //        kubectl apply -f k8s/dev/todo-list-service.yaml -n ${KUBERNETES_NAMESPACE}
        //            """
          //      }
          //  }
       // }

//        stage('Verify Deployment') {
//            steps {
//                script {
//                    // Verifica se o pod está rodando corretamente
//                    sh """
//                    kubectl rollout status deployment/${KUBERNETES_DEPLOYMENT} -n ${KUBERNETES_NAMESPACE}
//                    """
//                }
//            }
//        }
//    }

//    post {
//        success {
//            echo 'Deployment realizado com sucesso!'
//        }
//        failure {
//            echo 'Erro no pipeline!'
//        }
//    }
    }
}