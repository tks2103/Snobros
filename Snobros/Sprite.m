//
//  Sprite.m
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import "Sprite.h"

@implementation Sprite


- (id) initWithFile:(NSString *)filePath
           position:(GLKVector2)position
               size:(CGSize)size {
  
  self = [super init];
  if (self) {
    texture_  = [GLKTextureLoader
                textureWithCGImage:[UIImage imageNamed:filePath].CGImage
                options:nil
                error:nil];
    effect_   = [[GLKBaseEffect alloc] init];
    
    positionCoords_ = malloc(sizeof(GLKVector2) * 4);
    textureCoords_  = malloc(sizeof(GLKVector2) * 4);
    
    [self moveTo:position withSize:size];
  }
  
  return self;
}


- (void) dealloc {
  free(positionCoords_);
  free(textureCoords_);
}


- (void) moveTo:(GLKVector2)position withSize:(CGSize)size {
  [self calculatePosition:position withSize:size];
  [self calculateTexture];
}


- (void) calculatePosition:(GLKVector2)position withSize:(CGSize)size {
  positionCoords_[0] = GLKVector2Make(position.x,
                                     position.y + size.height);
  positionCoords_[1] = GLKVector2Make(position.x,
                                     position.y);
  positionCoords_[2] = GLKVector2Make(position.x + size.width,
                                     position.y);
  positionCoords_[3] = GLKVector2Make(position.x + size.width,
                                     position.y + size.height);
}


- (void) calculateTexture {
  textureCoords_[0] = GLKVector2Make(0, 1); // ?
  textureCoords_[1] = GLKVector2Make(0, 0); // bottom left
  textureCoords_[2] = GLKVector2Make(1, 0); // ?
  textureCoords_[3] = GLKVector2Make(1, 1); // top right
}


- (void) render {
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  
  effect_.transform.projectionMatrix = GLKMatrix4MakeOrtho(0, 480, 320, 0, -1, 1);
  
  effect_.texture2d0.envMode = GLKTextureEnvModeReplace;
  effect_.texture2d0.target  = GLKTextureTarget2D;
  effect_.texture2d0.name    = texture_.name;
  
  [effect_ prepareToDraw];
  
  glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
  glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT,
                        GL_FALSE, 0, textureCoords_);
  
  glEnableVertexAttribArray(GLKVertexAttribPosition);
  glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT,
                        GL_FALSE, 0, positionCoords_);
  
  glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
  glDisableVertexAttribArray(GLKVertexAttribPosition);
  glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
  glDisable(GL_BLEND);
}

@end