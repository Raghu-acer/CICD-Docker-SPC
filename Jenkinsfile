pipeline {
    agent any
      environment {
      DOCKER_TAG = getVersion()
    }
    stages {
       stage("scm") {
          steps{
              git 'https://github.com/Raghu-acer/CICD-Docker-SPC.git'
          }
        }
        stage("build") {
          steps{
              sh script: "mvn clean package"
          }
        }
        stage("Docker build") {
          steps{
              sh "sudo docker image build . -t raghudusa/spring-petclininc:${DOCKER_TAG}"
          }
        }
        stage("Docker push") {
          steps{
              withCredentials([string(credentialsId: 'raghudusa', variable: 'dockerhub')]) {
                sh "sudo docker login -u raghudusa -p ${dockerhub}"
             }
                sh "sudo docker push raghudusa/spring-petclininc:${DOCKER_TAG}"
          }
        }
        stage("deploy from ansible") {
          steps{
              ansiblePlaybook credentialsId: 'ansible', disableHostKeyChecking: true, extras: 'DOCKER_TAG="${DOCKER_TAG}"', installation: 'Ansible', inventory: 'host', playbook: 'Ansible.yml'
          }
        }
    }
}

def getVersion(){
    def commitHash = sh label: '', returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash
}
