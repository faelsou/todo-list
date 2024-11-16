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
        stage('Test Docker') {
            steps {
                script {
                    sh 'docker --version'
                    sh 'docker ps'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Constrói a imagem Docker localmente
                    sh """
                    docker build -t ${DOCKER_IMAGE} .
                    """
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Faz o push da imagem para um repositório remoto (ex: DockerHub)
                    sh """
                    docker login -u faelsouz -p 061603F@tim@
                    docker push ${DOCKER_IMAGE}
                    """
                }
            }
        }

        stage('Deploy to Minikube') {
            steps {
                script {
                    // Aplica os manifestos Kubernetes
                    sh """
                    kubectl apply -f k8s/dev/todo-list-deployment.yaml -n ${KUBERNETES_NAMESPACE}
                    kubectl apply -f k8s/dev/todo-list-service.yaml -n ${KUBERNETES_NAMESPACE}
                    """
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    // Verifica se o pod está rodando corretamente
                    sh """
                    kubectl rollout status deployment/${KUBERNETES_DEPLOYMENT} -n ${KUBERNETES_NAMESPACE}
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment realizado com sucesso!'
        }
        failure {
            echo 'Erro no pipeline!'
        }
    }
}
