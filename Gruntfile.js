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
        command: v => `npm version --allow-same-version ${v} -m "version bump %s"`,
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
      publishNpm: 'npm publish',
      pushFollowTags: 'git push --follow-tags',
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

  grunt.registerTask('publish', (version = 'patch') => {
    const { task } = grunt;

    task.run(`shell:bumpVersion:${version}`);
    task.run('shell:publishNpm');
    task.run('shell:updateChangelog');
    task.run('shell:pushFollowTags');
  });

  grunt.registerTask('shell:default', ['npm version']);
};
