node {
	stage('Build Test Image'){
		git url: 'https://github.com/SerkanGitRepo/WebTesting.git'
		//customImage = docker.build("testmvnprjtest:${env.BUILD_ID}")
		docker.build("webtest:1")
		
	}
	 
	stage ('Smoke Test') {
		//sh 'docker run -i -v $(pwd):/opt/myapp -w /home/CC_BDD_TNG --network="host" test-paralel:1 mvn -f /home/CC_BDD_TNG/pom.xml clean test -fn'
		sh 'docker run -i -v $(pwd):/opt/myapp -w /home/WebTesting --network="host" webtest:1'
		sh 'docker exec -it webtest:1 bash -c "./run_tests.sh"'
		//sh 'docker cp $(docker ps -aq --filter "network=host"):/home/CC_BDD_TNG/reports .'
		//publishHTML([allowMissing: false, alwaysLinkToLastBuild: true, keepAll: true, reportDir: "/var/jenkins_home/workspace/abapbuild_master/reports", reportFiles: "index.html", reportName: "HTML Report", reportTitles: "Test Raporu"])
		//sh 'docker rm $(docker ps -aq --filter "network=host")'
	}
}
	