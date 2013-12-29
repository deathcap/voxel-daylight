
module.exports = (game, opts) ->
  return new DaylightPlugin(game, opts)

class DaylightPlugin
  constructor: (@game, opts) ->
    opts ?= {}
    opts.ambientColor ?= 0x888888
    opts.directionalColor ?= 0xffffff

    # based on voxel-engine's addLights()
    @ambientLight = new game.THREE.AmbientLight(opts.ambientColor)
    @directionalLight = new game.THREE.DirectionalLight(opts.directionalColor, 1)
    @directionalLight.position.set(1, 1, 0.5).normalize()

    @enable()

  enable: () ->
    @game.scene.add @ambientLight
    @game.scene.add @directionalLight

  disable: () ->
    @game.scene.remove @ambientLight
    @game.scene.remove @directionalLight
