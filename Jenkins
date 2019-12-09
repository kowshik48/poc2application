node{
     
    stage('Git Clone'){
        git   'https://github.com/kowshik48/poc2application.git'
    }
    stage('Maven Clean Build'){
        def mavenHome = tool name: "Maven-3.6.3", type: "maven"
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
    }
    stage('Build Docker Image'){
        sh "docker build -t poc2cap/poc2application ."
    }
    stage('Docker Push'){
    withCredentials([string(credentialsId: 'DOCKER_HUB_CREDENTIALS', variable: 'DOCKER_HUB_CREDENTIALS')]) {
    sh "docker login -u poc2cap -p ${DOCKER_HUB_CREDENTIALS}"
    }
    sh "docker push poc2cap/poc2application"
    }
    stage('Deploy to K82 Cluster'){
        kubernetesDeploy(
            configs: "tomcat.yml",
            kubeconfigId: 'KUBERNETES_CLUSTER_CONFIG',
            enableConfigSubstitution: true)
            
        }
    
	}
