pipeline {
    agent any

    environment {
        NODE_ENV = 'production'
        DEPLOY_DIR = '/var/www/todo-list-react'
        DOCKER_IMAGE = "minikube-registry.local/faelsou/todo-list-web:1.1:${env.BUILD_ID}"
        DOCKER_REGISTRY = "minikube-registry.local"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/faelsou/todo-list-reactjs.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
    }
    
}pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "faelsouz/todo-list-reactjs-app:1.1"
        KUBERNETES_DEPLOYMENT = "todo-list-deployment"
        KUBERNETES_NAMESPACE = "default"
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
                    docker login -u <SEU_USUARIO> -p <SUA_SENHA>
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
                    kubectl apply -f k8s/deployment.yaml -n ${KUBERNETES_NAMESPACE}
                    kubectl apply -f k8s/service.yaml -n ${KUBERNETES_NAMESPACE}
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
