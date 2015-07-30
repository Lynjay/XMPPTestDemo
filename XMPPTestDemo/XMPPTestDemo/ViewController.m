//
//  ViewController.m
//  XMPPTestDemo
//
//  Created by gwchina on 15/4/10.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"
#import "MyBlock.h"
#import "MySelector.h"
#import "NSObject+GLPubSub.h"
#import "MJExtension.h"
#import "MyModel.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, retain)MBProgressHUD *HUD;
@property (nonatomic, retain) MyBlock *ablock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSLog(@"path:%@", documentsDirectory);
///Users/apple/Library/Developer/CoreSimulator/Devices/8CA51E3B-8CDA-4D99-94A2-D6CDAFE116F4/data/Containers/Data/Application/60996F25-0800-426A-9174-F36641803B32/Documents
    
    //coreData
//    查询记录
    //查找数据库中的所有Person。
    NSArray *persons = [Person MR_findAll];
    for (Person *per in persons) {
        NSLog(@"age:%d, first:%@, last:%@, sign:%@, address:%@, grade:%@", [per.age intValue], per.firstName, per.lastName, per.sign, per.address, per.grade);
    }
    
    
//    Person *person = [Person MR_createEntity];
//    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext){
//        
//        Person *localPerson = [person MR_inContext:localContext];
//        
//        localPerson.firstName = @"John";
//        localPerson.lastName = @"Appleseed";
//        
//    } completion:^(BOOL success, NSError *error) {
//        
//        NSArray *list = [Person MR_findAll];
//        
//    }];

    
//    //查找所有的Person并按照first name排序。
//    NSArray *personsSorted = [Person MR_findAllSortedBy:@"firstName" ascending:YES];
//    //查找所有age属性为25的Person记录。
//    NSArray *personsAgeEuqals25   = [Person MR_findByAttribute:@"age" withValue:[NSNumber numberWithInt:25]];
//    //查找数据库中的第一条记录
//    Person *person = [Person MR_findFirst];
    
//    Person *person = [Person MR_createEntity];
//    person.firstName = @"huang";
//    person.lastName = @"lynjay";
//    person.age = @30;//此处使用了LLVM的新特性，XCode 4.4可用
//    person.sign = @"this is demo";
//    person.address = @"福建";
//    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    //更新数据
    Person *person = [Person MR_createEntity];
    person.lastName = @"dodo";
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    //删除数据
//    Person *person = [Person MR_createEntity];
//    [person MR_deleteEntity];
//    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    //coreData
    
    self.ablock = [[MyBlock alloc] init];
    
//    [self done];
//    [self done1];
//    [self done2];
    
    id aSelector = [[MySelector alloc] init];
    SEL testSelector = @selector(test:);
    SEL notSelector = @selector(noImp);
    
    if ([aSelector respondsToSelector:testSelector]) {
        [aSelector test:@""];
        NSLog(@"1111111");
    } else if ([aSelector respondsToSelector:notSelector]) {
        [aSelector noImp];
        NSLog(@"2222");
    }
    
    if ([aSelector respondsToSelector:@selector(test:)]) {
        [aSelector test:@""];
    }
    
//    [self subscribe:@"YourEventName" selector:@selector(yourEventHandler)];
//    [self subscribeOnce:@"YourEventName" selector:@selector(yourEventHandler)];
    [self subscribe:@"YourEventName" obj:@"somePublisher" selector:@selector(yourEventHandler)];
    
    
    //字典转模型
    
    NSDictionary *dict = @{
                           @"name" : @"Jack",
//                           @"icon" : @"lufy.png",
                           @"age" : @20,
                           @"height" : @"1.55",
                           @"money" : @100.9,
                           @"sex" : @(SexFemale)
                           };
    
    // 将字典转为User模型
    MyModel *user = [MyModel objectWithKeyValues:dict];
    
    NSLog(@"name=%@, icon=%@, age=%d, height=%f, money=%@, sex=%d",
          user.name, user.icon, user.age, user.height, user.money, user.sex);
    
    //字符串转模型
    NSString *jsonString = @"{\"name\":\"Jack1\", \"icon\":\"lufy.png1\", \"age\":201}";
    // 2.将JSON字符串转为User模型
    user = [MyModel objectWithKeyValues:jsonString];
    
    // 3.打印User模型的属性
    NSLog(@"name=%@, icon=%@, age=%d", user.name, user.icon, user.age);

}

- (void)done {
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
//        // Do something...
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
//        });
//    });
    
}

