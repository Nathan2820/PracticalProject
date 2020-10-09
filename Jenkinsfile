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
                    ssh ubuntu@18.134.94.197 << EOF
                    git clone https://github.com/Nathan2820/PracticalProject
                    export SCRET_KEY="$SECRET_KEY"
                    export DB_PASSWORD="$DB_PASSWORD"
                    export TEST_DATABASE_URI="$DATABASE_URI"
                    cd PracticalProject
                    docker-compose up -d
                    docker-compose ps
                    docker exec practicalproject_flask-app_1 pytest --cov application
                    docker exec practicalproject_backend_1 pytest --cov application
                    exit
                    >> EOF
                    '''
                }
            }
        }    
}
