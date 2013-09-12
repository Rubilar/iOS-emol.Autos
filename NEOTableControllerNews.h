//
//  NEOTableControllerNews.h
//  Emol Autos
//
//  Created by Nicolas Rubilar on 25-07-13.
//  Copyright (c) 2013 com.neonline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEOTableControllerNews : UITableViewController<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *arrayTitle;
    NSMutableArray *arrayDescentTitle;
    NSMutableArray *arrayImageNews;
    
}

@property(nonatomic, retain)NSArray *datasource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
-(void)setupArray;
@end
