//
//  SBRectangle.h
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "SBRenderable.h"
#import "SBMovable.h"

@interface SBSprite : NSObject <SBRenderable> {
    GLKVector2      *positionCoords;
    GLKVector2      *textureCoords;
    GLKBaseEffect   *effect;
    GLKTextureInfo  *texture;
}

@property (readonly) GLKVector2 *positionCoords;
@property (readonly) GLKVector2 *textureCoords;

-(id) initWithFile:(NSString *)filePath andPosition:(GLKVector2)p andSize:(CGSize)s;

-(void) moveTo:(GLKVector2)p withSize:(CGSize)s;
-(void) calculatePosition:(GLKVector2)p withSize:(CGSize)s;
-(void) calculateTexture;

@end
