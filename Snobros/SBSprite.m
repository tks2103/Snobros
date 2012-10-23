//
//  SBRectangle.m
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import "SBSprite.h"

@implementation SBSprite

@synthesize positionCoords, textureCoords;


-(id) initWithFile:(NSString *)filePath andPosition:(CGPoint)pos andSize:(CGSize)s {
    self = [super init];
    if (self) {
        position = pos;
        size     = s;
        image    = [UIImage imageNamed:filePath];
        texture  = [GLKTextureLoader textureWithCGImage:image.CGImage options:nil error:nil];
        effect   = [[GLKBaseEffect alloc] init];
        [self precalculateCoords];
    }
    return self;
}

-(void) precalculateCoords {
    [self precalculatePosition];
    [self precalculateTexture];
}


-(void) precalculatePosition {
    positionCoords = malloc(sizeof(GLKVector2) * 4);
    
    positionCoords[0] = GLKVector2Make(position.x + size.width/2, position.y - size.height/2);
    positionCoords[1] = GLKVector2Make(position.x + size.width/2, position.y + size.height/2);
    positionCoords[2] = GLKVector2Make(position.x - size.width/2, position.y + size.height/2);
    positionCoords[3] = GLKVector2Make(position.x - size.width/2, position.y - size.height/2);
}

-(void) precalculateTexture {
    textureCoords = malloc(sizeof(GLKVector2) * 4);
    
    textureCoords[0] = GLKVector2Make(1, 1);
    textureCoords[1] = GLKVector2Make(1, 0);
    textureCoords[2] = GLKVector2Make(0, 0);
    textureCoords[3] = GLKVector2Make(0, 1);
}

-(void) render {
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    effect.transform.projectionMatrix = GLKMatrix4MakeOrtho(-240, 240, -160, 160, -1, 1);
    
    effect.texture2d0.envMode = GLKTextureEnvModeReplace;
    effect.texture2d0.target = GLKTextureTarget2D;
    effect.texture2d0.name = texture.name;
    
    [effect prepareToDraw];
    
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, textureCoords);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, positionCoords);
    
    glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
    glDisable(GL_BLEND);
}

-(void) update {
    
}

-(void) updatePosition:(CGPoint)pos {
    position = pos;
}

@end
