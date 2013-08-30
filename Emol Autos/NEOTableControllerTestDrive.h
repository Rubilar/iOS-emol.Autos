//
//  NEOTableControllerTestDrive.h
//  Emol Autos
//
//  Created by Nicolas Rubilar on 26-07-13.
//  Copyright (c) 2013 com.neonline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEOTableControllerTestDrive : UITableViewController<UITableViewDelegate, UITableViewDataSource>{
    NSArray *arrayTitle;
    NSArray *arrayDescentTitle;
    NSArray *arrayImageTestDrive;
}
@property(nonatomic, retain)NSArray *datasource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
-(void)setupArray;
@end

