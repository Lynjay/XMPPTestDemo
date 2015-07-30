//
//  CoreDataViewController.m
//  XMPPTestDemo
//
//  Created by gwchina on 15/7/1.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import "CoreDataViewController.h"
#import "Person.h"

@interface CoreDataViewController ()

@end

@implementation CoreDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //查找数据库中的所有Person。
    NSArray *persons = [Person MR_findAll];
    for (Person *per in persons) {
        NSLog(@"pid:%d, age:%d, first:%@, last:%@, sign:%@, address:%@, grade:%@", [per.pId intValue], [per.age intValue], per.firstName, per.lastName, per.sign, per.address, per.grade);
    }
    
//     NSArray *students = [Person MR_findByAttribute:@"firstName" withValue:@"huang"];
//    
//    for (Person *per in students) {
//        NSLog(@"pid:%d, age:%d, first:%@, last:%@, sign:%@, address:%@, grade:%@", [per.pId intValue], [per.age intValue], per.firstName, per.lastName, per.sign, per.address, per.grade);
//    }
    
    NSArray *students = [Person MR_findByAttribute:@"pId" withValue:@15];
    if (students.count == 0) {
        Person *person = [Person MR_createEntity];
        person.firstName = @"huang";
        person.lastName = @"lynjay";
        person.age = @30;//此处使用了LLVM的新特性，XCode 4.4可用
        person.sign = @"this is demo";
        person.address = @"福建";
        person.pId = @15;
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    } else {
        for (Person *tmp in students) {
            tmp.firstName = @"Jane";
        }
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
    
    
    
//    Person *person = [Person MR_createEntity];
//    person.firstName = @"huang";
//    person.lastName = @"lynjay";
//    person.age = @30;//此处使用了LLVM的新特性，XCode 4.4可用
//    person.sign = @"this is demo";
//    person.address = @"福建";
//    person.pId = @12;
//    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
