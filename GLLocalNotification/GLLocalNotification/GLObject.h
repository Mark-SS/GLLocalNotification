//
//  GLObject.h
//  GLLocalNotification
//
//  Created by gongliang on 13-9-25.
//  Copyright (c) 2013年 gongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MyBlock)(void);


@interface GLObject : NSObject

@property (nonatomic, copy) MyBlock block;

@property (nonatomic, copy) NSString *str;

@end
