
pipelineJob('hello') {
    definition {
        cps {
            script(readFileFromWorkspace('jobs/hello.groovy'))
            sandbox()
        }
    }
}

pipelineJob('infra-https') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/faficode/infra.git')
                    }
                    branch('*/master')
                }
            }
            lightweight()
        }
    }
}