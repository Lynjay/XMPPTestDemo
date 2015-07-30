//
//  MyModel.h
//  XMPPTestDemo
//
//  Created by gwchina on 15/4/30.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SexMale,
    SexFemale
} Sex;

@interface MyModel : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;
@property (assign, nonatomic) int age;
@property (assign, nonatomic) double height;
@property (strong, nonatomic) NSNumber *money;
@property (assign, nonatomic) Sex sex;

@end
