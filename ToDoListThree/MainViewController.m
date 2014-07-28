//
//  MainViewController.m
//  ToDoListThree
//
//  Created by Rachel Hyman on 3/13/14.
//  Copyright (c) 2014 Rachel Hyman. All rights reserved.
//

#import "MainViewController.h"
#import "Task.h"

@interface MainViewController ()

@property NSMutableArray *taskList;
@property (nonatomic, weak) IBOutlet UITableView *tasksTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@end

@implementation MainViewController

-(void)loadInitialData {
    Task *task1 = [[Task alloc] init];
    task1.taskName = @"Learn 2 Obj-C";
    task1.taskDueDate = @"Jan 1st, 2015";
    task1.completed = NO;
    [self.taskList addObject:task1];
    Task *task2 = [[Task alloc] init];
    task2.taskName = @"Ride my bike";
    task2.taskDueDate = @"Sunday";
    task2.completed = YES;
    [self.taskList addObject:task2];
    Task *task3 = [[Task alloc] init];
    task3.taskName = @"Make this to-do list app";
    task3.taskDueDate = @"TODAY";
    task3.completed = NO;
    [self.taskList addObject:task3];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.taskList = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.taskList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TaskCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TaskCell"];
    }
    Task *currentTask = (self.taskList)[indexPath.row];
    cell.textLabel.text = currentTask.taskName;
    cell.detailTextLabel.text = currentTask.taskDueDate;
    if (currentTask.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - Edit Methods

-(IBAction)editButtonPressed:(id)sender {
    if (! [_tasksTableView isEditing]) {
        [_tasksTableView setEditing:YES animated:YES];
        [self.navigationItem.leftBarButtonItem setTitle:@"Done"];
        _addButton.enabled = NO;
        
    }
    else {
        [_tasksTableView setEditing:NO animated:YES];
        [self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
        _addButton.enabled = YES;
    }
    [_tasksTableView reloadData];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.taskList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - AddItemViewControllerDelegate

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)AddItemViewController:(AddItemViewController *)controller didAddTask:(Task *)task {
   [self.taskList addObject:task];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.taskList count] -1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"AddItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddItemViewController *addItemViewController = [navigationController viewControllers][0];
        addItemViewController.delegate = self;
    }
}

@end
