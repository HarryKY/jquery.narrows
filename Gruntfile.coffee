module.exports = (grunt) ->
    pkg = grunt.file.readJSON 'package.json'

    grunt.initConfig
        jshint:
            files: ['jquery.narrows.js']
            options:
                jshintrc: ".jshintrc"
        uglify:
            dest:
                files:
                    'jquery.narrows.min.js': 'jquery.narrows.js'
        watch:
            files: ['jquery.narrows.js'],
            tasks: ['uglify', 'jshint']

    for taskName of pkg.devDependencies
        if taskName.substring(0, 6) is 'grunt-'
            grunt.loadNpmTasks taskName

    grunt.registerTask 'default', ['jshint', 'uglify', 'watch']
