module.exports = grunt => {
  const pkg = grunt.file.readJSON('package.json');

  /**
   *
   * @param {string} stderr
   */
  const revertAndAbort = error => {
    grunt.log.error(error.toString());
    grunt.task.run('shell:revert');
  };

  grunt.initConfig({
    pkg,
    shell: {
      bumpVersion: {
        command: target =>
          `npm version --allow-same-version ${target ?? 'patch'} -m "version bump %s"`,
        options: {
          stdout: false,
          callback(error, {}, {}, callback) {
            if (error) {
              return revertAndAbort(error);
            }
            callback();
          },
        },
      },
      publish: 'npm publish',
      push: 'git push --follow-tags',
      updateChangelog: {
        command: [
          "git log --oneline | sed 's/^[a-zA-Z0-9]* //g' > CHANGELOG.md",
          'git add CHANGELOG.md',
          'git commit --no-verify --amend  --no-edit',
        ].join(';'),
        options: {
          stdout: false,
          callback(error, {}, {}, callback) {
            if (error) {
              return revertAndAbort(error);
            }
            callback();
          },
        },
      },
      revert: {
        command: [].join(';'),
        options: {
          callback() {
            grunt.log.error(`failed to deploy. Reverting all changes`);
          },
        },
      },
    },
  });

  grunt.loadNpmTasks('grunt-shell');

  grunt.registerTask(
    'publish',
    'update npm version, gen changelog, publish and push',
    () => {
      const { task } = grunt;
      task.run('shell:minor');
      task.run('shell:publish');
      task.run('shell:updateChangelog');
      task.run('shell:push');
    },
  );

  grunt.registerTask(
    'deploy',
    'Buld bundles, update npm version and changelog, push',
    () => {
      const target = grunt.option('target') || 'patch';
      const { task } = grunt;

      task.run('build');
      task.run(`shell:bumpVersion:+${target}`);
      task.run('shell:updateChangelog');
      task.run('shell:push');
      task.run('shell:copyEnvFiles');
      task.run('shell:ssh');
    },
  );

  grunt.registerTask('shell:default', ['npm version']);
};
