//
//  Sprite.h
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "Renderable.h"

@interface Sprite : NSObject<Renderable> {
  GLKVector2      *positionCoords_;
  GLKVector2      *textureCoords_;
  GLKBaseEffect   *effect_;
  GLKTextureInfo  *texture_;
}

- (id) initWithFile:(NSString *)filePath
           position:(GLKVector2)position
               size:(CGSize)size;
- (void) moveTo:(GLKVector2)position withSize:(CGSize)size;
- (void) calculatePosition:(GLKVector2)position withSize:(CGSize)size;
- (void) calculateTexture;

@end
