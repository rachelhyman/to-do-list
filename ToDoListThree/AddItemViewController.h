//
//  AddItemViewController.h
//  ToDoListThree
//
//  Created by Rachel Hyman on 3/13/14.
//  Copyright (c) 2014 Rachel Hyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@class AddItemViewController;

@protocol AddItemViewControllerDelegate <NSObject>
- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller;
- (void)AddItemViewController: (AddItemViewController *)controller didAddTask: (Task *)task;

@end

@interface AddItemViewController : UIViewController

@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;
@property (nonatomic, weak) IBOutlet UITextField *taskNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *taskDueDateText;
@property Task *task; 

-(IBAction)cancel:(id)sender;
-(IBAction)save:(id)sender;

@end
