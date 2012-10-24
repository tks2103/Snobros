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


-(id) initWithFile:(NSString *)filePath andPosition:(GLKVector2)p andSize:(CGSize)s {
    self = [super init];
    if (self) {
        texture  = [GLKTextureLoader textureWithCGImage:[UIImage imageNamed:filePath].CGImage options:nil error:nil];
        effect   = [[GLKBaseEffect alloc] init];
        
        positionCoords = malloc(sizeof(GLKVector2) * 4);
        textureCoords = malloc(sizeof(GLKVector2) * 4);
        [self moveTo:p withSize:s];
    }
    return self;
}

-(void) dealloc {
    free(positionCoords);
    free(textureCoords);
}

-(void) moveTo:(GLKVector2)p withSize:(CGSize)s {
    [self calculatePosition:p withSize:s];
    [self calculateTexture];
}


-(void) calculatePosition:(GLKVector2)p withSize:(CGSize)s {
    positionCoords[0] = GLKVector2Make(p.x, p.y + s.height);
    positionCoords[1] = GLKVector2Make(p.x, p.y);
    positionCoords[2] = GLKVector2Make(p.x + s.width, p.y);
    positionCoords[3] = GLKVector2Make(p.x + s.width, p.y + s.height);
}

-(void) calculateTexture {
    textureCoords[0] = GLKVector2Make(0, 1); // ?
    textureCoords[1] = GLKVector2Make(0, 0); // bottom left
    textureCoords[2] = GLKVector2Make(1, 0); // ?
    textureCoords[3] = GLKVector2Make(1, 1); // top right
}

-(void) render {
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    effect.transform.projectionMatrix = GLKMatrix4MakeOrtho(0, 480, 320, 0, -1, 1);
    
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

@end
