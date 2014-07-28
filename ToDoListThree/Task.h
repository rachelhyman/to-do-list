//
//  Task.h
//  ToDoListThree
//
//  Created by Rachel Hyman on 3/14/14.
//  Copyright (c) 2014 Rachel Hyman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic, retain) NSString *taskName;
@property (nonatomic, retain) NSString *taskDueDate;
@property (nonatomic) BOOL *completed;

@end
