pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                script {
                    // Run Flutter tests and save the results
                    sh 'flutter test --machine > test_results.json'
                    currentBuild.result = 'SUCCESS' // Default to success
                    def testResults = readJSON file: 'test_results.json'

                    // Check if any tests failed
                    if (testResults.stats.failed > 0) {
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
        stage('Build') {
            when {
                expression {
                    currentBuild.resultIsBetterOrEqualTo('SUCCESS')
                }
            }
            steps {
                // Run the build command if tests passed
                sh 'flutter build apk' // Replace with your build command
            }
        }
    }
    post {
        always {
            // Archive test results, even if the build fails
            archiveArtifacts artifacts: 'test_results.json', onlyIfSuccessful: false
        }
    }
}
