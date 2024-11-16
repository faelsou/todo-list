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
        stage('Install Docker') {
            steps {
                script {
                    sh '''
                    # Atualizar pacotes e instalar pré-requisitos
                    sudo apt update -y
                    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

                    # Adicionar chave GPG do Docker e repositório oficial
                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
                    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

                    # Atualizar repositórios e instalar Docker
                    sudo apt update -y
                    sudo apt install -y docker-ce

                    # Verificar instalação
                    docker --version

                    # Adicionar usuário Jenkins ao grupo Docker
                    sudo usermod -aG docker $(whoami)

                    # Reiniciar o Docker para garantir a configuração
                    sudo systemctl restart docker
                    '''
                }
            }
        }
        stage('Verify Docker') {
            steps {
                script {
                    // Teste se o Docker está funcionando corretamente
                    sh 'docker --version'
                    sh 'docker ps'
                }
            }
        }
    
 //       stage('Build Docker Image') {
 //           steps {
 //               script {
 //                   // Constrói a imagem Docker localmente
 //                   sh """
 //                   docker build -t ${DOCKER_IMAGE} .
 //                   """
 //               }
 //           }
//        }

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