//
//  MyBlock.h
//  XMPPTestDemo
//
//  Created by gwchina on 15/4/10.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyBlock : NSObject

typedef void (^MBProgressHUDCompletionBlock)();

typedef void (^BoolBlock)(BOOL);//一个只接受一个BOOL参数，没有返回值的block
typedef int (^IntBlock)(void);//一个没有参数，返回int的block
typedef BoolBlock (^HugeBlock)(IntBlock);//看看，这个HugeBlock的参数和返回值都是block
typedef void (^Changcolor)(UIColor *aColor);

- (void)showLabWithBlock:(dispatch_block_t)block completionBlock:(void (^)(void))completion;
- (void)someMethod;
- (void)ChangeRootViewBtnRect:(CGRect)rect blockcompletion:(Changcolor)Changcolorblock;

- (void)labWithBlock:(dispatch_block_t)block completionBlock:(MBProgressHUDCompletionBlock)completion;

@property (copy) MBProgressHUDCompletionBlock completionBlock;

@property (nonatomic, copy) void(^MyBlock)(void);

//@property (nonatomic, copy) void(^BoolBlock)(BOOL);
//@property (nonatomic, copy) int(^IntBlock)(void);
//@property (nonatomic, copy) BoolBlock(^HugeBlock)(IntBlock);

//@property (nonatomic, copy) BoolBlock()

@end


//第一种：（直接写）
//@property (copy) void(^MyBlock)(void);
//
//第二种：（typedef）
//typedef void(^MyBlock)(void);
//
//@property (nonatomic, copy) MyBlock block;
