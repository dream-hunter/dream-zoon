Jax.Material['Brick'] = Jax.Class.create Jax.Material,
  initialize: ($super, options) ->
    options = Jax.Util.normalizeOptions options,
      # You can specify default options (see +manifest.yml+) here.
      shader: "brick"
    
    $super options
  
  setUniforms: ($super, context, mesh, options, uniforms) ->
    $super context, mesh, options, uniforms
    
    uniforms.set 'mvMatrix', context.getModelViewMatrix()
    uniforms.set 'nMatrix',  context.getNormalMatrix()
    uniforms.set 'pMatrix',  context.getProjectionMatrix()
  
    # uniforms.texture 'Texture', this.texture, context
  
  setAttributes: ($super, context, mesh, options, attributes) ->
    attributes.set 'VERTEX_POSITION',  mesh.getVertexBuffer()
    attributes.set 'VERTEX_COLOR',     mesh.getColorBuffer()
    attributes.set 'VERTEX_NORMAL',    mesh.getNormalBuffer()
    attributes.set 'VERTEX_TEXCOORDS', mesh.getTextureCoordsBuffer()
