//
//  PORoundsViewController.m
//  The Pomodoro
//
//  Created by John D. Storey on 6/3/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PORoundsViewController.h"
#import "POTableViewDataSource.h"

@interface PORoundsViewController () <UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) POTableViewDataSource *dataSource;

@end

@implementation PORoundsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        NSMutableArray *dataArray = [[NSMutableArray alloc] initWithObjects:@{@"round": @"0"}, nil];
        self.dataArray = dataArray;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    POTableViewDataSource *dataSource = [POTableViewDataSource new];
    self.dataSource = dataSource;
    // 
    self.tableView.dataSource = dataSource;
    self.tableView.delegate = dataSource;
    
    NSLog(@"array length is: %i", [self.dataArray count]);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell Identifier"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
