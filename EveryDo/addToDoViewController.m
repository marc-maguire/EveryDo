//
//  addToDoViewController.m
//  EveryDo
//
//  Created by Marc Maguire on 2017-05-16.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "addToDoViewController.h"

@interface addToDoViewController ()

@end

@implementation addToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveToDo:(id)sender{
    
    ToDo *todo = [[ToDo alloc]initWithTitle:self.titleTextField.text andDescription:self.descriptionTextField.text andPriorityNumber:[self.priorityTextField.text integerValue]];
    
    [self.delegate saveToDo:todo];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

@end
