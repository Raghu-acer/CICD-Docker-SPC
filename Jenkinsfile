pipeline {
    agent any
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
              sh "sudo docker image build . -t raghudusa/spring-petclininc:13052021"
          }
        }
        stage("Docker push") {
          steps{
              withCredentials([string(credentialsId: 'raghudusa', variable: 'dockerhub')]) {
                sh "sudo docker login -u raghudusa -p ${dockerhub}"
             }
                sh "sudo docker push raghudusa/spring-petclininc:13052021"
          }
        }
        stage("deploy from ansible") {
          steps{
              ansiblePlaybook credentialsId: 'ansible', disableHostKeyChecking: true, installation: 'Ansible', inventory: 'host', playbook: 'Ansible.yml' 
          }
        }
    }
}
