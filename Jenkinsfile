pipeline{
        agent any
        environment {
            app_version = 'v2'
            rollback = 'false'
        }
        stages{
            stage('Build Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            image1 = docker.build("nathan2820/flask-app", "./frontend")
                            image2 = docker.build("nathan2820/backend", "./backend")
                        }
                    }
                }          
            }
            stage('Tag & Push Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials'){
                                image1.push("${env.app_version}")
				image2.push("${env.app_version}")
                            }
                        }
                    }
                }          
            }
            stage('Deploy App'){
                steps{
                    load "/home/jenkins/.envvars/env-vars.groovy"
                    sh "docker-compose up -d"
                }
            }
        }    
}
