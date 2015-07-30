//
//  Person.h
//  
//
//  Created by gwchina on 15/7/1.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * sign;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * grade;
@property (nonatomic, retain) NSNumber * pId;

@end
