pipeline{
        agent any
        environment {
            app_version = 'v3'
            rollback = 'false'
        }
        stages{
            stage('SSH onto Test VM'){
                steps{
                    load "/home/jenkins/.envvars/env-vars.groovy"
                    sh '''
                    ssh ubuntu@52.56.37.99 << EOF
                    git clone https://github.com/Nathan2820/PracticalProject
                    export SECRET_KEY="$SECRET_KEY"
                    export DB_PASSWORD="$DB_PASSWORD"
                    export DATABASE_URI="$DATABASE_URI"
		    export TEST_DATABASE_URI="$TEST_DATABASE_URI"
                    cd PracticalProject
                    docker-compose up -d
                    docker-compose ps
                    #docker exec practicalproject_flask-app_1 pytest --cov application
                    #docker exec practicalproject_backend_1 pytest --cov application
                    exit
                    >> EOF
                    '''
                }
            }
            stage('SSH onto Production VM'){
		steps{
		  load "/home/jenkins/.envvars/env-vars.groovy"
	 	  sh '''
		  ssh ubuntu@3.8.10.146 << EOF
		  git clone https://github.com/Nathan2820/PracticalProject
		  export SECRET_KEY="$SECRET_KEY"
		  export DB_PASSWORD="$DB_PASSWORD"
		  export DATABASE_URI="$DATABASE_URI"
		  cd PracticalProject
		  docker-compose up -d
		  docker-compose ps
		  >> EOF
		  '''
	        }
            } 
        }    
}
