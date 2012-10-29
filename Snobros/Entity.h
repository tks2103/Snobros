//
//  Entity.h
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Renderable.h"
#import "Sprite.h"

@interface Entity : NSObject<Renderable> {
  GLKVector2 position_;
  CGSize     size_;
  Sprite     *sprite_;
}

- (id) initWithFile:(NSString *)filePath
           position:(GLKVector2)position
               size:(CGSize)size;

@end
