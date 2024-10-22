const paramsSchema = {
  properties: {
    port: {
      type: 'string',
    },
  },
}

function deploy(params) {
  api.offchain.deploy({
    details: {
      envs: {
        PORT: params?.port || '8081',
        DOCKER_COMPOSE_PROJECT_NAME: 'drew-curve',
      },
      flags: {
        build: true,
      },
    },
  })
}
