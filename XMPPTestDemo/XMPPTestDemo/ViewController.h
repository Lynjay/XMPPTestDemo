//
//  ViewController.h
//  XMPPTestDemo
//
//  Created by gwchina on 15/4/10.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//- (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(4_0);
//- (void)doSomethingInBackgroundWithProgressCallback:(void(^)(float progress))completionCallback;

typedef void(^MyTestCompletionBlock)();

- (IBAction)done:(id)sender;
@property (nonatomic, retain) IBOutlet UILabel *lab;

@property (copy) MyTestCompletionBlock completionBlock;

@end

