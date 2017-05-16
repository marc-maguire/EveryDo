//
//  MasterViewController.m
//  EveryDo
//
//  Created by Marc Maguire on 2017-05-16.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoTableViewCell.h"

@interface MasterViewController ()

@property (nonatomic) NSMutableArray <ToDo *> *objects;
@end

@implementation MasterViewController

-(NSMutableArray<ToDo *> *)objects {
    
    if (_objects == nil) {
        _objects = [[NSMutableArray <ToDo *> alloc]init];
    }
    
    return _objects;
}

//make this conform to delegatemethod from detailVC and add update button.
//cancel button on form to dismiss
//save button trigger this delegate method
//set the delegate in the prepare for segue


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    
    ToDo *item1 = [[ToDo alloc]initWithTitle:@"Test1" andDescription:@"Test description1" andPriorityNumber:1];
    ToDo *item2 = [[ToDo alloc]initWithTitle:@"Test2" andDescription:@"Test description2" andPriorityNumber:2];
    ToDo *item3 = [[ToDo alloc]initWithTitle:@"Test3" andDescription:@"Test description3" andPriorityNumber:3];
    ToDo *item4 = [[ToDo alloc]initWithTitle:@"Test4" andDescription:@"Test description4" andPriorityNumber:4];
    [self.objects addObject:item1];
    [self.objects addObject:item2];
    [self.objects addObject:item3];
    [self.objects addObject:item4];
    
    [self.tableView reloadData];
    
    
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)saveToDo:(ToDo *)toDo {
    
    [self.objects addObject:toDo];
    [self.tableView reloadData];
    
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    } else if ([[segue identifier] isEqualToString:@"add"]){
        addToDoViewController *atdvc = [segue destinationViewController];
        atdvc.delegate = self;
    
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"ToDoCell";
    
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.toDo = [self.objects objectAtIndex:indexPath.row];
 
    
    if (cell.toDo.isCompleted == YES) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [cell updateDisplayTaskComplete];
        
    } else {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        [cell updateDisplayTaskNotComplete];
        
        
    }
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    ToDo *toDo = self.objects[sourceIndexPath.row]; //get a reference to the object you are clicking on at the sourceIndexPath.row
    
    if (destinationIndexPath.row == sourceIndexPath.row) {
        //do nothing, no move needed
        return;
    } else {
        
        [self.objects removeObjectAtIndex:sourceIndexPath.row]; //remove it (you still have your copy from above
        [self.objects insertObject:toDo atIndex:destinationIndexPath.row]; //insert your copy at the destination
    }
    
}

-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *button = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        
            [self.objects removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
                                    }];
    
    UITableViewRowAction *button2;
    if (self.objects[indexPath.row].isCompleted) {
        
        button2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Uncomplete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
            
     
            self.objects[indexPath.row].isCompleted = NO;
        
            [self.tableView reloadData];
        }];

        
    } else {
    
    button2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Complete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
            
            self.objects[indexPath.row].isCompleted = YES;
    
            [self.tableView reloadData];
        
    }];
    }
    
    button2.backgroundColor = [UIColor greenColor]; //arbitrary color
    
    
    return @[button, button2]; //array with all the buttons you want. 1,2,3, etc...

}


@end
