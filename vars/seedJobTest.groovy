pipelineJob('some-job') {
    definition {
        cps ('println "hello"')
    }
}