- (void)yourEventHandler {
    NSLog(@"I am coming");
    
}



- (void)done1 {
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeAnnularDeterminate;
//    hud.labelText = @"Loading";
//    [self doSomethingInBackgroundWithProgressCallback:^(float progress) {
//        hud.progress = progress;
//    } completionCallback:^{
//        [hud hide:YES];
//    }];
}
    
    
//    [UIView animateWithDuration:kPRAnimationDuration*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    } completion:^(BOOL bl){
//        if (msg != nil && ![msg isEqualToString:@""]) {
//            [self flashMessage:msg];
//        }
//    }];


//- (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(4_0);

//    - (void)reloginSuccess:(void(^)())success failure:(void(^)(NSString* error))failure
//- (void)p_loadAllUsersCompletion:(void(^)())completion
//}

- (void)doSomethingInBackgroundWithProgressCallback:(void(^)(float progress))completionCallback {
    
}

- (void)done2 {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

- (IBAction)done:(id)sender {
//    self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:self.HUD];
//    self.HUD.labelText = @"正在加载";
//    
//    //设置模式为进度框形的
//    self.HUD.mode = MBProgressHUDModeDeterminate;
//    [self.HUD showMyAnimated:YES whileExecutingBlock:^{
//        float progress = 0.0f;
//        while (progress < 1.0f) {
//            progress += 0.01f;
//            self.HUD.progress = progress;
//            usleep(50000);
//        }
//    } completionBlock:^{
//        [self.HUD removeFromSuperview];
////        [self.HUD release];
//        self.HUD = nil;
//    }];
    
//    [self showLabWithBlock:^{
//        float progress = 0.0f;
//        while (progress < 1.0f) {
//                        progress += 0.01f;
////                        self.HUD.progress = progress;
//                        usleep(50000);
//                    }
//    } completionBlock:^{
//        self.lab.hidden = YES;
//    }];
    
    
//    [self.ablock showLabWithBlock:^{
//        float progress = 0.0f;
//        while (progress < 1.0f) {
//            progress += 0.01f;
//            //                        self.HUD.progress = progress;
//            usleep(50000);
//        }
//    } completionBlock:^{
//        self.lab.hidden = YES;
//    }];
    
//    [self showBlock:^{
//        float progress = 0.0f;
//        while (progress < 1.0f) {
//            progress += 0.01f;
//            //                        self.HUD.progress = progress;
//            usleep(50000);
//        }
//    } completionBlock:^{
//        self.lab.hidden = YES;
//    }];
    
//    [self showBlock2:^{
//        self.lab.hidden = YES;
//    }];
//
//    [self publish:@"YourEventName"];
//
//    [self.ablock someMethod];
    
//    [self.ablock ChangeRootViewBtnRect:self.lab.frame blockcompletion:^(UIColor *color) {
//        self.lab.textColor = color;
//    }];
    
    [self.ablock labWithBlock:^{
        float progress = 0.0f;
        while (progress < 1.0f) {
            progress += 0.01f;
            //                        self.HUD.progress = progress;
            usleep(50000);
        }

    } completionBlock:^{
        self.lab.hidden = YES;
    }];
}

- (void)showLabWithBlock:(dispatch_block_t)block completionBlock:(void (^)())completion {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [self showLabWithBlock:block onQueue:queue completionBlock:completion];
}

- (void)showLabWithBlock:(dispatch_block_t)block onQueue:(dispatch_queue_t)queue
         completionBlock:(MyTestCompletionBlock)completion {
    self.completionBlock = completion;
    dispatch_async(queue, ^(void) {
        block();
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            self.lab.hidden = YES;
            if (self.completionBlock) {
                self.completionBlock();
                self.completionBlock = NULL;
            }
        });
    });
}

- (void)showBlock:(dispatch_block_t)block completionBlock:(MyTestCompletionBlock)completion {
    self.completionBlock = completion;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^(void) {
        block();
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            if (self.completionBlock) {
                self.completionBlock();
                self.completionBlock = NULL;
            }
        });
    });
}

- (void)showBlock2:(MyTestCompletionBlock)completion {
    self.completionBlock = completion;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        float progress = 0.0f;
//        while (progress < 1.0f) {
//            progress += 0.01f;
//            //                        self.HUD.progress = progress;
//            usleep(50000);
//        }

        //这里加载数据
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.completionBlock) {
                self.completionBlock();
                self.completionBlock = NULL;
            }
        });
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end












