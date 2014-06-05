//
//  POTableViewDataSource.m
//  The Pomodoro
//
//  Created by John D. Storey on 6/4/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "POTableViewDataSource.h"

@interface POTableViewDataSource ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSDictionary *initialObject;

@end

@implementation POTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    return [self.dataArray count];
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell Indentifier"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell Identifier"];
    }
    cell.backgroundColor = [UIColor orangeColor];
    cell.textLabel.text = self.dataArray[indexPath.row][@"round"];
    return cell;
}


@end
