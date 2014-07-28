//
//  AddItemViewController.m
//  ToDoListThree
//
//  Created by Rachel Hyman on 3/13/14.
//  Copyright (c) 2014 Rachel Hyman. All rights reserved.
//

#import "AddItemViewController.h"
#import "Task.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancel:(id)sender {
    [self.delegate addItemViewControllerDidCancel:self];
}

-(IBAction)save:(id)sender{
    Task *task = [[Task alloc] init];
    task.taskName = self.taskNameTextField.text;
    task.taskDueDate = self.taskDueDateText.text;
    task.completed = NO;
    [self.delegate AddItemViewController:self didAddTask:task];
}

@end
