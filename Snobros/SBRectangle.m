//
//  SBRectangle.m
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import "SBRectangle.h"

@implementation SBRectangle

@synthesize positionCoords, textureCoords;

-(id) init {
    return [self initWithFile:@"/Users/tsinha/src/iOS/Snobros/Snobros/snobrosmap.png"];
}

-(id) initWithFile:(NSString *)filePath {
    return [self initWithFile:filePath andRectangle:CGRectMake(20, 20, 10, 10)];
}

-(id) initWithFile:(NSString *)filePath andRectangle:(CGRect)rect {
    self = [super init];
    if (self) {
        image = [UIImage imageNamed:filePath];
        texture = [GLKTextureLoader textureWithCGImage:image.CGImage options:nil error:nil];
        effect = [[GLKBaseEffect alloc] init];
        rectangleInfo = rect;
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
    CGPoint origin = rectangleInfo.origin;
    CGSize size = rectangleInfo.size;
    
    positionCoords[0] = GLKVector2Make(origin.x + size.width/2, origin.y - size.height/2);
    positionCoords[1] = GLKVector2Make(origin.x + size.width/2, origin.y + size.height/2);
    positionCoords[2] = GLKVector2Make(origin.x - size.width/2, origin.y + size.height/2);
    positionCoords[3] = GLKVector2Make(origin.x - size.width/2, origin.y - size.height/2);
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

@end
