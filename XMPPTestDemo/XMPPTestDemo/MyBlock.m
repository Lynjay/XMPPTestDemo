//
//  MyBlock.m
//  XMPPTestDemo
//
//  Created by gwchina on 15/4/10.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import "MyBlock.h"

@implementation MyBlock

- (instancetype)init
{
    self = [super init];
    if (self) {
        if (self.completionBlock) {
            self.completionBlock();
            self.completionBlock = NULL;
        }
    }
    return self;
}

- (void)showLabWithBlock:(dispatch_block_t)block completionBlock:(void (^)(void))completion {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [self showLabWithBlock:block onQueue:queue completionBlock:completion];
}

- (void)showLabWithBlock:(dispatch_block_t)block onQueue:(dispatch_queue_t)queue
         completionBlock:(MBProgressHUDCompletionBlock)completion {
    self.completionBlock = completion;
    dispatch_async(queue, ^(void) {
        block();
        dispatch_async(dispatch_get_main_queue(), ^(void) {
//            self.lab.hidden = YES;
            NSLog(@"done222");
            if (self.completionBlock) {
                self.completionBlock();
                self.completionBlock = NULL;
            }
        });
    });
}

- (void)labWithBlock:(dispatch_block_t)block completionBlock:(MBProgressHUDCompletionBlock)completion {
    dispatch_queue_t aqueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(aqueue, ^(void) {
        block();
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            //            self.lab.hidden = YES;
            NSLog(@"done222");
            if (completion) {
                completion();
            }
        });
    });
}


- (void)show:(BOOL)animated {
    // If the grace time is set postpone the HUD display
    if (3 > 0.0) {
//        self.graceTimer = [NSTimer scheduledTimerWithTimeInterval:self.graceTime target:self
//                                                         selector:@selector(handleGraceTimer:) userInfo:nil repeats:NO];
    }
    // ... otherwise show the HUD imediately
    else {
//        [self showUsingAnimation:useAnimation];
    }
}

- (void)someMethod {
    BoolBlock aBlock = ^(BOOL bValue) {
        NSLog(@"Bool block");
    };
    aBlock(NO);
}

- (BoolBlock)foo {
    BoolBlock aBlock = ^(BOOL bValue) {
        NSLog(@"BOOl block");
    };
    
    return [aBlock copy];
}

- (void)ChangeRootViewBtnRect:(CGRect)rect blockcompletion:(Changcolor)Changcolorblock {
    UIColor *color = [UIColor greenColor];
    Changcolorblock(color);
}



@end
